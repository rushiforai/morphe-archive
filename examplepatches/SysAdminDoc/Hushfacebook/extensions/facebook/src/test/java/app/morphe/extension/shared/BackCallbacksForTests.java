/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared;

import static org.junit.Assert.assertNotNull;

import android.content.pm.ApplicationInfo;
import android.view.View;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

import org.robolectric.RuntimeEnvironment;

import java.lang.reflect.Method;

/**
 * Back as Android 16 hands it to an app targeting API 36: to the window's back callbacks, never to
 * a view as a key. Facebook 585 targets 36 and only its HatchChatActivity opts out, so every
 * window Hushfacebook draws over Facebook gets Back this way on Android 16.
 */
public final class BackCallbacksForTests {
    private BackCallbacksForTests() {}

    /** Whether this app's windows hand Back to back callbacks. Read when a window starts, so set it first. */
    public static void on(boolean on) throws ReflectiveOperationException {
        ApplicationInfo info = RuntimeEnvironment.getApplication().getApplicationInfo();
        Method set = ApplicationInfo.class.getDeclaredMethod("setEnableOnBackInvokedCallback", boolean.class);
        set.setAccessible(true);
        set.invoke(info, on);
    }

    /** The callback [view]'s window hands the next Back to. */
    public static OnBackInvokedCallback top(View view) throws ReflectiveOperationException {
        OnBackInvokedDispatcher dispatcher = view.findOnBackInvokedDispatcher();
        assertNotNull("the window has no back dispatcher", dispatcher);
        Method top = dispatcher.getClass().getMethod("getTopCallback");
        OnBackInvokedCallback callback = (OnBackInvokedCallback) top.invoke(dispatcher);
        assertNotNull("the window has no back callback", callback);
        return callback;
    }
}
