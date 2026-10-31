package app.bitchord.telegram;

import android.os.Handler;
import android.os.Looper;

import androidx.compose.runtime.NeverEqualPolicy;
import androidx.compose.runtime.ParcelableSnapshotMutableState;
import androidx.compose.ui.Modifier;

import com.music.bitchord.data.NerdStats;
import com.music.bitchord.data.model.Song;
import com.music.bitchord.data.sources.StreamFormat;

import org.json.JSONObject;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * The small format chip after a song's title: "FLAC 24bit", "MP3 320kbps" and so on.
 *
 * <ul>
 *   <li>Telegram files (Addons search): from the file's header, or its type and bitrate.
 *   <li>Songs in BitChord's main search: matched against a Telegram search for the same query,
 *       which runs once per search in the background.
 *   <li>Anything else: from the format BitChord was given for the stream, or remembered from the
 *       last time the song played.
 * </ul>
 *
 * The legend is read through a Compose state, so rows already on screen update when a match or a
 * file's header comes in.
 */
public final class FormatLegend {
    private FormatLegend() {}

    static volatile boolean enabled = true;
    static final String TELEGRAM = "src:" + NativeSource.ID + "::";

    /** 60% grey and white, as Compose packs sRGB colours. */
    static final long CHIP = 0x997c7c8000000000L, WHITE = 0xffffffff00000000L;

    private static ParcelableSnapshotMutableState revision;
    private static int changes;
    private static Object chip;
    private static volatile List<JSONObject> recent = Collections.emptyList();
    private static volatile String recentQuery = "";
    private static final ExecutorService matching =
            Executors.newSingleThreadExecutor(
                    r -> {
                        Thread thread = new Thread(r, "Telegram format legend");
                        thread.setDaemon(true);
                        return thread;
                    });

    /** Called after the title in BitChord's song title row. Never throws; "" means no legend. */
    public static String text(Song song) {
        try {
            read();
            if (!enabled || song == null) return "";
            return label(song);
        } catch (Throwable e) {
            return "";
        }
    }

    /** The legend's modifier: the grey chip, or nothing when there's no legend. */
    public static Object modifier(String text) {
        try {
            if (text != null && !text.isEmpty()) {
                if (chip == null)
                    chip =
                            hostPadding(
                                    hostBackground(
                                            hostPadding(Modifier.Companion.$$INSTANCE, 6, 0, 0, 0),
                                            CHIP,
                                            hostShape(4)),
                                    4,
                                    1,
                                    4,
                                    1);
                return chip;
            }
        } catch (Throwable ignored) {
            // Fall back to a plain legend.
        }
        return Modifier.Companion.$$INSTANCE;
    }

    /** BitChord started a search: look for the same query in the selected Telegram chats. */
    public static void searching(String query) {
        TelegramBridge bridge = TelegramBridge.instance;
        if (!enabled || bridge == null || query == null || query.trim().isEmpty()) return;
        String wanted = query.trim();
        if (wanted.equalsIgnoreCase(recentQuery)) return;
        recentQuery = wanted;
        matching.execute(
                () -> {
                    try {
                        if (!bridge.ready() || bridge.selected.isEmpty()) return;
                        List<JSONObject> rows = bridge.searchTracks(wanted, true);
                        bridge.decorate(rows);
                        if (!wanted.equals(recentQuery)) return;
                        recent = rows;
                        changed();
                    } catch (Exception ignored) {
                        // No match is no legend.
                    }
                });
    }

    static String label(Song song) {
        String id = song.videoId;
        if (id == null || id.isEmpty()) return "";
        TelegramBridge bridge = TelegramBridge.instance;
        if (id.startsWith(TELEGRAM)) {
            if (bridge == null) return "";
            String track = id.substring(TELEGRAM.length());
            JSONObject header = bridge.formats.get(track);
            return header != null ? AudioHeader.label(header) : bridge.legends.get(id);
        }
        StreamFormat format = NerdStats.declaredFormat(id);
        if (format != null) {
            // What the stream in use says wins over anything remembered.
            String label = LegendMatch.label(format.codec, format.bitDepth, format.kbps);
            if (bridge != null && bridge.legends.put(id, label))
                bridge.work.execute(bridge.legends::save);
            return label.isEmpty() || bridge == null ? label : bridge.legends.get(id);
        }
        if (bridge == null) return "";
        String remembered = bridge.legends.get(id);
        if (!remembered.isEmpty()) return remembered;
        JSONObject row = LegendMatch.match(song.title, song.artist, song.durationText, recent);
        if (row == null) return "";
        String label = LegendMatch.row(row, bridge.formats.get(row.optString("id")));
        if (bridge.legends.put(id, label)) bridge.work.execute(bridge.legends::save);
        return label;
    }

    /** Reads the Compose state that changes when legends do, so title rows recompose. */
    private static void read() {
        if (Looper.myLooper() != Looper.getMainLooper()) return;
        if (revision == null)
            revision = new ParcelableSnapshotMutableState(0, NeverEqualPolicy.INSTANCE);
        revision.getValue();
    }

    /** Legends changed: titles on screen redraw. */
    static void changed() {
        new Handler(Looper.getMainLooper())
                .post(
                        () -> {
                            if (revision != null) revision.setValue(++changes);
                        });
    }

    // Replaced by the patch with calls to BitChord's own Compose functions, whose names Java
    // source can't spell.
    public static Object hostPadding(
            Object modifier, float start, float top, float end, float bottom) {
        return modifier;
    }

    public static Object hostBackground(Object modifier, long color, Object shape) {
        return modifier;
    }

    public static Object hostShape(float radius) {
        return null;
    }
}
