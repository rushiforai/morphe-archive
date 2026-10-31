package app.xposed.extension;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.text.TextPaint;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The X-Posed badge: a rounded box holding the flag, device and warning icons, a hairline
 * separator and the circled-i. Laid out in the extension's CSS px and scaled to whatever
 * height it is drawn at.
 */
final class BadgeDrawable extends Drawable {
    /** Intrinsic size multiplier, so the settings preview's ImageView scales the badge down, never up. */
    private static final int INTRINSIC_SCALE = 100;
    private static final float BORDER = 1;
    private static final float RADIUS = 6;
    private static final float SEPARATOR_MARGIN = 3;
    private static final float SEPARATOR_WIDTH = 1;

    private enum Kind {FLAG, DEVICE, VPN}

    private static final class Item {
        final Kind kind;
        final float size;

        Item(Kind kind, float size) {
            this.kind = kind;
            this.size = size;
        }
    }

    private static final Map<String, Rect> FLAG_BOUNDS = new HashMap<>();

    private final Settings.Badge config;
    private final BadgeStyle.Size size;
    private final boolean dark, warning;
    private final String location, source;
    private final List<Item> items = new ArrayList<>();
    private final String flag;
    private final Glyphs.Glyph deviceGlyph;
    private final boolean showInfo;
    private final boolean background;
    private final int fillColor, lineColor, iconColor, alertColor;
    private final float padding, detailsPadding, width;

    // Shared: badges are created and drawn on the main thread only.
    private static final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static final TextPaint emojiPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private static final RectF tmp = new RectF();

    private BadgeDrawable(AccountInfo info, Settings.Badge config, boolean dark) {
        this.config = config;
        this.dark = dark;
        size = config.size;
        showInfo = config.info;
        background = config.background;
        location = info.location;
        source = info.source;
        warning = info.hasLocationWarning();
        if (config.flags && info.location != null) {
            String f = Countries.flagFor(info.location);
            flag = f != null ? f : Countries.UNKNOWN_FLAG;
            items.add(new Item(Kind.FLAG, size.icon));
        } else {
            flag = null;
        }
        if (config.devices && info.source != null) {
            deviceGlyph = Glyphs.forSource(info.source);
            items.add(new Item(Kind.DEVICE, size.icon));
        } else {
            deviceGlyph = null;
        }
        // Like the extension, the warning belongs to the location and needs a flag.
        if (config.vpn && flag != null && info.hasLocationWarning()) {
            items.add(new Item(Kind.VPN, size.icon - 2));
        }

        // X-Posed's graphite theme tokens.
        fillColor = dark ? 0x12A5AFB6 : 0x0920272A;
        lineColor = dark ? 0x24A5AFB6 : 0x1F20272A;
        iconColor = dark ? 0xFFA8B0B8 : 0xFF59656B;
        alertColor = dark ? 0xFFE7B36A : 0xFF895314;

        padding = background ? size.padding : 0;
        detailsPadding = background ? size.detailsPadding : 2;

        float w = 2 * BORDER + 2 * padding + detailsWidth();
        if (showInfo) w += separatorWidth() + controlSize();
        width = w;
    }

    /** Null when the account has nothing to show with the current style. */
    static BadgeDrawable create(AccountInfo info) {
        BadgeDrawable d = new BadgeDrawable(info, Settings.badge(), XTheme.isDark());
        return d.items.isEmpty() ? null : d;
    }

    /** Identifies how the badge looks, so a rendered copy can be reused while it stays the same. */
    String key() {
        return location + '|' + source + '|' + warning + '|' + dark + '|' + size + '|' + background + '|'
                + showInfo + '|' + config.flags + '|' + config.devices + '|' + config.vpn;
    }

    float spanScale() {
        return size.spanScale;
    }

    /** Width over height. */
    float aspectRatio() {
        return width / size.height;
    }

