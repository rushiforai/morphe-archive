/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3287
 * https://github.com/MorpheApp/morphe-patches/pull/3451
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-25
 */

package app.morphe.extension.youtube.videoplayer;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.util.AttributeSet;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import java.io.IOException;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;

/**
 * Replaces an icon of the app's own player controls with the selected icon style.
 * <p>
 * The patch moves the original drawable to a new name and puts a {@code <drawable class>}
 * pointing to a subclass in its place, so every place that loads the icon gets this wrapper.
 */
@SuppressWarnings("unused")
public abstract class AppPlayerIconDrawable extends DrawableWrapper {

    public static final class FullscreenEnter extends AppPlayerIconDrawable {
        public FullscreenEnter() {
            super("morphe_fullscreen_enter", "morphe_yt_player_full_enter");
        }
    }

    public static final class FullscreenEnterAlt extends AppPlayerIconDrawable {
        public FullscreenEnterAlt() {
            super("morphe_fullscreen_enter", "morphe_yt_player_full_enter_alt");
        }
    }

    public static final class FullscreenEnterPortrait extends AppPlayerIconDrawable {
        public FullscreenEnterPortrait() {
            super("morphe_fullscreen_enter", "morphe_yt_player_full_enter_portrait");
        }
    }

    public static final class FullscreenExit extends AppPlayerIconDrawable {
        public FullscreenExit() {
            super("morphe_fullscreen_exit", "morphe_yt_player_full_exit");
        }
    }

    public static final class FullscreenExitAlt extends AppPlayerIconDrawable {
        public FullscreenExitAlt() {
            super("morphe_fullscreen_exit", "morphe_yt_player_full_exit_alt");
        }
    }

    public static final class SkipNext extends AppPlayerIconDrawable {
        public SkipNext() {
            super("morphe_player_next", "quantum_ic_skip_next_white_36");
        }
    }

    public static final class SkipNextDisabled extends AppPlayerIconDrawable {
        public SkipNextDisabled() {
            super("morphe_player_next", "quantum_ic_skip_next_white_36", true);
        }
    }

    public static final class SkipPrevious extends AppPlayerIconDrawable {
        public SkipPrevious() {
            super("morphe_player_previous", "quantum_ic_skip_previous_white_36");
        }
    }

    public static final class SkipPreviousDisabled extends AppPlayerIconDrawable {
        public SkipPreviousDisabled() {
            super("morphe_player_previous", "quantum_ic_skip_previous_white_36", true);
        }
    }

    public static final class Settings extends AppPlayerIconDrawable {
        public Settings() {
            super("morphe_player_settings", "yt_outline_gear_white_24");
        }
    }

    // The opacity of the app's disabled transport icons, white at 30 percent.
    private static final int DISABLED_ALPHA = 77;

    private final String drawableName;
    private final String originalName;
    private final boolean disabled;

    private AppPlayerIconDrawable(String styleBaseName, String originalName) {
        this(styleBaseName, originalName, false);
    }

    /**
     * @param disabled Draws the icon faded, for the disabled item of an app selector.
     */
    private AppPlayerIconDrawable(String styleBaseName, String originalName, boolean disabled) {
        super(null);
        drawableName = PlayerIcons.name(styleBaseName, originalName, originalName);
        this.originalName = originalName;
        this.disabled = disabled;
    }

    // The original icon is tinted with a theme attribute, so it is loaded with the theme of the caller.
    @Override
    public void inflate(@NonNull Resources r, @NonNull XmlPullParser parser,
                        @NonNull AttributeSet attrs, @Nullable Resources.Theme theme)
            throws XmlPullParserException, IOException {
        super.inflate(r, parser, attrs, theme);
        // A wrapper inside an app selector names the app icon in android:drawable,
        // which differs per screen size, so the default style keeps that one.
        if (getDrawable() != null && drawableName.equals(originalName)) return;

        try {
            setDrawable(r.getDrawable(
                    ResourceUtils.getIdentifierOrThrow(drawableName, ResourceType.DRAWABLE), theme));
        } catch (Exception ex) {
            Logger.printException(() -> "Could not load player icon: " + drawableName, ex);
        }
    }

    @Override
    public void draw(@NonNull Canvas canvas) {
        if (disabled) {
            Rect bounds = getBounds();
            final int save = canvas.saveLayerAlpha(
                    bounds.left, bounds.top, bounds.right, bounds.bottom, DISABLED_ALPHA);
            super.draw(canvas);
            canvas.restoreToCount(save);
            return;
        }

        super.draw(canvas);
    }

    // Resources caches drawables by their constant state, and a copy made from it would be empty.
    @Nullable
    @Override
    public ConstantState getConstantState() {
        return null;
    }

    @NonNull
    @Override
    public Drawable mutate() {
        Drawable drawable = getDrawable();
        if (drawable != null) {
            drawable.mutate();
        }
        return this;
    }
}
