package net.gtvbox.videoplayer;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;

import app.tikkamasalla.stremio.subs.SdhLabels;

import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Per-show track memory for Vimu (contract v1): applies the audio and
 * subtitle track Stremio remembers for the show (tikka.tracks.* launch extras), swaps an SDH subtitle for a full
 * one of the same language, and reports whatever the user picked by hand back on the result and the journal row.
 * The decision logic is pure Java; only the PlayerHost adapter touches Vimu's engine. Main thread only.
 */
public final class VimuTracks {
    private static final String TAG = "VimuTracks";
    private static final String P = "tikka.tracks.";

    private VimuTracks() {
    }

    // ---- pure decision logic -------------------------------------------------------------

    /** What Stremio sent; empty strings mean absent. */
    static final class Memory {
        String show = "", audioLang = "", audioLabel = "", subLang = "", subLabel = "";
        String userAudioLang = "", userSubLang = ""; // the user's own languages (Stremio settings), optional extras
        boolean subOff, avoidSdh;

        boolean hasAudio() {
            return !audioLang.isEmpty() || !audioLabel.isEmpty();
        }

        boolean hasSub() {
            return subOff || !subLang.isEmpty() || !subLabel.isEmpty();
        }
    }

    static final class Aud {
        final String lang, label, display;

        Aud(String lang, String label, String display) {
            this.lang = lang != null ? lang : "";
            this.label = label != null ? label : "";
            this.display = display != null ? display : "";
        }
    }

    static final class Sub {
        final String lang, label;
        final boolean forced;

        Sub(String lang, String label, boolean forced) {
            this.lang = lang != null ? lang : "";
            this.label = label != null ? label : "";
            this.forced = forced;
        }
    }

    static final class SubPick {
        static final int KEEP = -2;
        final int dialog;
        final String why;

        SubPick(int dialog, String why) {
            this.dialog = dialog;
            this.why = why != null ? why : "";
        }
    }

    static String normLabel(String s) {
        if (s == null || s.isEmpty()) return "";
        String lower = s.toLowerCase(Locale.ROOT);
        StringBuilder sb = new StringBuilder(lower.length());
        for (int i = 0; i < lower.length(); i++) {
            if (Character.isLetterOrDigit(lower.charAt(i))) sb.append(lower.charAt(i));
        }
        return sb.toString();
    }

    static boolean sameLang(String a, String b) {
        if (a == null || b == null) return false;
        String na = SdhLabels.normLang(a);
        return !na.isEmpty() && na.equals(SdhLabels.normLang(b));
    }

    /** Index of the track the memory points at, or -1 for "no memory decision". */
    static int pickAudio(Memory m, List<Aud> tracks) {
        if (m == null || !m.hasAudio() || tracks == null || tracks.isEmpty()) return -1;
        String want = normLabel(m.audioLabel);
        if (!want.isEmpty()) {
            for (int i = 0; i < tracks.size(); i++) {
                Aud t = tracks.get(i);
                if (!m.audioLang.isEmpty() && !sameLang(t.lang, m.audioLang)) continue;
                String have = normLabel(t.label);
                if (have.equals(want) || (have.isEmpty() && normLabel(t.display).equals(want))) return i;
            }
        }
        if (!m.audioLang.isEmpty()) {
            for (int i = 0; i < tracks.size(); i++) {
                if (sameLang(tracks.get(i).lang, m.audioLang)) return i;
            }
        }
        return -1;
    }

    static final class AudPick {
        final int index; // -1 = keep Vimu's default
        final String why, note;

        AudPick(int index, String why, String note) {
            this.index = index;
            this.why = why;
            this.note = note;
        }
    }

    /** Language of an audio track: its tag, or (tag missing/"und") a language word in its title ("Japanese"); "" if unknown. */
    static String effLang(Aud t) {
        String l = SdhLabels.normLang(t.lang);
        if (!l.isEmpty() && !"und".equals(l) && !"zxx".equals(l) && !"mis".equals(l)) return l;
        if (t.label.contains("\u65e5\u672c\u8a9e")) return "ja";
        Map<String, String> names = langNames();
        for (String w : t.label.toLowerCase(Locale.ROOT).split("[^\\p{L}]+")) {
            String c = names.get(w);
            if (c != null) return SdhLabels.normLang(c);
        }
        return "";
    }

    /**
     * No memory: anime -> the anime language (Japanese), otherwise the user's language, then English. A track in none of
     * those is never preferred; tracks of unknown language rank below them. No preferred track -> keep Vimu's default.
     */
    static AudPick pickDefaultAudio(boolean anime, String animeLang, String userLang, List<Aud> tracks) {
        if (tracks == null || tracks.isEmpty()) return new AudPick(-1, "default", "no audio tracks");
        List<String> prefs = new ArrayList<>();
        String a = SdhLabels.normLang(animeLang), u = SdhLabels.normLang(userLang);
        if (anime) prefs.add(a.isEmpty() ? "ja" : a);
        prefs.add(u.isEmpty() ? "en" : u);
        prefs.add("en");
        for (int p = 0; p < prefs.size(); p++) {
            for (int i = 0; i < tracks.size(); i++) {
                if (effLang(tracks.get(i)).equals(prefs.get(p))) {
                    return new AudPick(i, anime && p == 0 ? "anime" : "default", prefs.get(p));
                }
            }
        }
        return new AudPick(-1, "default", "no track in " + prefs);
    }

