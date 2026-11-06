/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3287
 * https://github.com/MorpheApp/morphe-patches/pull/3451
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.youtube.patches.shortsicons;

import android.content.res.Resources;
import android.graphics.Bitmap;
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

import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;

/**
 * Replaces an icon of the app's Shorts action buttons with the selected icon style.
 * <p>
 * The patch moves the original drawable to a new name and puts a {@code <drawable class>}
 * pointing to a subclass in its place, so every place that loads the icon gets this wrapper.
 */
@SuppressWarnings("unused")
public abstract class ShortsIconDrawable extends DrawableWrapper {

    public static final class ShortsHeart extends ShortsIconDrawable {
        public ShortsHeart() {
            super(Dim.dp32, "morphe_shorts_heart", "morphe_youtube_shorts_heart_outline_32dp");
        }
    }

    public static final class ShortsHeartFill extends ShortsIconDrawable {
        public ShortsHeartFill() {
            super(Dim.dp32, "morphe_shorts_heart_fill", "morphe_youtube_shorts_heart_fill_32dp");
        }
    }

    public static final class ShortsHeartOff extends ShortsIconDrawable {
        public ShortsHeartOff() {
            super(Dim.dp32, "morphe_shorts_heart_fill", "morphe_youtube_shorts_heart_off_32dp");
        }
    }

    public static final class ShortsComment extends ShortsIconDrawable {
        public ShortsComment() {
            super(Dim.dp32, "morphe_shorts_comment", "morphe_youtube_shorts_comment_outline_32dp");
        }
    }

    public static final class ShortsSave extends ShortsIconDrawable {
        public ShortsSave() {
            super(Dim.dp32, "morphe_shorts_save", "morphe_youtube_shorts_save_outline_32dp");
        }
    }

    public static final class ShortsSaveFill extends ShortsIconDrawable {
        public ShortsSaveFill() {
            super(Dim.dp32, "morphe_shorts_save_fill", "morphe_youtube_shorts_save_fill_32dp");
        }
    }

    public static final class ShortsShare extends ShortsIconDrawable {
        public ShortsShare() {
            super(Dim.dp32, "morphe_shorts_share", "morphe_youtube_shorts_share_outline_32dp");
        }
    }

    public static final class ShortsRemix extends ShortsIconDrawable {
        public ShortsRemix() {
            super(Dim.dp32, "morphe_shorts_remix", "morphe_youtube_shorts_remix_outline_32dp");
        }
    }

    public static final class ShortsLike extends ShortsIconDrawable {
        public ShortsLike() {
            super(Dim.dp32, "morphe_shorts_like", "morphe_youtube_shorts_like_outline_32dp");
        }
    }

    public static final class ShortsLikeFill extends ShortsIconDrawable {
        public ShortsLikeFill() {
            super(Dim.dp32, "morphe_shorts_like_fill", "morphe_youtube_shorts_like_fill_32dp");
        }
    }

    public static final class ShortsDislike extends ShortsIconDrawable {
        public ShortsDislike() {
            super(Dim.dp32, "morphe_shorts_dislike", "morphe_youtube_shorts_dislike_outline_32dp");
        }
    }

    public static final class ShortsDislikeFill extends ShortsIconDrawable {
        public ShortsDislikeFill() {
            super(Dim.dp32, "morphe_shorts_dislike_fill", "morphe_youtube_shorts_dislike_fill_32dp");
        }
    }

    public static final class DelhiHeart extends ShortsIconDrawable {
        public DelhiHeart() {
            super(Dim.dp24, "morphe_shorts_heart", "morphe_yt_delhi_heart_outline_24dp");
        }
    }

    public static final class DelhiHeartFill extends ShortsIconDrawable {
        public DelhiHeartFill() {
            super(Dim.dp24, "morphe_shorts_heart_fill", "morphe_yt_delhi_heart_fill_white_24dp");
        }
    }

    public static final class DelhiComment extends ShortsIconDrawable {
        public DelhiComment() {
            super(Dim.dp24, "morphe_shorts_comment", "morphe_yt_delhi_comment_24dp");
        }
    }

