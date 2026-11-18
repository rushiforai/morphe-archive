package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;

/** One emote image fitted into the view. An animated one runs only while the view is attached. */
class EmoteImageView extends View {
    private final Rect natural = new Rect();
    private Drawable drawable;
    private SharedAnimation animation;
    /** Room left free on every side of the image, in pixels. */
    int inset;

    EmoteImageView(Context context) {
        super(context);
    }

    /** Shows the image, or nothing when it is null. */
    void show(EmoteImageLoader.Image image) {
        if (animation != null && isAttachedToWindow()) animation.detach(this);
        drawable = image == null ? null : image.drawable;
        animation = image == null ? null : image.animation;
        if (animation != null && isAttachedToWindow()) animation.attach(this);
        if (drawable != null)
            natural.set(0, 0, Math.max(1, drawable.getIntrinsicWidth()), Math.max(1, drawable.getIntrinsicHeight()));
        invalidate();
    }

    boolean hasImage() {
        return drawable != null;
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (animation != null) animation.attach(this);
    }

    @Override
    protected void onDetachedFromWindow() {
        if (animation != null) animation.detach(this);
        super.onDetachedFromWindow();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (drawable == null) return;
        float width = getWidth() - 2f * inset, height = getHeight() - 2f * inset;
        if (width <= 0 || height <= 0) return;
        float scale = Math.min(width / natural.width(), height / natural.height());
        canvas.save();
        canvas.translate((getWidth() - natural.width() * scale) / 2f, (getHeight() - natural.height() * scale) / 2f);
        canvas.scale(scale, scale);
        if (drawable.getBounds().isEmpty()) drawable.setBounds(natural);
        drawable.draw(canvas);
        canvas.restore();
    }
}
