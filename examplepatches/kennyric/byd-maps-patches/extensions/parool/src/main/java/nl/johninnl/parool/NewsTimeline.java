package nl.johninnl.parool;

import androidx.media3.common.AdPlaybackState;
import androidx.media3.common.C;
import androidx.media3.common.MediaItem;
import androidx.media3.common.Timeline;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** The accepted native news queue, with one stable window and period per occurrence. */
final class NewsTimeline extends Timeline {
    // R8 exposes this field in the target APK, while the compile-only SDK keeps it private.
    private static final Field AD_PLAYBACK_STATE = adPlaybackStateField();

    private final List<MediaItem> items;
    private final List<String> uids;
    private final List<Long> durationsMs;
    private final int currentIndex;
    private final Window nativeWindow;

    NewsTimeline(List<MediaItem> items, List<String> uids, List<Long> durationsMs,
                 int currentIndex, Window nativeWindow) {
        if (items.size() != uids.size() || items.size() != durationsMs.size()) {
            throw new IllegalArgumentException("News queue columns have different lengths");
        }
        this.items = Collections.unmodifiableList(new ArrayList<>(items));
        this.uids = Collections.unmodifiableList(new ArrayList<>(uids));
        this.durationsMs = Collections.unmodifiableList(new ArrayList<>(durationsMs));
        this.currentIndex = currentIndex;
        this.nativeWindow = nativeWindow;
    }

    MediaItem itemAt(int index) {
        return items.get(index);
    }

    @Override public int getWindowCount() {
        return items.size();
    }

    @Override public int getPeriodCount() {
        return items.size();
    }

    @Override public Window getWindow(int index, Window window, long projectionUs) {
        MediaItem item = items.get(index);
        Window source = index == currentIndex ? nativeWindow : null;
        // Do not call Window.set: R8 changed its return type in the target APK.
        window.uid = uids.get(index);
        window.mediaItem = item;
        window.manifest = source == null ? null : source.manifest;
        window.presentationStartTimeMs = source == null ? C.TIME_UNSET : source.presentationStartTimeMs;
        window.windowStartTimeMs = source == null ? C.TIME_UNSET : source.windowStartTimeMs;
        window.elapsedRealtimeEpochOffsetMs = source == null ? C.TIME_UNSET : source.elapsedRealtimeEpochOffsetMs;
        window.isSeekable = source == null ? index != currentIndex : source.isSeekable;
        window.isDynamic = source != null && source.isDynamic;
        window.liveConfiguration = source == null ? null : source.liveConfiguration;
        window.defaultPositionUs = source == null ? 0L : source.defaultPositionUs;
        window.durationUs = durationUs(index);
        window.firstPeriodIndex = index;
        window.lastPeriodIndex = index;
        window.positionInFirstPeriodUs = source == null ? 0L : source.positionInFirstPeriodUs;
        window.isPlaceholder = source != null && source.isPlaceholder;
        return window;
    }

    @Override public Period getPeriod(int index, Period period, boolean setIds) {
        String uid = uids.get(index);
        // Do not call Period.set: its return type was also changed by target R8.
        period.id = setIds ? uid : null;
        period.uid = setIds ? uid : null;
        period.windowIndex = index;
        period.durationUs = durationUs(index);
        period.positionInWindowUs = index == currentIndex && nativeWindow != null
            ? -nativeWindow.positionInFirstPeriodUs : 0L;
        period.isPlaceholder = index == currentIndex && nativeWindow != null && nativeWindow.isPlaceholder;
        try {
            AD_PLAYBACK_STATE.set(period, AdPlaybackState.NONE);
        } catch (IllegalAccessException e) {
            throw new IllegalStateException("Cannot populate the news period", e);
        }
        return period;
    }

    @Override public Object getUidOfPeriod(int index) {
        return uids.get(index);
    }

    @Override public int getIndexOfPeriod(Object uid) {
        return uids.indexOf(uid);
    }

    private long durationUs(int index) {
        if (index == currentIndex) return nativeWindow == null ? C.TIME_UNSET : nativeWindow.durationUs;
        long duration = durationsMs.get(index);
        return duration > 0L && duration <= Long.MAX_VALUE / 1000L ? duration * 1000L : C.TIME_UNSET;
    }

    private static Field adPlaybackStateField() {
        try {
            Field field = Period.class.getDeclaredField("adPlaybackState");
            field.setAccessible(true);
            return field;
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException("Missing native period state", e);
        }
    }
}
