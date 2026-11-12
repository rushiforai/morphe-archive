// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.embedcommentimages;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
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
import java.lang.reflect.Proxy;
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
    private static final int BUTTON_SIZE_DP = 36;
    private static final long ORIENTATION_RELEASE_DELAY_MS = 1000L;
    /**
     * Player.STATE_ENDED: the video played to its end.
     */
    private static final int STATE_ENDED = 4;

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
    /**
     * The full screen showing the playing video, if any.
     */
    private static Dialog fullScreen;

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
     * A box with the first frame of the video and a play button. Tapping it plays the video in place, as wide as the
     * comment and at most {@code maxHeight} high: at {@code boxSize}, the player's controls cover most of the video.
     * While the controls show, two buttons show above them: one switches between the two sizes, the other opens the
     * video in full screen.
     *
     * @param fullWidth   If the box is as wide as the comment, else at most {@code boxSize} wide and high.
     * @param loadPreview If the first frame can be loaded now (not where images load on tap: there the box still takes
     *                    the video's size and duration from its playlist).
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
        slot.setLayoutParams(EmbedCommentImagesPatch.slotLayoutParams(
                textView, fullWidth ? ViewGroup.LayoutParams.MATCH_PARENT : boxSize));
        slot.setTag(CommentVideo.class);

        final AspectRatioFrameLayout box = new AspectRatioFrameLayout(context, DEFAULT_RATIO,
                fullWidth ? maxHeight : boxSize);
        box.setId(EmbedCommentImagesPatch.resourceId("baconreader_patches_comment_video"));
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
        else loadSize(box, preview, duration, id);

        box.setOnClickListener(v -> {
            View playerView = startPlayer(box, id);
            if (playerView == null) return;
            play.setVisibility(View.GONE);
            duration.setVisibility(View.GONE);
            box.setOnClickListener(null);
            addButtons(slot, box, playerView, boxSize, maxHeight);
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
        if (currentPlayer == player) closeFullScreen();
        releasePlayer(player);
    }

    /**
     * The buttons over a playing video, shown with its controls: one switches between full width and
     * {@code boxSize}, the other opens the full screen. The video starts at full width.
     */
    private static void addButtons(FrameLayout slot, AspectRatioFrameLayout box, View playerView, int boxSize,
                                   int maxHeight) {
        Context context = box.getContext();
        final boolean[] expanded = {true};
        final ImageView size = button(context);
        final ButtonDrawable sizeIcon = new ButtonDrawable(ButtonDrawable.SHRINK);
        size.setImageDrawable(sizeIcon);
        final Runnable applySize = () -> {
            slot.getLayoutParams().width = expanded[0] ? ViewGroup.LayoutParams.MATCH_PARENT : boxSize;
            slot.requestLayout();
            box.setMaxHeight(expanded[0] ? maxHeight : boxSize);
            sizeIcon.setKind(expanded[0] ? ButtonDrawable.SHRINK : ButtonDrawable.ENLARGE);
            size.setContentDescription(str(expanded[0]
                    ? "revanced_embed_comment_images_video_shrink"
                    : "revanced_embed_comment_images_video_enlarge"));
            // Grown, the video can reach below the screen, controls and all: the list scrolls to show it whole.
            // Posted after the layout the new size asks for.
            if (expanded[0]) {
                box.post(() -> box.requestRectangleOnScreen(new Rect(0, 0, box.getWidth(), box.getHeight()), false));
            }
        };
        applySize.run();
        size.setOnClickListener(v -> {
            expanded[0] = !expanded[0];
            applySize.run();
        });

        ImageView full = button(context);
        full.setImageDrawable(new ButtonDrawable(ButtonDrawable.FULL_SCREEN));
        full.setContentDescription(str("revanced_embed_comment_images_video_full_screen"));
        full.setOnClickListener(v -> openFullScreen(box, playerView));

        LinearLayout buttons = buttonRow(context, size, full);
        box.addView(buttons, buttonRowParams(context));
        followControls(playerView, buttons);
    }

    /**
     * Shows the playing video of the box over the whole screen, turned to landscape when the video is wider than
     * high. Back or the button closes it, and the video plays on in the comment.
     */
    private static void openFullScreen(AspectRatioFrameLayout box, View inline) {
        try {
            final Object player = box.getTag();
            final Activity activity = activityOf(box.getContext());
            if (player == null || activity == null) return;
            closeFullScreen();

            FrameLayout root = new FrameLayout(activity);
            root.setBackgroundColor(Color.BLACK);
            final View playerView = newPlayerView(activity);
            playerView.setId(EmbedCommentImagesPatch.resourceId("baconreader_patches_video_full_screen"));
            root.addView(playerView, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            ImageView exit = button(activity);
            exit.setImageDrawable(new ButtonDrawable(ButtonDrawable.EXIT_FULL_SCREEN));
            exit.setContentDescription(str("revanced_embed_comment_images_video_exit_full_screen"));
            LinearLayout buttons = buttonRow(activity, exit);
            root.addView(buttons, buttonRowParams(activity));

            final Dialog dialog = new Dialog(activity, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
            dialog.setContentView(root);
            exit.setOnClickListener(v -> dialog.dismiss());

            final int orientation = activity.getRequestedOrientation();
            final boolean turned = box.getRatio() < 1f;
            final int before = activity.getResources().getConfiguration().orientation
                    == Configuration.ORIENTATION_LANDSCAPE
                    ? ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                    : ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
            if (turned) {
                activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
            }
            dialog.setOnDismissListener(d -> {
                if (fullScreen == dialog) fullScreen = null;
                if (turned) {
                    // Given back right away, the app's own orientation follows the sensor, which keeps landscape
                    // while the phone lies flat. The screen turns back first.
                    activity.setRequestedOrientation(before);
                    MAIN.postDelayed(() -> {
                        if (fullScreen == null) activity.setRequestedOrientation(orientation);
                    }, ORIENTATION_RELEASE_DELAY_MS);
                }
                if (box.getTag() == player) {
                    try {
                        switchTargetView(player, playerView, inline);
                    } catch (Exception ex) {
                        ErrorDialog.printException(() -> "Could not show the video in the comment again", ex);
                    }
                }
            });

            // A new view shows no frame of a video that has ended: it starts over, paused. The player still wants to
            // play once it has ended, so it's paused first.
            if ((Integer) player.getClass().getMethod("getPlaybackState").invoke(player) == STATE_ENDED) {
                player.getClass().getMethod("setPlayWhenReady", boolean.class).invoke(player, false);
                player.getClass().getMethod("seekTo", int.class, long.class).invoke(player, 0, 0L);
            }
            switchTargetView(player, inline, playerView);
            followControls(playerView, buttons);
            dialog.show();
            // The theme hides the status bar. Hiding the navigation bar too would show Android's "Viewing full
            // screen" message over the video, the first time.
            if (dialog.getWindow() != null) {
                dialog.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            }
            fullScreen = dialog;
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the video in full screen", ex);
        }
    }

    private static void closeFullScreen() {
        Dialog dialog = fullScreen;
        if (dialog == null) return;
        fullScreen = null;
        try {
            dialog.dismiss();
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not close the full screen", ex);
        }
    }

    /**
     * PlayerView.switchTargetView: moves the player's video from one view to the other.
     */
    private static void switchTargetView(Object player, View from, View to) throws Exception {
        ClassLoader loader = from.getContext().getClassLoader();
        Class<?> playerClass = loader.loadClass("com.google.android.exoplayer2.Player");
        Class<?> playerViewClass = loader.loadClass("com.google.android.exoplayer2.ui.PlayerView");
        playerViewClass.getMethod("switchTargetView", playerClass, playerViewClass, playerViewClass)
                .invoke(null, player, from, to);
    }

    private static Activity activityOf(Context context) {
        while (context != null) {
            if (context instanceof Activity) return (Activity) context;
            context = context instanceof ContextWrapper ? ((ContextWrapper) context).getBaseContext() : null;
        }
        return null;
    }

    /**
     * Shows the buttons while the player's controls show, and hides them with the controls.
     */
    private static void followControls(View playerView, final View buttons) {
        try {
            ClassLoader loader = playerView.getContext().getClassLoader();
            boolean visible = (Boolean) playerView.getClass().getMethod("isControllerVisible").invoke(playerView);
            buttons.setVisibility(visible ? View.VISIBLE : View.GONE);
            Class<?> listenerClass =
                    loader.loadClass("com.google.android.exoplayer2.ui.PlayerControlView$VisibilityListener");
            Object listener = Proxy.newProxyInstance(loader, new Class<?>[]{listenerClass}, (proxy, method, args) -> {
                if ("onVisibilityChange".equals(method.getName())) {
                    buttons.setVisibility((Integer) args[0]);
                    return null;
                }
                if ("equals".equals(method.getName())) return proxy == args[0];
                if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
                if ("toString".equals(method.getName())) return "VisibilityListener";
                return null;
            });
            playerView.getClass().getMethod("setControllerVisibilityListener", listenerClass)
                    .invoke(playerView, listener);
        } catch (Exception ex) {
            buttons.setVisibility(View.VISIBLE);
            Logger.printInfo(() -> "Could not follow the video's controls", ex);
        }
    }

    private static ImageView button(Context context) {
        ImageView button = new ImageView(context);
        button.setScaleType(ImageView.ScaleType.FIT_CENTER);
        return button;
    }

    private static LinearLayout buttonRow(Context context, ImageView... buttons) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        int size = dp(context, BUTTON_SIZE_DP);
        for (int i = 0; i < buttons.length; i++) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(size, size);
            if (i > 0) params.leftMargin = dp(context, 8);
            row.addView(buttons[i], params);
        }
        return row;
    }

    private static FrameLayout.LayoutParams buttonRowParams(Context context) {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.END);
        int margin = dp(context, 6);
        params.setMargins(margin, margin, margin, margin);
        return params;
    }

    /**
     * Size and duration from the video's DASH playlist, a small text, without the first frame, where images load on
     * tap: the box has the video's shape before the tap, so it doesn't change size while the video plays. A video file
     * has no playlist: the player fits it in the box.
     */
    private static void loadSize(final AspectRatioFrameLayout box, final ImageView preview, final TextView duration,
                                 final String id) {
        Info cached = INFOS.get(id);
        if (cached != null) {
            showInfo(cached, box, preview, duration);
            return;
        }
        if (isFile(id)) return;

        LOADER.execute(() -> {
            try {
                Playlist playlist = Playlist.parse(fetchTextWithRetry(videoUrl(id) + "/DASHPlaylist.mpd"));
                final Info info = new Info(playlist.size, playlist.seconds);
                INFOS.put(id, info);
                MAIN.post(() -> showInfo(info, box, preview, duration));
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not load the video size of " + id, ex);
            }
        });
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

    /**
     * Plays the video in the box, under its buttons. Returns the player's view, or null.
     */
    private static View startPlayer(AspectRatioFrameLayout box, String id) {
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

            View playerView = newPlayerView(context);
            Class<?> playerClass = loader.loadClass("com.google.android.exoplayer2.Player");
            playerView.getClass().getMethod("setPlayer", playerClass).invoke(playerView, player);
            box.addView(playerView, 1, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            box.setTag(player);
            currentPlayer = player;
            return playerView;
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not play the video", ex);
            return null;
        }
    }

    private static View newPlayerView(Context context) throws Exception {
        Constructor<?> playerViewConstructor = context.getClassLoader()
                .loadClass("com.google.android.exoplayer2.ui.PlayerView").getConstructor(Context.class);
        View playerView = (View) playerViewConstructor.newInstance(context);
        playerView.getClass().getMethod("setShowBuffering", int.class).invoke(playerView, 1); // When playing.
        playerView.getClass().getMethod("setShutterBackgroundColor", int.class).invoke(playerView, Color.TRANSPARENT);
        return playerView;
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
     * A button's icon over a video: a white sign on a dark circle, like the play button. Shrink is "<", enlarge ">",
     * full screen four outward corners and exit full screen four inward ones.
     */
    static final class ButtonDrawable extends Drawable {
        static final int SHRINK = 0;
        static final int ENLARGE = 1;
        static final int FULL_SCREEN = 2;
        static final int EXIT_FULL_SCREEN = 3;

        private final Paint circle = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint sign = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private int kind;

        ButtonDrawable(int kind) {
            this.kind = kind;
            circle.setColor(0x99000000);
            sign.setColor(0xFFFFFFFF);
            sign.setStyle(Paint.Style.STROKE);
            sign.setStrokeCap(Paint.Cap.ROUND);
            sign.setStrokeJoin(Paint.Join.ROUND);
        }

        void setKind(int kind) {
            if (this.kind == kind) return;
            this.kind = kind;
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float r = Math.min(b.width(), b.height()) / 2f;
            canvas.drawCircle(cx, cy, r, circle);
            sign.setStrokeWidth(r * 0.14f);
            float t = r * 0.4f;
            path.reset();
            if (kind == SHRINK) {
                chevron(cx + t * 0.4f, cy, -t);
            } else if (kind == ENLARGE) {
                chevron(cx - t * 0.4f, cy, t);
            } else {
                float c = t * 0.5f;
                boolean outward = kind == FULL_SCREEN;
                for (int dx = -1; dx <= 1; dx += 2) {
                    for (int dy = -1; dy <= 1; dy += 2) {
                        float x = cx + dx * t;
                        float y = cy + dy * t;
                        // Outward corners point away from the center; inward ones toward it.
                        float ix = outward ? -dx * c : dx * c;
                        float iy = outward ? -dy * c : dy * c;
                        float px = outward ? x : x - dx * c;
                        float py = outward ? y : y - dy * c;
                        path.moveTo(px + ix, py);
                        path.lineTo(px, py);
                        path.lineTo(px, py + iy);
                    }
                }
            }
            canvas.drawPath(path, sign);
        }

        /**
         * A chevron with its tip at (x + depth, y).
         */
        private void chevron(float x, float y, float depth) {
            path.moveTo(x, y - Math.abs(depth));
            path.lineTo(x + depth, y);
            path.lineTo(x, y + Math.abs(depth));
        }

        @Override
        public void setAlpha(int alpha) {
            circle.setAlpha(alpha);
            sign.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            sign.setColorFilter(colorFilter);
        }

        @Override
        @SuppressWarnings("deprecation")
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * What a Reddit video's DASH playlist says: its smallest video file, its duration and its size.
     */
    static final class Playlist {
        final String smallest;
        final long seconds;
        final int[] size;

        private Playlist(String smallest, long seconds, int[] size) {
            this.smallest = smallest;
            this.seconds = seconds;
            this.size = size;
        }

        static Playlist parse(String mpd) throws Exception {
            XmlPullParser parser = Xml.newPullParser();
            parser.setInput(new StringReader(mpd));
            long seconds = -1;
            String smallest = null;
            long smallestBandwidth = Long.MAX_VALUE;
            long bandwidth = Long.MAX_VALUE;
            int[] size = null;
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
                        // Every rendition has the same ratio: the first video one's size.
                        int width = parseInt(parser.getAttributeValue(null, "width"));
                        int height = parseInt(parser.getAttributeValue(null, "height"));
                        if (size == null && width > 0 && height > 0) size = new int[]{width, height};
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
            return new Playlist(smallest, seconds, size);
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
