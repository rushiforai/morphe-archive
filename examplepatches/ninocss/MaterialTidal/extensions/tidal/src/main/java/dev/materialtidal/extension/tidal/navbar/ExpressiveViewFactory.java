package dev.materialtidal.extension.tidal.navbar;

import android.content.Context;
import android.view.View;

import dev.materialtidal.extension.tidal.collection.ExpressiveCollectionBridge;
import dev.materialtidal.extension.tidal.player.ExpressivePlayerBridge;

/**
 * Function1-compatible bridge factory for Compose {@code AndroidView} interop.
 * At patch time, {@code ExpressiveNavbarPatch} / {@code ExpressivePlayerPatch} / {@code ExpressiveMediaPagesPatch} adds TIDAL's
 * obfuscated {@code kotlin.jvm.functions.Function1} interface ({@code Lbn7;}) to this class.
 */
@SuppressWarnings("unused")
public final class ExpressiveViewFactory {

    public static final int MODE_CREATE_NAVBAR = 1;
    public static final int MODE_UPDATE_NAVBAR = 2;
    public static final int MODE_CREATE_MINIPLAYER = 3;
    public static final int MODE_UPDATE_MINIPLAYER = 4;
    public static final int MODE_CREATE_PLAYER = 5;
    public static final int MODE_UPDATE_PLAYER = 6;
    public static final int MODE_CREATE_COLLECTION_GRID = 7;
    public static final int MODE_UPDATE_COLLECTION_GRID = 8;

    private final int mode;

    public ExpressiveViewFactory(int mode) {
        this.mode = mode;
    }

    public Object invoke(Object arg) {
        switch (mode) {
            case MODE_CREATE_NAVBAR:
                return ExpressiveScaffoldBridge.createNavbarView((Context) arg);
            case MODE_UPDATE_NAVBAR:
                if (arg instanceof View) {
                    ExpressiveScaffoldBridge.updateNavbarView((View) arg);
                }
                return null;
            case MODE_CREATE_MINIPLAYER:
                return ExpressiveScaffoldBridge.createMiniPlayerView((Context) arg);
            case MODE_UPDATE_MINIPLAYER:
                if (arg instanceof View) {
                    ExpressiveScaffoldBridge.updateMiniPlayerView((View) arg);
                }
                return null;
            case MODE_CREATE_PLAYER:
                return ExpressivePlayerBridge.createPlayerView((Context) arg);
            case MODE_UPDATE_PLAYER:
                if (arg instanceof View) {
                    ExpressivePlayerBridge.updatePlayerView((View) arg);
                }
                return null;
            case MODE_CREATE_COLLECTION_GRID:
                return ExpressiveCollectionBridge.createCollectionGridView((Context) arg);
            case MODE_UPDATE_COLLECTION_GRID:
                if (arg instanceof View) {
                    ExpressiveCollectionBridge.updateCollectionGridView((View) arg);
                }
                return null;
            default:
                return null;
        }
    }
}
