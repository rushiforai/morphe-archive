/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Hide sponsored search results patch does to each page of search results before
 * Facebook builds the page.
 *
 * <p>A page of search results is a list of modules, one per block on screen, and each module
 * carries its role: the server's GraphQLGraphSearchResultRole, whose constant names the obfuscator
 * keeps. Facebook's own module class keeps a set of four of them as its ads (SEARCH_ADS,
 * DEPENDENT_SEARCH_ADS, LATE_DEPENDENT_SEARCH_ADS, TOP_POSITION_SEARCH_ADS), and the enum names
 * five more after ads. Every page goes through one constructor, and the hook first in it, shared
 * with Hide Meta AI in search, hands the page's module list to {@link #keptResults} after Meta AI's
 * filter (SearchResultsPage). A module whose role is one of {@link #AD_ROLES} doesn't make it into
 * the page. Nothing else is looked at, so a person, a page or a post you searched for stays
 * whatever it shows, and the Meta AI tab's own page is left whole.
 *
 * <p>The module class and the field its role sits in are Redex names that change every build, so
 * the patch fills in two stubs: {@link #isModule} and {@link #role}.
 *
 * <p>It fails open: switch off, a pause, settings that aren't ready, a module it can't read, or any
 * failure in here, and the page keeps every module Facebook sent.
 */
public final class SearchAdFilter {
    /**
     * The diagnostic counter route: each page, each module's role, and the modules left out. Hide
     * Meta AI in search counts the same pages under "Search results", by its own roles.
     */
    static final String ROUTE = "Search ads";

    /**
     * The name of the Meta AI tab's own page, which this leaves whole as Hide Meta AI in search does
     * (MetaAiSearch.META_AI_TAB_PAGE, which the patches hold both builds to), and what it counts as.
     */
    static final String META_AI_TAB_PAGE = "search_meta_ai_answer_module";
    static final String META_AI_TAB_KIND = "Meta AI tab page";

    /**
     * The roles that are ads: Facebook's own ad set first, then the roles named after ads beside
     * it. The patch holds the role enum to every one of them, and its own list to this one.
     */
    static final String[] AD_ROLES = {
            "SEARCH_ADS",
            "DEPENDENT_SEARCH_ADS",
            "LATE_DEPENDENT_SEARCH_ADS",
            "TOP_POSITION_SEARCH_ADS",
            "TOP_POSITION_SHOPPABLE_ADS",
            "MARKETPLACE_SEARCH_ADS",
            "MARKETPLACE_BOOSTED_LISTING_SEARCH_ADS",
            "SEARCH_ADS_DISCOVERY_HEADER",
            "SEARCH_ADS_FLOATING_SEE_MORE",
    };

    /** What a module counts as when its role can't be read, each its own shape for the report. */
    static final String NOT_A_MODULE = "not a module";
    static final String NO_ROLE = "no role";
    static final String NOT_AN_ENUM = "role not an enum";
    static final String NOT_PATCHED = "accessor not patched";
    static final String READ_FAILED = "read failed";

    /** What {@link #role} answers until the patch fills it in. */
    static final Object UNPATCHED = new Object();

    /** A page's modules, read through the stubs the patch filled in or through a test's stand-in. */
    interface Modules {
        boolean isModule(Object item);

        @Nullable
        Object role(Object module);
    }

    static final Modules PATCHED = new Modules() {
        @Override
        public boolean isModule(Object item) {
            return SearchAdFilter.isModule(item);
        }

        @Nullable
        @Override
        public Object role(Object module) {
            return SearchAdFilter.role(module);
        }
    };

    private SearchAdFilter() {
    }

    /**
     * Called by the page hook (SearchResultsPage) with a page's modules, after Meta AI's filter, and
     * the page's name. Null keeps the list it was handed; otherwise the modules to keep, in their
     * order, which the patch copies into an ImmutableList. Never throws.
     *
     * @param modules the page's module list.
     * @param page    the page's name.
     */
    @Nullable
    public static List<Object> keptResults(@Nullable List<?> modules, @Nullable String page) {
        return keptResults(modules, page, PATCHED);
    }

    /** {@link #keptResults(List, String)} with the module reads passed in, so a test can stand in for the stubs. */
    @Nullable
    @SuppressWarnings("unchecked")
    static List<Object> keptResults(@Nullable List<?> modules, @Nullable String page, Modules access) {
        if (modules != null && META_AI_TAB_PAGE.equals(page)) {
            HookStatus.invoked(FamilyNames.SPONSORED_SEARCH);
            FeedFilterCounters.sawKind(ROUTE, META_AI_TAB_KIND);
            return null;
        }
        List<?> kept = withoutAds(modules, access);
        return kept == modules ? null : (List<Object>) kept;
    }

    /**
     * The page's modules without the ads: the same list when none is an ad, so a page with none
     * keeps the list Facebook built. Never throws.
     */
    static List<?> withoutAds(List<?> modules, Modules access) {
        try {
            HookStatus.invoked(FamilyNames.SPONSORED_SEARCH);
            if (modules == null) return null;
            FeedFilterCounters.sawList(ROUTE, modules.size());
            if (modules.isEmpty()) return modules;

            boolean on = switchedOn();
            List<String> roles = new ArrayList<>(modules.size());
            ArrayList<Object> kept = null;
            for (int index = 0; index < modules.size(); index++) {
                Object module = modules.get(index);
                String role = roleName(module, access);
                roles.add(role);
                FeedFilterCounters.sawKind(ROUTE, role);
                if (on && isAdRole(role)) {
                    if (kept == null) {
                        kept = new ArrayList<>(modules.size());
                        kept.addAll(modules.subList(0, index));
                    }
                    FeedFilterCounters.removed(ROUTE, 1, role);
                } else if (kept != null) {
                    kept.add(module);
                }
            }

            // What a page held, as role names and how many of each: the server's enum constants,
            // never what a module shows.
            final int left = kept == null ? modules.size() : kept.size();
            Logger.printDebug(() -> "Search page: " + modules.size() + " modules, " + left + " kept. Roles: "
                    + summary(roles) + (on ? "" : " (switch off)"));
            return kept == null ? modules : kept;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPONSORED_SEARCH, "search page filter", failure);
            Logger.printException(() -> "Search ads: could not read a page of results", failure);
            return modules;
        }
    }

    /**
     * Injection point, filled in by the patch: whether an item is a search module. The patch
     * replaces this body with an instance-of the module class, whose name changes every build.
     */
    public static boolean isModule(Object item) {
        return false;
    }

    /**
     * Injection point, filled in by the patch: the module's role, the enum constant Facebook read
     * from the edge's result_role. The patch replaces this body with a read of the module's role
     * field. Only an item {@link #isModule} took may be passed.
     */
    public static Object role(Object module) {
        return UNPATCHED;
    }

    /** The module's role as its constant name, or why there is none. Never throws. */
    static String roleName(Object item, Modules access) {
        Object role;
        try {
            if (item == null || !access.isModule(item)) return NOT_A_MODULE;
            role = access.role(item);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPONSORED_SEARCH, "search module role", failure);
            return READ_FAILED;
        }
        if (role == UNPATCHED) {
            HookStatus.missingMember(FamilyNames.SPONSORED_SEARCH, "field", "search module", "role");
            return NOT_PATCHED;
        }
        if (role == null) return NO_ROLE;
        if (!(role instanceof Enum)) return NOT_AN_ENUM;
        HookStatus.bound(FamilyNames.SPONSORED_SEARCH, "search module#role");
        return ((Enum<?>) role).name();
    }

    /** Whether a role name read off a module is one of {@link #AD_ROLES}. */
    static boolean isAdRole(String role) {
        if (role == null) return false;
        for (String ad : AD_ROLES) {
            if (ad.equals(role)) return true;
        }
        return false;
    }

    /** "FEED_POSTS 3, SEARCH_ADS 1", in the order each role first came. */
    static String summary(List<String> roles) {
        Map<String, Integer> counts = new LinkedHashMap<>();
        for (String role : roles) {
            Integer seen = counts.get(role);
            counts.put(role, seen == null ? 1 : seen + 1);
        }
        StringBuilder line = new StringBuilder();
        for (Map.Entry<String, Integer> entry : counts.entrySet()) {
            if (line.length() > 0) line.append(", ");
            line.append(entry.getKey()).append(' ').append(entry.getValue());
        }
        return line.toString();
    }

    /** The switch. Off, unreadable, or asked before the settings are ready, the page stays whole. */
    private static boolean switchedOn() {
        try {
            return Utils.settingsReady() && Settings.HIDE_SPONSORED_SEARCH_RESULTS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPONSORED_SEARCH, "switch read", failure);
            return false;
        }
    }
}