    /** Anime + Japanese audio, no subtitle memory: the dialogue ("Full") track in the subtitle language, never Signs & Songs/SDH. */
    static SubPick pickAnimeSub(String subLang, List<Sub> tracks, int current) {
        String want = SdhLabels.normLang(subLang);
        if (want.isEmpty()) want = "en";
        for (int i = 0; tracks != null && i < tracks.size(); i++) {
            Sub t = tracks.get(i);
            if (sameLang(t.lang, want) && subKind(t) == SdhLabels.KIND_FULL) {
                return new SubPick(i + 1 == current ? SubPick.KEEP : i + 1, "anime");
            }
        }
        return null;
    }

    static int subKind(Sub s) {
        return s == null ? SdhLabels.KIND_FULL : SdhLabels.kindOf(s.label, 0, s.forced ? 2 : 0);
    }

    /** tracks.get(i) is dialog number i+1; current: -1 off/none, 0 external, 1..n embedded. */
    static SubPick pickSub(Memory m, boolean explicitSub, List<Sub> tracks, int current) {
        if (explicitSub) return new SubPick(SubPick.KEEP, "addon");
        if (m != null && m.subOff) {
            return new SubPick(current == -1 ? SubPick.KEEP : -1, "memory");
        }
        if (m != null && m.hasSub() && tracks != null && !tracks.isEmpty()) {
            int found = -1;
            String want = normLabel(m.subLabel);
            if (!want.isEmpty()) {
                for (int i = 0; i < tracks.size() && found < 0; i++) {
                    Sub t = tracks.get(i);
                    if (normLabel(t.label).equals(want) && (m.subLang.isEmpty() || sameLang(t.lang, m.subLang))) found = i;
                }
            }
            if (found < 0 && !m.subLang.isEmpty()) {
                int best = Integer.MAX_VALUE;
                for (int i = 0; i < tracks.size(); i++) {
                    Sub t = tracks.get(i);
                    if (!sameLang(t.lang, m.subLang)) continue;
                    int kind = subKind(t);
                    boolean allowed = kind == SdhLabels.KIND_FULL || kind == SdhLabels.KIND_SDH
                            || (kind == SdhLabels.KIND_SIGNS && SdhLabels.isSignsLabel(m.subLabel))
                            || (kind == SdhLabels.KIND_FORCED && SdhLabels.isForcedLabel(m.subLabel));
                    int rank = !m.avoidSdh && kind == SdhLabels.KIND_SDH ? SdhLabels.KIND_FULL : kind;
                    if (allowed && rank < best) {
                        best = rank;
                        found = i;
                    }
                }
            }
            if (found >= 0) return new SubPick(found + 1 == current ? SubPick.KEEP : found + 1, "memory");
        }
        if (m != null && m.avoidSdh && current >= 1 && tracks != null && current <= tracks.size()) {
            Sub cur = tracks.get(current - 1);
            if (subKind(cur) == SdhLabels.KIND_SDH && !cur.lang.isEmpty()) {
                for (int i = 0; i < tracks.size(); i++) {
                    Sub t = tracks.get(i);
                    if (i != current - 1 && sameLang(t.lang, cur.lang) && subKind(t) == SdhLabels.KIND_FULL) {
                        return new SubPick(i + 1, "sdh-swap");
                    }
                }
            }
        }
        return new SubPick(SubPick.KEEP, "default");
    }

    private static volatile Map<String, String> langNames;

