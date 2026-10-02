package io.github.bakwudo.uyu.extension.danmaku;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageView;

import java.util.List;

import io.github.bakwudo.uyu.extension.Utils;
import io.github.bakwudo.uyu.extension.settings.Setting;
import io.github.bakwudo.uyu.extension.settings.Settings;

/**
 * Danmaku in the native live theatre: the comment view over the video, and the on/off button
 * among the player's top right buttons.
 * <p>
 * Comments are shown in landscape, which is fullscreen on phones. Portrait, Twitch's mini player
 * and picture in picture each have their own setting. Only the live theatre creates this overlay,
 * so VODs and clips never show comments.
 */
final class DanmakuOverlay {
    /** Tag of the comment view, to find the overlay from the player's root view. */
    static final String VIEW_TAG = "uyu_danmaku";

    /** The player's top right buttons, from right to left. */
    private static final String[] TOP_BUTTONS = {
            "audio_and_subtitles", "settings_button", "share_button", "cast_button", "create_clip_text_button", "info",
    };

    private final ViewGroup player;
    private final View video;
    private final ViewGroup controls;
    /** Id of the view Twitch shrinks to show the theatre as the mini player. */
    private final int miniPlayerLayoutId;
    private final DanmakuView danmaku;
    private final ImageView button;
    private final DanmakuToggleIcon icon;
    private final Rect rect = new Rect();
    private final Rect buttonRect = new Rect();

    private final SharedPreferences.OnSharedPreferenceChangeListener settingsListener = (preferences, key) -> {
        if (Settings.DANMAKU_ENABLED.key.equals(key)
                || Settings.DANMAKU_PORTRAIT.key.equals(key)
                || Settings.DANMAKU_MINI_PLAYER.key.equals(key)
                || Settings.DANMAKU_PICTURE_IN_PICTURE.key.equals(key)) {
            update();
        }
    };

