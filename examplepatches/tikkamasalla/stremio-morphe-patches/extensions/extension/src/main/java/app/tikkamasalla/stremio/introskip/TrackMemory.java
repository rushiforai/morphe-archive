package app.tikkamasalla.stremio.introskip;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.TrackSelectionOverride;
import androidx.media3.common.TrackSelectionParameters;
import androidx.media3.common.Tracks;

import app.tikkamasalla.stremio.subs.SdhLabels;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Remembers the audio language and subtitle choice per show (IMDb tt id or kitsu:ID, see showKey) and
 * applies them to its other episodes. A movie keeps a memory under its own tt id; tmdb and other ids
 * are never stored. Fail soft everywhere.
 */
public final class TrackMemory {
    private static final String TAG = "TrackMemory";
    private static final String FILE = "introskip_prefs";
    private static final String KEY_ENABLED = "trackmem_enabled";
    /** Playbacks where the user picked a track (or we already applied one): never override again. */
    private static final Map<Object, Boolean> MANUAL = Collections.synchronizedMap(
            new WeakHashMap<Object, Boolean>());
    /** Players whose first onTracksChanged with tracks was seen: only that call may replace stock's own pick. */
    private static final Map<Object, Boolean> SEEN = Collections.synchronizedMap(
            new WeakHashMap<Object, Boolean>());
    /** Last player seen per view model, to forget manual picks of an earlier playback. */
    private static final Map<Object, WeakReference<Object>> LAST_PLAYER = Collections.synchronizedMap(
            new WeakHashMap<Object, WeakReference<Object>>());

    private TrackMemory() {
    }

