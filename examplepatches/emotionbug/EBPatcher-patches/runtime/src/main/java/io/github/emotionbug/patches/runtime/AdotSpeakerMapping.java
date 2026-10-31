package io.github.emotionbug.patches.runtime;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Maps local utterances to independently recorded native identities, never model-provided IDs. */
final class AdotSpeakerMapping {
    private static final int MIN_ANCHOR_LENGTH = 8;
    private static final int MAX_ANCHOR_LENGTH = 4096;
    private static final int MAX_CONTAINMENT_PAIRS = 250000;
    private static final long MAX_CONTAINMENT_CHARACTERS = 16000000;

    private AdotSpeakerMapping() {}

    static JSONObject resolve(JSONObject local, JSONObject api, String selfChannel) throws JSONException {
        JSONObject result = new JSONObject(local.toString());
        JSONArray segments = result.optJSONArray("segments");
        if (segments == null) {
            segments = new JSONArray();
            result.put("segments", segments);
        }
        JSONArray nativeSegments = api == null ? null : api.optJSONArray("segments");
        Integer nativeSelf = api == null ? null : id(api.opt("myTalkId"));
        int self = nativeSelf == null ? 0 : nativeSelf;
        Set<Integer> reserved = new HashSet<>();
        reserved.add(self);
        int nativeCount = nativeSegments == null ? 0 : nativeSegments.length();
        String[] nativeText = new String[nativeCount];
        int[] nativeIds = new int[nativeCount];
        Arrays.fill(nativeIds, -1);
        Map<String, Integer> exact = new HashMap<>();
        for (int i = 0; i < nativeCount; i++) {
            JSONObject segment = nativeSegments.optJSONObject(i);
            if (segment == null) continue;
            Integer talker = id(segment.opt("talkerId"));
            if (talker == null) continue;
            reserved.add(talker);
            nativeIds[i] = talker;
            nativeText[i] = normalize(segment.optString("text", ""));
            if (!nativeText[i].isEmpty()) {
                exact.put(nativeText[i], exact.containsKey(nativeText[i]) ? -1 : i);
            }
        }
        int count = segments.length();
        String[] text = new String[count];
        int[] channels = new int[count];
        int[] matched = new int[count];
        Arrays.fill(matched, -1);
        Map<String, Integer> occurrences = new HashMap<>();
        boolean first = false, second = false;
        for (int i = 0; i < count; i++) {
            JSONObject segment = segments.getJSONObject(i);
            text[i] = normalize(segment.optString("text", ""));
            if (!text[i].isEmpty()) occurrences.put(text[i], occurrences.getOrDefault(text[i], 0) + 1);
            channels[i] = channel(segment.optString("speaker", ""));
            first |= channels[i] == 1;
            second |= channels[i] == 2;
        }
        int manualChannel = channel(selfChannel);
        boolean manual = manualChannel != 0;
        boolean bounded = false;
        if (!manual && nativeSelf != null) {
            int comparisons = 0;
            long characters = 0;
            int[] claims = new int[nativeCount];
            for (int i = 0; i < count; i++) {
                if (text[i].isEmpty() || occurrences.get(text[i]) != 1) continue;
                Integer identical = exact.get(text[i]);
                int candidate = -1;
                if (identical != null) {
                    // Repeated native text is not an identity anchor, even if times appear close.
                    candidate = identical;
                } else {
                    boolean complete = true;
                    for (int j = 0; j < nativeCount; j++) {
                        if (nativeText[j] == null || nativeText[j].isEmpty()) continue;
                        if (++comparisons > MAX_CONTAINMENT_PAIRS
                                || (characters += text[i].length() + nativeText[j].length()) > MAX_CONTAINMENT_CHARACTERS) {
                            bounded = true;
                            complete = false;
                            break;
                        }
                        int shorter = Math.min(text[i].length(), nativeText[j].length());
                        int longer = Math.max(text[i].length(), nativeText[j].length());
                        if (shorter * 5 < longer * 3) continue;
                        if (text[i].contains(nativeText[j]) || nativeText[j].contains(text[i])) {
                            if (candidate != -1) {
                                complete = false;
                                break;
                            }
                            candidate = j;
                        }
                    }
                    if (!complete) candidate = -1;
                }
                if (candidate >= 0 && compatibleTimes(segments.getJSONObject(i), nativeSegments.getJSONObject(candidate))) {
                    matched[i] = candidate;
                    claims[candidate]++;
                }
            }
            // A native utterance cannot establish the identity of two separate local utterances.
            for (int i = 0; i < count; i++) {
                if (matched[i] >= 0 && claims[matched[i]] != 1) matched[i] = -1;
            }
        }
        int[] channelIds = {-1, -1, -1};
        boolean[] conflict = new boolean[3];
        boolean stereo = first && second;
        if (stereo && !manual) {
            for (int i = 0; i < count; i++) {
                int ch = channels[i];
                if (ch == 0 || matched[i] < 0) continue;
                int talker = nativeIds[matched[i]];
                if (channelIds[ch] >= 0 && channelIds[ch] != talker) conflict[ch] = true;
                else channelIds[ch] = talker;
            }
            if (channelIds[1] >= 0 && channelIds[1] == channelIds[2]) {
                conflict[1] = true;
                conflict[2] = true;
            }
        }
        boolean propagate = stereo && channelIds[1] >= 0 && channelIds[2] >= 0 && !conflict[1] && !conflict[2];
        int nextId = 0, manualRemote = -1;
        int selfCount = 0, remoteCount = 0, unknownCount = 0;
        for (int i = 0; i < count; i++) {
            int ch = channels[i];
            int talker = -1;
            if (manual && ch != 0) {
                if (ch == manualChannel) talker = self;
                else {
                    if (manualRemote < 0) {
                        while (reserved.contains(nextId)) nextId++;
                        manualRemote = nextId++;
                        reserved.add(manualRemote);
                    }
                    talker = manualRemote;
                }
            } else if (!manual && !conflict[ch]) {
                if (propagate && ch != 0) talker = channelIds[ch];
                else if (matched[i] >= 0) talker = nativeIds[matched[i]];
            }
            if (talker < 0) {
                // Unknown utterances do not inherit identity from a mono channel or from each other.
                while (reserved.contains(nextId)) nextId++;
                talker = nextId++;
                reserved.add(talker);
                unknownCount++;
            } else if (talker == self) selfCount++;
            else remoteCount++;
            segments.getJSONObject(i).put("talkerId", talker);
        }
        String status = unknownCount == 0 && count > 0 ? "Mapped" : selfCount + remoteCount == 0 ? "Unknown" : "Partial";
        status += ": " + selfCount + " self, " + remoteCount + " remote, " + unknownCount + " unknown utterances. ";
        if (manual) status += "Manual self channel: Channel " + manualChannel + ".";
        else if (nativeSelf == null) status += "No native self identity evidence; channel labels do not identify the caller.";
        else status += "Native utterance anchors" + (propagate ? " with consistent stereo channel evidence." : "; no channel identity assumed.");
        if (conflict[1] || conflict[2]) status += " Conflicting channel evidence remains unknown.";
        if (bounded) status += " Containment search limit reached; incomplete matches remain unknown.";
        if (unknownCount > 0) status += " Unknown roles use distinct non-self IDs.";
        return result.put("myTalkId", self).put("speakerMapping", status).put("speakerMappingVersion", 1);
    }

