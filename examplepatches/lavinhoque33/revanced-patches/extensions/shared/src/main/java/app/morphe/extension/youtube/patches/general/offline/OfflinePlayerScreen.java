/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-10-10.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.Arrays;

import app.morphe.extension.shared.ui.SheetBottomDialog;
import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.overlaybutton.AlwaysRepeatButton;
import app.morphe.extension.youtube.patches.player.DoubleTapSeekPatch;
import app.morphe.extension.youtube.patches.player.ExitFullscreenPatch.FullscreenMode;
import app.morphe.extension.youtube.patches.player.SeekbarColorPatch;
import app.morphe.extension.youtube.patches.video.CustomPlaybackSpeedPatch;
import app.morphe.extension.youtube.patches.video.CustomPlaybackSpeedPatch.PlaybackSpeedMenuType;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.utils.PlaybackSpeedControls;
import app.morphe.extension.youtube.videoplayer.PlayerIcons;

/**
 * Video screen of the offline player. The player itself is {@link OfflinePlayer}; this screen
 * only shows its video and controls, so playback continues when the screen is left.
 */
@SuppressLint({"ClickableViewAccessibility", "SetTextI18n"})
final class OfflinePlayerScreen implements OfflineScreens.Screen, OfflinePlayer.Listener {
    private static final long CONTROLS_TIMEOUT_MS = 3000;
    private static final long SEEK_HINT_TIMEOUT_MS = 1_200;
    private static final long PROGRESS_INTERVAL_MS = 500;
    private static final String EXTRA_FULLSCREEN = "rvx_offline_fullscreen";

    private final Activity activity;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final FrameLayout root;
    private final int scrimColor;
    @Nullable
    private final OfflineSwipeControls swipes;
    private final SurfaceView surfaceView;
    /** Stands in for the picture of an audio-only download. */
    private final ImageView artworkView;
    private final View controls;
    private final TextView title;
    private final ImageButton playPause;
    private final ImageButton previous;
    private final ImageButton next;
    private final ImageButton speedButton;
    private final ImageButton aspectButton;
    @Nullable
    private final ImageButton repeatButton;
    private final ImageButton fullscreenButton;
    private final SeekBar seekBar;
    private final TextView position;
    private final TextView duration;
    private final TextView seekHint;
    private final TextView sponsorSkip;

    private final OfflineSubtitleOverlay subtitles;
    private boolean controlsVisible = true;
    private boolean userSeeking;
    private boolean resumed;
    private boolean destroyed;
    private boolean fullscreen;
    private boolean swipeClaimed;
    private Dialog speedMenu;
    private OfflineVideo speedMenuItem;

    private final Runnable hideControls = () -> setControlsVisible(false);
    private final Runnable progressTicker = new Runnable() {
        @Override
        public void run() {
            updateProgress();
            if (resumed && !destroyed) handler.postDelayed(this, PROGRESS_INTERVAL_MS);
        }
    };
    private final Runnable subtitleTicker = new Runnable() {
        @Override
        public void run() {
            subtitles.update(OfflinePlayer.getCurrent(), OfflinePlayer.getPosition());
            if (resumed && !destroyed && OfflinePlayer.isPlaying()) handler.postDelayed(this, 150);
        }
    };

