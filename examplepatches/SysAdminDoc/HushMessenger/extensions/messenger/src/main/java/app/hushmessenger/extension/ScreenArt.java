package app.hushmessenger.extension;

import android.content.Context;
import android.content.res.Resources;
import android.util.TypedValue;
import java.util.function.ToIntFunction;

/**
 * Whether this Messenger download carries pictures for the phone's screen. APKMirror lists builds made for one screen
 * density (120-160, 240, 320, 480 or 640 dpi) beside the full ones, and Android stretches a low one's icons until they
 * look blurry and jagged (#91). The launcher art says which kind this is, since every build ships it at its densities.
 */
final class ScreenArt {
    private ScreenArt() {}

    /** The dpi of the launcher art Android picked for this screen, or 0 when it can't tell. Tests swap it. */
    static ToIntFunction<Context> artDpi = ScreenArt::launcherArtDpi;

    static int launcherArtDpi(Context context) {
        Resources resources = context.getResources();
        for (String owner : new String[] {"com.facebook.orca", context.getPackageName()}) {
            int id = resources.getIdentifier("launcher_icon_foreground", "mipmap", owner);
            if (id == 0) continue;
            try {
                TypedValue value = new TypedValue();
                resources.getValue(id, value, true);
                return value.density;
            } catch (Resources.NotFoundException gone) {
                return 0;
            }
        }
        return 0;
    }

    /** True when the art is stretched by half again or more, where icons visibly soften. */
    static boolean blurry(int art, int screen) {
        if (art <= 0 || art >= TypedValue.DENSITY_NONE - 1 || screen <= 0) return false;
        return (long) art * 3 <= (long) screen * 2;
    }
}
