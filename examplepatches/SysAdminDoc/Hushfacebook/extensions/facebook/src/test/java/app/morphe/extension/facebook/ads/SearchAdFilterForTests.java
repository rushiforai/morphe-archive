/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import java.util.Arrays;
import java.util.List;

/**
 * A page of search results as the filter sees one, with the stubs the patch fills in played by a
 * stand-in module class.
 */
public final class SearchAdFilterForTests {
    private SearchAdFilterForTests() {
    }

    /** Stands in for GraphQLGraphSearchResultRole: only the constant names matter to the filter. */
    public enum Role {
        UNSET_OR_UNRECOGNIZED_ENUM_VALUE,
        ENTITY_USER,
        FEED_POSTS,
        ENTITY_PAGES,
        SEARCH_ADS,
        DEPENDENT_SEARCH_ADS,
        LATE_DEPENDENT_SEARCH_ADS,
        TOP_POSITION_SEARCH_ADS,
        TOP_POSITION_SHOPPABLE_ADS,
        MARKETPLACE_SEARCH_ADS,
        MARKETPLACE_BOOSTED_LISTING_SEARCH_ADS,
        SEARCH_ADS_DISCOVERY_HEADER,
        SEARCH_ADS_FLOATING_SEE_MORE,
        FACEBOOK_ADVERTISING,
        PROMOTED_ENTITY_MEDIA,
    }

    /** Stands in for the renamed module class: its role field holds what the edge's result_role read. */
    public static final class Module {
        public final Object role;

        public Module(Object role) {
            this.role = role;
        }

        @Override
        public String toString() {
            return "Module(" + role + ")";
        }
    }

    /** The stubs as the patch fills them: an instance-of the module class and a read of its role field. */
    static final SearchAdFilter.Modules STAND_IN = new SearchAdFilter.Modules() {
        @Override
        public boolean isModule(Object item) {
            return item instanceof Module;
        }

        @Override
        public Object role(Object module) {
            return ((Module) module).role;
        }
    };

    /** The page filter with the stand-in stubs: the same list when no module is an ad. */
    public static List<?> withoutAds(List<?> modules) {
        return SearchAdFilter.withoutAds(modules, STAND_IN);
    }

    /** The entry the shared page hook calls, with the stand-in stubs: null keeps the list. */
    public static List<Object> keptResults(List<?> modules, String page) {
        return SearchAdFilter.keptResults(modules, page, STAND_IN);
    }

    /**
     * A page with a person, a SEARCH_ADS module and a post, filtered the way the patched page does.
     * True when the ad came out, which is the switch changing what Facebook would have built.
     */
    public static boolean dropsAnAd() {
        Module ad = new Module(Role.SEARCH_ADS);
        List<?> page = withoutAds(Arrays.asList(new Module(Role.ENTITY_USER), ad, new Module(Role.FEED_POSTS)));
        return !page.contains(ad);
    }
}