    private DanmakuOverlay(ViewGroup player, View video, ViewGroup controls) {
        this.player = player;
        this.video = video;
        this.controls = controls;
        Context context = player.getContext();
        miniPlayerLayoutId = Utils.getResourceId(context, "draggable_layout", "id");

        // Above the video, below the player's error, ad and caption views, and below the controls,
        // which are in another container on top of the player.
        danmaku = new DanmakuView(context);
        danmaku.setTag(VIEW_TAG);
        danmaku.setVisibility(View.INVISIBLE);
        player.addView(danmaku, 1, new FrameLayout.LayoutParams(0, 0, Gravity.TOP | Gravity.LEFT));

        int iconSize = Math.round(24 * context.getResources().getDisplayMetrics().density);
        icon = new DanmakuToggleIcon(iconSize);
        button = new ImageView(context);
        button.setImageDrawable(icon);
        button.setScaleType(ImageView.ScaleType.FIT_CENTER);
        button.setContentDescription("Danmaku comments");
        button.setVisibility(View.INVISIBLE);
        button.setOnClickListener(v -> {
            Settings.DANMAKU_ENABLED.save(!Settings.DANMAKU_ENABLED.get());
            update();
        });
        // Kept above the controls even if Twitch adds them to the container again later. No
        // outline, so the raised button casts no shadow.
        button.setTranslationZ(1);
        button.setOutlineProvider(null);
        controls.addView(button, new FrameLayout.LayoutParams(0, 0, Gravity.TOP | Gravity.RIGHT));

        player.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> update());
        video.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> update());
        controls.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            try {
                updateButton();
            } catch (Exception ex) {
                Utils.logError("Danmaku: failed to update the button", ex);
            }
        });
        danmaku.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
                Setting.addChangeListener(settingsListener);
                update();
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
                Setting.removeChangeListener(settingsListener);
            }
        });
        if (danmaku.isAttachedToWindow()) Setting.addChangeListener(settingsListener);
    }

    /**
     * @param theatreRoot Root view of the live theatre.
     * @return The overlay, or null if the theatre's layout is not as expected.
     */
    static DanmakuOverlay attach(View theatreRoot) {
        Context context = theatreRoot.getContext();
        View player = theatreRoot.findViewById(Utils.getResourceId(context, "player_view_delegate", "id"));
        View controls = theatreRoot.findViewById(Utils.getResourceId(context, "player_overlay_container", "id"));
        if (!(player instanceof FrameLayout playerLayout) || !(controls instanceof FrameLayout controlsLayout)) {
            Utils.logInfo("Danmaku: player views not found");
            return null;
        }
        View video = player.findViewById(Utils.getResourceId(context, "playback_view_container", "id"));
        if (video == null) {
            Utils.logInfo("Danmaku: video container not found");
            return null;
        }
        return new DanmakuOverlay(playerLayout, video, controlsLayout);
    }

    /**
     * @return true if the comment view is in the given player view.
     */
    boolean isInPlayer(View playerRoot) {
        return playerRoot != null && playerRoot.findViewWithTag(VIEW_TAG) == danmaku;
    }

    /** Main thread only. */
    void addComments(List<DanmakuComment> comments) {
        if (!isShown()) return;
        for (DanmakuComment comment : comments) danmaku.addComment(comment);
    }

    /** Main thread only. */
    void setPaused(boolean paused) {
        danmaku.setPaused(paused);
    }

    /**
     * @return true while comments are shown: danmaku is on, and the player is in landscape, or in
     * portrait, the mini player or picture in picture with its setting on.
     */
    boolean isShown() {
        return Settings.DANMAKU_ENABLED.get() && isAvailable();
    }

    private boolean isAvailable() {
        if (!danmaku.isAttachedToWindow()) return false;
        Context context = player.getContext();
        Activity activity = Utils.findActivity(context);
        if (activity != null && activity.isInPictureInPictureMode()) {
            return Settings.DANMAKU_PICTURE_IN_PICTURE.get();
        }
        if (isMiniPlayer()) return Settings.DANMAKU_MINI_PLAYER.get();
        if (context.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE) {
            return Settings.DANMAKU_PORTRAIT.get();
        }
        return true;
    }

    /**
     * @return true while the theatre is the mini player. Twitch shows it by giving the layout
     * around the theatre a fixed size, and gives it back the full size when the theatre expands.
     */
    private boolean isMiniPlayer() {
        if (miniPlayerLayoutId == 0) return false;
        for (ViewParent parent = player.getParent(); parent instanceof View view; parent = view.getParent()) {
            if (view.getId() != miniPlayerLayoutId) continue;
            ViewGroup.LayoutParams params = view.getLayoutParams();
            return params != null && params.width != ViewGroup.LayoutParams.MATCH_PARENT;
        }
        return false;
    }

    private void update() {
        try {
            updateViews();
        } catch (Exception ex) {
            Utils.logError("Danmaku: failed to update the overlay", ex);
        }
    }

    private void updateViews() {
        boolean shown = isShown();
        if (!shown) danmaku.clear();
        danmaku.setVisibility(shown ? View.VISIBLE : View.INVISIBLE);
        icon.setOn(Settings.DANMAKU_ENABLED.get());

        // The comments cover the part of the video inside the player. The video can be larger
        // than the player when it is cropped to fill it.
        rect.set(video.getLeft(), video.getTop(), video.getRight(), video.getBottom());
        if (!rect.intersect(0, 0, player.getWidth(), player.getHeight())) rect.setEmpty();
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) danmaku.getLayoutParams();
        if (params.leftMargin != rect.left || params.topMargin != rect.top
                || params.width != rect.width() || params.height != rect.height()) {
            params.leftMargin = rect.left;
            params.topMargin = rect.top;
            params.width = rect.width();
            params.height = rect.height();
            // Called from layout listeners, so change the layout on the next frame.
            danmaku.post(() -> danmaku.setLayoutParams(params));
        }
        updateButton();
    }

    /**
     * Shows the button while the player's controls are shown, to the left of the other top right
     * buttons. The controls are shown when their back button is.
     */
    private void updateButton() {
        View backButton = controls.findViewById(Utils.getResourceId(controls.getContext(), "back_button", "id"));
        boolean controlsShown = backButton != null && backButton.getVisibility() == View.VISIBLE;
        // INVISIBLE rather than GONE, so showing and hiding needs no new layout pass.
        button.setVisibility(controlsShown && isAvailable() ? View.VISIBLE : View.INVISIBLE);

        // While the controls are hidden, the other buttons are gone and give no position.
        if (!controlsShown) return;

        View template = null;
        int left = controls.getWidth();
        for (String name : TOP_BUTTONS) {
            View view = controls.findViewById(Utils.getResourceId(controls.getContext(), name, "id"));
            if (view == null) continue;
            if (name.equals("settings_button")) template = view;
            if (view.getVisibility() != View.VISIBLE || view.getWidth() == 0) continue;
            buttonRect.set(0, 0, view.getWidth(), view.getHeight());
            controls.offsetDescendantRectToMyCoords(view, buttonRect);
            left = Math.min(left, buttonRect.left);
        }
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) button.getLayoutParams();
        int size = template != null && template.getLayoutParams().width > 0
                ? template.getLayoutParams().width
                : Math.round(48 * controls.getResources().getDisplayMetrics().density);
        int rightMargin = Math.max(0, controls.getWidth() - left);
        if (params.width == size && params.rightMargin == rightMargin) return;

        if (params.width == 0 && template instanceof ImageView templateButton) {
            button.setPadding(template.getPaddingLeft(), template.getPaddingTop(),
                    template.getPaddingRight(), template.getPaddingBottom());
            button.setImageTintList(templateButton.getImageTintList());
            Drawable background = template.getBackground();
            if (background != null && background.getConstantState() != null) {
                button.setBackground(background.getConstantState().newDrawable().mutate());
            }
        }
        params.width = size;
        params.height = size;
        params.rightMargin = rightMargin;
        button.post(() -> button.setLayoutParams(params));
    }
}
