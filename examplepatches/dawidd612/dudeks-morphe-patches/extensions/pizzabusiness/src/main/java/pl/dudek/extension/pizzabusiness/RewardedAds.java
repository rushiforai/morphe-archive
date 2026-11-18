package pl.dudek.extension.pizzabusiness;

import com.tapblaze.pizzabusiness.IronSourceWrapper;
import org.cocos2dx.lib.Cocos2dxHelper;

/** Enable the game's local reward bridge independently of an ad network fill. */
public final class RewardedAds {
    private RewardedAds() {}

    public static void initialize() {
        // Native readiness callbacks schedule Cocos nodes. Always use the game
        // queue: the original initialization caller need not be the GL thread.
        Cocos2dxHelper.runOnGLThread(new Runnable() {
            @Override public void run() {
                IronSourceWrapper.onInitialized();
                IronSourceWrapper.onVideoReady();
            }
        });
    }
}