    private static Context app() {
        try {
            Class<?> thread = Class.forName("android.app.ActivityThread");
            Method current = thread.getMethod("currentApplication");
            return (Application) current.invoke(null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean enabled() {
        try {
            Context context = app();
            if (context == null) return true;
            return context.getSharedPreferences(FILE, Context.MODE_PRIVATE)
                    .getBoolean(KEY_ENABLED, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static boolean isSdh(String label) {
        return isSdh(label, null);
    }

    /**
     * Hearing-impaired label test. The code "hi" is Hindi and never SDH: a bare "hi" label is a plain track, and a
     * " hi " token counts only when the track is not Hindi (language hi, or a label naming Hindi).
     */
    private static boolean isSdh(String label, String lang) {
        if (label == null) return false;
        String v = label.toLowerCase(Locale.US);
        if (v.contains("sdh") || v.contains(" cc") || v.endsWith("cc")
                || v.contains("[cc]") || v.contains("(cc)")
                || v.contains("hearing") || v.contains("impaired")
                || v.contains(" hard of hearing")) return true;
        if (!v.contains(" hi ")) return false;
        if ("hi".equals(lang2(lang)) || v.contains("hindi")) return false;
        for (int i = 0; i < v.length(); i++) {
            if (v.charAt(i) >= 0x0900 && v.charAt(i) <= 0x097f) return false;
        }
        return true;
    }

    /** Track ids that are addon URLs say nothing about the content; only the label does. */
    private static boolean isSdhId(String id) {
        return isSdhId(id, null);
    }

    private static boolean isSdhId(String id, String lang) {
        if (id == null) return false;
        String v = id.toLowerCase(Locale.US);
        if (v.startsWith("http://") || v.startsWith("https://")) return false;
        return isSdh(v, lang);
    }

    private static String kindOf(String label) {
        if (label == null) return "full";
        String v = label.toLowerCase(Locale.US);
        if (v.contains("sign") || v.contains("song") || v.contains("forced")) return "signs";
        return "full";
    }

    private static boolean langMatch(String a, String b) {
        return sameLang(a, b);
    }

    private static String seriesIdOf(Object viewModel) {
        try {
            Object flow = viewModel.getClass().getMethod("getState").invoke(viewModel);
            Object state = flow.getClass().getMethod("getValue").invoke(flow);
            Object meta = state.getClass().getMethod("getMetaItem").invoke(state);
            if (meta == null) return "";
            Object id = meta.getClass().getMethod("getId").invoke(meta);
            return id == null ? "" : String.valueOf(id);
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static Object fieldOf(Object holder, String fieldName) {
        try {
            Field field = null;
            for (Class<?> c = holder.getClass(); c != null; c = c.getSuperclass()) {
                try {
                    field = c.getDeclaredField(fieldName);
                    break;
                } catch (NoSuchFieldException ignored) {
                    // Try superclass.
                }
            }
            if (field == null) return null;
            field.setAccessible(true);
            return field.get(holder);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Finds a raw field, a public getter or a Kotlin lazy delegate (name$delegate). */
    private static Object viewModelOf(Object holder, String fieldName) {
        try {
            if (holder == null) return null;
            Object direct = fieldOf(holder, fieldName);
            if (direct != null) return direct;
            String getterName = "get" + Character.toUpperCase(fieldName.charAt(0)) + fieldName.substring(1);
            try {
                Object value = holder.getClass().getMethod(getterName).invoke(holder);
                if (value != null) return value;
            } catch (Throwable ignored) {
                // Try the delegate.
            }
            Object delegate = fieldOf(holder, fieldName + "$delegate");
            if (delegate != null) {
                Method getValue = delegate.getClass().getMethod("getValue");
                getValue.setAccessible(true);
                return getValue.invoke(delegate);
            }
            return null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String formatString(Object format, String fieldName) {
        try {
            Field field = format.getClass().getField(fieldName);
            Object value = field.get(format);
            return value == null ? "" : String.valueOf(value);
        } catch (Throwable ignored) {
            return "";
        }
    }

    /** Hook at the start of TrackSelectionDialog.onSelectTrack. */
    public static void remember(Object dialog, Object trackInfo) {
        try {
            if (dialog == null) return;
            Object viewModel = viewModelOf(dialog, "viewModel");
            // Any manual pick, including "Subtitles off" (no track info), stops automatic changes.
            if (viewModel != null) MANUAL.put(viewModel, Boolean.TRUE);
            if (trackInfo == null || !enabled()) return;
            if (viewModel == null) return;
            String seriesId = showKey(seriesIdOf(viewModel));
            if (seriesId.length() == 0) return;
            Method getFormat = trackInfo.getClass().getMethod("getFormat");
            Object format = getFormat.invoke(trackInfo);
            if (format == null) return;
            String language = formatString(format, "language");
            String label = formatString(format, "label");
            String trackId = formatString(format, "id");
            if (language.length() == 0) {
                // Stock "none" entry of the subtitle dialog: EMPTY_FORMAT (id "", no language, no mime type).
                Object dialogType = fieldOf(dialog, "trackType");
                if (dialogType instanceof Integer && ((Integer) dialogType).intValue() == C.TRACK_TYPE_TEXT
                        && trackId.length() == 0 && formatString(format, "sampleMimeType").length() == 0
                        && groupTypeOf(trackInfo) == C.TRACK_TYPE_UNKNOWN) {
                    Context offContext = app();
                    if (offContext != null) {
                        offContext.getSharedPreferences(FILE, Context.MODE_PRIVATE).edit()
                                .putString("track_suboff_" + seriesId, "1").apply();
                        Log.i(TAG, "subs " + seriesId + " -> off");
                    }
                }
                return;
            }
            Object group = trackInfo.getClass().getMethod("getGroup").invoke(trackInfo);
            int type = 0;
            try {
                type = (Integer) group.getClass().getMethod("getType").invoke(group);
            } catch (Throwable ignored) {
                return;
            }
            Context context = app();
            if (context == null) return;
            SharedPreferences prefs = context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
            if (type == C.TRACK_TYPE_AUDIO) {
                SharedPreferences.Editor edit = prefs.edit().putString("track_audio_" + seriesId, language);
                if (label != null && label.length() > 0) {
                    edit.putString("track_audiolabel_" + seriesId, label);
                } else {
                    edit.remove("track_audiolabel_" + seriesId);
                }
                edit.apply();
                Log.i(TAG, "audio " + seriesId + " -> " + language);
            } else if (type == C.TRACK_TYPE_TEXT) {
                if (isSdh(label, language) || isSdhId(trackId, language)) return;
                SharedPreferences.Editor edit = prefs.edit()
                        .putString("track_sub_" + seriesId, language)
                        .putString("track_subkind_" + seriesId, kindOf(label))
                        .remove("track_suboff_" + seriesId);
                if (label != null && label.length() > 0) {
                    edit.putString("track_sublabel_" + seriesId, label);
                } else {
                    edit.remove("track_sublabel_" + seriesId);
                }
                edit.apply();
                Log.i(TAG, "subs " + seriesId + " -> " + language + " " + kindOf(label));
            }
        } catch (Throwable ignored) {
            // Remembering is optional.
        }
    }

    /** Track type of the TrackInfo's group; C.TRACK_TYPE_NONE when it cannot be read. */
    private static int groupTypeOf(Object trackInfo) {
        try {
            Object group = trackInfo.getClass().getMethod("getGroup").invoke(trackInfo);
            return (Integer) group.getClass().getMethod("getType").invoke(group);
        } catch (Throwable ignored) {
            return C.TRACK_TYPE_NONE;
        }
    }

    /**
     * Hook right after PlayerFragment.startStreamPlayback stores the player (legacy builds), before the media is prepared:
     * the show's remembered audio and subtitle language become the first preferred languages of the track selection, so
     * ExoPlayer picks them the first time and nothing switches after playback has started. Subtitles-off disables text.
     * Exact label / SDH / signs choices a preference cannot express are left to apply() (text only).
     */
    public static void preSelect(Object fragment, Object player) {
        try {
            if (fragment == null || player == null || !enabled()) return;
            Object viewModel = viewModelOf(fragment, "viewModel");
            if (viewModel == null) return;
            String seriesId = showKey(seriesIdOf(viewModel));
            if (seriesId.length() == 0) return;
            Context context = app();
            if (context == null) return;
            SharedPreferences prefs = context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
            String audioLang = lang2(prefs.getString("track_audio_" + seriesId, ""));
            String subLang = lang2(prefs.getString("track_sub_" + seriesId, ""));
            boolean subOff = "1".equals(prefs.getString("track_suboff_" + seriesId, ""));
            if (audioLang.equals("und") || audioLang.equals("zxx")) audioLang = "";
            if (subLang.equals("und") || subLang.equals("zxx")) subLang = "";
            if (audioLang.length() == 0 && subLang.length() == 0 && !subOff) return;
            Method getParams = player.getClass().getMethod("getTrackSelectionParameters");
            Method setParams = player.getClass().getMethod("setTrackSelectionParameters", TrackSelectionParameters.class);
            TrackSelectionParameters params = (TrackSelectionParameters) getParams.invoke(player);
            if (params == null) return;
            TrackSelectionParameters.Builder builder = params.buildUpon();
            if (audioLang.length() > 0) {
                builder.setPreferredAudioLanguages(languagesFirst(audioLang, params.preferredAudioLanguages));
            }
            if (subOff) { // off wins over a language saved earlier (apply() does the same)
                builder.setTrackTypeDisabled(C.TRACK_TYPE_TEXT, true);
            } else if (subLang.length() > 0) {
                builder.setPreferredTextLanguages(languagesFirst(subLang, params.preferredTextLanguages))
                        .setTrackTypeDisabled(C.TRACK_TYPE_TEXT, false);
            }
            setParams.invoke(player, builder.build());
            Log.i(TAG, "pre-select audio=" + (audioLang.length() == 0 ? "-" : audioLang)
                    + " sub=" + (subOff ? "off" : subLang.length() > 0 ? subLang : "-"));
        } catch (Throwable ignored) {
            // Stremio defaults keep working.
        }
    }

    private static String[] languagesFirst(String first, java.util.List<String> rest) {
        java.util.List<String> out = new java.util.ArrayList<String>();
        out.add(first);
        if (rest != null) {
            for (String l : rest) {
                if (l != null && l.length() > 0 && !sameLang(l, first)) out.add(l);
            }
        }
        return out.toArray(new String[0]);
    }

    /**
     * Hook at the end of PlayerEventListener.onTracksChanged (after stock's own track pick). Audio is never touched here
     * (preSelect set the audio preference before playback; a later audio switch would flush and rebuffer). Subtitles: on the
     * first call with tracks of a playback the remembered choice (kind, non-SDH, text over bitmap) replaces stock's pick when
     * it differs; later calls only fill in a type nobody has decided.
     */
    public static void apply(Object listener, Object tracksObj) {
        try {
            if (listener == null || !(tracksObj instanceof Tracks)) return;
            if (!enabled()) return;
            Object viewModel = viewModelOf(listener, "viewModel");
            Object player = viewModelOf(listener, "player");
            if (viewModel == null || player == null) return;
            WeakReference<Object> last = LAST_PLAYER.get(viewModel);
            if (last == null || last.get() != player) {
                LAST_PLAYER.put(viewModel, new WeakReference<Object>(player));
                MANUAL.remove(viewModel);
            }
            if (Boolean.TRUE.equals(MANUAL.get(viewModel))
                    || Boolean.TRUE.equals(MANUAL.get(player))) return;
            String seriesId = showKey(seriesIdOf(viewModel));
            if (seriesId.length() == 0) return;
            Context context = app();
            if (context == null) return;
            SharedPreferences prefs = context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
            Tracks tracks = (Tracks) tracksObj;
            boolean first = !tracks.getGroups().isEmpty() && SEEN.put(player, Boolean.TRUE) == null;
            String subLang = prefs.getString("track_sub_" + seriesId, "");
            String subKind = prefs.getString("track_subkind_" + seriesId, "full");
            String subOff = prefs.getString("track_suboff_" + seriesId, "");
            if ((subLang == null || subLang.length() == 0) && !"1".equals(subOff)) return;
            Method getParams;
            Method setParams;
            try {
                getParams = player.getClass().getMethod("getTrackSelectionParameters");
                setParams = player.getClass().getMethod("setTrackSelectionParameters",
                        TrackSelectionParameters.class);
            } catch (Throwable ignored) {
                return;
            }
            TrackSelectionParameters params =
                    (TrackSelectionParameters) getParams.invoke(player);
            if (params == null) return;
            // After the first call, a text type that already has an override (or is disabled) belongs to someone else.
            boolean textLocked = false;
            boolean textOverridden = false;
            for (TrackSelectionOverride held : params.overrides.values()) {
                if (held.getType() == C.TRACK_TYPE_TEXT) textOverridden = true;
            }
            if (!first) {
                textLocked = textOverridden || params.disabledTrackTypes.contains(C.TRACK_TYPE_TEXT);
            }
            TrackSelectionParameters.Builder builder = params.buildUpon();
            boolean changed = false;
            if (textLocked) {
                // Subtitles are already decided for this playback.
            } else if ("1".equals(subOff)) {
                if (textOverridden || !params.disabledTrackTypes.contains(C.TRACK_TYPE_TEXT)) {
                    builder.clearOverridesOfType(C.TRACK_TYPE_TEXT).setTrackTypeDisabled(C.TRACK_TYPE_TEXT, true);
                    changed = true;
                }
            } else if (subLang != null && subLang.length() > 0) {
                TrackSelectionOverride sub = findSub(tracks, subLang, subKind);
                if (sub != null && !isSelected(tracks, sub)) {
                    builder.setTrackTypeDisabled(C.TRACK_TYPE_TEXT, false).setOverrideForType(sub);
                    changed = true;
                }
            }
            if (!changed) return;
            setParams.invoke(player, builder.build());
            MANUAL.put(viewModel, Boolean.TRUE);
            MANUAL.put(player, Boolean.TRUE);
            String logMsg = "applied " + seriesId + " sub=" + subLang;
            if ("1".equals(subOff)) logMsg += " suboff=true";
            Log.i(TAG, logMsg);
        } catch (Throwable ignored) {
            // Fall back to Stremio defaults.
        }
    }

    /** True when the override's track is already the selected one of its group. */
    private static boolean isSelected(Tracks tracks, TrackSelectionOverride override) {
        try {
            for (Tracks.Group group : tracks.getGroups()) {
                if (!group.getMediaTrackGroup().equals(override.mediaTrackGroup)) continue;
                for (int i = 0; i < override.trackIndices.size(); i++) {
                    if (!group.isTrackSelected(override.trackIndices.get(i))) return false;
                }
                return true;
            }
        } catch (Throwable ignored) {
            // Treat as not selected.
        }
        return false;
    }

    public static void logSend(Entry e) {
        try {
            if (e == null) return;
            Entry w = new Entry();
            w.audioLang = lang3(e.audioLang); w.audioLabel = e.audioLabel;
            w.subLang = lang3(e.subLang); w.subLabel = e.subLabel; w.subOff = e.subOff;
            Log.i(TAG, "send show=" + e.show + " " + w + " avoid_sdh=" + e.avoidSdh);
        } catch (Throwable ignored) {
        }
    }

    public static void logVimu(Entry e, boolean stored) {
        try {
            if (e == null) return;
            Log.i(TAG, "vimu tracks show=" + e.show + " manual=" + e.manual + " stored=" + stored + " " + e.toString());
        } catch (Throwable ignored) {
        }
    }

    private static TrackSelectionOverride findAudio(Tracks tracks, String language) {
        try {
            for (Tracks.Group group : tracks.getGroups()) {
                if (group.getType() != C.TRACK_TYPE_AUDIO) continue;
                for (int i = 0; i < group.length; i++) {
                    Format format = group.getTrackFormat(i);
                    if (format == null) continue;
                    if (langMatch(format.language, language)) {
                        return new TrackSelectionOverride(group.getMediaTrackGroup(), i);
                    }
                }
            }
        } catch (Throwable ignored) {
            // No match.
        }
        return null;
    }

    private static TrackSelectionOverride findSub(Tracks tracks, String language, String kind) {
        try {
            // Bitmap tracks (PGS, VobSub, DVB) are drawn outline-only by Stremio's player for some
            // releases, so a text track wins over a bitmap one of the same kind; the kind match
            // still comes first, and a bitmap track is used only when no text track fits.
            TrackSelectionOverride textKind = null;
            TrackSelectionOverride bitmapKind = null;
            TrackSelectionOverride textAny = null;
            TrackSelectionOverride bitmapAny = null;
            for (Tracks.Group group : tracks.getGroups()) {
                if (group.getType() != C.TRACK_TYPE_TEXT) continue;
                for (int i = 0; i < group.length; i++) {
                    Format format = group.getTrackFormat(i);
                    if (format == null) continue;
                    if (!langMatch(format.language, language)) continue;
                    if (isSdh(format.label, format.language) || isSdhId(format.id, format.language)) continue;
                    TrackSelectionOverride candidate =
                            new TrackSelectionOverride(group.getMediaTrackGroup(), i);
                    boolean bitmap = SdhLabels.isBitmapMime(format.sampleMimeType);
                    boolean kindOk = kindOf(format.label).equals(kind);
                    if (bitmap) {
                        if (bitmapAny == null) bitmapAny = candidate;
                        if (kindOk && bitmapKind == null) bitmapKind = candidate;
                    } else {
                        if (textAny == null) textAny = candidate;
                        if (kindOk && textKind == null) textKind = candidate;
                    }
                }
            }
            if (textKind != null) return textKind;
            if (bitmapKind != null) return bitmapKind;
            return textAny != null ? textAny : bitmapAny;
        } catch (Throwable ignored) {
            return null;
        }
    }

    // ---- Per-show track sharing with Vimu (contract v1, 2026-11-01) ----
    public static final String X_SHOW = "tikka.tracks.show";
    public static final String X_AUDIO_LANG = "tikka.tracks.audio_lang";
    public static final String X_AUDIO_LABEL = "tikka.tracks.audio_label";
    public static final String X_SUB_LANG = "tikka.tracks.sub_lang";
    public static final String X_SUB_LABEL = "tikka.tracks.sub_label";
    public static final String X_SUB_OFF = "tikka.tracks.sub_off";
    public static final String X_AVOID_SDH = "tikka.tracks.avoid_sdh";
    public static final String X_MANUAL = "tikka.tracks.manual";
    private static final String LANG_PAIRS = "en eng,es spa,fr fra,de deu,it ita,pt por,ru rus,ja jpn,zh zho,"
            + "ko kor,hi hin,ar ara,nl nld,sv swe,nb nor,da dan,fi fin,pl pol,tr tur,uk ukr";

    /** One show's remembered (or reported) tracks. Pure data, no android classes. */
    public static final class Entry {
        public String show = "", audioLang = "", audioLabel = "", subLang = "", subLabel = "";
        public boolean subOff, manual, avoidSdh;

        public boolean hasAudio() { return audioLang.length() > 0 || audioLabel.length() > 0; }
        public boolean hasSub() { return subLang.length() > 0 || subLabel.length() > 0; }
        public boolean isEmpty() { return !hasAudio() && !hasSub() && !subOff; }

        @Override
        public String toString() {
            String a = hasAudio() ? dash(audioLang) + "/" + dash(audioLabel) : "-";
            String s = subOff ? "off" : (hasSub() ? dash(subLang) + "/" + dash(subLabel) : "-");
            return "audio=" + a + " sub=" + s;
        }

        private static String dash(String v) { return v.length() == 0 ? "-" : v; }
    }

    /** Key/value store the pure load/store logic works on (SharedPreferences adapter below). */
    public interface Kv {
        String get(String key);
        void put(String key, String value);
        void remove(String key);
    }

    /** Common language names (lowercase) to ISO 639-1, so a label or name compares like a code. */
    private static final Map<String, String> NAMES = new HashMap<String, String>();
    /** 639-2/B, 639-2/T and legacy codes SdhLabels.normLang does not fold, to the 2-letter form (comparison only). */
    private static final Map<String, String> EXTRA_CODES = new HashMap<String, String>();

    static {
        String[] names = {
            "english", "en", "spanish", "es", "espanol", "es", "castellano", "es", "espa\u00f1ol", "es",
            "french", "fr", "francais", "fr", "fran\u00e7ais", "fr", "german", "de", "deutsch", "de",
            "italian", "it", "italiano", "it", "portuguese", "pt", "portugues", "pt", "portugu\u00eas", "pt",
            "russian", "ru", "japanese", "ja", "chinese", "zh", "mandarin", "zh", "korean", "ko", "hindi", "hi",
            "arabic", "ar", "dutch", "nl", "nederlands", "nl", "swedish", "sv", "svenska", "sv",
            "norwegian", "nb", "norsk", "nb", "bokmal", "nb", "bokm\u00e5l", "nb", "danish", "da", "dansk", "da",
            "finnish", "fi", "suomi", "fi", "polish", "pl", "polski", "pl", "turkish", "tr", "t\u00fcrk\u00e7e", "tr",
            "turkce", "tr", "ukrainian", "uk", "thai", "th", "hebrew", "he", "indonesian", "id", "vietnamese", "vi",
            "czech", "cs", "greek", "el", "hungarian", "hu", "romanian", "ro"};
        for (int i = 0; i < names.length; i += 2) NAMES.put(names[i], names[i + 1]);
        String[] codes = {
            "tha", "th", "heb", "he", "iw", "he", "ind", "id", "in", "id", "vie", "vi", "ces", "cs", "cze", "cs",
            "ell", "el", "gre", "el", "hun", "hu", "ron", "ro", "rum", "ro", "no", "nb", "nno", "nb", "nob", "nb",
            "cmn", "zh", "yue", "zh",
            // codes that begin with their 2-letter form: the old prefix compare matched these, keep them matching
            "srp", "sr", "hrv", "hr", "slv", "sl", "swa", "sw", "cat", "ca", "est", "et", "lav", "lv", "lit", "lt",
            "bul", "bg", "bel", "be", "ben", "bn", "bos", "bs", "glg", "gl", "kaz", "kk", "mal", "ml", "mar", "mr",
            "tam", "ta", "tel", "te", "urd", "ur", "uzb", "uz", "afr", "af", "aze", "az", "guj", "gu", "sqi", "sq",
            "alb", "sq", "isl", "is", "ice", "is", "kat", "ka", "geo", "ka", "mkd", "mk", "mac", "mk", "msa", "ms",
            "may", "ms", "slk", "sk", "slo", "sk", "cym", "cy", "wel", "cy", "eus", "eu", "baq", "eu", "fas", "fa",
            "per", "fa", "hye", "hy", "arm", "hy"};
        for (int i = 0; i < codes.length; i += 2) EXTRA_CODES.put(codes[i], codes[i + 1]);
    }

    /** ISO 639-1 form (en/eng/en-US/English all become en); "" for null. Codes outside SdhLabels' table stay as given. */
    public static String lang2(String raw) {
        if (raw == null) return "";
        String lowered = raw.trim().toLowerCase(Locale.US);
        String named = NAMES.get(lowered);
        return SdhLabels.normLang(named != null ? named : lowered);
    }

    /** Comparison key: lang2, then the 639-2/B-T and legacy codes lang2 leaves alone (tha, cze, ger...) folded to 2 letters. */
    private static String langKey(String raw) {
        String l2 = lang2(raw);
        String folded = EXTRA_CODES.get(l2);
        return folded != null ? folded : l2;
    }

    /** Region or script part of a tag ("pt-BR" gives "br", "zh-Hant" gives "hant"), "" when there is none. */
    private static String subTag(String raw) {
        if (raw == null) return "";
        String l = raw.trim().toLowerCase(Locale.US).replace('_', '-');
        int dash = l.indexOf('-');
        return dash > 0 ? l.substring(dash + 1) : "";
    }

    /**
     * The one language comparison: codes (639-1, 639-2/B, 639-2/T, with region) and common names compare equal.
     * When both sides carry a region or script (zh-Hant vs zh-Hans, pt-BR vs pt-PT) it must be the same one.
     */
    public static boolean sameLang(String a, String b) {
        String ka = langKey(a);
        String kb = langKey(b);
        if (ka.length() == 0 || kb.length() == 0) return false;
        if (ka.equals("und") || ka.equals("zxx") || ka.equals("mul")) return false;
        if (!ka.equals(kb)) return false;
        String sa = subTag(a);
        String sb = subTag(b);
        return sa.length() == 0 || sb.length() == 0 || sa.equals(sb);
    }

    /** ISO 639-2 form used on the wire (en/eng/en-US become eng, ja/jpn become jpn); others unchanged. */
    public static String lang3(String raw) {
        String l2 = lang2(raw);
        for (String pair : LANG_PAIRS.split(",")) {
            if (pair.startsWith(l2 + " ")) return pair.substring(3);
        }
        return l2;
    }

    private static String nz(String v) { return v == null ? "" : v; }

    private static final java.util.regex.Pattern KITSU_SHOW =
            java.util.regex.Pattern.compile("(?i)^kitsu:(\\d+)(?::\\d+)?$");

    /**
     * Key of the show a video or meta id belongs to, shared by the legacy player, the Compose port and
     * the Vimu share extras: "tt0944947:1:2" gives "tt0944947", "tt0944947" itself, "kitsu:46474:5" and
     * "kitsu:46474" give "kitsu:46474". "" for anything else (tmdb, null, blank): no memory for it.
     */
    public static String showKey(String id) {
        if (id == null) return "";
        String t = id.trim();
        if (t.startsWith("tt")) {
            int colon = t.indexOf(':');
            return colon > 0 ? t.substring(0, colon) : t;
        }
        java.util.regex.Matcher m = KITSU_SHOW.matcher(t);
        return m.matches() ? "kitsu:" + m.group(1) : "";
    }

    /** The show's memory (stored language form, labels, off flag), or null for a null kv / show without a key (see showKey). */
    public static Entry load(Kv kv, String show) {
        show = showKey(show);
        if (kv == null || show.length() == 0) return null;
        Entry e = new Entry();
        e.show = show;
        e.audioLang = nz(kv.get("track_audio_" + show));
        e.audioLabel = nz(kv.get("track_audiolabel_" + show));
        e.subLang = nz(kv.get("track_sub_" + show));
        e.subLabel = nz(kv.get("track_sublabel_" + show));
        e.subOff = "1".equals(kv.get("track_suboff_" + show));
        return e;
    }

    private static void putOrRemove(Kv kv, String key, String value) {
        if (value != null && value.length() > 0) kv.put(key, value); else kv.remove(key);
    }

    /**
     * Stores a pick Vimu reported, exactly as if the user had made it in Stremio's player. Nothing is
     * written unless e.manual; an SDH-labelled subtitle is never stored (same rule as remember()).
     */
    public static boolean store(Kv kv, Entry e) {
        if (kv == null || e == null || !e.manual || showKey(e.show).length() == 0) return false;
        boolean written = false;
        String s = showKey(e.show);
        String aLang = lang2(e.audioLang);
        if (aLang.length() > 0) {
            kv.put("track_audio_" + s, aLang);
            putOrRemove(kv, "track_audiolabel_" + s, e.audioLabel);
            written = true;
        }
        String sLang = lang2(e.subLang);
        if (e.subOff) {
            kv.put("track_suboff_" + s, "1");
            written = true;
        } else if (sLang.length() > 0 && !isSdh(e.subLabel, e.subLang)) {
            kv.put("track_sub_" + s, sLang);
            kv.put("track_subkind_" + s, kindOf(e.subLabel));
            putOrRemove(kv, "track_sublabel_" + s, e.subLabel);
            kv.remove("track_suboff_" + s);
            written = true;
        }
        return written;
    }

    /** Entry to launch extras (languages as ISO 639-2; empty parts omitted; never X_MANUAL). */
    public static void toExtras(Entry e, Map<String, Object> out) {
        if (e == null || out == null || nz(e.show).length() == 0) return;
        out.put(X_SHOW, e.show);
        out.put(X_AVOID_SDH, e.avoidSdh);
        if (e.audioLang.length() > 0) out.put(X_AUDIO_LANG, lang3(e.audioLang));
        if (e.audioLabel.length() > 0) out.put(X_AUDIO_LABEL, e.audioLabel);
        if (e.subLang.length() > 0) out.put(X_SUB_LANG, lang3(e.subLang));
        if (e.subLabel.length() > 0) out.put(X_SUB_LABEL, e.subLabel);
        if (e.subOff) out.put(X_SUB_OFF, Boolean.TRUE);
    }

    private static String str(Map<String, Object> in, String key) {
        Object v = in.get(key);
        return v == null ? "" : String.valueOf(v).trim();
    }

    private static boolean flag(Map<String, Object> in, String key) {
        Object v = in.get(key);
        if (v instanceof Boolean) return (Boolean) v;
        if (v instanceof Number) return ((Number) v).intValue() != 0;
        String t = v == null ? "" : String.valueOf(v).trim().toLowerCase(Locale.US);
        return "true".equals(t) || "1".equals(t);
    }

    /** Extras (or journal columns) to an Entry, languages unconverted; null when no tikka.tracks key is present. */
    public static Entry fromExtras(Map<String, Object> in) {
        if (in == null) return null;
        boolean any = false;
        for (String k : in.keySet()) {
            if (k != null && k.startsWith("tikka.tracks.")) { any = true; break; }
        }
        if (!any) return null;
        Entry e = new Entry();
        e.show = str(in, X_SHOW);
        e.audioLang = str(in, X_AUDIO_LANG);
        e.audioLabel = str(in, X_AUDIO_LABEL);
        e.subLang = str(in, X_SUB_LANG);
        e.subLabel = str(in, X_SUB_LABEL);
        e.manual = flag(in, X_MANUAL);
        e.subOff = flag(in, X_SUB_OFF);
        e.avoidSdh = flag(in, X_AVOID_SDH);
        return e;
    }

    public static Entry load(Context ctx, String show) {
        try {
            Context c = ctx != null ? ctx : app();
            if (c == null || !enabled()) return null;
            final SharedPreferences prefs = c.getSharedPreferences(FILE, Context.MODE_PRIVATE);
            return load(new Kv() {
                public String get(String key) { return prefs.getString(key, null); }
                public void put(String key, String value) { }
                public void remove(String key) { }
            }, show);
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static boolean store(Context ctx, Entry e) {
        try {
            Context c = ctx != null ? ctx : app();
            if (c == null || !enabled()) return false;
            final SharedPreferences prefs = c.getSharedPreferences(FILE, Context.MODE_PRIVATE);
            final SharedPreferences.Editor editor = prefs.edit();
            final boolean[] changed = new boolean[1];
            boolean stored = store(new Kv() {
                public String get(String key) { return prefs.getString(key, null); }
                public void put(String key, String value) { editor.putString(key, value); changed[0] = true; }
                public void remove(String key) { editor.remove(key); changed[0] = true; }
            }, e);
            if (changed[0]) editor.apply();
            return stored;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Compose builds (TV 1.10.x / 1.12.x, phone 2.x): there is no Media3 dialog or listener to hook. The stock player picks its
     * tracks from the core Player.streamState (saved audio/subtitle id + language) for every engine, so the remembered language is
     * injected into the decoded model, and manual picks are read from the StreamStateChanged action. No Media3 types here.
     * Same SharedPreferences keys as the legacy hooks (via load/store above), so Vimu sharing keeps working. Fail soft everywhere.
     */
    public static final class Port {
        private static final String MODELS = "com.stremio.core.models.Player$";
        private static final ConcurrentHashMap<String, Method> GETTERS = new ConcurrentHashMap<String, Method>();
        private static final Object LOCK = new Object();
        /** Playback the baseline belongs to, and the track keys (id|language) the state held after injection. */
        private static String baseVideo = "";
        private static String baseAudio = "";
        private static String baseSub = "";

        private Port() {
        }

        /** Hook before the return of PlayerKt.decodeWithImpl(Player.Companion, ..): fills missing tracks from the show's memory. */
        public static void onPlayerModel(Object model) {
            try {
                if (model == null) return;
                String video = str(call(call(call(model, "getSelected"), "getStreamRequest"), "getPath"), "getId");
                String show = showOf(video);
                if (show.length() == 0) return;
                Object state = call(model, "getStreamState");
                Object audio = call(state, "getAudioTrack");
                Object sub = call(state, "getSubtitleTrack");
                Entry memory = audio == null || sub == null ? load((Context) null, show) : null;
                String audioLang = "";
                String subLang = "";
                if (memory != null) {
                    if (audio == null && usable(memory.audioLang)) audioLang = memory.audioLang;
                    if (sub == null && !memory.subOff && usable(memory.subLang)) subLang = memory.subLang;
                }
                String keyA = key(audio);
                String keyS = key(sub);
                if (audioLang.length() > 0 || subLang.length() > 0) {
                    ClassLoader loader = model.getClass().getClassLoader();
                    Object target = state != null ? state : Class.forName(MODELS + "StreamState", true, loader).newInstance();
                    if (audioLang.length() > 0) {
                        Class<?> type = Class.forName(MODELS + "AudioTrack", true, loader);
                        Object track = audioTrack(type, audioLang);
                        setByType(target, type, track);
                        keyA = key(track);
                    }
                    if (subLang.length() > 0) {
                        Class<?> type = Class.forName(MODELS + "SubtitleTrack", true, loader);
                        Object track = subtitleTrack(type, subLang);
                        setByType(target, type, track);
                        keyS = key(track);
                    }
                    if (state == null) setByType(model, target.getClass(), target);
                }
                boolean fresh;
                synchronized (LOCK) {
                    fresh = !video.equals(baseVideo);
                    if (fresh) {
                        baseVideo = video;
                        baseAudio = keyA;
                        baseSub = keyS;
                    }
                }
                if (fresh && (audioLang.length() > 0 || subLang.length() > 0)) {
                    Log.i(TAG, "port inject " + show + " audio=" + audioLang + " sub=" + subLang);
                }
            } catch (Throwable ignored) {
                // Stremio defaults keep working.
            }
        }

        /** Hook at Core.dispatch index 0 (p1 = Action). A track that differs from the playback's baseline is a manual pick. */
        public static void onDispatch(Object action, Object field) {
            try {
                if (action == null) return;
                if (call(action, "getLoad") != null || call(action, "getUnload") != null) {
                    synchronized (LOCK) {
                        baseVideo = "";
                    }
                    return;
                }
                Object state = call(call(action, "getPlayer"), "getStreamStateChanged");
                if (state == null) return;
                Object audio = call(state, "getAudioTrack");
                Object sub = call(state, "getSubtitleTrack");
                String keyA = key(audio);
                String keyS = key(sub);
                String video;
                boolean newAudio;
                boolean newSub;
                synchronized (LOCK) {
                    video = baseVideo;
                    newAudio = audio != null && !keyA.equals(baseAudio);
                    newSub = sub != null && !keyS.equals(baseSub);
                    baseAudio = keyA;
                    baseSub = keyS;
                }
                String show = showOf(video);
                if (show.length() == 0 || (!newAudio && !newSub)) return;
                Entry pick = new Entry();
                pick.show = show;
                pick.manual = true;
                if (newAudio) pick.audioLang = storedLang(str(audio, "getLanguage"));
                if (newSub && !isSdhId(str(sub, "getId"), str(sub, "getLanguage"))) pick.subLang = storedLang(str(sub, "getLanguage"));
                if (!usable(pick.audioLang)) pick.audioLang = "";
                if (!usable(pick.subLang)) pick.subLang = "";
                if (pick.audioLang.length() == 0 && pick.subLang.length() == 0) return;
                boolean stored = store((Context) null, pick);
                Log.i(TAG, "port pick " + show + " audio=" + pick.audioLang + " sub=" + pick.subLang + " stored=" + stored);
            } catch (Throwable ignored) {
                // Remembering is optional.
            }
        }

        /** "tt0944947:1:2" -> "tt0944947", "kitsu:46474:5" -> "kitsu:46474", others "" (see TrackMemory.showKey). */
        static String showOf(String videoId) {
            return showKey(videoId);
        }

        /** Language as the Vimu sharing stores it (jpn and ja both become ja, region dropped). */
        static String storedLang(String raw) {
            return lang2(raw == null ? "" : raw.trim());
        }

        private static boolean usable(String lang) {
            return lang != null && lang.length() > 0 && !"und".equals(lang) && !"zxx".equals(lang);
        }

        private static String key(Object track) {
            return track == null ? "" : str(track, "getId") + "|" + str(track, "getLanguage");
        }

        private static Object audioTrack(Class<?> type, String language) throws Exception {
            for (Constructor<?> c : type.getConstructors()) {
                Class<?>[] p = c.getParameterTypes();
                if (p.length == 3 && p[0] == String.class && p[1] == String.class) {
                    return c.newInstance("", language, Collections.emptyMap());
                }
            }
            throw new NoSuchMethodException("AudioTrack(String,String,Map)");
        }

        private static Object subtitleTrack(Class<?> type, String language) throws Exception {
            for (Constructor<?> c : type.getConstructors()) {
                Class<?>[] p = c.getParameterTypes();
                if (p.length == 4 && p[0] == String.class && p[1] == boolean.class && p[2] == String.class) {
                    return c.newInstance("", Boolean.FALSE, language, Collections.emptyMap());
                }
            }
            throw new NoSuchMethodException("SubtitleTrack(String,boolean,String,Map)");
        }

        /** Sets the one instance field of [holder] declared with exactly [type] (the model's own fields are final). */
        private static void setByType(Object holder, Class<?> type, Object value) throws Exception {
            for (Field f : holder.getClass().getDeclaredFields()) {
                if (f.getType() == type && !java.lang.reflect.Modifier.isStatic(f.getModifiers())) {
                    f.setAccessible(true);
                    f.set(holder, value);
                    return;
                }
            }
            throw new NoSuchFieldException(type.getName());
        }

        private static String str(Object target, String getter) {
            Object v = call(target, getter);
            return v == null ? "" : String.valueOf(v);
        }

        /** Public no-arg getter by name; null for a null target, a missing method or a failing call. */
        private static Object call(Object target, String name) {
            if (target == null) return null;
            try {
                String k = target.getClass().getName() + '#' + name;
                Method m = GETTERS.get(k);
                if (m == null) {
                    m = target.getClass().getMethod(name);
                    GETTERS.put(k, m);
                }
                return m.invoke(target);
            } catch (Throwable ignored) {
                return null;
            }
        }
    }
}
