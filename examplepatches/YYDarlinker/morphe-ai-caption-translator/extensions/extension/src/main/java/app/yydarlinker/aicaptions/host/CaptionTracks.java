package app.yydarlinker.aicaptions.host;

import app.yydarlinker.aicaptions.CaptionLanguageContext;
import app.yydarlinker.aicaptions.CaptionUrls;
import app.yydarlinker.aicaptions.SourceSelection;
import app.yydarlinker.aicaptions.TargetLanguage;
import app.yydarlinker.aicaptions.source.CaptionSourceIdentity;

import android.net.Uri;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/** Signed native source descriptors and the existing original-language-first selection policy. */
public final class CaptionTracks {
    private static final Map<String, Snapshot> catalog = new LinkedHashMap<>();
    private static final Map<String, Map<String, List<String>>> asr = new LinkedHashMap<>();
    private static final Snapshot MISSING = new Snapshot(false, Collections.emptyList());

    private CaptionTracks() {}

    public static final class Snapshot {
        public final boolean complete;
        public final List<SourceSelection> tracks;

        Snapshot(boolean complete, List<SourceSelection> tracks) {
            this.complete = complete;
            this.tracks = Collections.unmodifiableList(new ArrayList<>(tracks));
        }
    }

    public static synchronized Snapshot snapshot(String video) {
        return catalog.getOrDefault(video, MISSING);
    }

    public static synchronized void register(String video, List<SourceSelection> tracks, boolean complete) {
        catalog.put(video, new Snapshot(complete, tracks));
        if (catalog.size() > 6) catalog.remove(catalog.keySet().iterator().next());
    }

    static boolean collect(List<?> tracks, String foreground) {
        Map<String, List<SourceSelection>> byVideo = new LinkedHashMap<>();
        for (Object track : tracks) {
            if (track == null) continue;
            String url = NativeCaptionBridge.url(track);
            String code = NativeCaptionBridge.language(track), vss = NativeCaptionBridge.vss(track);
            remember(code, vss, url);
            if (code == null || code.endsWith("_OPTION") || !CaptionUrls.isTimedText(url)) continue;
            Uri uri = Uri.parse(url);
            if (!uri.getQueryParameters("tlang").isEmpty()) continue;
            String video = CaptionUrls.videoId(url), language = CaptionLanguageContext.observe(url, "").sourceCode;
            if (video.isEmpty() || language.isEmpty() || "UNKNOWN".equals(language)) continue;
            SourceSelection.Kind kind = vss != null && vss.startsWith("a.") ? SourceSelection.Kind.ASR
                    : vss != null && vss.startsWith(".") ? SourceSelection.Kind.MANUAL
                    : SourceSelection.Kind.UNKNOWN;
            String name = vss == null || vss.isEmpty() ? "unknown/" + language : vss;
            String stableId = name + "/" + value(uri, "name") + "/" + value(uri, "id");
            byVideo.computeIfAbsent(video, id -> new ArrayList<>()).add(
                    new SourceSelection(video, stableId, language, url, kind, true, 0, ""));
        }
        for (Map.Entry<String, List<SourceSelection>> entry : byVideo.entrySet())
            register(entry.getKey(), entry.getValue(), true);
        return byVideo.size() == 1 && byVideo.containsKey(foreground);
    }

    static boolean authored(String url) {
        String wanted = descriptor(url);
        for (SourceSelection track : snapshot(CaptionUrls.videoId(url)).tracks)
            if (descriptor(track.url).equals(wanted)) return track.kind == SourceSelection.Kind.MANUAL;
        return false;
    }

    static SourceSelection ownTargetTrack(String url) {
        TargetLanguage target = TargetLanguage.fromUrl(url);
        if (target == null) return null;
        Snapshot snapshot = snapshot(CaptionUrls.videoId(url));
        if (!snapshot.complete) return null;
        SourceSelection best = null;
        for (SourceSelection track : snapshot.tracks)
            if (SourceSelection.sameWritingLanguage(track.language, target.code)
                    && (best == null || kindOrder(track) < kindOrder(best))) best = track;
        return best;
    }

