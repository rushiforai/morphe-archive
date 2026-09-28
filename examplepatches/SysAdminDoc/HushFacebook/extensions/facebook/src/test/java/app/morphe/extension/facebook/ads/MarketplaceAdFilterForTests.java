/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import com.facebook.react.bridge.ReadableMap;

import java.util.HashMap;
import java.util.Map;

/** The Marketplace ad filter as Facebook's Networking module calls it, for tests in any package. */
public final class MarketplaceAdFilterForTests {
    private MarketplaceAdFilterForTests() {
    }

    /** A request's data as the Networking module gets it from React Native: a few named strings. */
    public static final class RequestData implements ReadableMap {
        final Map<String, String> strings = new HashMap<>();

        public RequestData(String trackingName, String body) {
            if (trackingName != null) strings.put("trackingName", trackingName);
            if (body != null) strings.put("string", body);
        }

        @Override
        public boolean hasKey(String name) {
            return strings.containsKey(name);
        }

        @Override
        public String getString(String name) {
            return strings.get(name);
        }
    }

    /** The feed query's body as Relay sends it, the two ad variables as it names them. */
    public static String feedBody(String skipAds, String skipBoosted) {
        return "doc_id=29362048826717980&variables=%7B%22count%22%3A24%2C%22shouldSkipAdRequest%22%3A" + skipAds
                + "%2C%22shippedOnly%22%3Anull%2C%22shouldSkipBoostedListingAdRequest%22%3A" + skipBoosted
                + "%2C%22scale%22%3A2.625%7D&fb_api_req_friendly_name=MarketplaceHomeFeedQueryRendererQuery";
    }

    /** The hook, with the tracking name Relay gives [query]. */
    public static String requestBody(String query, String body) {
        return MarketplaceAdFilter.requestBody(body, new RequestData("RelayFBNetwork_" + query, body));
    }

    /** Says the patch is in the build, or with null, asks SettingsStatus again. */
    public static void inBuild(Boolean inBuild) {
        MarketplaceAdFilter.inBuildForTests = inBuild;
    }

    /** Forgets the log count, as a new process would. */
    public static void forget() {
        MarketplaceAdFilter.forget();
    }

    /**
     * The feed's ads-only query, handed to the hook with the patch in the build. True when it's held
     * back, which is the switch changing what Facebook would have sent.
     */
    public static boolean holdsBackAnAdsQuery() {
        Boolean before = MarketplaceAdFilter.inBuildForTests;
        MarketplaceAdFilter.inBuildForTests = Boolean.TRUE;
        try {
            String body = "doc_id=1&variables=%7B%22count%22%3A4%7D";
            return requestBody("MarketplaceHomeFeedAdsQueryRendererQuery", body) == null;
        } finally {
            MarketplaceAdFilter.inBuildForTests = before;
        }
    }

    /**
     * The feed's own query, naming both ad variables false, handed to the hook with the patch in the
     * build. True when it goes out asking to skip the ads.
     */
    public static boolean asksTheFeedToSkipAds() {
        Boolean before = MarketplaceAdFilter.inBuildForTests;
        MarketplaceAdFilter.inBuildForTests = Boolean.TRUE;
        try {
            String body = feedBody("false", "false");
            return !body.equals(requestBody("MarketplaceHomeFeedQueryRendererQuery", body));
        } finally {
            MarketplaceAdFilter.inBuildForTests = before;
        }
    }
}
