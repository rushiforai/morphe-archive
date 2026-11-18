package app.afterglow.extension.playback;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.video.PlayerStatus;
import app.afterglow.extension.video.VideoState;

/**
 * iOS {@code wiFiQualityIndex} and {@code cellQualityIndex} ("Playback quality on WiFi /
 * Cellular"; tweak "video-quality"). As iOS's autoQuality does, one second after a video (not
 * an ad) starts playing on the watch page, the quality for the current connection is picked
 * from the qualities the video offers ({@link PlaybackTables#pickQuality}) and selected through
 * YouTube's quality menu, as if the viewer had tapped it. Once per video; a quality the viewer
 * picks afterwards stays. Shorts and feed previews keep YouTube's choice, and so does "Default".
 */
@SuppressWarnings("unused")
public final class VideoQuality {
    /** A video quality of YouTube's quality list; the methods are added by the patch. */
    public interface Option {
        String afterglow_getQualityName();

        int afterglow_getResolution();
    }

    /** YouTube's quality menu; selecting goes through the same code as a tap in the menu. */
    public interface Menu {
        void afterglow_selectQuality(Option quality);
    }

    private static final String TWEAK = "video-quality";
    /** iOS schedules autoQuality one second after the video activates. */
    private static final long APPLY_DELAY_MS = 1000;
    /** iOS retries five times, half a second apart, while the format list is still empty. */
    private static final long RETRY_DELAY_MS = 500;
    private static final int MAX_RETRIES = 5;

    private static final PlaybackTables.OncePerVideo APPLIED = new PlaybackTables.OncePerVideo();
    private static volatile Object[] latestQualities;
    private static volatile WeakReference<Menu> latestMenu = new WeakReference<>(null);
    private static boolean installed;

    private VideoQuality() {}

    /** Injection point, at startup: follows the playing video. */
    public static synchronized void install() {
        if (installed) return;
        installed = true;
        try {
            VideoState.addListener(new VideoState.Listener() {
                @Override
                public void onPlayerCreated() {
                    // A new playback: the last list belongs to the video before.
                    latestQualities = null;
                }

                @Override
                public void onPlayerStatus(PlayerStatus status) {
                    if (status == PlayerStatus.VIDEO_PLAYING) schedule(0, APPLY_DELAY_MS);
                }
            });
        } catch (Throwable error) {
            Afterglow.error("VideoQuality.install", error);
        }
    }

    /** Injection point: the quality menu item got the playing video's qualities. Observes only. */
    public static void onQualities(Object[] qualities, Object menu) {
        try {
            if (qualities != null && qualities.length > 0) latestQualities = qualities;
            if (menu instanceof Menu) latestMenu = new WeakReference<>((Menu) menu);
        } catch (Throwable error) {
            Afterglow.error("VideoQuality.onQualities", error);
        }
    }

    private static void schedule(int attempt, long delayMs) {
        Afterglow.runOnMainDelayed(() -> apply(attempt), delayMs);
    }

    private static boolean isWatchPageVideo() {
        return !VideoState.isAdPlaying() && !VideoState.isShortsPlayerInFront() && VideoState.playerType().isWatchPage();
    }

    private static void apply(int attempt) {
        try {
            if (!InstalledTweaks.has(TWEAK) || !isWatchPageVideo()) return;
            int index = AfterglowPrefs.getInt(onWiFi() ? "wiFiQualityIndex" : "cellQualityIndex");
            if (PlaybackTables.qualityLabel(index) == null) return;
            String videoId = VideoState.videoId();
            if (APPLIED.isClaimed(videoId)) return;

            Object[] qualities = latestQualities;
            Menu menu = latestMenu.get();
            List<String> labels = new ArrayList<>();
            List<Option> options = new ArrayList<>();
            if (qualities != null) {
                for (Object quality : qualities) {
                    if (!(quality instanceof Option)) continue;
                    String name = ((Option) quality).afterglow_getQualityName();
                    // Premium-only bitrates would open an upsell for viewers without Premium.
                    if (name == null || name.contains("Premium")) continue;
                    labels.add(name);
                    options.add((Option) quality);
                }
            }
            int picked = PlaybackTables.pickQuality(labels, index);
            if (picked < 0 || menu == null) {
                if (attempt < MAX_RETRIES) schedule(attempt + 1, RETRY_DELAY_MS);
                return;
            }
            if (!APPLIED.claim(videoId)) return;
            menu.afterglow_selectQuality(options.get(picked));
        } catch (Throwable error) {
            Afterglow.error("VideoQuality.apply", error);
        }
    }

    /** Wi-Fi or Ethernet, as iOS's ReachableViaWiFi; anything else counts as mobile data. */
    private static boolean onWiFi() {
        try {
            Context context = Afterglow.context();
            ConnectivityManager manager = context == null ? null : context.getSystemService(ConnectivityManager.class);
            if (manager == null) return false;
            Network network = manager.getActiveNetwork();
            NetworkCapabilities capabilities = network == null ? null : manager.getNetworkCapabilities(network);
            return capabilities != null && (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)
                    || capabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET));
        } catch (Throwable error) {
            Afterglow.error("VideoQuality.onWiFi", error);
            return false;
        }
    }
}
