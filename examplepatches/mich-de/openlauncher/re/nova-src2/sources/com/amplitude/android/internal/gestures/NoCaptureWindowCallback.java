package com.amplitude.android.internal.gestures;

import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import com.amplitude.android.migration.DatabaseConstants;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016J\u0012\u0010\u0007\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\bH\u0016J\u0012\u0010\t\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\bH\u0016J\u0012\u0010\n\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u000bH\u0016J\u0012\u0010\f\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016J\u0012\u0010\r\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016J\u0012\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011H\u0016J\u0012\u0010\u0012\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011H\u0016J\b\u0010\u0013\u001a\u00020\u000fH\u0016J\b\u0010\u0014\u001a\u00020\u000fH\u0016J\u0018\u0010\u0015\u001a\u00020\u00042\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\b\u0010\u001c\u001a\u00020\u000fH\u0016J\u0018\u0010\u001d\u001a\u00020\u00042\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u001e\u001a\u00020\u001fH\u0016J\u0018\u0010 \u001a\u00020\u00042\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\u0018\u0010!\u001a\u00020\u000f2\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\"\u0010\"\u001a\u00020\u00042\u0006\u0010\u0016\u001a\u00020\u00172\b\u0010#\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\b\u0010$\u001a\u00020\u0004H\u0016J\u0012\u0010$\u001a\u00020\u00042\b\u0010%\u001a\u0004\u0018\u00010&H\u0016J\u0012\u0010'\u001a\u00020\u000f2\b\u0010(\u001a\u0004\u0018\u00010)H\u0016J\u0010\u0010*\u001a\u00020\u000f2\u0006\u0010+\u001a\u00020\u0004H\u0016J\u0014\u0010,\u001a\u0004\u0018\u00010\u00112\b\u0010-\u001a\u0004\u0018\u00010.H\u0016J\u001c\u0010,\u001a\u0004\u0018\u00010\u00112\b\u0010-\u001a\u0004\u0018\u00010.2\u0006\u0010/\u001a\u00020\u0017H\u0016¨\u00060"}, d2 = {"Lcom/amplitude/android/internal/gestures/NoCaptureWindowCallback;", "Landroid/view/Window$Callback;", "()V", "dispatchGenericMotionEvent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, DatabaseConstants.EVENT_FIELD, "Landroid/view/MotionEvent;", "dispatchKeyEvent", "Landroid/view/KeyEvent;", "dispatchKeyShortcutEvent", "dispatchPopulateAccessibilityEvent", "Landroid/view/accessibility/AccessibilityEvent;", "dispatchTouchEvent", "dispatchTrackballEvent", "onActionModeFinished", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "mode", "Landroid/view/ActionMode;", "onActionModeStarted", "onAttachedToWindow", "onContentChanged", "onCreatePanelMenu", "featureId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "menu", "Landroid/view/Menu;", "onCreatePanelView", "Landroid/view/View;", "onDetachedFromWindow", "onMenuItemSelected", "item", "Landroid/view/MenuItem;", "onMenuOpened", "onPanelClosed", "onPreparePanel", "view", "onSearchRequested", "searchEvent", "Landroid/view/SearchEvent;", "onWindowAttributesChanged", "attrs", "Landroid/view/WindowManager$LayoutParams;", "onWindowFocusChanged", "hasFocus", "onWindowStartingActionMode", "callback", "Landroid/view/ActionMode$Callback;", TTConst.TRACK_TYPE, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class NoCaptureWindowCallback implements Window.Callback {
    @Override // android.view.Window.Callback
    public boolean dispatchGenericMotionEvent(@Nullable MotionEvent event) {
        return false;
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyEvent(@Nullable KeyEvent event) {
        return false;
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyShortcutEvent(@Nullable KeyEvent event) {
        return false;
    }

    @Override // android.view.Window.Callback
    public boolean dispatchPopulateAccessibilityEvent(@Nullable AccessibilityEvent event) {
        return false;
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTouchEvent(@Nullable MotionEvent event) {
        return false;
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTrackballEvent(@Nullable MotionEvent event) {
        return false;
    }

    @Override // android.view.Window.Callback
    public void onActionModeFinished(@Nullable ActionMode mode) {
    }

    @Override // android.view.Window.Callback
    public void onActionModeStarted(@Nullable ActionMode mode) {
    }

    @Override // android.view.Window.Callback
    public void onAttachedToWindow() {
    }

    @Override // android.view.Window.Callback
    public void onContentChanged() {
    }

    @Override // android.view.Window.Callback
    public boolean onCreatePanelMenu(int featureId, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        return false;
    }

    @Override // android.view.Window.Callback
    @Nullable
    public View onCreatePanelView(int featureId) {
        return null;
    }

    @Override // android.view.Window.Callback
    public void onDetachedFromWindow() {
    }

    @Override // android.view.Window.Callback
    public boolean onMenuItemSelected(int featureId, @NotNull MenuItem item) {
        Intrinsics.g(item, "item");
        return false;
    }

    @Override // android.view.Window.Callback
    public boolean onMenuOpened(int featureId, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        return false;
    }

    @Override // android.view.Window.Callback
    public void onPanelClosed(int featureId, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
    }

    @Override // android.view.Window.Callback
    public boolean onPreparePanel(int featureId, @Nullable View view, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        return false;
    }

    @Override // android.view.Window.Callback
    public boolean onSearchRequested() {
        return false;
    }

    @Override // android.view.Window.Callback
    public void onWindowAttributesChanged(@Nullable WindowManager.LayoutParams attrs) {
    }

    @Override // android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
    }

    @Override // android.view.Window.Callback
    @Nullable
    public ActionMode onWindowStartingActionMode(@Nullable ActionMode.Callback callback) {
        return null;
    }

    @Override // android.view.Window.Callback
    public boolean onSearchRequested(@Nullable SearchEvent searchEvent) {
        return false;
    }

    @Override // android.view.Window.Callback
    @Nullable
    public ActionMode onWindowStartingActionMode(@Nullable ActionMode.Callback callback, int type) {
        return null;
    }
}