    OfflinePlayerScreen(Activity activity) {
        this.activity = activity;
        Window window = activity.getWindow();
        activity.setTheme(Utils.getResourceIdentifierOrThrow("Theme.YouTube.Settings.Dark", "style"));
        window.setStatusBarColor(Color.BLACK);
        window.setNavigationBarColor(Color.BLACK);

        root = new FrameLayout(activity);
        root.setBackgroundColor(Color.BLACK);

        surfaceView = new SurfaceView(activity);
        root.addView(surfaceView, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT, Gravity.CENTER));
        surfaceView.getHolder().addCallback(new SurfaceHolder.Callback() {
            @Override
            public void surfaceCreated(SurfaceHolder holder) {
                OfflinePlayer.attachSurface(holder.getSurface());
            }

            @Override
            public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
            }

            @Override
            public void surfaceDestroyed(SurfaceHolder holder) {
                // Only the video stops; the audio continues in the background.
                OfflinePlayer.detachSurface(holder.getSurface());
            }
        });
        artworkView = new ImageView(activity);
        artworkView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        artworkView.setVisibility(View.GONE);
        root.addView(artworkView, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT, Gravity.CENTER));
        root.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            if (r - l != or - ol || b - t != ob - ot) fitVideo();
        });
        subtitles = new OfflineSubtitleOverlay(activity, root, surfaceView,
                () -> handler.removeCallbacks(hideControls), this::scheduleHide);

        seekHint = text(18, Color.WHITE);
        GradientDrawable hintBackground = new GradientDrawable();
        hintBackground.setCornerRadius(Utils.dipToPixels(24));
        hintBackground.setColor(0x99000000);
        seekHint.setBackground(hintBackground);
        final int hintPadding = Utils.dipToPixels(12);
        seekHint.setPadding(hintPadding * 2, hintPadding, hintPadding * 2, hintPadding);
        seekHint.setVisibility(View.GONE);

        sponsorSkip = text(16, Color.WHITE);
        sponsorSkip.setBackgroundColor(0xDD333333);
        sponsorSkip.setPadding(hintPadding, hintPadding, hintPadding, hintPadding);
        sponsorSkip.setVisibility(View.GONE);
        sponsorSkip.setOnClickListener(view -> OfflinePlayer.skipManualSponsor());
        FrameLayout.LayoutParams sponsorParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.END);
        sponsorParams.setMargins(hintPadding, hintPadding, hintPadding, Utils.dipToPixels(80));
        root.addView(sponsorSkip, sponsorParams);

        // region controls
        FrameLayout overlay = new FrameLayout(activity);
        int opacity = Utils.validateValue(Settings.CUSTOM_PLAYER_OVERLAY_OPACITY, 0, 100,
                "revanced_custom_player_overlay_opacity_invalid_toast");
        scrimColor = (0x66 * opacity / 100) << 24;
        overlay.setBackgroundColor(scrimColor);
        overlay.setFitsSystemWindows(true);
        controls = overlay;

        LinearLayout top = new LinearLayout(activity);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        // Taps on the very top edge are taken by the system (swipe to show the hidden bars).
        top.setPadding(0, Utils.dipToPixels(16), 0, 0);
        ImageButton back = button("back", str("revanced_settings_navigate_up"));
        back.setOnClickListener(v -> activity.finish());
        top.addView(back);
        title = text(16, Color.WHITE);
        title.setMaxLines(1);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        top.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        top.addView(subtitles.control());
        repeatButton = Settings.OVERLAY_BUTTON_ALWAYS_REPEAT.get() ? createRepeatButton() : null;
        if (repeatButton != null) {
            int buttonSize = Utils.dipToPixels(48);
            top.addView(repeatButton, new LinearLayout.LayoutParams(buttonSize, buttonSize));
        }
        speedButton = button("speed", str("revanced_offline_player_speed"));
        speedButton.setOnClickListener(v -> showSpeedMenu());
        top.addView(speedButton);
        aspectButton = button("aspect", str("revanced_offline_player_aspect"));
        aspectButton.setOnClickListener(v -> cycleAspectMode());
        top.addView(aspectButton);
        overlay.addView(top, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP));

        LinearLayout center = new LinearLayout(activity);
        center.setOrientation(LinearLayout.HORIZONTAL);
        center.setGravity(Gravity.CENTER);
        previous = button("previous", str("revanced_offline_previous"));
        previous.setOnClickListener(v -> {
            OfflinePlayer.skip(-1);
            scheduleHide();
        });
        playPause = button("pause", str("revanced_offline_pause"));
        playPause.setScaleX(1.5f);
        playPause.setScaleY(1.5f);
        playPause.setOnClickListener(v -> {
            OfflinePlayer.togglePlayPause();
            scheduleHide();
        });
        next = button("next", str("revanced_offline_next"));
        next.setOnClickListener(v -> {
            OfflinePlayer.skip(1);
            scheduleHide();
        });
        final int gap = Utils.dipToPixels(32);
        LinearLayout.LayoutParams centerParams = new LinearLayout.LayoutParams(Utils.dipToPixels(56), Utils.dipToPixels(56));
        centerParams.setMargins(gap, 0, gap, 0);
        center.addView(previous, new LinearLayout.LayoutParams(Utils.dipToPixels(56), Utils.dipToPixels(56)));
        center.addView(playPause, centerParams);
        center.addView(next, new LinearLayout.LayoutParams(Utils.dipToPixels(56), Utils.dipToPixels(56)));
        overlay.addView(center, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

        LinearLayout bottom = new LinearLayout(activity);
        bottom.setOrientation(LinearLayout.HORIZONTAL);
        bottom.setGravity(Gravity.CENTER_VERTICAL);
        final int side = Utils.dipToPixels(12);
        bottom.setPadding(side, 0, 0, Utils.dipToPixels(4));
        position = text(13, Color.WHITE);
        bottom.addView(position);
        seekBar = new SeekBar(activity);
        styleSeekBar(seekBar);
        seekBar.setMax(1000);
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                if (fromUser) {
                    position.setText(OfflineLibraryScreen.formatDuration(progress * OfflinePlayer.getDuration() / 1000));
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar bar) {
                userSeeking = true;
                handler.removeCallbacks(hideControls);
            }

            @Override
            public void onStopTrackingTouch(SeekBar bar) {
                userSeeking = false;
                OfflinePlayer.seekTo(bar.getProgress() * OfflinePlayer.getDuration() / 1000);
                scheduleHide();
            }
        });
        bottom.addView(seekBar, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        duration = text(13, Color.WHITE);
        bottom.addView(duration);
        fullscreenButton = button("rotate",
                str("revanced_offline_player_fullscreen"));
        fullscreenButton.setOnClickListener(v -> toggleFullscreen());
        bottom.addView(fullscreenButton);
        overlay.addView(bottom, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
        root.addView(overlay, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        sponsorSkip.bringToFront();
        // endregion

        swipes = OfflineSwipeControls.create(activity, root);
        seekHint.setTranslationY(-Utils.dipToPixels(56));
        root.addView(seekHint, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

        GestureDetector gestures = new GestureDetector(activity, new GestureDetector.SimpleOnGestureListener() {
            @Override
            public boolean onDown(MotionEvent e) {
                return true;
            }

            @Override
            public boolean onSingleTapConfirmed(MotionEvent e) {
                setControlsVisible(!controlsVisible);
                return true;
            }

            @Override
            public void onLongPress(MotionEvent event) {
                if (swipes != null) swipes.onLongPress();
            }

            @Override
            public boolean onDoubleTapEvent(MotionEvent event) {
                // The second down could become a swipe. Seek only after the tap is released.
                if (event.getActionMasked() == MotionEvent.ACTION_UP && OfflinePlayer.isPrepared()) {
                    int seconds = DoubleTapSeekPatch.getOfflineSeconds(event.getX() > root.getWidth() / 2f);
                    Logger.printDebug(() -> "Double-tap seek: offset=" + (seconds >= 0 ? "+" : "") + seconds + "s");
                    OfflinePlayer.seekBy(seconds * 1_000L);
                    showSeekHint(str("revanced_offline_player_seek_hint", seconds));
                }
                return true;
            }
        });
        // Interactive children handle their own touches; one detector handles the remaining player surface.
        root.setOnTouchListener((view, event) -> handlePlayerTouch(view, event, gestures));

        activity.setContentView(root);
        fullscreen = activity.getIntent().getBooleanExtra(EXTRA_FULLSCREEN, isLandscape());
        applyFullscreen(fullscreen);

        if (!openRequestedVideo()) {
            activity.finish();
            return;
        }
        OfflinePlayer.addListener(this);
        onPlayerStateChanged();
        scheduleHide();
    }

    /** @return False if there is nothing to show. */
    private boolean openRequestedVideo() {
        Intent intent = activity.getIntent();
        String key = intent.getStringExtra(OfflineScreens.EXTRA_VIDEO_ID);
        if (key == null) {
            // From the playback notification: show whatever plays.
            if (OfflinePlayer.isSessionActive()) return true;
            Utils.showToastShort(str("revanced_offline_nothing_playing"));
            return false;
        }
        OfflineVideo video = OfflineIndex.get(key);
        if (video == null) {
            Utils.showToastShort(str("revanced_offline_video_missing"));
            return false;
        }
        // A configuration change reattaches the surface, even if the queue has moved on.
        intent.removeExtra(OfflineScreens.EXTRA_VIDEO_ID);
        OfflinePlayer.play(video, OfflineScreens.order());
        if (!video.audioOnly) {
            switch (Settings.OPEN_VIDEOS_FULLSCREEN.get()) {
                case PORTRAIT -> setFullscreen(true, ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                case LANDSCAPE -> setFullscreen(true, ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
                case DISABLED -> { }
            }
        }
        return true;
    }

    private boolean handlePlayerTouch(View view, MotionEvent event, GestureDetector taps) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN -> {
                swipeClaimed = false;
                if (swipes != null) swipes.begin(view, event, fullscreen);
            }
            case MotionEvent.ACTION_MOVE -> {
                if (swipes != null && swipes.move(event) && !swipeClaimed) {
                    swipeClaimed = true;
                    cancelTaps(event, taps);
                }
            }
            case MotionEvent.ACTION_POINTER_DOWN -> {
                if (!swipeClaimed) cancelTaps(event, taps);
                swipeClaimed = true;
                if (swipes != null) swipes.finish(false);
            }
            case MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                if (swipes != null) swipes.finish(event.getActionMasked() == MotionEvent.ACTION_UP && swipeClaimed);
            }
            default -> { }
        }

        if (!swipeClaimed) taps.onTouchEvent(event);
        return true;
    }

    private static void cancelTaps(MotionEvent event, GestureDetector taps) {
        MotionEvent cancel = MotionEvent.obtain(event);
        cancel.setAction(MotionEvent.ACTION_CANCEL);
        taps.onTouchEvent(cancel);
        cancel.recycle();
    }

    // region views

    private TextView text(float sizeSp, int color) {
        TextView view = new TextView(activity);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
        view.setTextColor(color);
        final int padding = Utils.dipToPixels(8);
        view.setPadding(padding, 0, padding, 0);
        return view;
    }

    private ImageButton button(String icon, String description) {
        ImageButton button = button(description);
        setIcon(button, icon);
        return button;
    }

    private ImageButton button(String description) {
        ImageButton button = new ImageButton(activity);
        button.setBackgroundColor(Color.TRANSPARENT);
        button.setContentDescription(description);
        final int padding = Utils.dipToPixels(12);
        button.setPadding(padding, padding, padding, padding);
        button.setScaleType(android.widget.ImageView.ScaleType.FIT_CENTER);
        return button;
    }

    private void setIcon(ImageButton button, String icon) {
        button.setImageDrawable(OfflineUi.icon(activity, icon, Color.WHITE));
    }

    @Nullable
    private ImageButton createRepeatButton() {
        ImageButton repeat = button(str("revanced_offline_player_repeat"));
        Drawable icon = repeatIcon(repeat);
        if (icon == null) return null;

        repeat.setImageDrawable(icon);
        updateRepeatButton(repeat);
        repeat.setOnClickListener(view -> {
            AlwaysRepeatButton.toggleRepeat();
            updateRepeatButton(repeat);
            scheduleHide();
        });
        repeat.setOnLongClickListener(view -> {
            AlwaysRepeatButton.toggleRepeatPause();
            updateRepeatButton(repeat);
            scheduleHide();
            return true;
        });
        return repeat;
    }

    @Nullable
    private Drawable repeatIcon(ImageButton repeat) {
        Drawable off = PlayerIcons.styledDrawable("morphe_loop_video_button_off");
        Drawable on = off == null ? null : PlayerIcons.styledDrawable("morphe_loop_video_button_on");
        if (on == null) {
            int selector = ResourceUtils.getDrawableIdentifier("revanced_repeat_button");
            if (selector != 0) return activity.getDrawable(selector);

            int stock = ResourceUtils.getDrawableIdentifier("yt_outline_arrow_repeat_1_white_24");
            if (stock == 0) return null;
            off = activity.getDrawable(stock);
            on = activity.getDrawable(stock);
            if (off == null || on == null) return null;
        }

        Integer tint = AlwaysRepeatButton.activatedTint(repeat);
        if (tint != null) on.mutate().setTint(tint);
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{android.R.attr.state_selected}, on);
        states.addState(new int[0], off);
        return states;
    }

    private void updateRepeatButton(ImageButton repeat) {
        AlwaysRepeatButton.updateRepeatState(repeat);
        boolean pauseAfterRepeat = Settings.ALWAYS_REPEAT_PAUSE.get();
        repeat.setContentDescription(str(pauseAfterRepeat ? "revanced_offline_player_repeat_pause"
                : "revanced_offline_player_repeat"));
    }

    /** Draws the seekbar like YouTube's: a thin track, the progress and a dot in the seekbar color. */
    private void styleSeekBar(SeekBar bar) {
        final int primary = SeekbarColorPatch.getSeekbarColor();
        final int trackHeight = Utils.dipToPixels(3);
        final float radius = trackHeight / 2f;
        GradientDrawable track = new GradientDrawable();
        track.setColor(0x4DFFFFFF);
        track.setCornerRadius(radius);
        LayerDrawable layers = new LayerDrawable(new Drawable[]{track, new OfflineSeekbarProgress(primary)});
        layers.setId(0, android.R.id.background);
        layers.setId(1, android.R.id.progress);
        for (int i = 0; i < 2; i++) {
            layers.setLayerHeight(i, trackHeight);
            layers.setLayerGravity(i, Gravity.CENTER_VERTICAL | Gravity.FILL_HORIZONTAL);
        }
        bar.setProgressDrawable(layers);
        GradientDrawable thumb = new GradientDrawable();
        thumb.setShape(GradientDrawable.OVAL);
        thumb.setColor(primary);
        thumb.setSize(Utils.dipToPixels(14), Utils.dipToPixels(14));
        bar.setThumb(thumb);
        bar.setSplitTrack(false);
    }

    private void showSeekHint(String text) {
        seekHint.setText(text);
        seekHint.setVisibility(View.VISIBLE);
        handler.removeCallbacks(hideSeekHint);
        handler.postDelayed(hideSeekHint, SEEK_HINT_TIMEOUT_MS);
    }

    private final Runnable hideSeekHint = this::hideSeekHint;

    private void hideSeekHint() {
        seekHint.setVisibility(View.GONE);
    }

    private void setControlsVisible(boolean visible) {
        controlsVisible = visible;
        // The overlay itself stays visible: it has to receive the taps that show the controls again.
        ViewGroup group = (ViewGroup) controls;
        for (int i = 0; i < group.getChildCount(); i++) {
            group.getChildAt(i).setVisibility(visible ? View.VISIBLE : View.INVISIBLE);
        }
        controls.setBackgroundColor(visible ? scrimColor : Color.TRANSPARENT);
        if (visible) scheduleHide();
    }

    private void scheduleHide() {
        handler.removeCallbacks(hideControls);
        if (!destroyed && OfflinePlayer.isPlaying() && !userSeeking && speedMenu == null) {
            handler.postDelayed(hideControls, CONTROLS_TIMEOUT_MS);
        }
    }

    private void showSpeedMenu() {
        speedMenuItem = OfflinePlayer.getCurrent();
        boolean custom = Settings.ENABLE_CUSTOM_PLAYBACK_SPEED.get();
        float[] presets = CustomPlaybackSpeedPatch.getArray(OfflinePlaybackOptions.STOCK_SPEEDS);
        PlaybackSpeedMenuType style = custom ? Settings.CUSTOM_PLAYBACK_SPEED_MENU_TYPE.get()
                : PlaybackSpeedMenuType.YOUTUBE_LEGACY;
        handler.removeCallbacks(hideControls);

        speedMenu = switch (style) {
            case CUSTOM_MODERN -> showModernSpeedMenu(presets);
            case CUSTOM_NO_THEME, CUSTOM_LEGACY, YOUTUBE_LEGACY -> showSpeedChoices(presets, style);
        };
        speedMenu.setOnDismissListener(d -> {
            speedMenu = null;
            speedMenuItem = null;
            scheduleHide();
        });
    }

    private Dialog showModernSpeedMenu(float[] presets) {
        var content = SheetBottomDialog.createMainLayout(activity, BaseThemeUtils.getDialogBackgroundColor());
        TextView currentSpeed = new TextView(activity);
        PlaybackSpeedControls.addCenteredHeader(content, currentSpeed);
        PlaybackSpeedControls.addTo(content, currentSpeed, presets, OfflinePlayer::getSpeed, this::selectSpeed, false);

        ScrollView scroll = SheetBottomDialog.createCappedScrollView(activity);
        scroll.addView(content);
        var dialog = SheetBottomDialog.createSlideDialog(activity, scroll, 200);
        dialog.show();
        return dialog;
    }

    private Dialog showSpeedChoices(float[] presets, PlaybackSpeedMenuType style) {
        float current = OfflinePlayer.getSpeed();
        float[] choices = OfflinePlaybackOptions.speedChoices(presets, current);
        int selected = Arrays.binarySearch(choices, current);
        String[] labels = new String[choices.length];
        for (int i = 0; i < choices.length; i++) {
            float rate = choices[i];
            labels[i] = rate == 1f ? str("revanced_offline_player_speed_normal") : rate + "x";
        }
        String heading = str("revanced_offline_player_speed");
        if (style == PlaybackSpeedMenuType.CUSTOM_LEGACY) {
            return OfflineUi.showChoices(activity, heading, labels, selected, Color.WHITE,
                    which -> selectSpeed(choices[which]));
        }

        AlertDialog.Builder builder = style == PlaybackSpeedMenuType.CUSTOM_NO_THEME
                ? new AlertDialog.Builder(activity)
                : Utils.getDialogBuilder(activity);
        return builder.setTitle(heading).setSingleChoiceItems(labels, selected, (dialog, which) -> {
            selectSpeed(choices[which]);
            dialog.dismiss();
        }).show();
    }

    private void selectSpeed(float rate) {
        if (speedMenuItem == OfflinePlayer.getCurrent() && OfflinePlayer.setSpeed(rate)) {
            OfflinePlayer.rememberSpeed();
        }
    }

    private void dismissSpeedMenu() {
        if (speedMenu != null) speedMenu.dismiss();
    }

    private void fitVideo() {
        final int videoWidth = OfflinePlayer.getVideoWidth();
        final int videoHeight = OfflinePlayer.getVideoHeight();
        final int width = root.getWidth();
        final int height = root.getHeight();
        if (videoWidth <= 0 || videoHeight <= 0 || width <= 0 || height <= 0) return;

        int[] size = surfaceSize(currentAspectMode(), videoWidth, videoHeight, width, height);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) surfaceView.getLayoutParams();
        if (params.width == size[0] && params.height == size[1]) return;

        params.width = size[0];
        params.height = size[1];
        params.gravity = Gravity.CENTER;
        surfaceView.setLayoutParams(params);
    }

    /**
     * The surface size of a mode. The surface is centered in the root, which clips a surface that
     * is larger than itself, so Zoom crops the picture and Original shows the native pixels.
     */
    private static int[] surfaceSize(AspectMode mode, int videoWidth, int videoHeight, int width, int height) {
        if (mode == AspectMode.STRETCH) return new int[]{width, height};
        if (mode == AspectMode.ORIGINAL) return new int[]{videoWidth, videoHeight};

        final float scale = mode == AspectMode.ZOOM
                ? Math.max((float) width / videoWidth, (float) height / videoHeight)
                : Math.min((float) width / videoWidth, (float) height / videoHeight);
        return new int[]{Math.round(videoWidth * scale), Math.round(videoHeight * scale)};
    }

    /** The next mode of the cycle, saved so the next video and the next start use it too. */
    private void cycleAspectMode() {
        final AspectMode mode = currentAspectMode().next();
        Settings.OFFLINE_ASPECT_MODE.save(mode.name());
        fitVideo();
        Utils.showToastShort(str(mode.labelKey()));
        scheduleHide();
    }

    private static AspectMode currentAspectMode() {
        return AspectMode.fromSetting(Settings.OFFLINE_ASPECT_MODE.get());
    }

    /** How the picture fills the screen, cycled by the aspect ratio button. */
    private enum AspectMode {
        /** Letterboxed, the whole picture is visible. */
        FIT,
        /** Fills the screen, the picture is distorted. */
        STRETCH,
        /** Fills the screen, the edges of the picture are cropped. */
        ZOOM,
        /** Native pixel size, centered. */
        ORIGINAL;

        AspectMode next() {
            final AspectMode[] modes = values();
            return modes[(ordinal() + 1) % modes.length];
        }

        static AspectMode fromSetting(String value) {
            for (AspectMode mode : values()) {
                if (mode.name().equals(value)) return mode;
            }
            return FIT;
        }

        String labelKey() {
            return switch (this) {
                case STRETCH -> "revanced_offline_aspect_stretch";
                case ZOOM -> "revanced_offline_aspect_zoom";
                case ORIGINAL -> "revanced_offline_aspect_original";
                default -> "revanced_offline_aspect_fit";
            };
        }
    }

    private void updateProgress() {
        final long total = OfflinePlayer.getDuration();
        final long current = OfflinePlayer.getPosition();
        duration.setText(OfflineLibraryScreen.formatDuration(total));
        if (!userSeeking) {
            position.setText(OfflineLibraryScreen.formatDuration(current));
            seekBar.setProgress(total > 0 ? (int) (current * 1000 / total) : 0);
        }
        subtitles.update(OfflinePlayer.getCurrent(), current);
    }

    // endregion

    // region fullscreen

    private boolean isLandscape() {
        return activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
    }

    private void toggleFullscreen() {
        if (fullscreen) exitFullscreen();
        else setFullscreen(true, ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
    }

    private void exitFullscreen() {
        setFullscreen(false, ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
    }

    private void setFullscreen(boolean fullscreen, int orientation) {
        // LicenseActivity may be recreated; the new screen restores presentation and reattaches.
        if (swipes != null && this.fullscreen != fullscreen) {
            swipes.finish(false);
            if (!fullscreen) swipes.saveBrightness();
            else if (resumed) swipes.restoreBrightness(true);
        }

        this.fullscreen = fullscreen;
        activity.getIntent().putExtra(EXTRA_FULLSCREEN, fullscreen);
        applyFullscreen(fullscreen);
        activity.setRequestedOrientation(orientation);
    }

    @SuppressWarnings("deprecation")
    private void applyFullscreen(boolean fullscreen) {
        Window window = activity.getWindow();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(!fullscreen);
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                if (fullscreen) {
                    controller.hide(WindowInsets.Type.systemBars());
                    controller.setSystemBarsBehavior(WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
                } else {
                    controller.show(WindowInsets.Type.systemBars());
                }
            }
        } else {
            window.getDecorView().setSystemUiVisibility(fullscreen
                    ? View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                    | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                    : View.SYSTEM_UI_FLAG_VISIBLE);
        }
    }

    // endregion

    // region state

    @Override
    public void onPlayerStateChanged() {
        if (destroyed) return;
        OfflineVideo video = OfflinePlayer.getCurrent();
        if (video == null) {
            // The session was closed, for example from the notification.
            activity.finish();
            return;
        }
        if (speedMenu != null && speedMenuItem != video) dismissSpeedMenu();
        speedButton.setEnabled(OfflinePlayer.isPrepared());
        title.setText(video.title);
        showArtwork(video);
        aspectButton.setVisibility(video.audioOnly ? View.GONE : View.VISIBLE);
        final boolean playing = OfflinePlayer.isPlaying();
        setIcon(playPause, playing ? "pause" : "play");
        playPause.setContentDescription(playing ? str("revanced_offline_pause") : str("revanced_offline_play"));
        previous.setAlpha(OfflinePlayer.hasPrevious() || OfflinePlayer.getPosition() > 3000 ? 1f : 0.4f);
        next.setEnabled(OfflinePlayer.hasNext());
        next.setAlpha(OfflinePlayer.hasNext() ? 1f : 0.4f);
        String sponsorText = OfflinePlayer.manualSponsorText();
        sponsorSkip.setText(sponsorText);
        sponsorSkip.setVisibility(sponsorText.isEmpty() ? View.GONE : View.VISIBLE);
        if (playing) {
            activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            if (controlsVisible) scheduleHide();
        } else {
            activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            handler.removeCallbacks(hideControls);
            if (!controlsVisible) setControlsVisible(true);
        }
        fitVideo();
        updateProgress();
        handler.removeCallbacks(subtitleTicker);
        if (resumed && playing) handler.post(subtitleTicker);
    }

    private void showArtwork(OfflineVideo video) {
        artworkView.setVisibility(video.audioOnly ? View.VISIBLE : View.GONE);
        artworkView.setImageBitmap(video.audioOnly ? OfflinePlayer.getArtwork() : null);
    }

    @Override
    public void onPlaybackEnded() {
        if (!resumed || !fullscreen || destroyed) return;
        FullscreenMode mode = Settings.EXIT_FULLSCREEN.get();
        if (mode == FullscreenMode.PORTRAIT_LANDSCAPE
                || (isLandscape() ? mode == FullscreenMode.LANDSCAPE : mode == FullscreenMode.PORTRAIT)) {
            exitFullscreen();
        }
    }

    @Override
    public boolean onBackPressed() {
        if (!destroyed && OfflinePlayer.getCurrent() != null && fullscreen) {
            exitFullscreen();
            return true;
        }
        return false;
    }

    @Override
    public void onResume() {
        resumed = true;
        if (OfflinePlayer.hasPlaybackEnded()) onPlaybackEnded();
        if (repeatButton != null) updateRepeatButton(repeatButton);
        handler.removeCallbacks(progressTicker);
        handler.post(progressTicker);
        if (OfflinePlayer.isPlaying()) handler.post(subtitleTicker);
        applyFullscreen(fullscreen);
        if (swipes != null) swipes.restoreBrightness(fullscreen);
    }

    @Override
    public void onPause() {
        resumed = false;
        if (swipes != null) {
            swipes.finish(false);
            swipes.saveBrightness();
        }
        handler.removeCallbacks(progressTicker);
        handler.removeCallbacks(subtitleTicker);
    }

    @Override
    public void onDestroy() {
        destroyed = true;
        if (speedMenu instanceof SheetBottomDialog.SlideDialog sheet) sheet.dismissWithoutAnimation();
        else dismissSpeedMenu();
        subtitles.close();
        handler.removeCallbacksAndMessages(null);
        OfflinePlayer.removeListener(this);
        OfflinePlayer.detachSurface(surfaceView.getHolder().getSurface());
        Logger.printDebug(() -> "Offline player screen destroyed, playback continues: " + OfflinePlayer.isPlaying());
    }

    // endregion
}
