/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Reads the queue a {@code /next} (watch-next) response lists: the id and length of every item, and the counterpart
 * the item names when it has one. Used by the video pairing of a stream download.
 * Contains no Android code.
 */
final class WatchQueueLogic {
    private WatchQueueLogic() {}


    /** One item of a watch queue: what the primary renderer is and what its counterpart is, if it has one. */
    record NextItem(int index, String kind, String videoId, String type, String title, String artist, String length,
                    String counterpartId, String counterpartType, String counterpartLength) {
        boolean hasCounterpart() {
            return !counterpartId.isEmpty();
        }
    }

    /** The queue a {@code /next} response (or its continuation) lists, and the token of the next page. */
    record NextPage(List<NextItem> items, String continuation, int automix, List<String> otherKinds) {}

    private static final String WRAPPER = "playlistPanelVideoWrapperRenderer";
    private static final String PLAIN = "playlistPanelVideoRenderer";
    private static final String AUTOMIX = "automixPreviewVideoRenderer";

    /** Reads the queue of a {@code /next} response; {@code firstIndex} numbers its first item. */
    static NextPage readNext(JSONObject response, int firstIndex) {
        JSONArray contents = findContents(response);
        List<NextItem> items = new ArrayList<>();
        List<String> otherKinds = new ArrayList<>();
        int automix = 0;
        for (int index = 0; contents != null && index < contents.length(); index++) {
            JSONObject entry = contents.optJSONObject(index);
            if (entry == null) continue;

            if (entry.has(WRAPPER)) {
                items.add(readWrapper(entry.optJSONObject(WRAPPER), firstIndex + items.size()));
            } else if (entry.has(PLAIN)) {
                JSONObject renderer = entry.optJSONObject(PLAIN);
                items.add(new NextItem(firstIndex + items.size(), "plain", videoIdOf(renderer), typeOf(renderer),
                        titleOf(renderer), artistOf(renderer), lengthOf(renderer), "", "", ""));
            } else if (entry.has(AUTOMIX)) {
                automix++;
            } else {
                String key = entry.keys().hasNext() ? entry.keys().next() : "?";
                if (!otherKinds.contains(key)) otherKinds.add(key);
            }
        }
        return new NextPage(items, continuationOf(response), automix, otherKinds);
    }

    private static NextItem readWrapper(JSONObject wrapper, int index) {
        JSONObject primary = wrapper == null ? null : wrapper.optJSONObject("primaryRenderer");
        JSONObject renderer = primary == null ? null : primary.optJSONObject(PLAIN);
        String counterpartId = "";
        String counterpartType = "";
        String counterpartLength = "";
        JSONArray counterparts = wrapper == null ? null : wrapper.optJSONArray("counterpart");
        for (int position = 0; counterparts != null && position < counterparts.length(); position++) {
            JSONObject counterpart = counterparts.optJSONObject(position);
            JSONObject holder = counterpart == null ? null : counterpart.optJSONObject("counterpartRenderer");
            JSONObject other = holder == null ? null : holder.optJSONObject(PLAIN);
            if (other == null) continue;

            counterpartId = videoIdOf(other);
            counterpartType = typeOf(other);
            counterpartLength = lengthOf(other);
            break;
        }
        return new NextItem(index, "wrapper", videoIdOf(renderer), typeOf(renderer), titleOf(renderer),
                artistOf(renderer), lengthOf(renderer), counterpartId, counterpartType, counterpartLength);
    }

    private static String videoIdOf(JSONObject renderer) {
        return renderer == null ? "" : renderer.optString("videoId");
    }

    private static String typeOf(JSONObject renderer) {
        JSONObject endpoint = renderer == null ? null : renderer.optJSONObject("navigationEndpoint");
        JSONObject watch = endpoint == null ? null : endpoint.optJSONObject("watchEndpoint");
        JSONObject supported = watch == null ? null : watch.optJSONObject("watchEndpointMusicSupportedConfigs");
        JSONObject config = supported == null ? null : supported.optJSONObject("watchEndpointMusicConfig");
        String type = config == null ? "" : config.optString("musicVideoType");
        return type.replace("MUSIC_VIDEO_TYPE_", "");
    }

