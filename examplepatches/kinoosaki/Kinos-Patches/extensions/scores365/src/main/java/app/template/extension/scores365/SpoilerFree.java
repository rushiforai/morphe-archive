package app.template.extension.scores365;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import app.template.extension.hevalcontrols.HevalSettings;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * "Spoiler-free mode" for 365Scores: the user marks a match on its match page or a whole
 * competition on its page, and the app then posts no notification for that match and shows its
 * kickoff time instead of the score.
 *
 * <p>Everything lives in one SharedPreferences file, {@value #PREFS}, on the phone only:
 * <ul>
 *   <li>{@value #KEY_MATCHES}: the marked game ids (string set);</li>
 *   <li>{@value #KEY_COMPETITIONS}: the marked competition ids (string set);</li>
 * </ul>
 * Each surface is a Patch settings switch ({@link #SURFACE_FEATURES}, all on by default, all off
 * while the master switch {@value #FEATURE_MASTER} is off): each hook checks its own surface through
 * {@link #isSurfaceOn(int)}.
 * The file is read once into an immutable {@link Snapshot}; every write replaces the snapshot, so
 * the hot paths (list rows, the match header, each push) never touch the disk.
 *
 * <p>A mark only hides a match that has started: a match that has not started shows its kickoff
 * time anyway. Every hook fails open (stock behaviour) on any error.
 */
@SuppressWarnings("unused")
public final class SpoilerFree {
    private static final String TAG = "Morphe-365Spoiler";

    static final String PREFS = "morphe_spoiler_free";
    static final String KEY_MATCHES = "matches";
    static final String KEY_COMPETITIONS = "competitions";

    /** Goal, card and result notifications of a marked match. */
    public static final int SURFACE_NOTIFICATIONS = 0;
    /** The score text of the match list rows. */
    public static final int SURFACE_LISTS = 1;
    /** The score in the match page header. */
    public static final int SURFACE_MATCH_HEADER = 2;
    /** The status text ("FT", the minute) of the list rows and the match page header. */
    public static final int SURFACE_STATUS = 3;
    /** The winner hints: the row's result description and qualify icons, the header's winner marks. */
    public static final int SURFACE_WINNER = 4;

    /** The Patch settings master switch; the surface switches depend on it. */
    public static final String FEATURE_MASTER = "scores365.spoiler_free";

    /** The Patch settings switch of each surface, indexed by the SURFACE_* constants. */
    static final String[] SURFACE_FEATURES = {
            "scores365.spoiler_notifications",
            "scores365.spoiler_lists",
            "scores365.spoiler_match_header",
            "scores365.spoiler_status",
            "scores365.spoiler_winner",
    };

    private static final String GAME_OBJ = "com.scores365.entitys.GameObj";
    private static final String ENTITY_TYPE = "com.scores365.entitys.eDashboardEntityType";
    private static final String DASHBOARD_ACTIVITY = "com.scores365.dashboard.singleEntity.SingleEntityDashboardActivity";
    private static final String GAME_CENTER_ACTIVITY = "com.scores365.gameCenter.GameCenterBaseActivity";
    private static final String TOGGLE_TAG = "morphe_spoiler_free_toggle";
    /** A no-break space (U+00A0), like the app's own blank status line. */
    private static final String NBSP = String.valueOf((char) 0xA0);

    private SpoilerFree() {
    }

    // ---------------------------------------------------------------------------------------
    // Store
    // ---------------------------------------------------------------------------------------

    private static final class Snapshot {
        final Set<String> matches;
        final Set<String> competitions;

        Snapshot(Set<String> matches, Set<String> competitions) {
            this.matches = Collections.unmodifiableSet(matches);
            this.competitions = Collections.unmodifiableSet(competitions);
        }

        boolean isEmpty() {
            return matches.isEmpty() && competitions.isEmpty();
        }
    }

    private static volatile Snapshot snapshot;
    private static volatile Context appContext;

    private static Context context() {
        Context context = appContext;
        if (context != null) return context;
        try {
            Object app = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            if (app instanceof Context) {
                context = ((Context) app).getApplicationContext();
                appContext = context;
            }
        } catch (Throwable ignored) {
            // No application yet: the caller treats the store as empty.
        }
        return context;
    }

    private static SharedPreferences prefs() {
        Context context = context();
        return context == null ? null : context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Snapshot snapshot() {
        Snapshot current = snapshot;
        if (current != null) return current;
        synchronized (SpoilerFree.class) {
            if (snapshot != null) return snapshot;
            SharedPreferences prefs = prefs();
            if (prefs == null) {
                // Not cached: the next call retries once the application exists.
                return new Snapshot(new HashSet<String>(), new HashSet<String>());
            }
            snapshot = new Snapshot(
                    new HashSet<>(prefs.getStringSet(KEY_MATCHES, Collections.<String>emptySet())),
                    new HashSet<>(prefs.getStringSet(KEY_COMPETITIONS, Collections.<String>emptySet())));
            return snapshot;
        }
    }

    /**
     * Whether surface {@code surface} (a SURFACE_* constant) hides marked matches: its Patch settings
     * switch, which is off while the master switch is off. Fails open (false, stock) on any error.
     */
    public static boolean isSurfaceOn(int surface) {
        try {
            return surface >= 0 && surface < SURFACE_FEATURES.length && HevalSettings.isEnabled(SURFACE_FEATURES[surface]);
        } catch (Throwable failure) {
            return false;
        }
    }

    /** Whether the master switch is on (the marking toggles are shown only then). */
    static boolean isMasterOn() {
        try {
            return HevalSettings.isEnabled(FEATURE_MASTER);
        } catch (Throwable failure) {
            return false;
        }
    }

    /** Whether game {@code gameId} of competition {@code competitionId} (0 when unknown) is marked. */
    public static boolean isSpoilerGame(int gameId, int competitionId) {
        Snapshot current = snapshot();
        if (gameId > 0 && current.matches.contains(Integer.toString(gameId))) return true;
        return competitionId > 0 && current.competitions.contains(Integer.toString(competitionId));
    }

    /** Whether competition {@code competitionId} is marked. */
    public static boolean isSpoilerComp(int competitionId) {
        return competitionId > 0 && snapshot().competitions.contains(Integer.toString(competitionId));
    }

    /** Marks or un-marks game {@code gameId}; returns the new state, or null when it could not be saved. */
    public static Boolean toggleGame(int gameId) {
        return toggle(true, gameId);
    }

    /** Marks or un-marks competition {@code competitionId}; returns the new state, or null when it could not be saved. */
    public static Boolean toggleComp(int competitionId) {
        return toggle(false, competitionId);
    }

    private static synchronized Boolean toggle(boolean match, int id) {
        if (id <= 0) return null;
        SharedPreferences prefs = prefs();
        if (prefs == null) return null;
        Snapshot old = snapshot();
        Set<String> matches = new HashSet<>(old.matches);
        Set<String> competitions = new HashSet<>(old.competitions);
        Set<String> target = match ? matches : competitions;
        String key = Integer.toString(id);
        boolean marked = !target.remove(key);
        if (marked) target.add(key);
        prefs.edit()
                .putStringSet(match ? KEY_MATCHES : KEY_COMPETITIONS, new HashSet<>(target))
                .apply();
        snapshot = new Snapshot(matches, competitions);
        return marked;
    }

    // ---------------------------------------------------------------------------------------
    // Model access (Gson model names the patch checks: they are kept by R8)
    // ---------------------------------------------------------------------------------------

    private static volatile Method gameId, gameCompetition, gameStartTime, gameStatus, statusNotStarted;

    private static void resolveGame(Object game) throws Exception {
        if (statusNotStarted != null) return;
        Class<?> type = Class.forName(GAME_OBJ, false, game.getClass().getClassLoader());
        gameId = type.getMethod("getID");
        gameCompetition = type.getMethod("getCompetitionID");
        gameStartTime = type.getMethod("getSTime");
        gameStatus = type.getMethod("getStatusObj");
        statusNotStarted = gameStatus.getReturnType().getMethod("getIsNotStarted");
    }

    /** Whether {@code game} (a GameObj) is marked and has started; false on any doubt. */
    private static boolean hidesGame(Object game) {
        try {
            if (game == null || snapshot().isEmpty()) return false;
            resolveGame(game);
            int id = (Integer) gameId.invoke(game);
            int competition = (Integer) gameCompetition.invoke(game);
            if (!isSpoilerGame(id, competition)) return false;
            Object status = gameStatus.invoke(game);
            return status != null && !((Boolean) statusNotStarted.invoke(status));
        } catch (Throwable failure) {
            return false;
        }
    }

    /** The kickoff time of {@code game} in the phone's time format, or "" when unknown. */
    private static String kickoff(Object game) {
        try {
            Date start = (Date) gameStartTime.invoke(game);
            if (start == null) return "";
            Context context = context();
            java.text.DateFormat format = context != null
                    ? android.text.format.DateFormat.getTimeFormat(context)
                    : java.text.DateFormat.getTimeInstance(java.text.DateFormat.SHORT);
            return format.format(start);
        } catch (Throwable failure) {
            return "";
        }
    }

    private static Object field(Object owner, String name) throws Exception {
        Field field = owner.getClass().getField(name);
        return field.get(owner);
    }

    private static Object declaredField(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(owner);
    }

    // ---------------------------------------------------------------------------------------
    // Hooks
    // ---------------------------------------------------------------------------------------

    /**
     * Patched at the entry of the notification manager's per-notification handler: true drops the
     * notification. {@code notification} is a GCMNotificationObj; a match notification carries its
     * game in the Game field (NotificationGameObj: GameID, CompetitionID) and the competition in
     * competitionId. Notifications without a game (news, transfers) always pass.
     */
    public static boolean blocksNotification(Object notification) {
        if (!isSurfaceOn(SURFACE_NOTIFICATIONS)) return false;
        try {
            if (notification == null || snapshot().isEmpty()) return false;
            Object game = declaredField(notification, "Game");
            if (game == null) return false;
            Field gameIdField = game.getClass().getDeclaredField("GameID");
            Field competitionField = game.getClass().getDeclaredField("CompetitionID");
            gameIdField.setAccessible(true);
            competitionField.setAccessible(true);
            int id = gameIdField.getInt(game);
            int competition = competitionField.getInt(game);
            Field topCompetition = notification.getClass().getDeclaredField("competitionId");
            topCompetition.setAccessible(true);
            return isSpoilerGame(id, competition) || isSpoilerComp(topCompetition.getInt(notification));
        } catch (Throwable failure) {
            return false;
        }
    }

    /**
     * Patched at the entry of the list rows' score formatter (GameObj, boolean, abnormal texts):
     * the kickoff time for a marked match that has started, else null (the stock text).
     */
    public static String rowScoreText(Object game) {
        if (!isSurfaceOn(SURFACE_LISTS)) return null;
        if (!hidesGame(game)) return null;
        String time = kickoff(game);
        return time.isEmpty() ? null : time;
    }

    /**
     * Patched before the list row binder returns ({@code binding} is ScoresGameItemLayoutBinding):
     * for a marked match the status line is blank, and the result description and the qualify
     * icons are hidden. The binder sets each of these views again on every bind, so a recycled row
     * of another match is stock again.
     */
    public static void afterRowBound(Object binding, Object item, Object game) {
        try {
            boolean status = isSurfaceOn(SURFACE_STATUS);
            boolean winner = isSurfaceOn(SURFACE_WINNER);
            if (binding == null || (!status && !winner) || !hidesGame(game)) return;
            if (status) {
                ((TextView) field(binding, "tvGameEnd")).setText(NBSP);
            }
            if (winner) {
                ((View) field(binding, "tvWinDescription")).setVisibility(View.GONE);
                ((View) field(binding, "scorePenaltyHome")).setVisibility(View.GONE);
                ((View) field(binding, "scorePenaltyAway")).setVisibility(View.GONE);
            }
        } catch (Throwable failure) {
            Log.w(TAG, "row not hidden: " + failure.getClass().getName());
        }
    }

    /** The score box being bound (main thread only; ScoreBoxView.a does not re-enter itself). */
    private static Object scoreBoxView, scoreBoxGame;

    /**
     * Patched at the entry of ScoreBoxView.a(GameObj): remembers the view and its game for
     * {@link #afterScoreBox()}, because the binder reuses its parameter registers before it returns.
     */
    public static void beforeScoreBox(Object view, Object game) {
        scoreBoxView = view;
        scoreBoxGame = game;
    }

    /**
     * Patched before every return of ScoreBoxView.a(GameObj) (the match page header): for a marked
     * match the score line (gameStateTitle) shows the kickoff time, the status label is blank and
     * the winner marks (bold name, winner icons) are cleared.
     */
    public static void afterScoreBox() {
        Object view = scoreBoxView;
        Object game = scoreBoxGame;
        scoreBoxView = null;
        scoreBoxGame = null;
        try {
            boolean header = isSurfaceOn(SURFACE_MATCH_HEADER);
            boolean status = isSurfaceOn(SURFACE_STATUS);
            boolean winner = isSurfaceOn(SURFACE_WINNER);
            if (view == null || (!header && !status && !winner) || !hidesGame(game)) return;
            Method getBinding = view.getClass().getDeclaredMethod("getBinding");
            getBinding.setAccessible(true);
            Object binding = getBinding.invoke(view);
            if (binding == null) return;
            if (header) {
                ((TextView) field(binding, "gameStateTitle")).setText(kickoff(game));
            }
            if (status) {
                ((TextView) field(binding, "gameStateLabel")).setText(NBSP);
            }
            if (winner) {
                for (String name : new String[]{"home", "away"}) {
                    TextView team = (TextView) field(binding, name);
                    team.getPaint().setFakeBoldText(false);
                    team.invalidate();
                }
                ((View) field(binding, "winningTeamIconHome")).setVisibility(View.GONE);
                ((View) field(binding, "winningTeamIconAway")).setVisibility(View.GONE);
            }
        } catch (Throwable failure) {
            Log.w(TAG, "header not hidden: " + failure.getClass().getName());
        }
    }

    // ---------------------------------------------------------------------------------------
    // Toggles
    // ---------------------------------------------------------------------------------------

    /**
     * Patched right after the match page adds its follow bell to the toolbar group: adds the
     * spoiler-free toggle for the GameCenterBaseActivity's GameObj (its one GameObj field, found by
     * type). The activity is the group's context.
     */
    public static void addMatchToggle(ViewGroup group) {
        try {
            if (group == null || !isMasterOn()) return;
            final Activity host = activityOf(group.getContext());
            if (host == null || !isGameCenter(host.getClass())) return;
            final Object game = gameOf(host);
            if (game == null) return;
            resolveGame(game);
            final int id = (Integer) gameId.invoke(game);
            final int competition = (Integer) gameCompetition.invoke(game);
            if (id <= 0) return;
            addToggle(group, new Toggle() {
                @Override
                public boolean isOn() {
                    return isSpoilerGame(id, competition);
                }

                @Override
                public void flip() {
                    if (isSpoilerComp(competition)) {
                        toast(host, "The whole competition is spoiler-free. Turn it off on the competition page.");
                        return;
                    }
                    report(host, toggleGame(id));
                }
            });
        } catch (Throwable failure) {
            Log.w(TAG, "match toggle not added: " + failure.getClass().getName());
        }
    }

    /**
     * Patched where the entity page header adds its follow bell to its toolbar group (after the
     * bell). Acts only on SingleEntityDashboardActivity showing a competition: the entity id and
     * type come from its intent ("entityIdTag"/"entityTypeTag", or the deep link's
     * "entityid"/"entitytype"), and the type is resolved with eDashboardEntityType.create(int).
     */
    public static void addCompetitionToggle(ViewGroup group) {
        try {
            if (group == null || !isMasterOn()) return;
            final Activity host = activityOf(group.getContext());
            if (host == null || !DASHBOARD_ACTIVITY.equals(host.getClass().getName())) return;
            Intent intent = host.getIntent();
            if (intent == null) return;
            int id = intent.getIntExtra("entityIdTag", -1);
            int type = intent.getIntExtra("entityTypeTag", -1);
            Uri data = intent.getData();
            if ((id <= 0 || type < 0) && data != null) {
                id = parse(data.getQueryParameter("entityid"));
                type = parse(data.getQueryParameter("entitytype"));
            }
            if (id <= 0 || !isCompetitionType(host, type)) return;
            final int competition = id;
            addToggle(group, new Toggle() {
                @Override
                public boolean isOn() {
                    return isSpoilerComp(competition);
                }

                @Override
                public void flip() {
                    report(host, toggleComp(competition));
                }
            });
        } catch (Throwable failure) {
            Log.w(TAG, "competition toggle not added: " + failure.getClass().getName());
        }
    }

    private static boolean isCompetitionType(Activity host, int type) throws Exception {
        if (type < 0) return false;
        Class<?> types = Class.forName(ENTITY_TYPE, false, host.getClass().getClassLoader());
        Object resolved = types.getMethod("create", int.class).invoke(null, type);
        return resolved instanceof Enum && "Competition".equals(((Enum<?>) resolved).name());
    }

    private static int parse(String value) {
        if (value == null) return -1;
        try {
            return Integer.parseInt(value.trim());
        } catch (NumberFormatException notANumber) {
            return -1;
        }
    }

    private static boolean isGameCenter(Class<?> type) {
        for (; type != null && type != Activity.class; type = type.getSuperclass()) {
            if (GAME_CENTER_ACTIVITY.equals(type.getName())) return true;
        }
        return false;
    }

    private static Object gameOf(Activity activity) throws Exception {
        for (Class<?> type = activity.getClass(); type != null && type != Activity.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (GAME_OBJ.equals(field.getType().getName()) && !java.lang.reflect.Modifier.isStatic(field.getModifiers())) {
                    field.setAccessible(true);
                    return field.get(activity);
                }
            }
        }
        return null;
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private interface Toggle {
        boolean isOn();

        void flip();
    }

    /** Adds (or replaces) the toggle: an eye icon, crossed out while the mark is on. */
    private static void addToggle(ViewGroup group, final Toggle toggle) {
        View old = group.findViewWithTag(TOGGLE_TAG);
        if (old != null && old.getParent() instanceof ViewGroup) ((ViewGroup) old.getParent()).removeView(old);
        Context context = group.getContext();
        float density = context.getResources().getDisplayMetrics().density;
        int size = Math.round(40 * density);
        int padding = Math.round(9 * density);
        final ImageView icon = new ImageView(context);
        icon.setTag(TOGGLE_TAG);
        icon.setPadding(padding, padding, padding, padding);
        final EyeDrawable eye = new EyeDrawable(density);
        eye.crossed = toggle.isOn();
        icon.setImageDrawable(eye);
        icon.setContentDescription("Spoiler-free mode");
        icon.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View clicked) {
                try {
                    toggle.flip();
                    eye.crossed = toggle.isOn();
                    eye.invalidateSelf();
                } catch (Throwable failure) {
                    Log.w(TAG, "toggle failed: " + failure.getClass().getName());
                }
            }
        });
        group.addView(icon, new ViewGroup.LayoutParams(size, size));
    }

    private static void report(Context context, Boolean marked) {
        if (marked == null) {
            toast(context, "Could not save the change");
        } else {
            toast(context, marked ? "Spoiler-free on: scores and alerts are hidden" : "Spoiler-free off");
        }
    }

    private static void toast(Context context, String text) {
        try {
            Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // A toast is only feedback.
        }
    }

    /** A plain eye outline drawn in code (no resources), with a slash while the mark is on. */
    private static final class EyeDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF oval = new RectF();
        boolean crossed;

        EyeDrawable(float density) {
            paint.setColor(Color.WHITE);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2 * density);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float w = b.width();
            float h = b.height();
            oval.set(b.left + w * 0.05f, b.top + h * 0.25f, b.right - w * 0.05f, b.bottom - h * 0.25f);
            canvas.drawOval(oval, paint);
            canvas.drawCircle(b.exactCenterX(), b.exactCenterY(), Math.min(w, h) * 0.14f, paint);
            if (crossed) canvas.drawLine(b.left + w * 0.1f, b.bottom - h * 0.1f, b.right - w * 0.1f, b.top + h * 0.1f, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
