package com.stremio.morphe;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;

public final class MorpheNavBridge {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile boolean accountsFocused;
    private static volatile boolean menuFocusInitialized;
    private static volatile boolean nativeMenuFocused;
    private static volatile boolean destinationInitialized;
    private static volatile int destinationId;
    private static volatile Method cachedValueSetter;
    private static WeakReference<Object> menuFocusState = new WeakReference<Object>(null);
    private static WeakReference<MorpheAccountsNavView> accountsView =
            new WeakReference<MorpheAccountsNavView>(null);

    private MorpheNavBridge() {}

    public static void onMenuFocusChanged(final Object state, boolean hasFocus) {
        Object previousState = menuFocusState.get();
        if (menuFocusInitialized && previousState == state && nativeMenuFocused == hasFocus) return;
        menuFocusInitialized = true;
        nativeMenuFocused = hasFocus;
        menuFocusState = new WeakReference<Object>(state);
        MorpheAccountsNavView view = accountsView.get();
        if (view != null) view.setNativeMenuExpanded(hasFocus);
        if (!hasFocus) {
            MAIN.postDelayed(new Runnable() {
                @Override public void run() {
                    if (accountsFocused) setState(state, true);
                }
            }, 80L);
        }
    }

    public static void setAccountsFocused(boolean focused) {
        if (accountsFocused == focused) return;
        accountsFocused = focused;
        Object state = menuFocusState.get();
        if (state != null) setState(state, focused);
    }

    public static void registerAccountsView(MorpheAccountsNavView view) {
        accountsView = new WeakReference<MorpheAccountsNavView>(view);
        if (menuFocusInitialized) view.setNativeMenuExpanded(nativeMenuFocused);
        if (destinationInitialized) view.onDestinationChanged(destinationId);
    }

    public static void onDestinationChanged(int id) {
        if (destinationInitialized && destinationId == id) return;
        destinationInitialized = true;
        destinationId = id;
        MorpheAccountsNavView view = accountsView.get();
        if (view != null) view.onDestinationChanged(id);
    }

    public static boolean isLoginDestination(Context context) {
        if (!destinationInitialized) return true;
        int loginId = context.getResources().getIdentifier(
                "login", "id", context.getPackageName());
        return destinationId == loginId;
    }

    private static void setState(Object state, boolean value) {
        if (state == null) return;
        try {
            Method setter = cachedValueSetter;
            if (setter == null || !setter.getDeclaringClass().isAssignableFrom(state.getClass())) {
                for (Method method : state.getClass().getMethods()) {
                    if ("setValue".equals(method.getName()) && method.getParameterTypes().length == 1) {
                        setter = method;
                        cachedValueSetter = method;
                        break;
                    }
                }
            }
            if (setter != null) setter.invoke(state, Boolean.valueOf(value));
        } catch (Exception ignored) {
            // The explicit backdrop still keeps the rail visually complete if reflection is unavailable.
        }
    }
}