    private static String titleOf(JSONObject renderer) {
        return firstRun(renderer, "title");
    }

    /** The first run of the short byline, else of the long one: the artist. */
    private static String artistOf(JSONObject renderer) {
        String artist = firstRun(renderer, "shortBylineText");
        return artist.isEmpty() ? firstRun(renderer, "longBylineText") : artist;
    }

    private static String firstRun(JSONObject renderer, String key) {
        JSONObject text = renderer == null ? null : renderer.optJSONObject(key);
        JSONArray runs = text == null ? null : text.optJSONArray("runs");
        JSONObject run = runs == null ? null : runs.optJSONObject(0);
        return run == null ? "" : run.optString("text");
    }

    private static String lengthOf(JSONObject renderer) {
        JSONObject text = renderer == null ? null : renderer.optJSONObject("lengthText");
        JSONArray runs = text == null ? null : text.optJSONArray("runs");
        JSONObject run = runs == null ? null : runs.optJSONObject(0);
        return run == null ? "" : run.optString("text");
    }

    /** The queue's items: the first list under a {@code playlistPanelRenderer} or {@code playlistPanelContinuation}. */
    private static JSONArray findContents(Object node) {
        if (node instanceof JSONObject object) {
            for (String key : new String[]{"playlistPanelRenderer", "playlistPanelContinuation"}) {
                JSONObject panel = object.optJSONObject(key);
                if (panel != null && panel.optJSONArray("contents") != null) return panel.optJSONArray("contents");
            }
            var keys = object.keys();
            while (keys.hasNext()) {
                JSONArray found = findContents(object.opt(keys.next()));
                if (found != null) return found;
            }
        } else if (node instanceof JSONArray array) {
            for (int index = 0; index < array.length(); index++) {
                JSONArray found = findContents(array.opt(index));
                if (found != null) return found;
            }
        }
        return null;
    }

    /** The token that asks for the next page of the queue, or an empty string when there is none. */
    private static String continuationOf(Object node) {
        if (node instanceof JSONObject object) {
            for (String key : new String[]{"nextRadioContinuationData", "nextContinuationData"}) {
                JSONObject data = object.optJSONObject(key);
                if (data != null && !data.optString("continuation").isEmpty()) return data.optString("continuation");
            }
            var keys = object.keys();
            while (keys.hasNext()) {
                String found = continuationOf(object.opt(keys.next()));
                if (!found.isEmpty()) return found;
            }
        } else if (node instanceof JSONArray array) {
            for (int index = 0; index < array.length(); index++) {
                String found = continuationOf(array.opt(index));
                if (!found.isEmpty()) return found;
            }
        }
        return "";
    }

    /** One item as a log line body. */
    static String describe(NextItem item) {
        StringBuilder text = new StringBuilder("item ").append(item.index());
        text.append(' ').append(item.kind()).append(" id=").append(item.videoId());
        text.append(" type=").append(item.type().isEmpty() ? "-" : item.type());
        if (item.hasCounterpart()) {
            text.append(" counterpart=").append(item.counterpartId());
            text.append(" counterpartType=").append(item.counterpartType().isEmpty() ? "-" : item.counterpartType());
        } else {
            text.append(" counterpart=none");
        }
        if (!item.length().isEmpty()) text.append(" len=").append(item.length());
        if (!item.counterpartLength().isEmpty()) text.append(" counterpartLen=").append(item.counterpartLength());
        if (!item.title().isEmpty()) text.append(" title=\"").append(item.title()).append('"');
        if (!item.artist().isEmpty()) text.append(" artist=\"").append(item.artist()).append('"');
        return text.toString();
    }

    /** The totals of one page as a log line body. */
    static String describe(NextPage page) {
        int wrappers = 0;
        int counterparts = 0;
        for (NextItem item : page.items()) {
            if (item.kind().equals("wrapper")) wrappers++;
            if (item.hasCounterpart()) counterparts++;
        }
        return "items=" + page.items().size() + " wrappers=" + wrappers + " withCounterpart=" + counterparts
                + " automix=" + page.automix() + " otherKinds=" + page.otherKinds()
                + " continuation=" + (page.continuation().isEmpty() ? "no" : "yes");
    }
}
