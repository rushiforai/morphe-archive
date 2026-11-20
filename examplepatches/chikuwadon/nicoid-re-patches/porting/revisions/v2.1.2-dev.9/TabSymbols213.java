package e.e.a;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import java.lang.reflect.Field;

/** Additional tab-bar icons; never change stored tab descriptors or names. */
public final class TabSymbols213 {
    private TabSymbols213() { }
    private static Object value(Object tab, String field) throws Exception {
        Field f = tab.getClass().getDeclaredField(field);
        f.setAccessible(true);
        return f.get(tab);
    }
    private static String str(Object tab, String key) throws Exception {
        Object v = value(tab, key);
        return v == null ? "" : v.toString();
    }
    private static int num(Object tab, String key) throws Exception {
        return ((Number)value(tab,key)).intValue();
    }
    // Existing badges 1-4 remain unchanged. 5 mylist, 6 temporary list,
    // 7 NicoRepo, 8 on-device playlist.
    public static int badge(Object tab) {
        if (tab == null) return 0;
        try {
            String screen = str(tab,"screen"), url = str(tab,"url");
            int type = num(tab,"type");
            if ("nicorepo".equals(screen)) return 7;
            if ("playlist".equals(screen)) return 8;
            if ("mylist".equals(screen) || "list".equals(screen)) {
                if (type == 9 || "deflist".equals(url) || url.contains("/deflist")) return 6;
                if ("mylist".equals(screen) || type == 5 || url.contains("/mylist/")) return 5;
            }
        } catch (Exception ignored) { }
        return 0;
    }

    public static void draw(Canvas canvas, int kind, Paint source, Drawable drawable) {
        if (canvas == null || drawable == null) return;
        Rect bounds = drawable.getBounds();
        Paint p = new Paint(source);
        p.setAntiAlias(true);
        p.setStyle(Paint.Style.STROKE);
        p.setStrokeCap(Paint.Cap.ROUND);
        p.setStrokeJoin(Paint.Join.ROUND);
        p.setStrokeWidth(1.5f);
        int save = canvas.save();
        canvas.translate(bounds.left, bounds.top);
        canvas.scale(bounds.width() / 16f, bounds.height() / 16f);
        if (kind == 5) { // Mylist folder
            canvas.drawRoundRect(1.5f, 4.7f, 14.5f, 13.5f, 1.7f, 1.7f, p);
            canvas.drawLine(3, 4.7f, 3, 3f, p);
            canvas.drawLine(3, 3f, 7, 3f, p);
            canvas.drawLine(5, 8.2f, 11, 8.2f, p);
            canvas.drawLine(5, 10.6f, 9.7f, 10.6f, p);
        } else if (kind == 6) { // Temporary mylist, bookmark and dot
            canvas.drawLine(4, 2, 12, 2, p);
            canvas.drawLine(4, 2, 4, 14, p);
            canvas.drawLine(12, 2, 12, 14, p);
            canvas.drawLine(4, 14, 8, 11, p);
            canvas.drawLine(8, 11, 12, 14, p);
            canvas.drawCircle(8, 6.7f, 1.3f, p);
        } else if (kind == 7) { // NicoRepo, newspaper
            canvas.drawRoundRect(2, 2, 14, 14, 1.1f, 1.1f, p);
            canvas.drawRect(4, 4.2f, 8, 8.2f, p);
            canvas.drawLine(10, 4.2f, 12, 4.2f, p);
            canvas.drawLine(10, 6.3f, 12, 6.3f, p);
            canvas.drawLine(4, 10.3f, 12, 10.3f, p);
            canvas.drawLine(4, 12.3f, 11, 12.3f, p);
        } else if (kind == 8) { // Local playlists, play glyph in a list
            canvas.drawRoundRect(1.5f, 3f, 14.5f, 13.5f, 1.5f, 1.5f, p);
            canvas.drawLine(4, 5.5f, 4, 10.8f, p);
            canvas.drawLine(4, 5.5f, 8.8f, 8.1f, p);
            canvas.drawLine(4, 10.8f, 8.8f, 8.1f, p);
            canvas.drawLine(10.4f, 6, 12.2f, 6, p);
            canvas.drawLine(10.4f, 9.8f, 12.2f, 9.8f, p);
        }
        canvas.restoreToCount(save);
    }

    public static void describe(View cell, Object tab) {
        int code = badge(tab);
        if (cell == null || code == 0) return;
        Context c = cell.getContext();
        String lang = c.getResources().getConfiguration().locale.getLanguage();
        String ja = code == 5 ? "マイリスト" : code == 6 ? "とりあえずマイリスト"
                : code == 7 ? "ニコレポ" : "本体プレイリスト";
        String en = code == 5 ? "Mylist" : code == 6 ? "Temporary Mylist"
                : code == 7 ? "NicoRepo" : "Local playlists";
        try {
            cell.setContentDescription(("ja".equals(lang) ? ja : en) + ": " + str(tab, "label"));
        } catch (Exception ignored) { }
    }
}