package app.fblite.research;

import android.content.Context;

/** Runs right after FeedFontPatch.loadRasterizer and records which X.0eF the class loader returns. Research only. */
public final class PreloadProbe {
    public static volatile String result = "not run";

    public static void run(Context context) {
        try {
            ClassLoader app = PreloadProbe.class.getClassLoader();
            Class<?> c = Class.forName("X.0eF", false, app);
            boolean ours;
            try {
                c.getDeclaredField("EM_PER_BOX_HEIGHT");
                ours = true;
            } catch (NoSuchFieldException e) {
                ours = false;
            }
            result = "ours=" + ours + " parent=" + app.getParent();
        } catch (Throwable t) {
            result = "error " + t;
        }
    }
}