    /** Height relative to the medium size, which is as tall as X's verified badge. */
    float relativeHeight() {
        return size.height / BadgeStyle.Size.MEDIUM.height;
    }

    /** The badge drawn into a bitmap heightPx tall. */
    Bitmap toBitmap(int heightPx) {
        int widthPx = Math.max(1, Math.round(heightPx * aspectRatio()));
        Bitmap bitmap = Bitmap.createBitmap(widthPx, heightPx, Bitmap.Config.ARGB_8888);
        setBounds(0, 0, widthPx, heightPx);
        draw(new Canvas(bitmap));
        return bitmap;
    }

    private float detailsWidth() {
        float w = 2 * detailsPadding + size.gap * (items.size() - 1);
        for (Item item : items) w += item.size;
        return w;
    }

    private float separatorWidth() {
        return 2 * SEPARATOR_MARGIN + SEPARATOR_WIDTH;
    }

    private float controlSize() {
        return size.height - 2;
    }

    @Override
    public int getIntrinsicWidth() {
        return Math.round(width * INTRINSIC_SCALE);
    }

    @Override
    public int getIntrinsicHeight() {
        return Math.round(size.height * INTRINSIC_SCALE);
    }

    @Override
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        if (bounds.isEmpty()) return;
        float s = bounds.height() / size.height;

        canvas.save();
        canvas.translate(bounds.left, bounds.top);
        canvas.scale(s, s);

        if (background) {
            float half = BORDER / 2;
            tmp.set(half, half, width - half, size.height - half);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(fillColor);
            canvas.drawRoundRect(tmp, RADIUS, RADIUS, paint);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(BORDER);
            paint.setColor(lineColor);
            canvas.drawRoundRect(tmp, RADIUS, RADIUS, paint);
            paint.setStyle(Paint.Style.FILL);
        }

        float centerY = size.height / 2;
        float x = BORDER + padding + detailsPadding;
        for (Item item : items) {
            float top = centerY - item.size / 2;
            switch (item.kind) {
                case FLAG:
                    drawFlag(canvas, x, top, item.size);
                    break;
                case DEVICE:
                    deviceGlyph.draw(canvas, paint, x, top, item.size, iconColor);
                    break;
                case VPN:
                    Glyphs.VPN.draw(canvas, paint, x, top, item.size, alertColor);
                    break;
            }
            x += item.size + size.gap;
        }
        x += -size.gap + detailsPadding;

        if (showInfo) {
            x += SEPARATOR_MARGIN;
            float sepHeight = size.icon - 4;
            paint.setColor(lineColor);
            canvas.drawRect(x, centerY - sepHeight / 2, x + SEPARATOR_WIDTH, centerY + sepHeight / 2, paint);
            x += SEPARATOR_WIDTH + SEPARATOR_MARGIN;

            float control = controlSize();
            float glyph = size.icon - 1;
            Glyphs.INFO.draw(canvas, paint, x + (control - glyph) / 2, centerY - glyph / 2, glyph, iconColor);
        }

        canvas.restore();
    }

    /** Emoji flag, scaled to fit an icon box the way the extension sizes its Twemoji image. */
    private void drawFlag(Canvas canvas, float left, float top, float box) {
        final float reference = 100;
        Rect b = FLAG_BOUNDS.get(flag);
        if (b == null) {
            b = new Rect();
            emojiPaint.setTextSize(reference);
            emojiPaint.getTextBounds(flag, 0, flag.length(), b);
            FLAG_BOUNDS.put(flag, b);
        }
        if (b.isEmpty()) return;
        float scale = Math.min(box / b.width(), box / b.height());
        emojiPaint.setTextSize(reference * scale);
        float w = b.width() * scale, h = b.height() * scale;
        float dx = left + (box - w) / 2 - b.left * scale;
        float dy = top + (box - h) / 2 - b.top * scale;
        canvas.drawText(flag, dx, dy, emojiPaint);
    }

    @Override
    public void setAlpha(int alpha) {
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
