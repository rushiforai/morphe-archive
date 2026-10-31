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

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Remembers the audio language and subtitle choice per series and applies them
 * to other episodes. Series only; movies are never stored. Fail soft everywhere.
 */
public final class TrackMemory {
    private static final String TAG = "TrackMemory";
    private static final String FILE = "introskip_prefs";
    private static final String KEY_ENABLED = "trackmem_enabled";
    /** Playbacks where the user picked a track (or we already applied one): never override again. */
    private static final Map<Object, Boolean> MANUAL = Collections.synchronizedMap(
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
        if (label == null) return false;
        String v = label.toLowerCase(Locale.US);
        return v.contains("sdh") || v.contains(" cc") || v.endsWith("cc")
                || v.contains("[cc]") || v.contains("(cc)")
                || v.contains("hearing") || v.contains("impaired")
                || v.contains(" hard of hearing") || v.equals("hi") || v.contains(" hi ");
    }

    /** Track ids that are addon URLs say nothing about the content; only the label does. */
    private static boolean isSdhId(String id) {
        if (id == null) return false;
        String v = id.toLowerCase(Locale.US);
        if (v.startsWith("http://") || v.startsWith("https://")) return false;
        return isSdh(v);
    }

    private static String kindOf(String label) {
        if (label == null) return "full";
        String v = label.toLowerCase(Locale.US);
        if (v.contains("sign") || v.contains("song") || v.contains("forced")) return "signs";
        return "full";
    }

    private static boolean langMatch(String a, String b) {
        if (a == null || b == null) return false;
        String x = a.trim().toLowerCase(Locale.US);
        String y = b.trim().toLowerCase(Locale.US);
        if (x.length() == 0 || y.length() == 0) return false;
        if (x.equals(y)) return true;
        return x.startsWith(y) || y.startsWith(x);
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
            String seriesId = seriesIdOf(viewModel);
            if (seriesId.length() == 0 || !seriesId.startsWith("tt")) return;
            Method getFormat = trackInfo.getClass().getMethod("getFormat");
            Object format = getFormat.invoke(trackInfo);
            if (format == null) return;
            String language = formatString(format, "language");
            String label = formatString(format, "label");
            String trackId = formatString(format, "id");
            if (language.length() == 0) return;
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
                prefs.edit().putString("track_audio_" + seriesId, language).apply();
                Log.i(TAG, "audio " + seriesId + " -> " + language);
            } else if (type == C.TRACK_TYPE_TEXT) {
                if (isSdh(label) || isSdhId(trackId)) return;
                prefs.edit().putString("track_sub_" + seriesId, language)
                        .putString("track_subkind_" + seriesId, kindOf(label)).apply();
                Log.i(TAG, "subs " + seriesId + " -> " + language + " " + kindOf(label));
            }
        } catch (Throwable ignored) {
            // Remembering is optional.
        }
    }

    /** Hook at the start of PlayerEventListener.onTracksChanged. */
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
            String seriesId = seriesIdOf(viewModel);
            if (seriesId.length() == 0 || !seriesId.startsWith("tt")) return;
            Context context = app();
            if (context == null) return;
            SharedPreferences prefs = context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
            String audioLang = prefs.getString("track_audio_" + seriesId, "");
            String subLang = prefs.getString("track_sub_" + seriesId, "");
            String subKind = prefs.getString("track_subkind_" + seriesId, "full");
            if ((audioLang == null || audioLang.length() == 0)
                    && (subLang == null || subLang.length() == 0)) return;
            Tracks tracks = (Tracks) tracksObj;
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
            if (params == null || !params.overrides.isEmpty()
                    || !params.disabledTrackTypes.isEmpty()) return;
            TrackSelectionParameters.Builder builder = params.buildUpon();
            boolean changed = false;
            if (audioLang != null && audioLang.length() > 0) {
                TrackSelectionOverride audio = findAudio(tracks, audioLang);
                if (audio != null) {
                    builder.setOverrideForType(audio);
                    changed = true;
                }
            }
            if (subLang != null && subLang.length() > 0) {
                TrackSelectionOverride sub = findSub(tracks, subLang, subKind);
                if (sub != null) {
                    builder.setOverrideForType(sub);
                    changed = true;
                }
            }
            if (!changed) return;
            setParams.invoke(player, builder.build());
            MANUAL.put(viewModel, Boolean.TRUE);
            MANUAL.put(player, Boolean.TRUE);
            Log.i(TAG, "applied " + seriesId + " audio=" + audioLang + " sub=" + subLang);
        } catch (Throwable ignored) {
            // Fall back to Stremio defaults.
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
                    if (isSdh(format.label) || isSdhId(format.id)) continue;
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
}
