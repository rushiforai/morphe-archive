package com.amplitude.android.internal.gestures;

import android.annotation.SuppressLint;
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

@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0010\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0001¢\u0006\u0002\u0010\u0003J\u0012\u0010\u0006\u001a\u00020\u00072\b\u0010\b\u001a\u0004\u0018\u00010\tH\u0016J\u0012\u0010\n\u001a\u00020\u00072\b\u0010\b\u001a\u0004\u0018\u00010\u000bH\u0016J\u0012\u0010\f\u001a\u00020\u00072\b\u0010\b\u001a\u0004\u0018\u00010\u000bH\u0016J\u0012\u0010\r\u001a\u00020\u00072\b\u0010\b\u001a\u0004\u0018\u00010\u000eH\u0016J\u0012\u0010\u000f\u001a\u00020\u00072\b\u0010\b\u001a\u0004\u0018\u00010\tH\u0016J\u0012\u0010\u0010\u001a\u00020\u00072\b\u0010\b\u001a\u0004\u0018\u00010\tH\u0016J\u0012\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0016J\u0012\u0010\u0015\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0016J\b\u0010\u0016\u001a\u00020\u0012H\u0016J\b\u0010\u0017\u001a\u00020\u0012H\u0016J\u0018\u0010\u0018\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001cH\u0016J\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u001e2\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\b\u0010\u001f\u001a\u00020\u0012H\u0016J\u0018\u0010 \u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\"H\u0016J\u0018\u0010#\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001cH\u0016J\u0018\u0010$\u001a\u00020\u00122\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001cH\u0016J\"\u0010%\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00020\u001a2\b\u0010&\u001a\u0004\u0018\u00010\u001e2\u0006\u0010\u001b\u001a\u00020\u001cH\u0016J\b\u0010'\u001a\u00020\u0007H\u0016J\u0012\u0010'\u001a\u00020\u00072\b\u0010(\u001a\u0004\u0018\u00010)H\u0017J\u0012\u0010*\u001a\u00020\u00122\b\u0010+\u001a\u0004\u0018\u00010,H\u0016J\u0010\u0010-\u001a\u00020\u00122\u0006\u0010.\u001a\u00020\u0007H\u0016J\u0014\u0010/\u001a\u0004\u0018\u00010\u00142\b\u00100\u001a\u0004\u0018\u000101H\u0016J\u001c\u0010/\u001a\u0004\u0018\u00010\u00142\b\u00100\u001a\u0004\u0018\u0001012\u0006\u00102\u001a\u00020\u001aH\u0017R\u0011\u0010\u0002\u001a\u00020\u0001¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u0005¨\u00063"}, d2 = {"Lcom/amplitude/android/internal/gestures/WindowCallbackAdapter;", "Landroid/view/Window$Callback;", "delegate", "(Landroid/view/Window$Callback;)V", "getDelegate", "()Landroid/view/Window$Callback;", "dispatchGenericMotionEvent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, DatabaseConstants.EVENT_FIELD, "Landroid/view/MotionEvent;", "dispatchKeyEvent", "Landroid/view/KeyEvent;", "dispatchKeyShortcutEvent", "dispatchPopulateAccessibilityEvent", "Landroid/view/accessibility/AccessibilityEvent;", "dispatchTouchEvent", "dispatchTrackballEvent", "onActionModeFinished", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "mode", "Landroid/view/ActionMode;", "onActionModeStarted", "onAttachedToWindow", "onContentChanged", "onCreatePanelMenu", "featureId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "menu", "Landroid/view/Menu;", "onCreatePanelView", "Landroid/view/View;", "onDetachedFromWindow", "onMenuItemSelected", "item", "Landroid/view/MenuItem;", "onMenuOpened", "onPanelClosed", "onPreparePanel", "view", "onSearchRequested", "searchEvent", "Landroid/view/SearchEvent;", "onWindowAttributesChanged", "attrs", "Landroid/view/WindowManager$LayoutParams;", "onWindowFocusChanged", "hasFocus", "onWindowStartingActionMode", "callback", "Landroid/view/ActionMode$Callback;", TTConst.TRACK_TYPE, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class WindowCallbackAdapter implements Window.Callback {

    @NotNull
    private final Window.Callback delegate;

    public WindowCallbackAdapter(@NotNull Window.Callback delegate) {
        Intrinsics.g(delegate, "delegate");
        this.delegate = delegate;
    }

    @Override // android.view.Window.Callback
    public boolean dispatchGenericMotionEvent(@Nullable MotionEvent event) {
        return this.delegate.dispatchGenericMotionEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyEvent(@Nullable KeyEvent event) {
        return this.delegate.dispatchKeyEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyShortcutEvent(@Nullable KeyEvent event) {
        return this.delegate.dispatchKeyShortcutEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchPopulateAccessibilityEvent(@Nullable AccessibilityEvent event) {
        return this.delegate.dispatchPopulateAccessibilityEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTouchEvent(@Nullable MotionEvent event) {
        return this.delegate.dispatchTouchEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTrackballEvent(@Nullable MotionEvent event) {
        return this.delegate.dispatchTrackballEvent(event);
    }

    @NotNull
    public final Window.Callback getDelegate() {
        return this.delegate;
    }

    @Override // android.view.Window.Callback
    public void onActionModeFinished(@Nullable ActionMode mode) {
        this.delegate.onActionModeFinished(mode);
    }

    @Override // android.view.Window.Callback
    public void onActionModeStarted(@Nullable ActionMode mode) {
        this.delegate.onActionModeStarted(mode);
    }

    @Override // android.view.Window.Callback
    public void onAttachedToWindow() {
        this.delegate.onAttachedToWindow();
    }

    @Override // android.view.Window.Callback
    public void onContentChanged() {
        this.delegate.onContentChanged();
    }

    @Override // android.view.Window.Callback
    public boolean onCreatePanelMenu(int featureId, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        return this.delegate.onCreatePanelMenu(featureId, menu);
    }

    @Override // android.view.Window.Callback
    @Nullable
    public View onCreatePanelView(int featureId) {
        return this.delegate.onCreatePanelView(featureId);
    }

    @Override // android.view.Window.Callback
    public void onDetachedFromWindow() {
        this.delegate.onDetachedFromWindow();
    }

    @Override // android.view.Window.Callback
    public boolean onMenuItemSelected(int featureId, @NotNull MenuItem item) {
        Intrinsics.g(item, "item");
        return this.delegate.onMenuItemSelected(featureId, item);
    }

    @Override // android.view.Window.Callback
    public boolean onMenuOpened(int featureId, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        return this.delegate.onMenuOpened(featureId, menu);
    }

    @Override // android.view.Window.Callback
    public void onPanelClosed(int featureId, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        this.delegate.onPanelClosed(featureId, menu);
    }

    @Override // android.view.Window.Callback
    public boolean onPreparePanel(int featureId, @Nullable View view, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        return this.delegate.onPreparePanel(featureId, view, menu);
    }

    @Override // android.view.Window.Callback
    public boolean onSearchRequested() {
        return this.delegate.onSearchRequested();
    }

    @Override // android.view.Window.Callback
    public void onWindowAttributesChanged(@Nullable WindowManager.LayoutParams attrs) {
        this.delegate.onWindowAttributesChanged(attrs);
    }

    @Override // android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        this.delegate.onWindowFocusChanged(hasFocus);
    }

    @Override // android.view.Window.Callback
    @Nullable
    public ActionMode onWindowStartingActionMode(@Nullable ActionMode.Callback callback) {
        return this.delegate.onWindowStartingActionMode(callback);
    }

    @Override // android.view.Window.Callback
    @SuppressLint({"NewApi"})
    public boolean onSearchRequested(@Nullable SearchEvent searchEvent) {
        return this.delegate.onSearchRequested(searchEvent);
    }

    @Override // android.view.Window.Callback
    @SuppressLint({"NewApi"})
    @Nullable
    public ActionMode onWindowStartingActionMode(@Nullable ActionMode.Callback callback, int type) {
        return this.delegate.onWindowStartingActionMode(callback, type);
    }
}