    public static final class DelhiSave extends ShortsIconDrawable {
        public DelhiSave() {
            super(Dim.dp24, "morphe_shorts_save", "morphe_yt_delhi_bookmark_not_filled_24dp");
        }
    }

    public static final class DelhiSaveFill extends ShortsIconDrawable {
        public DelhiSaveFill() {
            super(Dim.dp24, "morphe_shorts_save_fill", "morphe_yt_delhi_bookmark_filled_24dp");
        }
    }

    public static final class DelhiShare extends ShortsIconDrawable {
        public DelhiShare() {
            super(Dim.dp24, "morphe_shorts_share", "morphe_yt_delhi_share_24dp");
        }
    }

    public static final class DelhiRemix extends ShortsIconDrawable {
        public DelhiRemix() {
            super(Dim.dp24, "morphe_shorts_remix", "morphe_yt_delhi_remix_24dp");
        }
    }

    public static final class DelhiLike extends ShortsIconDrawable {
        public DelhiLike() {
            super(Dim.dp24, "morphe_shorts_like", "morphe_yt_delhi_thumbs_up_not_filled_24dp");
        }
    }

    public static final class DelhiLikeFill extends ShortsIconDrawable {
        public DelhiLikeFill() {
            super(Dim.dp24, "morphe_shorts_like_fill", "morphe_yt_delhi_thumbs_up_filled_24dp");
        }
    }

    public static final class DelhiDislike extends ShortsIconDrawable {
        public DelhiDislike() {
            super(Dim.dp24, "morphe_shorts_dislike", "morphe_yt_delhi_thumbs_down_not_filled_24dp");
        }
    }

    public static final class DelhiDislikeFill extends ShortsIconDrawable {
        public DelhiDislikeFill() {
            super(Dim.dp24, "morphe_shorts_dislike_fill", "morphe_yt_delhi_thumbs_down_filled_24dp");
        }
    }

    private final String drawableName;
    // The style icons are plain vectors, while the app's originals are bitmaps with a shadow.
    private final boolean styled;
    private final int size;
    @Nullable
    private Bitmap shadow;

    /**
     * @param size Size of the app's icon, which the style icon takes over.
     */
    private ShortsIconDrawable(int size, String styleBaseName, String originalName) {
        super(null);
        drawableName = ShortsIcons.resolve(styleBaseName, originalName);
        styled = !drawableName.equals(originalName);
        this.size = size;
    }

    // The original icon is tinted with a theme attribute, so it is loaded with the theme of the caller.
    @Override
    public void inflate(@NonNull Resources r, @NonNull XmlPullParser parser,
                        @NonNull AttributeSet attrs, @Nullable Resources.Theme theme)
            throws XmlPullParserException, IOException {
        super.inflate(r, parser, attrs, theme);

        try {
            setDrawable(r.getDrawable(
                    ResourceUtils.getIdentifierOrThrow(drawableName, ResourceType.DRAWABLE), theme));
        } catch (Exception ex) {
            Logger.printException(() -> "Could not load Shorts icon: " + drawableName, ex);
        }
    }

    @Override
    public int getIntrinsicWidth() {
        return styled ? size : super.getIntrinsicWidth();
    }

    @Override
    public int getIntrinsicHeight() {
        return styled ? size : super.getIntrinsicHeight();
    }

    @Override
    protected void onBoundsChange(@NonNull Rect bounds) {
        super.onBoundsChange(bounds);
        shadow = null;
    }

    @Override
    public void draw(@NonNull Canvas canvas) {
        if (styled && ShortsIconShadow.isAvailable()) {
            Drawable icon = getDrawable();
            Rect bounds = getBounds();
            if (shadow == null && icon != null && !bounds.isEmpty()) {
                shadow = ShortsIconShadow.build(icon, bounds.width(), bounds.height());
            }
            if (shadow != null) {
                canvas.drawBitmap(shadow, bounds.left, bounds.top, null);
            }
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
