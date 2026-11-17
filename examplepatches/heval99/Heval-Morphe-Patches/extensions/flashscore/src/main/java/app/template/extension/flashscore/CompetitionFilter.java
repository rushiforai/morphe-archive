package app.template.extension.flashscore;

import android.content.Context;
import android.view.View;

import java.util.ArrayList;
import java.util.Set;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Hide competitions" (Patch settings switch {@value #FEATURE_ID}, list {@value #LIST_ID}): the
 * user long-presses a match row and picks "Hide this competition"; the matches of that competition
 * then leave every match list that reads its events through the app's event filter (Today, Live,
 * sports, custom lists). The Favourites list ({@value #FAVOURITES_FILTER}) is never filtered, so a
 * starred match stays there.
 *
 * <p>The key of a competition is its template id (the id Flashscore keeps pinned leagues under, for
 * example "1_8bP2bXmH": sport id and template): the app's LeagueRowModel calls it tournamentTemplateId,
 * next to the season's tournamentId and the stage's tournamentStageId, so it stays the same across
 * seasons and stages. When an event carries no template id the full league id is used instead. The
 * label is the league header's prefix and name, "AFRICA · Africa Cup of Nations - Qualification"
 * (NAME_PART_1 and NAME_PART_2; the feed's NAME is not sent for list leagues). The user can remove
 * entries or clear the list in Patch settings.
 *
 * <p>The list is read on every rebuild of a match list, so a change applies when the list reloads;
 * no restart is needed. Only the event list changes: a league's header disappears with its events.
 *
 * <p>The methods marked "patched" are stubs: the patch rewrites their bodies with the app's R8
 * names (the event entity, its model, the league holder, the league and its fields, the list's
 * filter type).
 */
@SuppressWarnings("unused")
public final class CompetitionFilter {
    static final String FEATURE_ID = "flashscore.hide_competitions";
    static final String LIST_ID = "flashscore.hidden_competitions";
    /** The filter type (an enum constant name) of the Favourites list. */
    static final String FAVOURITES_FILTER = "FILTER_MYFS";

    private CompetitionFilter() {
    }

    // ---------------------------------------------------------------------------------------
    // Patched accessors (stubs; the patch writes their bodies)
    // ---------------------------------------------------------------------------------------

    /** Patched: whether {@code item} is an event entity (the elements of the filtered list). */
    public static boolean isEvent(Object item) {
        return false;
    }

    /** Patched: the event model of event entity {@code event}. */
    public static Object eventModel(Object event) {
        return null;
    }

    /** Patched: the league holder of event model {@code model}. */
    public static Object leagueHolder(Object model) {
        return null;
    }

    /** Patched: the league model of league holder {@code holder}. */
    public static Object league(Object holder) {
        return null;
    }

    /** Patched: the league's id (sport and header, may name a stage). */
    public static String leagueId(Object league) {
        return null;
    }

    /** Patched: the league's template id (the competition across seasons and stages). */
    public static String leagueTemplateId(Object league) {
        return null;
    }

    /** Patched: the league's feed NAME (not sent for list leagues; a fallback only). */
    public static String leagueName(Object league) {
        return null;
    }

    /** Patched: the league's NAME_PART_1, the header's prefix ("AFRICA"). */
    public static String leaguePrefix(Object league) {
        return null;
    }

    /** Patched: the league's NAME_PART_2, the header's league name ("Africa Cup of Nations - Qualification"). */
    public static String leagueTitle(Object league) {
        return null;
    }

    /** Patched: the filter type of list filter {@code filter} (an enum constant). */
    public static Object filterType(Object filter) {
        return null;
    }

    // ---------------------------------------------------------------------------------------
    // Keys
    // ---------------------------------------------------------------------------------------

    /** The league of event model {@code model}, or null. */
    static Object leagueOfModel(Object model) {
        if (model == null) return null;
        Object holder = leagueHolder(model);
        return holder == null ? null : league(holder);
    }

    /** The key of {@code league}: its template id, else its league id, else null. */
    static String key(Object league) {
        if (league == null) return null;
        String template = leagueTemplateId(league);
        if (template != null && !template.isEmpty()) return template;
        String id = leagueId(league);
        return id == null || id.isEmpty() ? null : id;
    }

    /** Whether {@code league} is in {@code hidden} by its template id or its league id. */
    static boolean isHidden(Object league, Set<String> hidden) {
        if (league == null || hidden.isEmpty()) return false;
        String template = leagueTemplateId(league);
        if (template != null && hidden.contains(template)) return true;
        String id = leagueId(league);
        return id != null && hidden.contains(id);
    }

    private static String trimmed(String text) {
        return text == null ? "" : text.trim();
    }

    /** The league name the header shows ("Africa Cup of Nations - Qualification"), else the feed name, else null. */
    static String title(Object league) {
        if (league == null) return null;
        String title = trimmed(leagueTitle(league));
        if (title.isEmpty()) title = trimmed(leagueName(league));
        return title.isEmpty() ? null : title;
    }

    /** The picker label: "prefix · name" ("AFRICA · Africa Cup of Nations - Qualification"), else the key. */
    static String label(Object league, String key) {
        String title = title(league);
        if (title == null) return key;
        String prefix = trimmed(leaguePrefix(league));
        return prefix.isEmpty() ? title : prefix + SEPARATOR + title;
    }

    static final String SEPARATOR = " · ";

    /** Keys whose label was reported in this process (a hidden league seen in a list keeps its label fresh). */
    private static final Set<String> labelled = new java.util.HashSet<>();

    /** Reports the label of hidden {@code league} once per process (fixes labels saved before a name was known). */
    private static void rememberLabel(Object league) {
        String key = key(league);
        if (key == null) return;
        synchronized (labelled) {
            if (!labelled.add(key)) return;
        }
        String label = label(league, key);
        if (!label.equals(key)) HevalSettings.reportOptionsSeen(LIST_ID, key, label);
    }

    static boolean isFavourites(Object filter) {
        if (filter == null) return false;
        Object type = filterType(filter);
        return type instanceof Enum && FAVOURITES_FILTER.equals(((Enum<?>) type).name());
    }

    // ---------------------------------------------------------------------------------------
    // The hook
    // ---------------------------------------------------------------------------------------

    /**
     * Patched into the app's event filter (the method that logs "FILTER_EVENTS: "), after its own
     * filters ran and before the list is sorted: removes the events of hidden competitions from the
     * fresh list {@code events}, except in the Favourites list. {@code filter} is the list's filter.
     */
    public static void filterEvents(Object filter, ArrayList<Object> events) {
        try {
            if (events == null || events.isEmpty()) return;
            // Empty while the switch is off (the list depends on it), paused or in safe mode.
            Set<String> hidden = HevalSettings.getHidden(LIST_ID);
            if (hidden.isEmpty() || isFavourites(filter)) return;
            int kept = 0;
            int size = events.size();
            for (int i = 0; i < size; i++) {
                Object event = events.get(i);
                boolean drop = false;
                try {
                    if (isEvent(event)) {
                        Object league = leagueOfModel(eventModel(event));
                        drop = isHidden(league, hidden);
                        if (drop) rememberLabel(league);
                    }
                } catch (Throwable failure) {
                    HevalSettings.reportFailure(FEATURE_ID, failure);
                }
                if (!drop) {
                    if (kept != i) events.set(kept, event);
                    kept++;
                }
            }
            for (int i = size - 1; i >= kept; i--) events.remove(i);
        } catch (Throwable failure) {
            HevalSettings.reportFailure(FEATURE_ID, failure);
        }
    }

    // ---------------------------------------------------------------------------------------
    // The long-press entry
    // ---------------------------------------------------------------------------------------

    /** The league of a bound row, or null. */
    private static Object rowLeague(SpoilerFree.Row row) {
        Object rowModel = row.model;
        return rowModel == null ? null : leagueOfModel(SpoilerFree.eventModel(rowModel));
    }

    /** "Hide this competition" / "Show this competition" in the row's long-press dialog. */
    static final SpoilerFree.Action TOGGLE = new SpoilerFree.Action() {
        @Override
        public String title(SpoilerFree.Row row, String eventId) {
            try {
                if (isHidden(rowLeague(row), HevalSettings.getHidden(LIST_ID))) return "Show this competition";
            } catch (Throwable ignored) {
                // Offer hiding.
            }
            return "Hide this competition";
        }

        @Override
        public void run(Context context, View root, SpoilerFree.Row row, String eventId) {
            Object league = rowLeague(row);
            String key = key(league);
            if (key == null) {
                SpoilerFree.toast(context, "Could not find this match's competition");
                return;
            }
            boolean hide = !isHidden(league, HevalSettings.getHidden(LIST_ID));
            if (hide && HevalSettings.pickedHidden(LIST_ID).size() >= HevalSettings.MAX_HIDDEN) {
                SpoilerFree.toast(context, "The hidden competitions list is full (" + HevalSettings.MAX_HIDDEN
                    + "). Remove some or clear it in Patch settings, Leagues and countries, Hidden competitions.");
                return;
            }
            boolean saved;
            if (hide) {
                saved = HevalSettings.setHidden(LIST_ID, key, true);
            } else {
                // Take both forms out, so a competition hidden by either key comes back.
                saved = HevalSettings.setHidden(LIST_ID, key, false);
                String id = leagueId(league);
                if (saved && id != null && !id.equals(key)) saved = HevalSettings.setHidden(LIST_ID, id, false);
            }
            if (!saved) {
                SpoilerFree.toast(context, "Could not save the change");
                return;
            }
            if (hide) HevalSettings.reportOptionsSeen(LIST_ID, key, label(league, key));
            String title = CompetitionFilter.title(league);
            // The match lists cache their filtered events until they reload.
            SpoilerFree.toast(context, (hide ? "Hidden: " : "Shown again: ") + (title == null ? key : title)
                + ". Applies when the list reloads.");
        }
    };
}
