package app.template.extension.hevalcontrols.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

import java.util.Locale;

/**
 * The small icon set of the Patch settings screen, drawn in code on a 24 x 24 grid (stroke icons).
 * Nothing here needs a resource, so the host app's resource table stays untouched.
 *
 * <p>A feature names an icon by key; a feature without one falls back to its category's icon
 * ({@link #forCategory(String)}), and an unknown key draws the generic "sliders" icon. Icons are
 * purely visual: rows are announced by their name, so every icon view is hidden from accessibility.
 */
final class Icons {
    /** Keys a feature may name. */
    static final String ADS = "ads", SHIELD = "shield", EYE = "eye", EYE_OFF = "eye_off", BELL = "bell",
            TABS = "tabs", STAR = "star", GLOBE = "globe", TROPHY = "trophy", BALL = "ball", PLAY = "play",
            TAG = "tag", CHAT = "chat", REFRESH = "refresh", TEXT = "text", MOON = "moon", BUG = "bug",
            TICKET = "ticket", CLOCK = "clock", LOCK = "lock", SLIDERS = "sliders", LIST = "list";

    private Icons() { }

    /** The icon of a category by what its name says; the generic icon when nothing matches. */
    static String forCategory(String category) {
        String name = category == null ? "" : category.toLowerCase(Locale.ROOT);
        if (name.contains("spoiler")) return EYE_OFF;
        if (name.equals("ad") || name.contains("ads") || name.contains("advert")) return ADS;
        if (name.contains("telemetry") || name.contains("privacy") || name.contains("track") || name.contains("security")) return SHIELD;
        if (name.contains("notif") || name.contains("alert")) return BELL;
        if (name.contains("premium") || name.contains("pro ") || name.equals("pro")) return STAR;
        if (name.contains("countr") || name.contains("region") || name.contains("language")) return GLOBE;
        if (name.contains("competition") || name.contains("league")) return TROPHY;
        if (name.contains("sport")) return BALL;
        if (name.contains("animation") || name.contains("video") || name.contains("player")) return PLAY;
        // Before "promo", so "Betting and promotions" keeps the betting icon.
        if (name.contains("bett") || name.contains("odds")) return TICKET;
        if (name.contains("promo") || name.contains("marketing") || name.contains("pop")) return TAG;
        if (name.contains("chat") || name.contains("message") || name.contains("comment")) return CHAT;
        if (name.contains("widget") || name.contains("refresh") || name.contains("sync")) return REFRESH;
        if (name.contains("font") || name.contains("text")) return TEXT;
        if (name.contains("theme") || name.contains("appearance") || name.contains("amoled") || name.contains("dark")
                || name.contains("display") || name.contains("look")) return MOON;
        if (name.contains("speed") || name.contains("battery") || name.contains("perform")) return CLOCK;
        if (name.contains("develop") || name.contains("debug")) return BUG;
        if (name.contains("tab") || name.contains("bar") || name.contains("match") || name.contains("layout") || name.contains("home")
                || name.contains("screen") || name.contains("menu")) return TABS;
        if (name.contains("call") || name.contains("contact") || name.contains("profile")) return LIST;
        return SLIDERS;
    }

    /** A drawable of the named icon, 24 dp square by default, in the given color. */
    static Drawable of(String key, int color, int sizePx) {
        return new IconDrawable(key == null ? SLIDERS : key, color, sizePx);
    }

    private static final class IconDrawable extends Drawable {
        private final String key;
        private final int size;
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);

