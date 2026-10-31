// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.embedcommentimages;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.LruCache;
import android.util.TypedValue;
import android.util.Xml;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.StringReader;
import java.lang.reflect.Constructor;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.xmlpull.v1.XmlPullParser;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.GlideUtils;
import app.morphe.extension.shared.Logger;

/**
 * Videos uploaded in comments, linked as reddit.com/link/[post]/video/[id]/player, and links to video files
 * (.mp4, .webm). Reddit's web page for the first does not work, so they are played in the comment, with the
 * ExoPlayer bundled in BaconReader.
 */
final class CommentVideo {
    private static final float DEFAULT_RATIO = 9f / 16f;
    private static final String PLAYER_USER_AGENT = "BaconReader";

    private static final ExecutorService LOADER = Executors.newFixedThreadPool(2);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /**
     * Size, duration and first frame of the last videos shown.
     */
    private static final LruCache<String, Info> INFOS = new LruCache<>(20);

    /**
     * The video playing in a comment. Only one plays at a time.
     */
    private static Object currentPlayer;

    private CommentVideo() {
    }

    /**
     * What identifies the video of a link: the id of a comment video, the link itself for a video file, or null.
     */
    static String videoId(String url) {
        if (url == null) return null;
        Uri uri = Uri.parse(url);
        String scheme = uri.getScheme();
        String host = uri.getHost();
        if (host == null || !("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme))) return null;
        host = host.toLowerCase(Locale.ROOT);

        // reddit.com/link/[post]/video/[id]/player
        List<String> segments = uri.getPathSegments();
        if ((host.equals("reddit.com") || host.endsWith(".reddit.com")) && segments.size() == 5
                && segments.get(0).equals("link") && segments.get(2).equals("video")
                && segments.get(4).equals("player")) {
            return segments.get(3);
        }

        String path = uri.getPath();
        if (path == null) return null;
        path = path.toLowerCase(Locale.ROOT);
        return path.endsWith(".mp4") || path.endsWith(".webm") ? url : null;
    }

    /** A video file link, played as it is, rather than a comment video (a DASH playlist). */
    private static boolean isFile(String id) {
        return id.startsWith("http");
    }

    private static String videoUrl(String id) {
        return "https://v.redd.it/" + id;
    }

    /**
     * A box with the first frame of the video and a play button. Tapping it plays the video in place.
     *
     * @param fullWidth   If the video is as wide as the comment, else at most {@code boxSize} wide and high.
     * @param loadPreview If the first frame and size can be loaded now (not on metered data with "Wi-Fi only").
     */
    static View createSlot(final TextView textView, final String id, boolean fullWidth, int boxSize,
                           int maxHeight, boolean loadPreview) {
        final Context context = textView.getContext();
        final FrameLayout slot = new FrameLayout(context) {
            @Override
            protected void onWindowVisibilityChanged(int visibility) {
                super.onWindowVisibilityChanged(visibility);
                // The app went to the background, or another screen is on top.
                if (visibility != View.VISIBLE) pauseVideo(this);
            }
        };
        LinearLayout.LayoutParams slotParams = new LinearLayout.LayoutParams(
                fullWidth ? ViewGroup.LayoutParams.MATCH_PARENT : boxSize, ViewGroup.LayoutParams.WRAP_CONTENT);
        slotParams.topMargin = dp(context, 4);
        slot.setLayoutParams(slotParams);
        slot.setTag(CommentVideo.class);

        final AspectRatioFrameLayout box = new AspectRatioFrameLayout(context, DEFAULT_RATIO,
                fullWidth ? maxHeight : boxSize);
        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.BLACK);
        background.setCornerRadius(dp(context, 6));
        box.setBackground(background);
        box.setClipToOutline(true);
        slot.addView(box, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final ImageView preview = new ImageView(context);
        preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
        box.addView(preview, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        final ImageView play = new ImageView(context);
        play.setImageDrawable(new YoutubeTitles.PlayDrawable(dp(context, 48)));
        box.addView(play, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

        final TextView duration = new TextView(context);
        duration.setTextColor(Color.WHITE);
        duration.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        int padH = dp(context, 6);
        int padV = dp(context, 2);
        duration.setPadding(padH, padV, padH, padV);
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(0x99000000);
        pill.setCornerRadius(dp(context, 8));
        duration.setBackground(pill);
        duration.setVisibility(View.GONE);
        FrameLayout.LayoutParams durationParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.START);
        durationParams.setMargins(dp(context, 6), 0, 0, dp(context, 6));
        box.addView(duration, durationParams);

        if (loadPreview) loadInfo(slot, box, preview, duration, id);

        box.setOnClickListener(v -> {
            if (!loadPreview) loadInfo(slot, box, preview, duration, id);
            startPlayer(box, id);
            play.setVisibility(View.GONE);
            duration.setVisibility(View.GONE);
            box.setOnClickListener(null);
        });

        // A player keeps playing and holds its decoder until released.
        slot.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                release(slot);
            }
        });
        return slot;
    }

