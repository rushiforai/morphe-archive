/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import androidx.annotation.Nullable;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.TreeMap;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.settings.BaseSettings;

/**
 * Debug-only schema evidence at the existing Marketplace Tigon boundary. The observer never holds
 * or changes text sent to JavaScript. It reports types, with query/model/field names drawn only from
 * fixed vocabulary; arbitrary keys, model names and all scalar values remain private. Known names
 * describe fields actually present, not a promise of fulfillment or distance semantics.
 */
final class MarketplaceResponseDiagnostics {
    static final int MAX_PAYLOAD_CHARS = 256 * 1024;
    static final int MAX_RESPONSE_CHARS = 2 * 1024 * 1024;
    static final int MAX_REQUESTS = 16;
    static final int MAX_SHAPES = 32;
    private static final String PREFIX = "Marketplace shape: ";
    private static final String[] QUERIES = {
            "MarketplaceHomeFeedAdsThemedQuery",
            "MarketplaceProductDetailsPageRelatedAdsDetailQuery",
            "MarketplaceHomeFeedQueryRendererQuery",
            "MarketplaceHomeQuery",
            "MarketplacePlainHomeAppQuery",
            "MarketplaceSearchApp_MarketplaceSearchFeedHeadQuery",
            "MarketplaceSearchFeedPaginationQuery",
    };
    private static final String[] MODELS = {
            "MarketplaceFeedGeneralListingObject", "MarketplaceFeedListingStoryObject",
            "MarketplaceFeedAdStory", "GroupCommerceProductItem", "MarketplaceSearch",
            "MarketplaceSearchFeedStoriesEdge",
    };
    // Structural fields used by the existing filter; the selection variables come from the fixture
    // query configs, including PlainHome's radius. Shipping names occur in stock app serializers,
    // without proven semantics on returned results.
    private static final Set<String> FIELDS = new HashSet<>(Arrays.asList(
            "__typename", "data", "edges", "node", "listing", "story", "sponsored_data", "ad_id",
            "marketplace_search", "feed_units", "location", "is_shipping_offered", "shipping_offer_type",
            "localOnly", "shippedOnly", "radius", "search_radius_in_meters"));
    private static final Map<Object, Observer> observers = new WeakHashMap<>();
    private static final Map<String, Set<String>> shapes = new HashMap<>();
    private static final Set<String> summaryBudgetNotices = new HashSet<>();

