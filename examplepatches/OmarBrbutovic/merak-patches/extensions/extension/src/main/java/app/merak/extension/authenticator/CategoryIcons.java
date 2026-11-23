package app.merak.extension.authenticator;

import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/**
 * Icons a category can use, drawn as simple outlines in a 24 unit grid.
 * The id is what is stored; an empty id means no icon (plain folder / color dot).
 */
final class CategoryIcons {

    static final String NONE = "";

    static final String[] IDS = {
            "work", "bank", "card", "cart", "game", "chat",
            "mail", "cloud", "code", "home", "book", "heart",
            "star", "shield", "globe", "person", "key", "phone",
    };

    static final String[] LABELS = {
            "Work", "Bank", "Payment card", "Shopping", "Games", "Chat",
            "Mail", "Cloud", "Code", "Home", "School", "Favorite",
            "Star", "Security", "Web", "Personal", "Key", "Phone",
    };

    private CategoryIcons() {
    }

    static boolean isValid(String id) {
        if (id == null || id.isEmpty()) return false;
        for (String known : IDS) if (known.equals(id)) return true;
        return false;
    }

    static String label(String id) {
        for (int i = 0; i < IDS.length; i++) if (IDS[i].equals(id)) return LABELS[i];
        return "No icon";
    }

    /** @return The icon drawable, or null for no icon. */
    static Drawable create(String id, int color) {
        if (!isValid(id)) return null;
        switch (id) {
            case "work":
                return new Icons.Glyph(color, (c, s, f) -> {
                    c.drawRoundRect(new RectF(3, 7.5f, 21, 19.5f), 2.5f, 2.5f, s);
                    Path handle = new Path();
                    handle.moveTo(9, 7.5f);
                    handle.lineTo(9, 5.5f);
                    handle.quadTo(9, 4.5f, 10, 4.5f);
                    handle.lineTo(14, 4.5f);
                    handle.quadTo(15, 4.5f, 15, 5.5f);
                    handle.lineTo(15, 7.5f);
                    c.drawPath(handle, s);
                    c.drawLine(3, 12.5f, 21, 12.5f, s);
                });
            case "bank":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path roof = new Path();
                    roof.moveTo(3, 9);
                    roof.lineTo(12, 4);
                    roof.lineTo(21, 9);
                    roof.close();
                    c.drawPath(roof, s);
                    c.drawLine(3, 20, 21, 20, s);
                    for (float x : new float[]{6, 10, 14, 18}) c.drawLine(x, 11.5f, x, 17.5f, s);
                });
            case "card":
                return new Icons.Glyph(color, (c, s, f) -> {
                    c.drawRoundRect(new RectF(3, 6, 21, 18), 2.5f, 2.5f, s);
                    c.drawLine(3, 10, 21, 10, s);
                    c.drawLine(6.5f, 14.5f, 10, 14.5f, s);
                });
            case "cart":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path cart = new Path();
                    cart.moveTo(2.5f, 4);
                    cart.lineTo(5, 4);
                    cart.lineTo(7.5f, 15);
                    cart.lineTo(18, 15);
                    cart.lineTo(20.5f, 8);
                    cart.lineTo(6.2f, 8);
                    c.drawPath(cart, s);
                    c.drawCircle(9, 19, 1.5f, f);
                    c.drawCircle(17, 19, 1.5f, f);
                });
            case "game":
                return new Icons.Glyph(color, (c, s, f) -> {
                    c.drawRoundRect(new RectF(2.5f, 7.5f, 21.5f, 17.5f), 5, 5, s);
                    c.drawLine(6, 12.5f, 10, 12.5f, s);
                    c.drawLine(8, 10.5f, 8, 14.5f, s);
                    c.drawCircle(15, 11.5f, 1.2f, f);
                    c.drawCircle(17.5f, 14, 1.2f, f);
                });
            case "chat":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path bubble = new Path();
                    bubble.addRoundRect(new RectF(3.5f, 4.5f, 20.5f, 16), 3, 3, Path.Direction.CW);
                    Path tail = new Path();
                    tail.moveTo(8, 15.5f);
                    tail.lineTo(7, 20.5f);
                    tail.lineTo(12.5f, 15.5f);
                    tail.close();
                    bubble.op(tail, Path.Op.UNION);
                    c.drawPath(bubble, s);
                });
            case "mail":
                return new Icons.Glyph(color, (c, s, f) -> {
                    c.drawRoundRect(new RectF(3, 5.5f, 21, 18.5f), 2, 2, s);
                    Path flap = new Path();
                    flap.moveTo(3.5f, 7);
                    flap.lineTo(12, 13);
                    flap.lineTo(20.5f, 7);
                    c.drawPath(flap, s);
                });
            case "cloud":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path cloud = new Path();
                    cloud.addOval(new RectF(3, 10.5f, 10.5f, 18), Path.Direction.CW);
                    Path top = new Path();
                    top.addOval(new RectF(7, 5, 17, 15), Path.Direction.CW);
                    Path right = new Path();
                    right.addOval(new RectF(13, 9, 21, 17.5f), Path.Direction.CW);
                    Path base = new Path();
                    base.addRect(new RectF(6.5f, 12, 17.5f, 18), Path.Direction.CW);
                    cloud.op(top, Path.Op.UNION);
                    cloud.op(right, Path.Op.UNION);
                    cloud.op(base, Path.Op.UNION);
                    c.drawPath(cloud, s);
                });
            case "code":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path code = new Path();
                    code.moveTo(8, 7);
                    code.lineTo(3, 12);
                    code.lineTo(8, 17);
                    code.moveTo(16, 7);
                    code.lineTo(21, 12);
                    code.lineTo(16, 17);
                    c.drawPath(code, s);
                    c.drawLine(13.5f, 5, 10.5f, 19, s);
                });
            case "home":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path house = new Path();
                    house.moveTo(3, 11);
                    house.lineTo(12, 4);
                    house.lineTo(21, 11);
                    house.moveTo(5.5f, 9.5f);
                    house.lineTo(5.5f, 20);
                    house.lineTo(18.5f, 20);
                    house.lineTo(18.5f, 9.5f);
                    house.moveTo(10, 20);
                    house.lineTo(10, 14.5f);
                    house.lineTo(14, 14.5f);
                    house.lineTo(14, 20);
                    c.drawPath(house, s);
                });
            case "book":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path book = new Path();
                    book.moveTo(12, 6.5f);
                    book.cubicTo(9.5f, 4.8f, 6, 4.5f, 3, 5);
                    book.lineTo(3, 18.5f);
                    book.cubicTo(6, 18, 9.5f, 18.3f, 12, 20);
                    book.cubicTo(14.5f, 18.3f, 18, 18, 21, 18.5f);
                    book.lineTo(21, 5);
                    book.cubicTo(18, 4.5f, 14.5f, 4.8f, 12, 6.5f);
                    book.lineTo(12, 20);
                    c.drawPath(book, s);
                });
            case "heart":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path heart = new Path();
                    heart.moveTo(12, 20);
                    heart.cubicTo(5, 15, 2.5f, 11.5f, 3.5f, 8);
                    heart.cubicTo(4.5f, 4.5f, 9.5f, 3.5f, 12, 7.5f);
                    heart.cubicTo(14.5f, 3.5f, 19.5f, 4.5f, 20.5f, 8);
                    heart.cubicTo(21.5f, 11.5f, 19, 15, 12, 20);
                    heart.close();
                    c.drawPath(heart, s);
                });
            case "star":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path star = new Path();
                    for (int i = 0; i < 10; i++) {
                        double angle = Math.toRadians(-90 + i * 36);
                        float radius = i % 2 == 0 ? 9.5f : 4f;
                        float x = 12 + (float) (Math.cos(angle) * radius);
                        float y = 12.8f + (float) (Math.sin(angle) * radius);
                        if (i == 0) star.moveTo(x, y);
                        else star.lineTo(x, y);
                    }
                    star.close();
                    c.drawPath(star, s);
                });
            case "shield":
                return new Icons.Glyph(color, (c, s, f) -> {
                    Path shield = new Path();
                    shield.moveTo(12, 3);
                    shield.lineTo(19.5f, 6);
                    shield.lineTo(19.5f, 11.5f);
                    shield.cubicTo(19.5f, 16, 16.5f, 19.5f, 12, 21);
                    shield.cubicTo(7.5f, 19.5f, 4.5f, 16, 4.5f, 11.5f);
                    shield.lineTo(4.5f, 6);
                    shield.close();
                    c.drawPath(shield, s);
                    Path check = new Path();
                    check.moveTo(8.5f, 12);
                    check.lineTo(11, 14.5f);
                    check.lineTo(15.5f, 9.5f);
                    c.drawPath(check, s);
                });
            case "globe":
                return new Icons.Glyph(color, (c, s, f) -> {
                    c.drawCircle(12, 12, 9, s);
                    c.drawOval(new RectF(8, 3, 16, 21), s);
                    c.drawLine(3, 12, 21, 12, s);
                });
            case "person":
                return new Icons.Glyph(color, (c, s, f) -> {
                    c.drawCircle(12, 8, 3.8f, s);
                    Path body = new Path();
                    body.moveTo(4.5f, 20.5f);
                    body.cubicTo(4.5f, 16.5f, 8, 14, 12, 14);
                    body.cubicTo(16, 14, 19.5f, 16.5f, 19.5f, 20.5f);
                    c.drawPath(body, s);
                });
            case "key":
                return new Icons.Glyph(color, (c, s, f) -> {
                    c.drawCircle(7.5f, 12, 4, s);
                    c.drawLine(11.5f, 12, 21, 12, s);
                    c.drawLine(18, 12, 18, 15.5f, s);
                    c.drawLine(14.5f, 12, 14.5f, 14.5f, s);
                });
            case "phone":
                return new Icons.Glyph(color, (c, s, f) -> {
                    c.drawRoundRect(new RectF(6.5f, 2.5f, 17.5f, 21.5f), 2.5f, 2.5f, s);
                    c.drawLine(10.5f, 18.5f, 13.5f, 18.5f, s);
                });
            default:
                return null;
        }
    }
}
