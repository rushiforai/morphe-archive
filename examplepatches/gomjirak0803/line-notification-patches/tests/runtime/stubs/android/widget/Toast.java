package android.widget;

import android.content.Context;
import java.util.ArrayList;
import java.util.List;

public class Toast {
    public static final int LENGTH_SHORT = 0;
    private static final List<String> SHOWN = new ArrayList<String>();
    private final String text;

    private Toast(String text) { this.text = text; }

    public static Toast makeText(Context context, CharSequence text, int duration) {
        return new Toast(text == null ? "" : text.toString());
    }

    public void show() {
        synchronized (SHOWN) {
            SHOWN.add(text);
        }
    }

    public static void resetForTest() {
        synchronized (SHOWN) { SHOWN.clear(); }
    }

    public static List<String> shownForTest() {
        synchronized (SHOWN) { return new ArrayList<String>(SHOWN); }
    }
}
