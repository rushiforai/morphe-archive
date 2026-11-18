package app.afterglow.extension.playback;

import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.SpannedString;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.TimeZone;
import java.util.WeakHashMap;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.video.PlaybackState;
import app.afterglow.extension.video.PlayerStatus;
import app.afterglow.extension.video.PlayerType;
import app.afterglow.extension.video.VideoState;

/** Appends the estimated clock time to the native duration label without replacing its style. */
public final class PlayerEndTime {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<TextView, WeakReference<Binding>> BOUND = new WeakHashMap<>();
    private static final Runnable REFRESH = () -> {
        for (WeakReference<Binding> reference : new ArrayList<>(BOUND.values())) {
            Binding binding = reference.get();
            if (binding != null && binding.view.isAttachedToWindow()) binding.refresh();
        }
    };
    private static boolean installed;

    private PlayerEndTime() {}

    public static void install() {
        if (installed || !InstalledTweaks.has("video-end-time")) return;
        installed = true;
        AfterglowPrefs.addListener(key -> {
            if (key == null || key.equals("videoEndTime") || key.equals("24hrFormat")
                    || key.equals(LiteMode.KEY)) schedule();
        });
        VideoState.addListener(new VideoState.Listener() {
            @Override public void onNewVideo(String id) { schedule(); }
            @Override public void onVideoTime(long time) { schedule(); }
            @Override public void onPlayerType(PlayerType type) { schedule(); }
            @Override public void onPlayerStatus(PlayerStatus status) { schedule(); }
            @Override public void onPlaybackState(PlaybackState state) { schedule(); }
        });
    }

    private static void schedule() {
        MAIN.removeCallbacks(REFRESH);
        MAIN.post(REFRESH);
    }

    public static void bind(TextView view) {
        if (view == null || !InstalledTweaks.has("video-end-time")) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(() -> bind(view));
            return;
        }
        try {
            install();
            WeakReference<Binding> previous = BOUND.get(view);
            if (previous != null && previous.get() != null) return;
            Binding binding = new Binding(view);
            BOUND.put(view, new WeakReference<>(binding));
            view.addTextChangedListener(binding);
            view.addOnAttachStateChangeListener(binding);
            if (view.isAttachedToWindow()) binding.onViewAttachedToWindow(view);
        } catch (Throwable error) {
            Afterglow.error("PlayerEndTime.bind", error);
        }
    }

    private static final class Binding implements TextWatcher, View.OnAttachStateChangeListener,
            ViewTreeObserver.OnPreDrawListener {
        final TextView view;
        CharSequence nativeText;
        String suffix = "";
        ViewTreeObserver observer;
        boolean applying, enabled;
        float lastSpeed = 1f;
        long lastLength;

        Binding(TextView view) {
            this.view = view;
            nativeText = new SpannedString(view.getText());
        }

        @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) {}
        @Override public void onTextChanged(CharSequence text, int start, int before, int count) {}
        @Override public void afterTextChanged(Editable text) {
            if (applying) return;
            // Native format/style updates can reuse the displayed text. Remove only our
            // exact previous suffix, preserving native spans and never stacking estimates.
            int end = text.length();
            if (!suffix.isEmpty() && text.toString().endsWith(suffix)) end -= suffix.length();
            nativeText = new SpannedString(text.subSequence(0, end));
            // The native setter temporarily measures a duration string and caches its
            // minimum width. Append after that call returns so our suffix cannot become
            // its permanent minimum, which otherwise leaves a gap after disabling it.
            schedule();
        }

        @Override public void onViewAttachedToWindow(View v) {
            if (observer == null) {
                observer = view.getViewTreeObserver();
                observer.addOnPreDrawListener(this);
            }
            refresh();
        }

        @Override public void onViewDetachedFromWindow(View v) {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
        }

        @Override public boolean onPreDraw() {
            // Native speed selection can change while paused, without a time callback.
            // The seek bar publishes its duration while drawing, after the label can bind.
            if (enabled && view.isShown() && (VideoState.playbackSpeed() != lastSpeed
                    || VideoState.videoLength() != lastLength)) refresh();
            return true;
        }

        void refresh() {
            if (applying) return;
            try {
                enabled = PlayerBehavior.showEndTime();
                String clock = "";
                if (enabled) {
                    lastSpeed = VideoState.playbackSpeed();
                    lastLength = VideoState.videoLength();
                }
                if (enabled && VideoState.playerType().isMaximizedOrFullscreen()
                        && !VideoState.isShortsPlayerInFront() && !VideoState.isAdPlaying()) {
                    clock = EndTimeFormat.format(System.currentTimeMillis(), lastLength,
                            VideoState.videoTime(), lastSpeed, AfterglowPrefs.getBool("24hrFormat"),
                            TimeZone.getDefault());
                }
                suffix = clock.isEmpty() || nativeText.length() == 0 ? "" : " • " + clock;
                CharSequence display = suffix.isEmpty() ? nativeText
                        : new SpannableStringBuilder(nativeText).append(suffix);
                if (TextUtils.equals(view.getText(), display)) return;
                applying = true;
                try { view.setText(display); }
                finally { applying = false; }
            } catch (Throwable error) {
                Afterglow.error("PlayerEndTime.refresh", error);
            }
        }
    }
}
