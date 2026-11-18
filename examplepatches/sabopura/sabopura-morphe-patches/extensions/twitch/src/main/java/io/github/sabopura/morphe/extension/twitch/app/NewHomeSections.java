package io.github.sabopura.morphe.extension.twitch.app;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.nio.charset.StandardCharsets;
import java.util.EnumSet;
import java.util.Set;
import java.util.function.Predicate;

import io.github.sabopura.morphe.extension.twitch.ui.Feature;

/**
 * The parts of the React Native home's Following tab, as they arrive in Twitch's GraphQL responses.
 * A part the viewer hides is emptied here, the answer an account with nothing in it gets, so the
 * home leaves it out the way it does for that account: no heading, no gap.
 */
final class NewHomeSections {
    /** A part a setting hides: the setting, the patch that offers it, and a name every response with the part holds. */
    enum Part {
        CATEGORIES("hide_followed_games", Feature.FOLLOWING_FEED, "followedGames"),
        VIDEOS("hide_continue_watching", Feature.FOLLOWING_FEED, "viewedVideos"),
        OFFLINE("hide_offline_channels", Feature.FOLLOWING_FEED, "lastBroadcast"),
        /** The "Go Ad-Free" button beside the tab's heading, shown while Twitch has an offer to make. */
        AD_FREE("hide_go_ad_free", Feature.DECLUTTER, "subscriptionProduct");

        final String key, marker;
        final Feature feature;

        Part(String key, Feature feature, String marker) {
            this.key = key;
            this.feature = feature;
            this.marker = marker;
        }
    }

    private NewHomeSections() {
    }

    /**
     * {@code body} without the parts that are {@code hidden}, or {@code body} itself when it holds
     * none of them. Most responses are other things (feeds, flags, events) and come back after a
     * look at their bytes, unparsed.
     */
    static byte[] without(byte[] body, Predicate<Part> hidden) throws JSONException {
        // Twitch's answers are a JSON object or a list of them.
        if (body == null || body.length < 2 || body[0] != '{' && body[0] != '[') return body;
        EnumSet<Part> found = null;
        for (Part part : Part.values()) {
            if (!hidden.test(part) || !holds(body, part.marker)) continue;
            if (found == null) found = EnumSet.noneOf(Part.class);
            found.add(part);
        }
        if (found == null) return body;
        String changed = without(new String(body, StandardCharsets.UTF_8), found);
        return changed == null ? body : changed.getBytes(StandardCharsets.UTF_8);
    }

    /** True when {@code body} has {@code name} as a quoted word, which every JSON key is. */
    static boolean holds(byte[] body, String name) {
        int length = name.length(), last = body.length - length - 2;
        char first = name.charAt(0);
        for (int i = 0; i <= last; i++) {
            if (body[i] != '"' || body[i + 1] != first || body[i + length + 1] != '"') continue;
            int matched = 1;
            while (matched < length && body[i + 1 + matched] == name.charAt(matched)) matched++;
            if (matched == length) return true;
        }
        return false;
    }

    /** {@code body} without the {@code hidden} parts, or null when it holds none of them. */
    static String without(String body, Set<Part> hidden) throws JSONException {
        JSONTokener text = new JSONTokener(body);
        Object root = text.nextValue();
        // More after the first value is not one answer: written back, the rest would be lost.
        if (text.nextClean() != 0) return null;
        boolean changed = false;
        if (root instanceof JSONObject) {
            changed = strip((JSONObject) root, hidden);
        } else if (root instanceof JSONArray) {
            // Queries sent together are answered as a list.
            JSONArray answers = (JSONArray) root;
            for (int i = 0; i < answers.length(); i++) {
                JSONObject answer = answers.optJSONObject(i);
                if (answer != null) changed |= strip(answer, hidden);
            }
        }
        return changed ? root.toString() : null;
    }

    private static boolean strip(JSONObject answer, Set<Part> hidden) throws JSONException {
        JSONObject data = answer.optJSONObject("data");
        if (data == null) return false;
        boolean changed = false;
        JSONObject user = data.optJSONObject("user");
        if (user != null) {
            // The tab asks for its sections together with the live channels; the same lists asked
            // for by another screen are that screen's business.
            if (user.has("followedLiveUsers")) {
                if (hidden.contains(Part.CATEGORIES)) changed |= empty(user.optJSONObject(Part.CATEGORIES.marker), "nodes");
                if (hidden.contains(Part.VIDEOS)) changed |= empty(user.optJSONObject(Part.VIDEOS.marker), "edges");
            }
            if (hidden.contains(Part.OFFLINE)) changed |= dropOffline(user.optJSONObject("follows"));
        }
        // Subscription products have offers on other screens too: only the button's own question is answered "none".
        if (hidden.contains(Part.AD_FREE) && "TurboUpsellButton".equals(operation(answer)))
            changed |= empty(data.optJSONObject(Part.AD_FREE.marker), "offers");
        return changed;
    }

    /** The name of the query an answer is for, which Twitch's server repeats in every answer. */
    private static String operation(JSONObject answer) {
        JSONObject extensions = answer.optJSONObject("extensions");
        return extensions == null ? null : extensions.optString("operationName", null);
    }

    private static boolean empty(JSONObject holder, String list) throws JSONException {
        JSONArray items = holder == null ? null : holder.optJSONArray(list);
        if (items == null || items.length() == 0) return false;
        holder.put(list, new JSONArray());
        return true;
    }

    /**
     * The followed channels come a page at a time, live ones among them, and the home lists the
     * ones without a stream. Those are dropped, and the page says it is the last one: the pages
     * after it would only bring more channels to drop.
     */
    private static boolean dropOffline(JSONObject follows) throws JSONException {
        JSONArray edges = follows == null ? null : follows.optJSONArray("edges");
        if (edges == null) return false;
        JSONArray live = new JSONArray();
        boolean channels = false;
        for (int i = 0; i < edges.length(); i++) {
            JSONObject edge = edges.optJSONObject(i);
            // The tab also asks whether anyone is followed at all: edges that name no channel, left alone.
            if (edge == null || !edge.has("node")) return false;
            JSONObject channel = edge.optJSONObject("node");
            // An account that is gone has no channel to show, live or not.
            if (channel == null) continue;
            if (!channel.has(Part.OFFLINE.marker)) return false;
            channels = true;
            if (!channel.isNull("stream")) live.put(edge);
        }
        if (!channels || live.length() == edges.length()) return false;
        follows.put("edges", live);
        JSONObject page = follows.optJSONObject("pageInfo");
        if (page != null && page.has("hasNextPage")) page.put("hasNextPage", false);
        return true;
    }
}