    static String preferredSource(String url) {
        TargetLanguage target = TargetLanguage.fromUrl(url);
        if (target == null) return url;
        Snapshot snapshot = snapshot(CaptionUrls.videoId(url));
        if (!snapshot.complete || snapshot.tracks.size() < 2) return url;
        String speech = "";
        for (SourceSelection track : snapshot.tracks) {
            if (track.kind != SourceSelection.Kind.ASR) continue;
            if (speech.isEmpty()) speech = track.language;
            if (!SourceSelection.sameWritingLanguage(track.language, target.code)) {
                speech = track.language;
                break;
            }
        }
        boolean speechIsTarget = !speech.isEmpty() && SourceSelection.sameWritingLanguage(speech, target.code);
        SourceSelection best = null;
        int bestRank = Integer.MAX_VALUE;
        Set<String> seen = new HashSet<>();
        for (SourceSelection track : snapshot.tracks) {
            if (!seen.add(track.kind + "|" + languageKey(track.language))) continue;
            int rank = rank(track, speech, speechIsTarget, target.code);
            if (rank < bestRank || rank == bestRank && better(track, best)) {
                best = track;
                bestRank = rank;
            }
        }
        return best == null || descriptor(best.url).equals(descriptor(url))
                ? url : TargetLanguage.withCode(best.url, target.code);
    }

    private static int rank(SourceSelection track, String speech, boolean speechIsTarget, String target) {
        boolean selected = SourceSelection.sameWritingLanguage(track.language, target);
        boolean human = track.kind != SourceSelection.Kind.ASR;
        boolean spoken = !speech.isEmpty() && family(track.language).equals(family(speech));
        if (speechIsTarget) {
            if (spoken) return human ? 0 : 1;
            return selected ? 5 : human ? 2 : 3;
        }
        if (selected) return human ? 6 : 7;
        if (spoken && human) return 0;
        if (human && family(track.language).equals("en")) return 1;
        if (spoken) return 2;
        return human ? 3 : 4;
    }

    private static boolean better(SourceSelection a, SourceSelection b) {
        boolean aDefault = family(a.language).isEmpty(), bDefault = family(b.language).isEmpty();
        if (aDefault != bDefault) return aDefault;
        boolean aEnglish = family(a.language).equals("en"), bEnglish = family(b.language).equals("en");
        if (aEnglish != bEnglish) return aEnglish;
        int byLanguage = a.language.compareToIgnoreCase(b.language);
        return byLanguage != 0 ? byLanguage < 0 : a.trackId.compareTo(b.trackId) < 0;
    }

    private static String family(String code) {
        return Locale.forLanguageTag(code).getLanguage();
    }

    private static int kindOrder(SourceSelection track) {
        return track.kind == SourceSelection.Kind.MANUAL ? 0
                : track.kind == SourceSelection.Kind.UNKNOWN ? 1 : 2;
    }

    private static String descriptor(String url) {
        try {
            Uri uri = Uri.parse(url);
            return value(uri, "lang") + '|' + value(uri, "kind") + '|' + value(uri, "name");
        } catch (RuntimeException malformed) {
            return "";
        }
    }

    private static String value(Uri uri, String key) {
        String value = uri.getQueryParameter(key);
        return value == null ? "" : value;
    }

    // Keep multiple signed ASR variants so a coarse response does not evict a richer variant.
    static synchronized void remember(String language, String vss, String url) {
        if (language == null || language.isEmpty() || vss == null || !vss.startsWith("a.") || url == null)
            return;
        String video = CaptionUrls.videoId(url);
        if (!CaptionSourceIdentity.safe(url, video)) return;
        String declared = value(Uri.parse(url), "lang");
        if (!declared.isEmpty() && !declared.equalsIgnoreCase(language)) return;
        if (!asr.containsKey(video) && asr.size() >= 4) asr.remove(asr.keySet().iterator().next());
        Map<String, List<String>> languages = asr.computeIfAbsent(video, key -> new LinkedHashMap<>());
        String key = languageKey(language);
        if (!languages.containsKey(key) && languages.size() >= 16) return;
        List<String> urls = languages.computeIfAbsent(key, ignored -> new ArrayList<>());
        urls.remove(url);
        urls.add(url);
        if (urls.size() > 4) urls.remove(0);
    }

    public static synchronized List<String> candidates(String video, String language) {
        Map<String, List<String>> languages = asr.get(video);
        if (languages == null) return Collections.emptyList();
        Set<String> ordered = new java.util.LinkedHashSet<>();
        String exact = languageKey(language);
        ordered.addAll(languages.getOrDefault(exact, Collections.emptyList()));
        for (Map.Entry<String, List<String>> entry : languages.entrySet())
            if (CaptionSourceIdentity.sameLanguage(entry.getKey(), language)) ordered.addAll(entry.getValue());
        for (List<String> urls : languages.values()) ordered.addAll(urls);
        return new ArrayList<>(ordered);
    }

    private static String languageKey(String value) {
        return value == null ? "" : value.trim().toLowerCase(Locale.ROOT);
    }

    public static synchronized void clear() {
        catalog.clear();
        asr.clear();
    }
}
