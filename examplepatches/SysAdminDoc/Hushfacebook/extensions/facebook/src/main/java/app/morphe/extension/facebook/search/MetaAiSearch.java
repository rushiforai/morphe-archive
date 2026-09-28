/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.search;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Hide Meta AI in search patch asks in three places of Facebook's search, on 577 and 580.
 *
 * <ul>
 *   <li>The results page asks one question before it adds a Meta AI answer on top of the results
 *   (it answers the placeholder it adds and the flag it sends with the results query from the same
 *   question). {@link #hideAnswer} goes first in it and answers no, which is what Facebook answers
 *   for an account that never gets the answer.</li>
 *   <li>Every page of results is built from a list of result modules, each with a role from
 *   Facebook's own GraphQLGraphSearchResultRole enum. {@link #keptResults} goes first in the page's
 *   constructor and leaves out the modules whose role is one of Meta AI's answer and prompt modules
 *   ({@link #HIDDEN_ROLES}). The server sends its answer in the first page of the All results even
 *   when the question above says no (a signed-in 580 on the S22, 2026-09-27), so this is what takes
 *   it off. Every other role, UNSET_OR_UNRECOGNIZED_ENUM_VALUE and one this code has never heard of
 *   included, stays. The Meta AI tab's own page ({@link #META_AI_TAB_PAGE}) is left whole.</li>
 *   <li>A suggestion in the search box arrives from Facebook's servers with a flag that opens it in
 *   Meta AI instead of the results. {@link #opensMetaAi} reads the flag as it's stored and answers
 *   no, so the suggestion searches like any other.</li>
 * </ul>
 *
 * <p>What the patch leaves alone is the explicit way in: the Meta AI button beside the search box
 * opens AI mode without asking any of the three, and the results page's own Meta AI tab builds its
 * answer as a page of its own, which the page hook knows by its name and leaves whole.
 *
 * <p>Each hook fails open. With the switch off, Hushfacebook paused, the settings not ready yet, or
 * any failure in here, Facebook gets its own answer and its own list. Nothing here reads what was
 * searched for: the report counts role names, which are enum constants, and whether a suggestion
 * carried the flag.
 */
public final class MetaAiSearch {
    /** The diagnostic counter routes. */
    static final String ANSWER_ROUTE = "Search Meta AI answer";
    static final String RESULTS_ROUTE = "Search results";
    static final String SUGGESTIONS_ROUTE = "Search suggestions";

    /** What a Meta AI answer the page no longer adds counts under. */
    static final String ANSWER = "Meta AI answer";

    /** What a suggestion that would have opened Meta AI counts under, as a kind and as a removal. */
    static final String OPENS_META_AI = "opens Meta AI";

    /** What a module whose role can't be read counts under, as a kind and in the debug line. */
    static final String NO_ROLE = "no role";

    /** What a Meta AI tab page counts under, as a kind, each time one is left whole. */
    static final String META_AI_TAB_KIND = "Meta AI tab page";

    /**
     * The name Facebook gives the page its results page's Meta AI tab builds, the one page of that
     * tab. It holds the tab's own answer, a SEARCH_META_AI_ANSWER module, and is left whole. The
     * patch holds both builds to the tab's builder naming its page this.
     */
    static final String META_AI_TAB_PAGE = "search_meta_ai_answer_module";

    /**
     * The result roles of Meta AI's answer and prompt modules. SEARCH_META_AI_ANSWER is the answer
     * card at the top of the All results ("Summary", with Good response and Bad response), the only
     * Meta AI role a signed-in 580 served on the S22; its body, full body and loading state follow
     * it. The HCM ones are the answer, the "Ask Meta AI" prompt pills (with and without their
     * loading state) and the AI mode card of the top module. All eight are in the role enum on 577
     * and 580, and the patch holds each build to every one. Left out on purpose: AI mode's own
     * modules (AI_MODE_CACHED_CONTENT, AI_MODE_FOLLOWUP_SUGGESTIONS), the Meta AI tab's
     * (SEARCH_META_AI_TAB, SEARCH_META_AI_TAB_BODY), and the answer sheet's friend and group posts,
     * which are people's posts.
     */
    static final String[] HIDDEN_ROLES = {
            "SEARCH_META_AI_ANSWER",
            "SEARCH_META_AI_ANSWER_BODY",
            "SEARCH_META_AI_ANSWER_BODY_FULL",
            "SEARCH_META_AI_ANSWER_LOADING",
            "HCM_SEARCH_META_AI_ANSWER",
            "HCM_RELATED_META_AI_PROMPTS",
            "HCM_RELATED_META_AI_PROMPTS_W_LOADING",
            "HCM_SEARCH_AI_MODE",
    };

    /** What {@link #unitRole} answers until the patch fills it in. */
    static final Object NOT_PATCHED = new Object();

    /** The accessor {@link #keptResults} reads a module's role with; a test stands in for it. */
    interface RoleAccessor {
        Object role(Object module) throws Throwable;
    }

    static final RoleAccessor PATCHED = MetaAiSearch::unitRole;

    private MetaAiSearch() {
    }

    /** Whether the switch is on and Hushfacebook can act: settings ready, not paused. */
    private static boolean hiding() {
        return Utils.settingsReady() && Settings.HIDE_META_AI_IN_SEARCH.get();
    }

    /**
     * Injection point, first thing in the results page's question of whether it adds a Meta AI
     * answer. True answers no for Facebook. Never throws.
     */
    public static boolean hideAnswer() {
        try {
            HookStatus.invoked(FamilyNames.META_AI_SEARCH);
            FeedFilterCounters.sawList(ANSWER_ROUTE, 1);
            if (!hiding()) return false;
            FeedFilterCounters.removed(ANSWER_ROUTE, 1, ANSWER);
            Logger.printDebug(() -> "Meta AI search: told the results page to leave out its Meta AI answer");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.META_AI_SEARCH, "Meta AI answer question", failure);
            return false;
        }
    }

    /**
     * Injection point, filled in by the patch: the result module's role, the constant of
     * Facebook's GraphQLGraphSearchResultRole enum. The patch replaces this body with a call to the
     * module's role accessor, whose name changes every build. Only a result module may be passed.
     */
    public static Object unitRole(Object module) {
        return NOT_PATCHED;
    }

    /**
     * Called by the page hook first in the constructor of a page of search results
     * ({@link SearchResultsPage}), with the page's result modules and its name. Null leaves the list
     * as it is; otherwise the modules to keep, in their order, which the patch copies into a list of
     * Facebook's own kind. Never throws.
     */
    @Nullable
    public static List<Object> keptResults(List<?> modules, @Nullable String page) {
        return keptResults(modules, page, PATCHED);
    }

    /** {@link #keptResults(List, String)} with the role accessor passed in, so a test can stand in for the stub. */
    @Nullable
    static List<Object> keptResults(@Nullable List<?> modules, @Nullable String page, RoleAccessor accessor) {
        try {
            HookStatus.invoked(FamilyNames.META_AI_SEARCH);
            if (modules == null) return null;
            FeedFilterCounters.sawList(RESULTS_ROUTE, modules.size());
            // A module is read only while the switch is on and Hushfacebook isn't paused, so off or
            // paused the page is Facebook's own, down to not being looked at.
            if (modules.isEmpty() || !hiding()) return null;
            if (META_AI_TAB_PAGE.equals(page)) {
                // Someone opened the Meta AI tab: its answer is what they asked for.
                FeedFilterCounters.sawKind(RESULTS_ROUTE, META_AI_TAB_KIND);
                Logger.printDebug(() -> "Meta AI search: left the Meta AI tab's own page as it is");
                return null;
            }

            List<Object> kept = null;
            List<String> roles = new ArrayList<>(modules.size());
            for (int index = 0; index < modules.size(); index++) {
                Object module = modules.get(index);
                String role = roleName(module, accessor);
                roles.add(role == null ? NO_ROLE : role);
                if (role == null) {
                    // Kept, and counted, so a report tells a page nobody could read from one with
                    // nothing to leave out.
                    FeedFilterCounters.sawKind(RESULTS_ROUTE, NO_ROLE);
                } else if (isMetaAiRole(role)) {
                    // The Meta AI roles that reach a page, dropped or kept, so a report from an
                    // account that's served another one names it.
                    FeedFilterCounters.sawKind(RESULTS_ROUTE, role);
                }
                if (role != null && isHiddenRole(role)) {
                    if (kept == null) kept = new ArrayList<>(modules.subList(0, index));
                    FeedFilterCounters.removed(RESULTS_ROUTE, 1, role);
                    continue;
                }
                if (kept != null) kept.add(module);
            }
            if (kept != null && kept.isEmpty()) FeedFilterCounters.emptied(RESULTS_ROUTE);
            final int dropped = kept == null ? 0 : modules.size() - kept.size();
            Logger.printDebug(() -> "Meta AI search: a results page of " + roles.size() + " modules ("
                    + String.join(", ", roles) + "), " + dropped + " left out");
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.META_AI_SEARCH, "search results page", failure);
            return null;
        }
    }

    /**
     * Injection point, where the search box's suggestion parser stores the flag Facebook's server
     * sent to open the suggestion in Meta AI. Answers the flag to store: false while the switch is
     * on, so the suggestion opens ordinary results; otherwise Facebook's own. Never throws.
     */
    public static boolean opensMetaAi(boolean opens) {
        try {
            HookStatus.invoked(FamilyNames.META_AI_SEARCH);
            FeedFilterCounters.sawList(SUGGESTIONS_ROUTE, 1);
            if (!opens) return false;
            FeedFilterCounters.sawKind(SUGGESTIONS_ROUTE, OPENS_META_AI);
            if (!hiding()) return true;
            FeedFilterCounters.removed(SUGGESTIONS_ROUTE, 1, OPENS_META_AI);
            Logger.printDebug(() -> "Meta AI search: a suggestion that would have opened Meta AI opens the results instead");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.META_AI_SEARCH, "search suggestion", failure);
            return opens;
        }
    }

    /**
     * The module's role name, or null when it has none this can read. An accessor that isn't
     * filled in or that throws is recorded in Hook status, and the module stays.
     */
    @Nullable
    static String roleName(Object module, RoleAccessor accessor) {
        Object role;
        try {
            role = accessor.role(module);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.META_AI_SEARCH, "search result role accessor", failure);
            return null;
        }
        if (role == NOT_PATCHED) {
            HookStatus.missingMember(FamilyNames.META_AI_SEARCH, "method", "search result module", "the role accessor");
            return null;
        }
        if (!(role instanceof Enum)) return null;
        HookStatus.bound(FamilyNames.META_AI_SEARCH, "search result module#role");
        return ((Enum<?>) role).name();
    }

    /** Whether a role is one of the Meta AI modules this leaves out of the results. */
    static boolean isHiddenRole(String role) {
        for (String hidden : HIDDEN_ROLES) {
            if (hidden.equals(role)) return true;
        }
        return false;
    }

    /** Whether a role names Meta AI or AI mode, for the report. */
    static boolean isMetaAiRole(String role) {
        return role.contains("META_AI") || role.contains("AI_MODE");
    }
}