        IconDrawable(String key, int color, int size) {
            this.key = key;
            this.size = size;
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setColor(color);
            stroke.setStrokeCap(Paint.Cap.ROUND);
            stroke.setStrokeJoin(Paint.Join.ROUND);
            fill.setStyle(Paint.Style.FILL);
            fill.setColor(color);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void draw(Canvas canvas) {
            int save = canvas.save();
            float scale = Math.min(getBounds().width(), getBounds().height()) / 24f;
            canvas.translate(getBounds().left, getBounds().top);
            canvas.scale(scale, scale);
            stroke.setStrokeWidth(1.8f);
            drawIcon(canvas);
            canvas.restoreToCount(save);
        }

        private void drawIcon(Canvas c) {
            Path p = new Path();
            switch (key) {
                case ADS:
                    c.drawRoundRect(new RectF(3, 5, 21, 19), 3, 3, stroke);
                    c.drawLine(7, 15, 10, 9, stroke);
                    c.drawLine(10, 9, 13, 15, stroke);
                    c.drawLine(8, 13, 12, 13, stroke);
                    c.drawLine(16, 9, 16, 15, stroke);
                    break;
                case SHIELD:
                    p.moveTo(12, 3);
                    p.lineTo(20, 6);
                    p.lineTo(20, 12);
                    p.quadTo(20, 18, 12, 21);
                    p.quadTo(4, 18, 4, 12);
                    p.lineTo(4, 6);
                    p.close();
                    c.drawPath(p, stroke);
                    c.drawLine(9, 12, 11.2f, 14.2f, stroke);
                    c.drawLine(11.2f, 14.2f, 15.2f, 9.8f, stroke);
                    break;
                case EYE:
                case EYE_OFF:
                    p.moveTo(2.5f, 12);
                    p.quadTo(12, 3.5f, 21.5f, 12);
                    p.quadTo(12, 20.5f, 2.5f, 12);
                    c.drawPath(p, stroke);
                    c.drawCircle(12, 12, 3, stroke);
                    if (EYE_OFF.equals(key)) c.drawLine(4, 4, 20, 20, stroke);
                    break;
                case BELL:
                    p.moveTo(6, 17);
                    p.lineTo(6, 11);
                    p.quadTo(6, 5, 12, 5);
                    p.quadTo(18, 5, 18, 11);
                    p.lineTo(18, 17);
                    p.lineTo(20, 18);
                    p.lineTo(4, 18);
                    p.close();
                    c.drawPath(p, stroke);
                    c.drawArc(new RectF(10, 18.5f, 14, 22.5f), 0, 180, false, stroke);
                    break;
                case TABS:
                    c.drawRoundRect(new RectF(3, 6, 21, 20), 3, 3, stroke);
                    c.drawLine(3, 11, 21, 11, stroke);
                    c.drawLine(9, 3.5f, 9, 6, stroke);
                    c.drawLine(15, 3.5f, 15, 6, stroke);
                    break;
                case STAR:
                    for (int i = 0; i < 10; i++) {
                        double angle = -Math.PI / 2 + i * Math.PI / 5;
                        float radius = i % 2 == 0 ? 9f : 4f;
                        float x = 12 + (float) Math.cos(angle) * radius;
                        float y = 12.5f + (float) Math.sin(angle) * radius;
                        if (i == 0) p.moveTo(x, y);
                        else p.lineTo(x, y);
                    }
                    p.close();
                    c.drawPath(p, stroke);
                    break;
                case GLOBE:
                    c.drawCircle(12, 12, 9, stroke);
                    c.drawOval(new RectF(8, 3, 16, 21), stroke);
                    c.drawLine(3, 12, 21, 12, stroke);
                    break;
                case TROPHY:
                    p.moveTo(7, 4);
                    p.lineTo(17, 4);
                    p.lineTo(17, 9);
                    p.quadTo(17, 14, 12, 14);
                    p.quadTo(7, 14, 7, 9);
                    p.close();
                    c.drawPath(p, stroke);
                    c.drawLine(12, 14, 12, 18, stroke);
                    c.drawLine(8, 20, 16, 20, stroke);
                    c.drawArc(new RectF(2.5f, 5, 8, 10), 90, 180, false, stroke);
                    c.drawArc(new RectF(16, 5, 21.5f, 10), 270, 180, false, stroke);
                    break;
                case BALL:
                    c.drawCircle(12, 12, 9, stroke);
                    for (int i = 0; i < 5; i++) {
                        double angle = -Math.PI / 2 + i * 2 * Math.PI / 5;
                        float x = 12 + (float) Math.cos(angle) * 3.4f;
                        float y = 12 + (float) Math.sin(angle) * 3.4f;
                        if (i == 0) p.moveTo(x, y);
                        else p.lineTo(x, y);
                        c.drawLine(x, y, 12 + (float) Math.cos(angle) * 8.8f, 12 + (float) Math.sin(angle) * 8.8f, stroke);
                    }
                    p.close();
                    c.drawPath(p, stroke);
                    break;
                case PLAY:
                    c.drawCircle(12, 12, 9, stroke);
                    p.moveTo(10, 8.5f);
                    p.lineTo(16, 12);
                    p.lineTo(10, 15.5f);
                    p.close();
                    c.drawPath(p, stroke);
                    break;
                case TAG:
                    p.moveTo(3.5f, 12);
                    p.lineTo(12, 3.5f);
                    p.lineTo(20.5f, 3.5f);
                    p.lineTo(20.5f, 12);
                    p.lineTo(12, 20.5f);
                    p.close();
                    c.drawPath(p, stroke);
                    c.drawCircle(16, 8, 1.4f, fill);
                    break;
                case CHAT:
                    p.moveTo(4, 5);
                    p.lineTo(20, 5);
                    p.lineTo(20, 16);
                    p.lineTo(11, 16);
                    p.lineTo(6, 20);
                    p.lineTo(6, 16);
                    p.lineTo(4, 16);
                    p.close();
                    c.drawPath(p, stroke);
                    break;
                case REFRESH:
                    c.drawArc(new RectF(4, 4, 20, 20), 40, 270, false, stroke);
                    c.drawLine(18.5f, 3, 18.5f, 8, stroke);
                    c.drawLine(18.5f, 8, 13.5f, 8, stroke);
                    break;
                case TEXT:
                    c.drawLine(5, 6, 19, 6, stroke);
                    c.drawLine(12, 6, 12, 19, stroke);
                    c.drawLine(9, 19, 15, 19, stroke);
                    break;
                case MOON:
                    p.moveTo(18, 15.5f);
                    p.quadTo(9, 18.5f, 7, 9.5f);
                    p.quadTo(6.2f, 6, 8.5f, 4);
                    p.quadTo(3, 5.5f, 3.4f, 12);
                    p.quadTo(4, 20, 12, 20.5f);
                    p.quadTo(17, 20.5f, 20, 16);
                    p.quadTo(19, 16, 18, 15.5f);
                    c.drawPath(p, stroke);
                    break;
                case BUG:
                    c.drawRoundRect(new RectF(8, 7, 16, 19), 4, 4, stroke);
                    c.drawLine(12, 7, 12, 19, stroke);
                    c.drawLine(8, 11, 4, 9, stroke);
                    c.drawLine(16, 11, 20, 9, stroke);
                    c.drawLine(8, 16, 4, 18, stroke);
                    c.drawLine(16, 16, 20, 18, stroke);
                    c.drawLine(10, 5, 11, 7, stroke);
                    c.drawLine(14, 5, 13, 7, stroke);
                    break;
                case TICKET:
                    c.drawRoundRect(new RectF(3, 6, 21, 18), 2, 2, stroke);
                    c.drawLine(9, 6, 9, 18, stroke);
                    c.drawLine(13, 10, 17, 10, stroke);
                    c.drawLine(13, 14, 17, 14, stroke);
                    break;
                case CLOCK:
                    c.drawCircle(12, 12, 9, stroke);
                    c.drawLine(12, 7, 12, 12, stroke);
                    c.drawLine(12, 12, 16, 14, stroke);
                    break;
                case LOCK:
                    c.drawRoundRect(new RectF(5, 11, 19, 20), 2, 2, stroke);
                    c.drawArc(new RectF(8, 4, 16, 14), 180, 180, false, stroke);
                    break;
                case LIST:
                    for (int i = 0; i < 3; i++) {
                        float y = 7 + i * 5;
                        c.drawCircle(5, y, 1.2f, fill);
                        c.drawLine(9, y, 20, y, stroke);
                    }
                    break;
                case SLIDERS:
                default:
                    c.drawLine(4, 8, 20, 8, stroke);
                    c.drawLine(4, 16, 20, 16, stroke);
                    c.drawCircle(9, 8, 2.4f, fill);
                    c.drawCircle(15, 16, 2.4f, fill);
                    break;
            }
        }

        @Override
        public void setAlpha(int alpha) {
            stroke.setAlpha(alpha);
            fill.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            stroke.setColorFilter(colorFilter);
            fill.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