    /** Language of Vimu's audio display text "codec ch, Language[, title]", normalised ("ja"); "" if unknown. */
    static String audioLangFromDisplay(String display) {
        if (display == null) return "";
        int first = display.indexOf(", ");
        if (first < 0) return "";
        int second = display.indexOf(", ", first + 2);
        String part = (second < 0 ? display.substring(first + 2) : display.substring(first + 2, second)).trim();
        if (part.isEmpty()) return "";
        if (part.length() >= 2 && part.length() <= 3) {
            boolean letters = true;
            for (int i = 0; i < part.length(); i++) {
                char c = part.charAt(i);
                if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))) letters = false;
            }
            if (letters) return SdhLabels.normLang(part);
        }
        String code = langNames().get(part.toLowerCase(Locale.ROOT));
        return code == null ? "" : SdhLabels.normLang(code);
    }

    private static Map<String, String> langNames() {
        Map<String, String> map = langNames;
        if (map == null) {
            map = new HashMap<>();
            for (String c : Locale.getISOLanguages()) {
                Locale loc = new Locale(c);
                for (String name : new String[] {loc.getDisplayLanguage(Locale.ENGLISH), loc.getDisplayLanguage()}) {
                    String key = name == null ? "" : name.trim().toLowerCase(Locale.ROOT);
                    if (!key.isEmpty() && !map.containsKey(key)) map.put(key, c);
                }
            }
            langNames = map;
        }
        return map;
    }

    /** Everything after the second ", " of Vimu's audio display text, or "". */
    static String audioTitleFromDisplay(String display) {
        if (display == null) return "";
        int first = display.indexOf(", ");
        int second = first < 0 ? -1 : display.indexOf(", ", first + 2);
        return second < 0 ? "" : display.substring(second + 2).trim();
    }

    /** Vimu's upper-case ISO 639-2 subtitle language field to the normalised form ("ENG" -> "en"). */
    static String subLangFromRaw(String raw) {
        return raw == null ? "" : SdhLabels.normLang(raw.trim());
    }

    private static final String LANG_PAIRS = "en eng,es spa,fr fra,de deu,it ita,pt por,ru rus,ja jpn,zh zho,"
            + "ko kor,hi hin,ar ara,nl nld,sv swe,nb nor,da dan,fi fin,pl pol,tr tur,uk ukr";

    /** Three-letter form used on the wire (same table as Stremio's TrackMemory.lang3); unknown codes pass through. */
    static String lang3(String raw) {
        String l2 = SdhLabels.normLang(raw);
        for (String pair : LANG_PAIRS.split(",")) {
            if (pair.startsWith(l2 + " ")) return pair.substring(3);
        }
        return l2;
    }

    static String describe(String lang, String label) {
        return (lang == null || lang.isEmpty() ? "?" : lang) + "/" + (label == null || label.isEmpty() ? "-" : label);
    }

    // ---- state machine -------------------------------------------------------------------

    /** The player as seen by the state machine (PlayerHost over Vimu's engine, a fake in tests). */
    interface Host {
        int audioCount();             // 0 = list not loaded yet
        Aud audio(int index);
        int audioCurrent();           // -1 = unknown (Vimu's native default, normally the first track)
        void selectAudio(int index);
        int subCount();               // embedded tracks; -1 = list not loaded yet
        Sub sub(int dialog);          // 1..n
        int subCurrent();             // -1 off/none, 0 external, 1..n
        void selectSub(int dialog);   // -1 = off
    }

    private static final int SETTLE_POLLS = 5;
    /** Advancing polls to wait for IntroSkip's anime verdict (its own hold is 5 s) before treating the show as not anime. */
    private static final int VERDICT_WAIT_POLLS = 8;
    private static boolean active, explicitSub, audioDone, subDone, settled, manual, applyLogged, snapSubOff;
    private static boolean verdictSet, animeShow;
    private static String animeLangPref = "", userLangPref = "";
    private static int verdictWait;
    private static Memory mem = new Memory();
    private static String show = "", whyAudio = "default", whySub = "default";
    private static String snapAudioLang = "", snapAudioLabel = "", snapSubLang = "", snapSubLabel = "";
    private static int audioTries, subTries, advancing, lastPos = -1, settleCount, baseAudio = -1, baseSub = -1;
    private static WeakReference<e> lastPlayer;

    // Addon subtitles (VimuAddonSubs): the list Stremio passed, the one-time auto decision and the cycle key.
    private static final int AUTO_LIST_POLLS = 10;
    private static final long CYCLE_GAP_MS = 1500;
    private static List<VimuAddonSubs.Entry> addons = new ArrayList<>();
    private static boolean addonAutoDone;
    private static int addonTries, restoreTries, lastEmbedded = -1, restoreAudio = -1;
    private static long lastCycleAt;
    private static AddonHost addonHost;

    private static void reset() {
        addons = new ArrayList<>();
        addonAutoDone = false;
        addonTries = 0;
        lastEmbedded = restoreAudio = -1;
        restoreTries = 0;
        lastCycleAt = 0;
        addonHost = null;
        active = explicitSub = audioDone = subDone = settled = manual = applyLogged = snapSubOff = false;
        verdictSet = animeShow = false;
        animeLangPref = userLangPref = "";
        verdictWait = 0;
        mem = new Memory();
        show = "";
        whyAudio = whySub = "default";
        snapAudioLang = snapAudioLabel = snapSubLang = snapSubLabel = "";
        audioTries = subTries = advancing = settleCount = 0;
        lastPos = baseAudio = baseSub = -1;
        lastPlayer = null;
    }

    private static String str(Bundle b, String key) {
        String v = b.getString(P + key, "");
        return v == null ? "" : v.trim();
    }

    /** Hook in VimuResult.normalize, once per launch (extras may be null). */
    public static void begin(Bundle extras) {
        try {
            reset();
            if (extras == null) return;
            addons = new ArrayList<>(VimuAddonSubs.parse(extras));
            show = str(extras, "show");
            mem.show = show;
            mem.audioLang = SdhLabels.normLang(str(extras, "audio_lang"));
            mem.audioLabel = str(extras, "audio_label");
            mem.subLang = SdhLabels.normLang(str(extras, "sub_lang"));
            mem.subLabel = str(extras, "sub_label");
            mem.subOff = extras.getBoolean(P + "sub_off", false);
            mem.avoidSdh = extras.getBoolean(P + "avoid_sdh", false);
            mem.userAudioLang = SdhLabels.normLang(str(extras, "user_audio_lang"));
            mem.userSubLang = SdhLabels.normLang(str(extras, "user_sub_lang"));
            for (String key : extras.keySet()) {
                if (key != null && key.startsWith(P)) active = true;
            }
            if (!addons.isEmpty()) active = true; // an addon list alone also turns the state machine on
            explicitSub = extras.containsKey("subs.enable") || extras.containsKey("forcedsrt")
                    || extras.containsKey("sub_lang") || extras.containsKey("sub_label")
                    || extras.containsKey("sub_track_id") || extras.getInt("sub_track_index", -1) >= 0;
            if (active) {
                Log.i(TAG, "begin show=" + show + " audio=" + describe(mem.audioLang, mem.audioLabel)
                        + " sub=" + (mem.subOff ? "off" : describe(mem.subLang, mem.subLabel))
                        + " avoid_sdh=" + mem.avoidSdh + " explicitSub=" + explicitSub
                        + " userAudio=" + mem.userAudioLang + " userSub=" + mem.userSubLang
                        + " addonSubs=" + addons.size());
            }
        } catch (Throwable t) {
            Log.w(TAG, "begin", t);
        }
    }

    /**
     * IntroSkip's anime verdict for this launch (hook: IntroSkip.applyPendingAudio), plus the language settings.
     * Without memory VimuTracks picks anime -> animeLang, else the user's language, else English.
     */
    public static void setAnimeVerdict(boolean anime, String animeLang, String userLang) {
        verdictSet = true;
        animeShow = anime;
        animeLangPref = animeLang == null ? "" : animeLang;
        userLangPref = userLang == null ? "" : userLang;
    }

    private static String audioToken() {
        return describe(snapAudioLang, snapAudioLabel);
    }

    private static String subToken() {
        return snapSubOff ? "off" : describe(snapSubLang, snapSubLabel);
    }

    private static void logApply() {
        String why = "memory".equals(whyAudio) || "memory".equals(whySub) ? "memory"
                : "anime".equals(whyAudio) || "anime".equals(whySub) ? "anime"
                : "sdh-swap".equals(whySub) ? "sdh-swap" : "default";
        Log.i(TAG, "apply show=" + show + " audio=" + audioToken()
                + " sub=" + ("addon".equals(whySub) ? "addon" : subToken()) + " why=" + why);
    }

    private static void snapshot(Host h) {
        int count = h.audioCount();
        int a = h.audioCurrent();
        if (a < 0 && count > 0) a = 0;
        Aud aud = a >= 0 && a < count ? h.audio(a) : null;
        snapAudioLang = aud == null ? "" : aud.lang;
        snapAudioLabel = aud == null ? "" : aud.label;
        int s = h.subCurrent();
        Sub sub = s >= 1 && s <= h.subCount() ? h.sub(s) : null;
        snapSubOff = s == -1;
        snapSubLang = sub == null ? "" : sub.lang;
        snapSubLabel = sub == null ? "" : sub.label;
        VimuAddonSubs.Entry ext = s == 0 ? loadedAddon() : null; // the external slot shows one of our addon subtitles
        if (ext != null) {
            snapSubLang = ext.lang;
            snapSubLabel = ext.name;
        }
    }

    /** Called about once per second while the player is alive (VimuResult tick). */
    static void tick(Host h, boolean playing, int posMs) {
        try {
            if (h == null || (!active && !verdictSet)) return; // plain Vimu launch, rule never reached: untouched
            if (!playing) {
                advancing = 0;
                lastPos = posMs;
            } else {
                int moved = lastPos < 0 ? 0 : posMs - lastPos;
                lastPos = posMs;
                advancing = moved > 0 && moved < 3000 ? advancing + 1 : 0;
            }
            if (settled) {
                int a = h.audioCurrent();
                int s = h.subCurrent();
                boolean changed = a != baseAudio || s != baseSub;
                snapshot(h);
                if (changed) {
                    manual = true;
                    baseAudio = a;
                    baseSub = s;
                    Log.i(TAG, "manual change audio=" + audioToken() + " sub=" + subToken());
                }
                return;
            }
            if (advancing < 2) return; // never touch tracks before the stream steadily advances, or during a seek
            if (restoreAudio >= 0) { // a restart for a new addon subtitle resets Vimu's audio track
                if (h.audioCount() > 0) {
                    int want = restoreAudio;
                    restoreAudio = -1;
                    int cur = h.audioCurrent();
                    if (want != (cur < 0 ? 0 : cur)) h.selectAudio(want);
                } else if (++restoreTries >= AUTO_LIST_POLLS) {
                    restoreAudio = -1;
                    Log.i(TAG, "audio list never loaded after the subtitle restart");
                }
            }
            if (!addonAutoDone && !addons.isEmpty() && addonAuto(h)) return; // restarted: wait for the new engine
            if (!audioDone) {
                int count = h.audioCount();
                if (count <= 0) {
                    if (++audioTries >= 10) {
                        audioDone = true;
                        Log.i(TAG, "audio list never loaded");
                    }
                } else {
                    List<Aud> list = new ArrayList<>();
                    for (int i = 0; i < count; i++) list.add(h.audio(i));
                    int idx = pickAudio(mem, list);
                    if (idx >= 0) {
                        int cur = h.audioCurrent();
                        if (idx != (cur < 0 ? 0 : cur)) h.selectAudio(idx);
                        whyAudio = "memory";
                        audioDone = true;
                    } else if (verdictSet || ++verdictWait > VERDICT_WAIT_POLLS) {
                        if (mem.hasAudio()) Log.i(TAG, "no audio track matches the memory");
                        String userLang = !mem.userAudioLang.isEmpty() ? mem.userAudioLang : userLangPref;
                        AudPick p = pickDefaultAudio(verdictSet && animeShow, animeLangPref, userLang, list);
                        if (p.index >= 0) {
                            int cur = h.audioCurrent();
                            if (p.index != (cur < 0 ? 0 : cur)) h.selectAudio(p.index);
                        } else {
                            Log.i(TAG, "audio default kept: " + p.note + ", keeping Vimu default");
                        }
                        whyAudio = p.why;
                        audioDone = true;
                    }
                }
            }
            if (!subDone && (audioDone || mem.hasSub() || explicitSub)) { // the anime subtitle rule needs the audio decision
                int count = h.subCount();
                if (count < 0) {
                    if (++subTries >= 10) subDone = true;
                } else {
                    List<Sub> list = new ArrayList<>();
                    for (int i = 1; i <= count; i++) list.add(h.sub(i));
                    SubPick p = null;
                    if ("anime".equals(whyAudio) && !mem.hasSub() && !explicitSub) {
                        p = pickAnimeSub(mem.userSubLang, list, h.subCurrent());
                    }
                    if (p == null) p = pickSub(mem, explicitSub, list, h.subCurrent());
                    if (p.dialog != SubPick.KEEP) h.selectSub(p.dialog);
                    whySub = p.why;
                    subDone = true;
                }
            }
            if (audioDone && subDone) {
                snapshot(h);
                if (!applyLogged) {
                    applyLogged = true;
                    logApply();
                }
                // The settle delay lets other code finish its own audio/subtitle hand-off before manual changes are watched.
                if (restoreAudio < 0 && ++settleCount >= SETTLE_POLLS) { // never settle on a half-restored audio track
                    baseAudio = h.audioCurrent();
                    baseSub = h.subCurrent();
                    settled = true;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "tick", t);
        }
    }

    /** Hook in VimuResult.tick: the live Vimu engine. */
    public static void tick(Object fragment, e player, boolean playing, int posMs) {
        if (player == null) return;
        lastPlayer = new WeakReference<>(player);
        bindHost(fragment);
        tick(new PlayerHost(player), playing, posMs);
    }

    /** Points the addon host at this fragment (a new Vimu screen brings a new fragment). */
    private static void bindHost(Object fragment) {
        if (!addons.isEmpty() && fragment instanceof PlayerFragment) {
            AddonHost ah = addonHost;
            if (!(ah instanceof FragmentAddonHost) || ((FragmentAddonHost) ah).fragment.get() != fragment) {
                addonHost = new FragmentAddonHost((PlayerFragment) fragment);
            }
        }
    }

    // ---- addon subtitles -----------------------------------------------------------------

    /** Seam to Vimu's fragment: loads a new external subtitle by restarting the engine (FragmentAddonHost; a fake in tests). */
    interface AddonHost {
        /** Puts url on the activity intent as forcedsrt, shows the toast (may be null) and restarts at the current position. */
        boolean restart(String url, String toastText);

        void toast(String text);

        /** The forcedsrt currently on the activity intent, "" when none. */
        String loadedUrl();
    }

    static void setAddonHost(AddonHost host) {
        addonHost = host;
    }

    private static int loadedIndex() {
        try {
            AddonHost ah = addonHost;
            String url = ah == null ? "" : ah.loadedUrl();
            if (url == null || url.isEmpty()) return -1;
            for (int i = 0; i < addons.size(); i++) {
                if (url.equals(addons.get(i).url)) return i;
            }
        } catch (Throwable t) {
            Log.w(TAG, "loadedIndex", t);
        }
        return -1;
    }

    private static VimuAddonSubs.Entry loadedAddon() {
        int i = loadedIndex();
        return i >= 0 && i < addons.size() ? addons.get(i) : null;
    }

    /**
     * Once, early: the file has no full embedded subtitle in the user's language and nothing explicit was chosen, so
     * the best addon subtitle replaces nothing and is loaded through forcedsrt. True when the engine was restarted.
     */
    private static boolean addonAuto(Host h) {
        if (explicitSub || mem.subOff) {
            addonAutoDone = true;
            Log.i(TAG, "addon auto skipped: " + (explicitSub ? "subtitle chosen explicitly" : "subtitles off in memory"));
            return false;
        }
        int count = h.subCount();
        if (count < 0) {
            if (++addonTries >= AUTO_LIST_POLLS) {
                addonAutoDone = true;
                Log.i(TAG, "addon auto skipped: embedded subtitle list never loaded");
            }
            return false;
        }
        addonAutoDone = true;
        String want = VimuAddonSubs.wantLang(mem.subLang, mem.userSubLang);
        List<Sub> embedded = new ArrayList<>();
        for (int i = 1; i <= count; i++) embedded.add(h.sub(i));
        if (VimuAddonSubs.hasGoodEmbedded(embedded, want)) {
            Log.i(TAG, "addon auto skipped: embedded " + want + " subtitle present");
            return false;
        }
        int idx = VimuAddonSubs.pickAuto(addons, want, mem.subLabel);
        if (idx < 0) { // only an addon subtitle in the wanted language is ever loaded on its own; the others stay in the dialog
            Log.i(TAG, "addon auto skipped: no " + want + " addon subtitle");
            return false;
        }
        return loadAddon(idx, false, h);
    }

    /** Restarts Vimu on addon subtitle idx. byUser = a manual switch (counts as a manual track change). */
    private static boolean loadAddon(int idx, boolean byUser, Host h) {
        AddonHost ah = addonHost;
        if (ah == null || idx < 0 || idx >= addons.size()) return false;
        VimuAddonSubs.Entry en = addons.get(idx);
        int audio = h.audioCurrent();
        String text = byUser ? VimuAddonSubs.toast(VimuAddonSubs.T_ADDON, en, "") : null;
        if (!ah.restart(en.url, text)) {
            Log.w(TAG, "addon subtitle restart failed");
            return false;
        }
        explicitSub = true;
        whySub = "addon";
        if (byUser) {
            subDone = true; // from now on the user decides; the automatic rules stay out
            addonAutoDone = true;
        }
        restoreAudio = (byUser || audioDone) && audio >= 0 ? audio : -1;
        restoreTries = 0;
        if (byUser) {
            manual = true;
            settled = false;
            settleCount = 0;
            snapSubOff = false; // what the result reports from now on, even if Vimu is left before the next snapshot
            snapSubLang = en.lang;
            snapSubLabel = en.name;
        }
        advancing = 0;
        lastPos = -1;
        lastPlayer = null; // the old engine is gone; the next tick brings the new one
        lastCycleAt = System.currentTimeMillis();
        Log.i(TAG, "addon subtitle " + (byUser ? "switch" : "auto") + " -> " + en.name + " lang=" + en.lang);
        return true;
    }

    /** Next entry of the ring addons -> embedded -> off. True when something was switched. */
    static boolean cycle(Host h) {
        int count = h.subCount();
        List<Sub> embedded = new ArrayList<>();
        for (int i = 1; i <= count; i++) embedded.add(h.sub(i));
        boolean hasEmb = !embedded.isEmpty();
        int cur = h.subCurrent();
        if (cur >= 1) lastEmbedded = cur;
        int n = addons.size();
        int loaded = loadedIndex();
        int pos = VimuAddonSubs.ringPos(n, hasEmb, cur, loaded);
        int next = VimuAddonSubs.ringNext(VimuAddonSubs.ringSize(n, hasEmb), pos);
        int kind = VimuAddonSubs.targetKind(next, n, hasEmb);
        String text;
        if (kind == VimuAddonSubs.T_ADDON) {
            if (next != loaded) return loadAddon(next, true, h);
            h.selectSub(0); // already loaded in the external slot, only show it again
            text = VimuAddonSubs.toast(kind, addons.get(next), "");
        } else if (kind == VimuAddonSubs.T_EMBEDDED) {
            int d = VimuAddonSubs.embeddedDialog(embedded, VimuAddonSubs.wantLang(mem.subLang, mem.userSubLang), lastEmbedded);
            if (d < 1) return false;
            h.selectSub(d);
            lastEmbedded = d;
            text = VimuAddonSubs.toast(kind, null, embedded.get(d - 1).label);
        } else {
            h.selectSub(-1);
            text = VimuAddonSubs.toast(kind, null, "");
        }
        markManual(h);
        if (kind == VimuAddonSubs.T_OFF) { // what the result reports, even if the engine is slow to confirm the change
            snapSubOff = true;
            snapSubLang = snapSubLabel = "";
        } else if (kind == VimuAddonSubs.T_EMBEDDED) {
            Sub chosen = embedded.get(lastEmbedded - 1); // set to the chosen dialog number above
            snapSubOff = false;
            snapSubLang = chosen.lang;
            snapSubLabel = chosen.label;
        } else {
            snapSubOff = false;
            snapSubLang = addons.get(next).lang;
            snapSubLabel = addons.get(next).name;
        }
        AddonHost ah = addonHost;
        if (ah != null) ah.toast(text);
        Log.i(TAG, "addon subtitle cycle -> " + text);
        return true;
    }

    /** The user chose a subtitle: from now on the user decides, the automatic rules stay out, and the result says "manual". */
    private static void markManual(Host h) {
        manual = true;
        explicitSub = true;
        subDone = true;
        addonAutoDone = true;
        if (settled) baseSub = h.subCurrent();
        snapshot(h);
    }

    // ---- Vimu's subtitle dialog (VimuSubDialog) ------------------------------------------

    /** The addon list of this launch (empty when none), for the dialog rows. */
    static List<VimuAddonSubs.Entry> dialogAddons() {
        return addons;
    }

    /** Index of the addon sitting in the external subtitle slot, or -1. */
    static int dialogLoaded(Object fragment) {
        try {
            bindHost(fragment);
            return loadedIndex();
        } catch (Throwable t) {
            Log.w(TAG, "dialogLoaded", t);
            return -1;
        }
    }

    /** A row "Addon: ..." was chosen in Vimu's subtitle dialog. True when the switch was made. */
    static boolean pickAddon(Object fragment, int idx) {
        try {
            if (idx < 0 || idx >= addons.size() || !(fragment instanceof PlayerFragment)) return false;
            bindHost(fragment);
            e player = PlayerFragment.G0((PlayerFragment) fragment);
            return player != null && pickAddon(new PlayerHost(player), idx);
        } catch (Throwable t) {
            Log.w(TAG, "pickAddon", t);
            return false;
        }
    }

    static boolean pickAddon(Host h, int idx) {
        if (idx < 0 || idx >= addons.size()) return false;
        if (System.currentTimeMillis() - lastCycleAt < CYCLE_GAP_MS) return false; // the engine is still restarting
        if (idx != loadedIndex()) return loadAddon(idx, true, h);
        h.selectSub(0); // already in the external slot, only show it again
        markManual(h);
        VimuAddonSubs.Entry en = addons.get(idx);
        snapSubOff = false;
        snapSubLang = en.lang;
        snapSubLabel = en.name;
        AddonHost ah = addonHost;
        if (ah != null) ah.toast(VimuAddonSubs.toast(VimuAddonSubs.T_ADDON, en, ""));
        Log.i(TAG, "addon subtitle dialog -> " + en.name + " lang=" + en.lang);
        return true;
    }

    /** True when Stremio passed addon subtitles for this launch (the IntroSkip key hook then owns the cycle key). */
    public static boolean hasAddonSubs() {
        return !addons.isEmpty();
    }

    /** Key hook (IntroSkip.onKey): switch to the next addon subtitle, embedded or off. Fail-soft. */
    public static void cycleAddonSubs() {
        try {
            e player = lastPlayer == null ? null : lastPlayer.get();
            if (addons.isEmpty() || player == null || addonHost == null) return;
            if (System.currentTimeMillis() - lastCycleAt < CYCLE_GAP_MS) return;
            lastCycleAt = System.currentTimeMillis();
            cycle(new PlayerHost(player));
        } catch (Throwable t) {
            Log.w(TAG, "cycleAddonSubs", t);
        }
    }

    /** Vimu's fragment as the addon host: restart is exactly what Vimu's OpenSubtitles download does (PlayerFragment$e). */
    static final class FragmentAddonHost implements AddonHost {
        final WeakReference<PlayerFragment> fragment;

        FragmentAddonHost(PlayerFragment f) {
            fragment = new WeakReference<>(f);
        }

        private Intent intent() {
            PlayerFragment f = fragment.get();
            Activity a = f == null ? null : f.getActivity();
            return a == null ? null : a.getIntent();
        }

        @Override
        public boolean restart(String url, String toastText) {
            Intent i = null;
            String old = null;
            try {
                PlayerFragment f = fragment.get();
                i = intent();
                e p = f == null ? null : PlayerFragment.G0(f);
                if (i == null || p == null) return false;
                old = i.getStringExtra("forcedsrt");
                i.putExtra("forcedsrt", url);
                PlayerFragment.L0(f, Math.max(p.getCurrentPosition(), 0)); // resume point for a restart before 20 s
                if (toastText != null) f.P1(toastText);
                PlayerFragment.R0(f);
                return true;
            } catch (Throwable t) {
                Log.w(TAG, "restart", t);
                try {
                    if (i != null) {
                        if (old != null) i.putExtra("forcedsrt", old);
                        else i.removeExtra("forcedsrt");
                    }
                } catch (Throwable ignored) {
                    // leave the intent as it is
                }
                return false;
            }
        }

        @Override
        public void toast(String text) {
            try {
                PlayerFragment f = fragment.get();
                if (f != null && text != null) f.P1(text);
            } catch (Throwable t) {
                Log.w(TAG, "toast", t);
            }
        }

        @Override
        public String loadedUrl() {
            try {
                Intent i = intent();
                String u = i == null ? null : i.getStringExtra("forcedsrt");
                return u == null ? "" : u;
            } catch (Throwable t) {
                return "";
            }
        }
    }

    /** One more look at the tracks just before the result is built, so a change made right before exit is not missed. */
    private static void pollFinal() {
        e player = lastPlayer == null ? null : lastPlayer.get();
        if (settled && player != null) tick(new PlayerHost(player), false, lastPos);
    }

    // ---- reporting -----------------------------------------------------------------------

    /** Hook in VimuResult (tick and fill): the tikka.tracks.* extras on the result Intent. */
    public static void fillResult(Intent out) {
        try {
            if (out == null || !active) return;
            pollFinal();
            out.putExtra(P + "show", show);
            out.putExtra(P + "audio_lang", lang3(snapAudioLang));
            out.putExtra(P + "audio_label", snapAudioLabel);
            out.putExtra(P + "sub_lang", lang3(snapSubLang));
            out.putExtra(P + "sub_label", snapSubLabel);
            out.putExtra(P + "sub_off", snapSubOff);
            out.putExtra(P + "manual", manual);
        } catch (Throwable t) {
            Log.w(TAG, "fillResult", t);
        }
    }

    static final String[] JOURNAL_COLUMNS = {
        P + "show", P + "audio_lang", P + "audio_label", P + "sub_lang", P + "sub_label", P + "sub_off", P + "manual"
    };

    /** Journal row part (always written, so a previous launch never survives into this one). */
    static void writeJournal(SharedPreferences.Editor ed) {
        try {
            ed.putString(JOURNAL_COLUMNS[0], active ? show : "");
            ed.putString(JOURNAL_COLUMNS[1], active ? lang3(snapAudioLang) : "");
            ed.putString(JOURNAL_COLUMNS[2], active ? snapAudioLabel : "");
            ed.putString(JOURNAL_COLUMNS[3], active ? lang3(snapSubLang) : "");
            ed.putString(JOURNAL_COLUMNS[4], active ? snapSubLabel : "");
            ed.putBoolean(JOURNAL_COLUMNS[5], active && snapSubOff);
            ed.putBoolean(JOURNAL_COLUMNS[6], active && manual);
        } catch (Throwable t) {
            Log.w(TAG, "writeJournal", t);
        }
    }

    /** The seven journal values in JOURNAL_COLUMNS order; booleans as Integer 1/0 (a MatrixCursor has no boolean). */
    static Object[] journalValues(SharedPreferences p) {
        try {
            return new Object[] {
                p.getString(JOURNAL_COLUMNS[0], ""), p.getString(JOURNAL_COLUMNS[1], ""),
                p.getString(JOURNAL_COLUMNS[2], ""), p.getString(JOURNAL_COLUMNS[3], ""),
                p.getString(JOURNAL_COLUMNS[4], ""),
                p.getBoolean(JOURNAL_COLUMNS[5], false) ? 1 : 0, p.getBoolean(JOURNAL_COLUMNS[6], false) ? 1 : 0
            };
        } catch (Throwable t) {
            Log.w(TAG, "journalValues", t);
            return new Object[] {"", "", "", "", "", 0, 0};
        }
    }

    // ---- Vimu engine adapter -------------------------------------------------------------

    private static boolean warned;

    private static void warnOnce(String what, Throwable t) {
        if (warned) return;
        warned = true;
        Log.w(TAG, what, t);
    }

    static final class PlayerHost implements Host {
        private final e player;

        PlayerHost(e player) {
            this.player = player;
        }

        @Override
        public int audioCount() {
            try {
                return player.f0();
            } catch (Throwable t) {
                warnOnce("audioCount", t);
                return 0;
            }
        }

        @Override
        public Aud audio(int index) {
            try {
                String display = player.p0(index);
                if (display == null) display = "";
                return new Aud(audioLangFromDisplay(display), audioTitleFromDisplay(display), display);
            } catch (Throwable t) {
                warnOnce("audio", t);
                return new Aud("", "", "");
            }
        }

        @Override
        public int audioCurrent() {
            try {
                return player.M();
            } catch (Throwable t) {
                warnOnce("audioCurrent", t);
                return -1;
            }
        }

        @Override
        public void selectAudio(int index) {
            try {
                if (player.R0()) player.J0(); // exactly what Vimu's own audio dialog does
                player.e0(index);
            } catch (Throwable t) {
                Log.w(TAG, "selectAudio", t);
            }
        }

        private static Object field(Object target, String name) throws Exception {
            for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
                try {
                    Field f = c.getDeclaredField(name);
                    f.setAccessible(true);
                    return f.get(target);
                } catch (NoSuchFieldException ignored) {
                    // try the superclass
                }
            }
            throw new NoSuchFieldException(name);
        }

        /** The embedded subtitle array of the engine (field K.d), or null while Vimu has not parsed it. */
        private Object tracks() throws Exception {
            Object k = field(player, "K");
            return k == null ? null : field(k, "d");
        }

        @Override
        public int subCount() {
            try {
                Object d = tracks();
                return d == null ? -1 : Array.getLength(d);
            } catch (Throwable t) {
                warnOnce("subCount", t);
                return -1;
            }
        }

        @Override
        public Sub sub(int dialog) {
            try {
                Object one = Array.get(tracks(), dialog - 1);
                Object label = field(one, "c");
                Object lang = field(one, "d");
                Object forced = field(one, "f");
                return new Sub(subLangFromRaw(lang instanceof String ? (String) lang : ""),
                        label instanceof String ? (String) label : "", Boolean.TRUE.equals(forced));
            } catch (Throwable t) {
                warnOnce("sub", t);
                return new Sub("", "", false);
            }
        }

        @Override
        public int subCurrent() {
            try {
                return player.L();
            } catch (Throwable t) {
                warnOnce("subCurrent", t);
                return -1;
            }
        }

        @Override
        public void selectSub(int dialog) {
            try {
                player.O0(dialog);
            } catch (Throwable t) {
                Log.w(TAG, "selectSub", t);
            }
        }
    }
}
