package app.template.extension.fotmob;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.util.Map;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Spoiler-free mode" (Patch settings switch {@value #FEATURE_ID}, on by default): the user marks
 * a match on its page or a whole competition on its page, and while a marked match is live FotMob
 * posts no alert for it, and the match rows, the match page header, the share text, the
 * live-update notification and the home-screen live score widget show no score. Each of those
 * surfaces has its own Patch settings switch ({@value #NOTIFICATIONS}, {@value #LISTS},
 * {@value #MATCH_PAGE}, {@value #WIDGET}, all depending on {@value #FEATURE_ID}), so the user
 * chooses what gets hidden.
 *
 * <p>Once the match is over (its status is one of {@link SpoilerRules#FINISHED}) the score shows
 * again at the next bind or refresh, with no un-marking, unless {@value #KEEP_FINAL} is on. Every
 * hook asks again on each bind, so a status flip is picked up without a restart.
 *
 * <p>The marks are two Patch settings lists, {@value #MATCHES} (FotMob match ids, "4506263") and
 * {@value #COMPETITIONS} (league ids, keyed like "Hide competitions": "47" is the Premier League).
 * Both depend on the switch, so {@link HevalSettings#getHidden} answers empty (stock) while it is
 * off, and the user can un-mark entries in Patch settings. A competition counts as marked when the
 * league id or its parent id (a stage or group of the competition) is in the list. Nothing leaves
 * the phone; finished matches stay in the list until the user un-marks them (at most
 * {@link HevalSettings#MAX_HIDDEN} marks per list).
 */
@SuppressWarnings("unused")
public final class SpoilerFree {
    static final String FEATURE_ID = "fotmob.spoiler_free";
    static final String MATCHES = "fotmob.spoiler_matches";
    static final String COMPETITIONS = "fotmob.spoiler_competitions";
    /** The per-surface switches; each depends on {@link #FEATURE_ID}, so it is off while that is off. */
    static final String NOTIFICATIONS = "fotmob.spoiler_notifications";
    static final String LISTS = "fotmob.spoiler_lists";
    static final String MATCH_PAGE = "fotmob.spoiler_match_page";
    static final String WIDGET = "fotmob.spoiler_widget";
    /** Off by default: marked matches also stay hidden after full time. Depends on {@link #FEATURE_ID}. */
    static final String KEEP_FINAL = "fotmob.spoiler_keep_final";
    private static final String TAG = "Morphe-FotMob";

    /** Outside FotMob's own 0x7f...... resource ids, so no inflated item clashes with it. */
    private static final int ITEM_ID = 0x7e5f0001;
    /** After the inflated items (their order is 0), inside the overflow menu. */
    private static final int ITEM_ORDER = 1000;

    private static final String LEAGUE_ACTIVITY = "com.fotmob.android.feature.league.ui.LeagueActivity";

    // MatchActivity's intent extras (its onCreate reads them) and LeagueActivity's league id.
    private static final String EXTRA_MATCH_ID = "PARAM_MATCHID";
    private static final String EXTRA_LEAGUE_ID = "PARAM_LEAGUEID";
    private static final String EXTRA_PARENT_LEAGUE_ID = "PARAM_PARENT_LEAGUE_ID";
    private static final String EXTRA_HOME_NAME = "PARAM_HOMENAME";
    private static final String EXTRA_AWAY_NAME = "PARAM_AWAYNAME";
    private static final String EXTRA_COMPETITION_ID = "leagueId";

    private SpoilerFree() {
    }

    // ---------------------------------------------------------------------------------------
    // Checks
    // ---------------------------------------------------------------------------------------

    /** Whether match {@code matchId} (league {@code leagueId}, parent {@code parentId}; 0 when unknown) is marked. */
    public static boolean isMarked(String matchId, int leagueId, int parentId) {
        try {
            if (matchId != null && HevalSettings.isHidden(MATCHES, matchId.trim())) return true;
            return isCompetitionMarked(leagueId) || isCompetitionMarked(parentId);
        } catch (Throwable failure) {
            return false;
        }
    }

    private static boolean isCompetitionMarked(int leagueId) {
        return leagueId > 0 && HevalSettings.isHidden(COMPETITIONS, Integer.toString(leagueId));
    }

    private static int parseId(String value) {
        if (value == null) return 0;
        try {
            return Integer.parseInt(value.trim());
        } catch (NumberFormatException notANumber) {
            return 0;
        }
    }

    /** Whether the user keeps final scores of marked matches hidden too ({@value #KEEP_FINAL}). */
    private static boolean keepsFinal() {
        try {
            return HevalSettings.isEnabled(KEEP_FINAL);
        } catch (Throwable failure) {
            return false;
        }
    }

    /**
     * Patched into PushMessagingService.onMessageReceived, behind the switch: true drops the push
     * before FotMob handles it. {@code message} is the FCM message bundle; match pushes carry the
     * match id under "m", the league and parent league ids under "lid" and "plid", and the match
     * status (a MatchStatus name, FotMob's MatchNotificationData parses it with valueOf) under
     * "status". A push of a marked match is dropped while the match is live; a push whose status
     * says the match is over (the full-time result) goes through unless final scores stay hidden.
     * A missing or unknown status counts as live.
     */
    public static boolean blocksPush(Bundle message) {
        try {
            if (message == null || !HevalSettings.isEnabled(NOTIFICATIONS)) return false;
            String matchId = message.getString("m");
            int leagueId = parseId(message.getString("lid"));
            int parentId = parseId(message.getString("plid"));
            if ((matchId == null || matchId.trim().isEmpty()) && leagueId <= 0 && parentId <= 0) return false;
            boolean marked = isMarked(matchId, leagueId, parentId);
            return SpoilerRules.hides(marked, message.getString("status"), keepsFinal());
        } catch (Throwable failure) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Score display (match rows, match page, share text, live-update notification, widget)
    // ---------------------------------------------------------------------------------------

    /**
     * Match.id, Match.league, League.id, League.parentId and Match.StatusOfMatch: kept model names
     * (the patch checks them; 242 renamed Id/ParentId).
     */
    private static volatile Field matchId, matchLeague, leagueId, leagueParentId, matchStatus;

    private static Field field(Class<?> owner, String name) throws NoSuchFieldException {
        Field field = owner.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    /** The match rows (live, fixtures, form): the "match lists" switch. */
    public static boolean hidesScoreInLists(Object match) {
        return hides(match, LISTS);
    }

    /** The match page header: the "match page" switch. */
    public static boolean hidesScoreOnMatchPage(Object match) {
        return hides(match, MATCH_PAGE);
    }

    /** The live-update (ongoing) match notification: the "notifications" switch. */
    public static boolean hidesScoreInNotifications(Object match) {
        return hides(match, NOTIFICATIONS);
    }

    /** The home-screen live score widget: the "widget" switch. */
    public static boolean hidesScoreInWidget(Object match) {
        return hides(match, WIDGET);
    }

    /**
     * The live-update notification's score texts ("2 - 1", the penalties "(4 - 3)"): every number
     * becomes "?" while the match's score is hidden.
     */
    public static String maskScoreInNotifications(String text, Object match) {
        return hidesScoreInNotifications(match) ? SpoilerRules.maskScore(text) : text;
    }

    /** The live-update notification's header "2 - 1 • 67'": "? - ? • 67'" while the score is hidden. */
    public static String maskLeadingScoreInNotifications(String text, Object match) {
        return hidesScoreInNotifications(match) ? SpoilerRules.maskLeadingScore(text) : text;
    }

    /**
     * A match row's winner inputs (the aggregate status, the match status read for "won on
     * penalties"): null while the score is hidden, so the row bolds no team name.
     */
    public static Object hiddenInLists(Object value, Object match) {
        return hidesScoreInLists(match) ? null : value;
    }

    /**
     * Whether FotMob's Match {@code match} is marked (by its id or its competition) while the master
     * switch and the {@code surface} switch are on, and its score is not final yet (or final scores
     * stay hidden, see {@link SpoilerRules#hides}). Patched after a "has the match started" check:
     * true makes that code draw the kickoff time or the minute instead of the score.
     */
    private static boolean hides(Object match, String surface) {
        boolean marked;
        try {
            if (match == null || !HevalSettings.isEnabled(FEATURE_ID) || !HevalSettings.isEnabled(surface)) return false;
            if (matchId == null) {
                Class<?> type = match.getClass();
                Field league = field(type, "league");
                leagueId = field(league.getType(), "id");
                leagueParentId = field(league.getType(), "parentId");
                matchLeague = league;
                matchId = field(type, "id");
            }
            Object id = matchId.get(match);
            Object league = matchLeague.get(match);
            int competition = league == null ? 0 : leagueId.getInt(league);
            int parent = league == null ? 0 : leagueParentId.getInt(league);
            marked = isMarked(id == null ? null : id.toString(), competition, parent);
        } catch (Throwable failure) {
            return false;
        }
        // A marked match whose status cannot be read counts as live: it stays hidden.
        return SpoilerRules.hides(marked, marked ? statusName(match) : null, keepsFinal());
    }

    /** Match.StatusOfMatch's enum constant name ("SecondHalf", "Finished"), null when unreadable. */
    private static String statusName(Object match) {
        try {
            Field status = matchStatus;
            if (status == null) matchStatus = status = field(match.getClass(), "StatusOfMatch");
            Object value = status.get(match);
            return value instanceof Enum ? ((Enum<?>) value).name() : null;
        } catch (Throwable failure) {
            return null;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Menu items
    // ---------------------------------------------------------------------------------------

    /**
     * Patched into the match page's menu builder (the MenuProvider that inflates
     * menu/activity_match_facts_v2), behind the switch: adds "Spoiler-free: on/off" for this match.
     */
    public static void addMatchItem(Menu menu, Object host) {
        try {
            if (menu == null || !(host instanceof Activity)) return;
            final Activity activity = (Activity) host;
            Bundle extras = extras(activity);
            final String matchId = extras == null ? null : extras.getString(EXTRA_MATCH_ID);
            if (matchId == null || matchId.trim().isEmpty()) return;
            final int leagueId = extras.getInt(EXTRA_LEAGUE_ID);
            final int parentId = extras.getInt(EXTRA_PARENT_LEAGUE_ID);
            final String label = matchLabel(extras.getString(EXTRA_HOME_NAME), extras.getString(EXTRA_AWAY_NAME), matchId);
            addItem(menu, new Toggle() {
                @Override
                public String title() {
                    if (isCompetitionMarked(leagueId) || isCompetitionMarked(parentId)) {
                        return "Spoiler-free: on (competition)";
                    }
                    return HevalSettings.isHidden(MATCHES, matchId.trim()) ? "Spoiler-free: on" : "Spoiler-free: off";
                }

                @Override
                public void toggle() {
                    if (isCompetitionMarked(leagueId) || isCompetitionMarked(parentId)) {
                        toast(activity, "The whole competition is spoiler-free. Turn it off on the competition page.");
                        return;
                    }
                    flip(activity, MATCHES, matchId.trim(), label);
                }
            });
        } catch (Throwable failure) {
            Log.w(TAG, "Spoiler-free match item not added: " + failure.getClass().getName());
        }
    }

    /**
     * Patched into the competition page's menu builder (the MenuProvider that inflates
     * menu/league_info; the same builder serves the team and squad member pages, so only
     * LeagueActivity gets the item), behind the switch.
     */
    public static void addCompetitionItem(Menu menu, Object host) {
        try {
            if (menu == null || !(host instanceof Activity)) return;
            if (!LEAGUE_ACTIVITY.equals(host.getClass().getName())) return;
            final Activity activity = (Activity) host;
            Bundle extras = extras(activity);
            int leagueId = extras == null ? 0 : extras.getInt(EXTRA_COMPETITION_ID);
            if (leagueId <= 0) return;
            final String key = Integer.toString(leagueId);
            addItem(menu, new Toggle() {
                @Override
                public String title() {
                    return HevalSettings.isHidden(COMPETITIONS, key) ? "Spoiler-free: on" : "Spoiler-free: off";
                }

                @Override
                public void toggle() {
                    flip(activity, COMPETITIONS, key, competitionLabel(activity, key));
                }
            });
        } catch (Throwable failure) {
            Log.w(TAG, "Spoiler-free competition item not added: " + failure.getClass().getName());
        }
    }

    private interface Toggle {
        String title();

        void toggle();
    }

    private static void addItem(Menu menu, final Toggle toggle) {
        menu.removeItem(ITEM_ID);
        final MenuItem item = menu.add(Menu.NONE, ITEM_ID, ITEM_ORDER, toggle.title());
        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        item.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem clicked) {
                try {
                    toggle.toggle();
                    clicked.setTitle(toggle.title());
                } catch (Throwable failure) {
                    Log.w(TAG, "Spoiler-free toggle failed: " + failure.getClass().getName());
                }
                return true;
            }
        });
    }

    private static void flip(Activity activity, String listId, String key, String label) {
        boolean mark = !HevalSettings.isHidden(listId, key);
        if (!HevalSettings.setHidden(listId, key, mark)) {
            toast(activity, "Could not save the change");
            return;
        }
        if (mark && label != null) HevalSettings.reportOptionsSeen(listId, key, label);
        toast(activity, mark ? "Spoiler-free on: live scores and alerts are hidden" : "Spoiler-free off");
    }

    private static Bundle extras(Activity activity) {
        Intent intent = activity.getIntent();
        return intent == null ? null : intent.getExtras();
    }

    private static String matchLabel(String home, String away, String matchId) {
        String h = home == null ? "" : home.trim();
        String a = away == null ? "" : away.trim();
        if (h.isEmpty() || a.isEmpty()) return "Match " + matchId;
        return h + " - " + a;
    }

    /** The "Hide competitions" label of the bundled leagues ("England · Premier League"), else the page title. */
    private static String competitionLabel(Context context, String key) {
        try {
            Map<String, String> seeds = CountryData.competitionSeeds(context);
            String label = seeds == null ? null : seeds.get(key);
            if (label != null) return label;
        } catch (Throwable ignored) {
            // Fall back to the title below.
        }
        CharSequence title = context instanceof Activity ? ((Activity) context).getTitle() : null;
        String name = title == null ? "" : title.toString().trim();
        return name.isEmpty() ? "Competition " + key : name;
    }

    private static void toast(Context context, String text) {
        try {
            Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // A toast is only feedback.
        }
    }
}