    private static void pauseVideo(FrameLayout slot) {
        View box = slot.getChildAt(0);
        Object player = box == null ? null : box.getTag();
        if (player != null) pause(player);
    }

    /**
     * Stops the video of the slot, if it plays.
     */
    static void release(View slot) {
        if (!(slot instanceof FrameLayout) || slot.getTag() != CommentVideo.class) return;
        View box = ((FrameLayout) slot).getChildAt(0);
        Object player = box == null ? null : box.getTag();
        if (player == null) return;
        box.setTag(null);
        releasePlayer(player);
    }

    /**
     * Size and duration from the video's DASH playlist (or from the file itself), and its first frame.
     */
    private static void loadInfo(final FrameLayout slot, final AspectRatioFrameLayout box, final ImageView preview,
                                 final TextView duration, final String id) {
        // The comment is drawn again when scrolled back: show what is already known right away.
        final Info cached = INFOS.get(id);
        if (cached != null) {
            showInfo(cached, box, preview, duration);
            if (cached.frame != null) return;
        }

        LOADER.execute(() -> {
            if (isFile(id)) {
                loadFileInfo(box, preview, duration, id, id, -1);
                return;
            }
            try {
                // Every rendition has the same ratio and length: read them from the smallest file.
                Playlist playlist = Playlist.parse(fetchTextWithRetry(videoUrl(id) + "/DASHPlaylist.mpd"));
                loadFileInfo(box, preview, duration, videoUrl(id) + "/" + playlist.smallest, id, playlist.seconds);
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not load the video information of " + id, ex);
            }
        });
    }

