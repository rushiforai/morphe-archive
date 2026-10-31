package com.dhuadapter.mediabridge;

import android.content.Context;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.util.Log;

import java.lang.reflect.Method;

import com.dhuadapter.core.HookEnv;

import top.canyie.pine.Pine;
import top.canyie.pine.callback.MethodHook;

/**
 * Category 6 — MediaCenter bridge. gate: config.mediaBridge
 *
 * Mirrors the app's own MediaSession to Zeekr MediaCenter (steering-wheel
 * control, cover art, metadata). We hook MediaSession.setActive(true): when the
 * app activates its session we grab its token, build a MediaController, and hand
 * it to MediaBridge which binds + registers with MediaCenter. The shared bridge
 * instance lives in HookEnv.mediaBridge so LifecycleHooks can tear it down.
 */
public final class MediaSessionHooks {

    private static final String TAG = HookEnv.TAG;

    private MediaSessionHooks() {}

    public static void install() {
        if (!HookEnv.config.mediaBridge) {
            Log.i(TAG, "MediaBridge disabled (config.mediaBridge=false)");
            return;
        }
        try {
            Method setActive = MediaSession.class.getMethod("setActive", boolean.class);
            Pine.hook(setActive, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        boolean active = (boolean) callFrame.args[0];
                        if (!active) {
                            return;
                        }
                        MediaSession session = (MediaSession) callFrame.thisObject;
                        if (session == null) {
                            return;
                        }
                        MediaSession.Token token = session.getSessionToken();
                        if (token == null) {
                            return;
                        }
                        Context ctx = HookEnv.appContext;
                        if (ctx == null) {
                            return;
                        }
                        MediaController mc = new MediaController(ctx, token);
                        ensureMediaBridge(ctx).attachController(mc);
                        if (HookEnv.config.debug) {
                            Log.d(TAG, "MediaBridge attached to session "
                                    + session.getClass().getName());
                        }
                    } catch (Throwable t) {
                        Log.e(TAG, "MediaSession.setActive bridge hook failed", t);
                    }
                }
            });
            Log.i(TAG, "MediaBridge hook installed (MediaSession.setActive)");
        } catch (Exception e) {
            Log.e(TAG, "Failed to install MediaBridge hook", e);
        }
    }

    private static synchronized MediaBridge ensureMediaBridge(Context ctx) {
        if (HookEnv.mediaBridge == null) {
            HookEnv.mediaBridge = new MediaBridge(ctx);
        }
        return HookEnv.mediaBridge;
    }
}
