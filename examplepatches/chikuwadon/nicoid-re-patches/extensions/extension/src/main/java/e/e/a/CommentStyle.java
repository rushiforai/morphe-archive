package e.e.a;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.view.View;

/** Configure the shared comment paint before layout measures any comment text. */
public final class CommentStyle {
    private static volatile SharedPreferences preferences;
    private static volatile boolean bold;
    private static final SharedPreferences.OnSharedPreferenceChangeListener listener = (prefs, key) -> {
        if ("comment_bold".equals(key)) bold = prefs.getBoolean(key, false);
    };
    private CommentStyle() { }
    public static void bind(View renderer) {
        try {
            String field = "e.e.a.u".equals(renderer.getClass().getName()) ? "r0" : "s0";
            Paint paint = (Paint) renderer.getClass().getField(field).get(renderer);
            apply(paint, renderer.getContext());
        } catch (Exception error) {
            android.util.Log.w("nicoid-comment-style", "Could not configure comment font", error);
        }
    }
    public static boolean apply(Paint paint, Context context) {
        if (preferences == null) initialize(context);
        boolean requested = bold;
        if (paint.isFakeBoldText() == requested) return false;
        paint.setFakeBoldText(requested);
        paint.setTypeface(Typeface.create(paint.getTypeface(), requested ? Typeface.BOLD : Typeface.NORMAL));
        return true;
    }
    private static synchronized void initialize(Context context) {
        if (preferences != null) return;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        prefs.registerOnSharedPreferenceChangeListener(listener);
        bold = prefs.getBoolean("comment_bold", false);
        preferences = prefs;
    }
}