    /**
     * Size, duration and first frame of a video file, read from the file and kept under the key. Blocks.
     *
     * @param knownSeconds The duration to use when the file does not say it, or -1.
     */
    private static void loadFileInfo(AspectRatioFrameLayout box, ImageView preview, TextView duration, String url,
                                     String key, long knownSeconds) {
        for (int attempt = 1; attempt <= GlideUtils.MAX_ATTEMPTS; attempt++) {
            MediaMetadataRetriever retriever = new MediaMetadataRetriever();
            try {
                retriever.setDataSource(url, new HashMap<>());
                int width = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH));
                int height = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT));
                int rotation = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_ROTATION));
                if (rotation == 90 || rotation == 270) {
                    int swap = width;
                    width = height;
                    height = swap;
                }
                long millis = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION));
                final Info info = new Info(width > 0 && height > 0 ? new int[]{width, height} : null,
                        millis > 0 ? Math.round(millis / 1000.0) : knownSeconds);
                info.frame = retriever.getFrameAtTime(0, MediaMetadataRetriever.OPTION_CLOSEST_SYNC);
                INFOS.put(key, info);
                MAIN.post(() -> showInfo(info, box, preview, duration));
                return;
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not load the video information of " + url, ex);
            } finally {
                try {
                    retriever.release();
                } catch (Exception ignored) {
                }
            }
            try {
                Thread.sleep(GlideUtils.RETRY_DELAY_MS * attempt);
            } catch (InterruptedException ex) {
                return;
            }
        }
    }

    private static int parseInt(String value) {
        try {
            return value == null ? 0 : Integer.parseInt(value.trim());
        } catch (NumberFormatException ex) {
            return 0;
        }
    }

    private static void showInfo(Info info, AspectRatioFrameLayout box, ImageView preview, TextView duration) {
        if (info.size != null) box.setRatio((float) info.size[1] / info.size[0]);
        if (info.seconds > 0) {
            duration.setText(YoutubeTitles.formatTime((int) info.seconds));
            if (box.getTag() == null) duration.setVisibility(View.VISIBLE);
        }
        if (info.frame != null) preview.setImageBitmap(info.frame);
    }

    /**
     * What is known about a video, kept for when its comment is shown again.
     */
    private static final class Info {
        final int[] size;
        final long seconds;
        volatile Bitmap frame;

        Info(int[] size, long seconds) {
            this.size = size;
            this.seconds = seconds;
        }
    }

    private static void startPlayer(AspectRatioFrameLayout box, String id) {
        try {
            Context context = box.getContext();
            if (currentPlayer != null) pause(currentPlayer);

            ClassLoader loader = context.getClassLoader();
            Class<?> dataSourceFactoryClass = loader.loadClass("com.google.android.exoplayer2.upstream.DataSource$Factory");
            Object dataSourceFactory = loader.loadClass("com.google.android.exoplayer2.upstream.DefaultDataSourceFactory")
                    .getConstructor(Context.class, String.class).newInstance(context, PLAYER_USER_AGENT);
            // A video file plays as it is; a comment video from its DASH playlist.
            Object mediaSourceFactory = loader.loadClass(isFile(id)
                            ? "com.google.android.exoplayer2.source.ProgressiveMediaSource$Factory"
                            : "com.google.android.exoplayer2.source.dash.DashMediaSource$Factory")
                    .getConstructor(dataSourceFactoryClass).newInstance(dataSourceFactory);
            Class<?> mediaItemClass = loader.loadClass("com.google.android.exoplayer2.MediaItem");
            Object mediaItem = mediaItemClass.getMethod("fromUri", String.class)
                    .invoke(null, isFile(id) ? id : videoUrl(id) + "/DASHPlaylist.mpd");
            Object mediaSource = mediaSourceFactory.getClass().getMethod("createMediaSource", mediaItemClass)
                    .invoke(mediaSourceFactory, mediaItem);

            Object player = loader.loadClass("com.google.android.exoplayer2.SimpleExoPlayer$Builder")
                    .getConstructor(Context.class).newInstance(context);
            player = player.getClass().getMethod("build").invoke(player);
            Class<?> mediaSourceClass = loader.loadClass("com.google.android.exoplayer2.source.MediaSource");
            player.getClass().getMethod("setMediaSource", mediaSourceClass).invoke(player, mediaSource);
            player.getClass().getMethod("prepare").invoke(player);
            player.getClass().getMethod("setPlayWhenReady", boolean.class).invoke(player, true);

            Constructor<?> playerViewConstructor = loader.loadClass("com.google.android.exoplayer2.ui.PlayerView")
                    .getConstructor(Context.class);
            View playerView = (View) playerViewConstructor.newInstance(context);
            Class<?> playerClass = loader.loadClass("com.google.android.exoplayer2.Player");
            playerView.getClass().getMethod("setPlayer", playerClass).invoke(playerView, player);
            playerView.getClass().getMethod("setShowBuffering", int.class).invoke(playerView, 1); // When playing.
            playerView.getClass().getMethod("setShutterBackgroundColor", int.class).invoke(playerView, Color.TRANSPARENT);
            box.addView(playerView, 1, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            box.setTag(player);
            currentPlayer = player;
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not play the video", ex);
        }
    }

    private static void pause(Object player) {
        try {
            player.getClass().getMethod("setPlayWhenReady", boolean.class).invoke(player, false);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not pause the video", ex);
        }
    }

    private static void releasePlayer(Object player) {
        try {
            player.getClass().getMethod("release").invoke(player);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not release the video", ex);
        }
        if (currentPlayer == player) currentPlayer = null;
    }

    /**
     * What a Reddit video's DASH playlist says: its smallest video file and its duration.
     */
    static final class Playlist {
        final String smallest;
        final long seconds;

        private Playlist(String smallest, long seconds) {
            this.smallest = smallest;
            this.seconds = seconds;
        }

        static Playlist parse(String mpd) throws Exception {
            XmlPullParser parser = Xml.newPullParser();
            parser.setInput(new StringReader(mpd));
            long seconds = -1;
            String smallest = null;
            long smallestBandwidth = Long.MAX_VALUE;
            long bandwidth = Long.MAX_VALUE;
            boolean video = false;
            for (int event = parser.getEventType(); event != XmlPullParser.END_DOCUMENT; event = parser.next()) {
                if (event != XmlPullParser.START_TAG) continue;
                switch (parser.getName()) {
                    case "MPD":
                        seconds = durationSeconds(parser.getAttributeValue(null, "mediaPresentationDuration"));
                        break;
                    case "Representation":
                        // Audio renditions have no height.
                        video = parser.getAttributeValue(null, "height") != null;
                        String value = parser.getAttributeValue(null, "bandwidth");
                        bandwidth = value == null ? Long.MAX_VALUE : Long.parseLong(value);
                        break;
                    case "BaseURL":
                        if (video && (smallest == null || bandwidth < smallestBandwidth)) {
                            smallest = parser.nextText().trim();
                            smallestBandwidth = bandwidth;
                        }
                        break;
                }
            }
            if (smallest == null) throw new IllegalStateException("No video in the playlist");
            return new Playlist(smallest, seconds);
        }

        /** Seconds of an ISO 8601 duration such as "PT1M2.5S", or -1. */
        static long durationSeconds(String value) {
            if (value == null || !value.startsWith("PT")) return -1;
            double seconds = 0;
            int start = 2;
            try {
                for (int i = 2; i < value.length(); i++) {
                    char unit = value.charAt(i);
                    if (unit != 'H' && unit != 'M' && unit != 'S') continue;
                    double number = Double.parseDouble(value.substring(start, i));
                    seconds += unit == 'H' ? number * 3600 : unit == 'M' ? number * 60 : number;
                    start = i + 1;
                }
            } catch (NumberFormatException ex) {
                return -1;
            }
            return Math.round(seconds);
        }
    }

    private static String fetchTextWithRetry(String url) throws Exception {
        for (int attempt = 1; ; attempt++) {
            try {
                return fetchText(url);
            } catch (Exception ex) {
                if (attempt >= GlideUtils.MAX_ATTEMPTS) throw ex;
                Thread.sleep(GlideUtils.RETRY_DELAY_MS * attempt);
            }
        }
    }

    private static String fetchText(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setConnectTimeout(10000);
            connection.setReadTimeout(10000);
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IllegalStateException("HTTP " + connection.getResponseCode());
            }
            try (InputStream in = connection.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
                return out.toString("UTF-8");
            }
        } finally {
            connection.disconnect();
        }
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }
}
