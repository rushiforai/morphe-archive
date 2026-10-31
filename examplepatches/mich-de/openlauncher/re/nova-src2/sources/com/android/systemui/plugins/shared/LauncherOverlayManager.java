package com.android.systemui.plugins.shared;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import java.io.PrintWriter;

/* loaded from: classes.dex */
public interface LauncherOverlayManager extends Application.ActivityLifecycleCallbacks {

    public interface LauncherOverlay {
        void onScrollChange(float f11, boolean z11);

        void onScrollInteractionBegin();

        void onScrollInteractionEnd();

        void setOverlayCallbacks(LauncherOverlayCallbacks launcherOverlayCallbacks);
    }

    public interface LauncherOverlayCallbacks {
        void onScrollChanged(float f11);
    }

    default void dump(String str, PrintWriter printWriter) {
    }

    default void hideOverlay(int i5) {
    }

    default boolean isShowing() {
        return false;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    default void onActivityCreated(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    default void onActivityDestroyed(Activity activity) {
    }

    default void onActivityFocusedResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    default void onActivityPaused(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    default void onActivityResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    default void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    default void onActivityStarted(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    default void onActivityStopped(Activity activity) {
    }

    default void onAttachedToWindow() {
    }

    default void onDetachedFromWindow() {
    }

    default void onDeviceProvideChanged() {
    }

    default void openOverlay() {
    }

    default boolean startSearch(byte[] bArr, Bundle bundle) {
        return false;
    }

    default void hideOverlay(boolean z11) {
        hideOverlay(z11 ? 200 : 0);
    }
}
