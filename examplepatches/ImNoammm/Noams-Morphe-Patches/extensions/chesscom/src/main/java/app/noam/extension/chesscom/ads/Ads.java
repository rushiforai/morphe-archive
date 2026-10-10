package app.noam.extension.chesscom.ads;

import java.lang.reflect.Constructor;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;

/**
 * Every ad waits on one "ads enabled" state, which is off for members, so it stays off here. The
 * game-over screens check the account's show_ads flag instead, so that reads off too.
 */
public final class Ads {
    private static Object noAds;

    private Ads() {}

    public static boolean enabled() {
        return Features.noAdsPatched() && Features.isEnabled(Features.NO_ADS);
    }

    public static boolean showAds(boolean original) {
        return original && !enabled();
    }

    /** The app's "ads enabled" state flow, or one that stays false. */
    public static Object adsEnabled(Object original) {
        if (!enabled()) return original;
        if (noAds == null) {
            try {
                // StateFlowImpl is not public: open its constructor first.
                Constructor<?> constructor = Class.forName("kotlinx.coroutines.flow.StateFlowImpl")
                    .getDeclaredConstructor(Object.class);
                constructor.setAccessible(true);
                noAds = constructor.newInstance(Boolean.FALSE);
            } catch (Throwable throwable) {
                Utils.logError("No ads failed", throwable);
                return original;
            }
        }
        return noAds;
    }
}