    private MarketplaceResponseDiagnostics() {
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && BaseSettings.DEBUG.get();
        } catch (Throwable unavailable) {
            return false;
        }
    }

    @Nullable
    private static String query(@Nullable String trackingName) {
        for (String known : QUERIES) {
            if ((MarketplaceAdFilter.RELAY + known).equals(trackingName)) return known;
        }
        return null;
    }

    static void request(String query, String body) {
        if (query(MarketplaceAdFilter.RELAY + query) == null || !enabled()) return;
        try {
            if (body.length() > MarketplaceAdFilter.MAX_BODY_CHARS) return;
            int[] range = MarketplaceAdFilter.variablesParameter(body);
            if (range == null) return;
            MarketplaceAdFilter.Decoded decoded = MarketplaceAdFilter.Decoded.of(body, range[0], range[1]);
            if (decoded == null) return;
            String text = new String(decoded.bytes, 0, decoded.length, StandardCharsets.UTF_8);
            MarketplaceSearchAds.Value variables = MarketplaceSearchAds.Parser.whole(text);
            if (variables.kind == '{') record(query, "request variables " + fields(text, variables));
        } catch (Throwable unreadable) {
            record(query, "unreadable request variables");
        }
    }

    static void piece(String piece, String trackingName, Object request) {
        String query = query(trackingName);
        if (query == null) return;
        if (!enabled()) {
            synchronized (observers) { observers.remove(request); }
            return;
        }
        try {
            Observer observer;
            synchronized (observers) {
                observer = observers.get(request);
                if (observer == null) {
                    if (observers.size() >= MAX_REQUESTS) {
                        record(query, "observer request budget");
                        return;
                    }
                    observer = new Observer(query);
                    observers.put(request, observer);
                }
            }
            observer.read(piece);
        } catch (Throwable unreadable) {
            record(query, "observer unavailable");
        }
    }

    static void whole(String text, String trackingName) {
        String query = query(trackingName);
        if (query == null || !enabled()) return;
        try {
            Observer observer = new Observer(query);
            observer.read(text);
            observer.end();
        } catch (Throwable unreadable) {
            record(query, "observer unavailable");
        }
    }

    static void end(Object request) {
        try {
            Observer observer;
            synchronized (observers) { observer = observers.remove(request); }
            if (observer != null && enabled()) observer.end();
        } catch (Throwable unreadable) {
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, "MarketplaceResponseDiagnostics",
                    () -> PREFIX + "observer end unavailable");
        }
    }

    private static final class Observer {
        private final String query;
        private final StringBuilder waiting = new StringBuilder();
        private int characters;
        private int depth;
        private boolean inString;
        private boolean escaped;
        private boolean stopped;
        private boolean complete = true;
        private int payloads;
        private int unrecognizedModels;
        private final Map<String, Integer> models = new TreeMap<>();

        Observer(String query) { this.query = query; }

        synchronized void read(String piece) {
            if (stopped) return;
            if (piece.length() > MAX_RESPONSE_CHARS - characters) { stop("response budget"); return; }
            characters += piece.length();
            for (int i = 0; i < piece.length(); i++) {
                char c = piece.charAt(i);
                if (depth == 0) {
                    if (c != '{' && c != '[') continue;
                    depth = 1;
                } else if (inString) {
                    if (escaped) escaped = false;
                    else if (c == '\\') escaped = true;
                    else if (c == '"') inString = false;
                } else if (c == '"') {
                    inString = true;
                } else if (c == '{' || c == '[') {
                    if (++depth > MarketplaceSearchAds.MAX_PARSE_DEPTH) { stop("depth budget"); return; }
                } else if (c == '}' || c == ']') {
                    depth--;
                }
                if (waiting.length() >= MAX_PAYLOAD_CHARS) { stop("payload budget"); return; }
                waiting.append(c);
                if (depth != 0) continue;
                String text = waiting.toString();
                waiting.setLength(0);
                if (waiting.capacity() > 65_536) waiting.trimToSize();
                try {
                    inspect(text, MarketplaceSearchAds.Parser.whole(text), "response", 0, new int[] {256});
                    payloads++;
                } catch (Exception unreadable) {
                    stop("unreadable payload");
                    return;
                }
            }
        }

        private void inspect(String text, MarketplaceSearchAds.Value value, String path, int level, int[] visits) {
            if (--visits[0] < 0 || level > 10) {
                complete = false;
                record(query, "shape traversal budget");
                return;
            }
            if (value.kind == '{') {
                String model = model(text, value);
                if (model.equals("unrecognized")) unrecognizedModels++;
                else if (!model.equals("none")) models.put(model, models.getOrDefault(model, 0) + 1);
                if (!record(query, path + " model=" + model + " " + fields(text, value))) complete = false;
                for (int i = 0; i < value.items.size(); i++) {
                    MarketplaceSearchAds.Value child = value.items.get(i);
                    if (child.kind != '{' && child.kind != '[') continue;
                    inspect(text, child, path + "." + field(text, value.names.get(i)), level + 1, visits);
                }
            } else if (value.kind == '[') {
                for (MarketplaceSearchAds.Value child : value.items) inspect(text, child, path + "[]", level + 1, visits);
            }
        }

        synchronized void end() {
            if (!stopped && waiting.length() > 0) stop("unfinished payload");
            Set<String> counts = new TreeSet<>();
            for (Map.Entry<String, Integer> model : models.entrySet()) counts.add(model.getKey() + ":" + model.getValue());
            record(query, "response summary payloads=" + payloads + " capture=" + (complete ? "complete" : "incomplete")
                    + " models={" + String.join(",", counts) + "} unrecognized_models=" + unrecognizedModels, true);
        }

        private void stop(String reason) {
            stopped = true;
            complete = false;
            waiting.setLength(0);
            waiting.trimToSize();
            record(query, reason + "; observer stopped");
        }
    }

    private static String fields(String text, MarketplaceSearchAds.Value object) {
        Set<String> fields = new TreeSet<>();
        Map<String, Integer> unknown = new TreeMap<>();
        for (int i = 0; i < object.items.size(); i++) {
            String field = field(text, object.names.get(i));
            String shape = type(text, object.items.get(i));
            if (field.equals("other")) unknown.put(shape, unknown.getOrDefault(shape, 0) + 1);
            else fields.add(field + ":" + shape);
        }
        for (Map.Entry<String, Integer> item : unknown.entrySet()) fields.add("other_" + item.getKey() + ":" + item.getValue());
        return "fields={" + String.join(",", fields) + "}";
    }

    private static String field(String text, int[] range) {
        for (String known : FIELDS) {
            if (range[1] - range[0] == known.length() && text.startsWith(known, range[0])) return known;
        }
        return "other";
    }

    private static String model(String text, MarketplaceSearchAds.Value object) {
        MarketplaceSearchAds.Value type = object.member(text, "__typename");
        if (type == null) return "none";
        if (type.kind == '"') {
            for (String known : MODELS) {
                if (type.end - type.start == known.length() + 2 && text.startsWith(known, type.start + 1)) return known;
            }
        }
        return "unrecognized";
    }

    private static String type(String text, MarketplaceSearchAds.Value value) {
        if (value.kind == '{') return "object";
        if (value.kind == '[') return "array";
        if (value.kind == '"') return "string";
        int length = value.end - value.start;
        if (length == 4 && text.startsWith("null", value.start)) return "null";
        if ((length == 4 && text.startsWith("true", value.start)) || (length == 5 && text.startsWith("false", value.start))) return "boolean";
        char first = text.charAt(value.start);
        return first == '-' || first >= '0' && first <= '9' ? "number" : "literal";
    }

    private static boolean record(String query, String shape) {
        return record(query, shape, false);
    }

    private static boolean record(String query, String shape, boolean summary) {
        boolean retained = true;
        synchronized (shapes) {
            String key = query + (summary ? " summary" : " shapes");
            Set<String> seen = shapes.get(key);
            if (seen == null) { seen = new HashSet<>(); shapes.put(key, seen); }
            // A duplicate is already retained, even when this query has filled its budget.
            if (seen.contains(shape)) return true;
            if (seen.size() >= (summary ? 8 : MAX_SHAPES)) {
                if (!summary || !summaryBudgetNotices.add(query)) return false;
                retained = false;
            } else {
                seen.add(shape);
            }
        }
        String message = retained ? shape : "response summary omitted: summary budget";
        Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, "MarketplaceResponseDiagnostics",
                () -> PREFIX + query + " " + message);
        return retained;
    }

    static void forget() {
        synchronized (observers) { observers.clear(); }
        synchronized (shapes) { shapes.clear(); summaryBudgetNotices.clear(); }
    }
}