    private static int channel(String speaker) {
        if ("Channel 1".equals(speaker)) return 1;
        if ("Channel 2".equals(speaker)) return 2;
        return 0;
    }

    private static Integer id(Object value) {
        if (!(value instanceof Integer) && !(value instanceof Long)) return null;
        long number = ((Number) value).longValue();
        return number >= 0 && number <= Integer.MAX_VALUE ? (int) number : null;
    }

    private static Long time(JSONObject segment, String key) {
        Object value = segment.opt(key);
        if (!(value instanceof Integer) && !(value instanceof Long)) return null;
        long number = ((Number) value).longValue();
        return number >= 0 ? number : null;
    }

    private static boolean compatibleTimes(JSONObject local, JSONObject api) {
        Long start = time(local, "startMs"), end = time(local, "endMs");
        Long nativeStart = time(api, "startMs"), nativeEnd = time(api, "endMs");
        // Missing/zero-length times cannot supply temporal evidence. Unique text still can.
        if (start == null || end == null || end <= start || nativeStart == null || nativeEnd == null || nativeEnd <= nativeStart) return true;
        long overlap = Math.min(end, nativeEnd) - Math.max(start, nativeStart);
        long shorter = Math.min(end - start, nativeEnd - nativeStart);
        return overlap > 0 && overlap >= shorter / 2 + shorter % 2;
    }

    private static String normalize(String text) {
        // Oversized text is not truncated into a potentially false anchor.
        if (text.length() > MAX_ANCHOR_LENGTH) return "";
        String lower = text.toLowerCase(Locale.ROOT);
        StringBuilder normalized = new StringBuilder(lower.length());
        int letters = 0;
        for (int i = 0; i < lower.length();) {
            int point = lower.codePointAt(i);
            if (Character.isLetterOrDigit(point)) {
                normalized.appendCodePoint(point);
                letters++;
            }
            i += Character.charCount(point);
        }
        return letters >= MIN_ANCHOR_LENGTH ? normalized.toString() : "";
    }
}
