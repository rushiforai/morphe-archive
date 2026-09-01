package sprig.graphics;

import android.content.Context;
import android.graphics.Point;
import android.view.ActionMode;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import defpackage.x45;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003\u0012\u0012\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00050\u0003¢\u0006\u0004\b\t\u0010\nJ \u0010\u000f\u001a\u00020\u000e2\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010\u000b0\u000bH\u0096\u0001¢\u0006\u0004\b\u000f\u0010\u0010J \u0010\u0012\u001a\u00020\u000e2\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010\u00110\u0011H\u0096\u0001¢\u0006\u0004\b\u0012\u0010\u0013J \u0010\u0014\u001a\u00020\u000e2\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010\u00110\u0011H\u0096\u0001¢\u0006\u0004\b\u0014\u0010\u0013J \u0010\u0016\u001a\u00020\u000e2\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010\u00150\u0015H\u0096\u0001¢\u0006\u0004\b\u0016\u0010\u0017J \u0010\u0018\u001a\u00020\u000e2\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010\u000b0\u000bH\u0096\u0001¢\u0006\u0004\b\u0018\u0010\u0010J \u0010\u001a\u001a\u00020\u00052\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010\u00190\u0019H\u0096\u0001¢\u0006\u0004\b\u001a\u0010\u001bJ \u0010\u001c\u001a\u00020\u00052\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010\u00190\u0019H\u0096\u0001¢\u0006\u0004\b\u001c\u0010\u001bJ\u0010\u0010\u001d\u001a\u00020\u0005H\u0096\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0005H\u0096\u0001¢\u0006\u0004\b\u001f\u0010\u001eJ\"\u0010#\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020 2\b\b\u0001\u0010\"\u001a\u00020!H\u0096\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010&\u001a\u0004\u0018\u00010%2\u0006\u0010\r\u001a\u00020 H\u0097\u0001¢\u0006\u0004\b&\u0010'J\u0010\u0010(\u001a\u00020\u0005H\u0096\u0001¢\u0006\u0004\b(\u0010\u001eJ\"\u0010*\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020 2\b\b\u0001\u0010\"\u001a\u00020)H\u0096\u0001¢\u0006\u0004\b*\u0010+J\"\u0010,\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020 2\b\b\u0001\u0010\"\u001a\u00020!H\u0096\u0001¢\u0006\u0004\b,\u0010$J\"\u0010-\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020 2\b\b\u0001\u0010\"\u001a\u00020!H\u0096\u0001¢\u0006\u0004\b-\u0010.J.\u00100\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020 2\n\b\u0001\u0010\"\u001a\u0004\u0018\u00010%2\b\b\u0001\u0010/\u001a\u00020!H\u0096\u0001¢\u0006\u0004\b0\u00101J\u0010\u00102\u001a\u00020\u000eH\u0096\u0001¢\u0006\u0004\b2\u00103J \u00102\u001a\u00020\u000e2\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010404H\u0096\u0001¢\u0006\u0004\b2\u00105J \u00107\u001a\u00020\u00052\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010606H\u0096\u0001¢\u0006\u0004\b7\u00108J\u0018\u00109\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eH\u0096\u0001¢\u0006\u0004\b9\u0010:J\"\u0010<\u001a\u0004\u0018\u00010\u00192\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010;0;H\u0097\u0001¢\u0006\u0004\b<\u0010=J*\u0010<\u001a\u0004\u0018\u00010\u00192\u000e\u0010\r\u001a\n \f*\u0004\u0018\u00010;0;2\u0006\u0010\"\u001a\u00020 H\u0097\u0001¢\u0006\u0004\b<\u0010>J\u0017\u0010@\u001a\u00020\u000e2\u0006\u0010?\u001a\u00020\u000bH\u0016¢\u0006\u0004\b@\u0010\u0010R\u0014\u0010\u0002\u001a\u00020\u00018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bA\u0010BR#\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00038\u0006¢\u0006\f\n\u0004\bC\u0010D\u001a\u0004\bE\u0010FR#\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00050\u00038\u0006¢\u0006\f\n\u0004\bG\u0010D\u001a\u0004\bH\u0010FR\u0018\u0010L\u001a\u0004\u0018\u00010I8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bJ\u0010K¨\u0006M"}, d2 = {"Lsprig/h/m;", "Landroid/view/Window$Callback;", "delegate", "Lkotlin/Function1;", "Landroid/graphics/Point;", "Lc1e;", "onTouch", "Lsprig/d/b$c;", "onSwipe", "<init>", "(Landroid/view/Window$Callback;Lx45;Lx45;)V", "Landroid/view/MotionEvent;", "kotlin.jvm.PlatformType", "p0", "", "dispatchGenericMotionEvent", "(Landroid/view/MotionEvent;)Z", "Landroid/view/KeyEvent;", "dispatchKeyEvent", "(Landroid/view/KeyEvent;)Z", "dispatchKeyShortcutEvent", "Landroid/view/accessibility/AccessibilityEvent;", "dispatchPopulateAccessibilityEvent", "(Landroid/view/accessibility/AccessibilityEvent;)Z", "dispatchTrackballEvent", "Landroid/view/ActionMode;", "onActionModeFinished", "(Landroid/view/ActionMode;)V", "onActionModeStarted", "onAttachedToWindow", "()V", "onContentChanged", "", "Landroid/view/Menu;", "p1", "onCreatePanelMenu", "(ILandroid/view/Menu;)Z", "Landroid/view/View;", "onCreatePanelView", "(I)Landroid/view/View;", "onDetachedFromWindow", "Landroid/view/MenuItem;", "onMenuItemSelected", "(ILandroid/view/MenuItem;)Z", "onMenuOpened", "onPanelClosed", "(ILandroid/view/Menu;)V", "p2", "onPreparePanel", "(ILandroid/view/View;Landroid/view/Menu;)Z", "onSearchRequested", "()Z", "Landroid/view/SearchEvent;", "(Landroid/view/SearchEvent;)Z", "Landroid/view/WindowManager$LayoutParams;", "onWindowAttributesChanged", "(Landroid/view/WindowManager$LayoutParams;)V", "onWindowFocusChanged", "(Z)V", "Landroid/view/ActionMode$Callback;", "onWindowStartingActionMode", "(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;", "(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;", "event", "dispatchTouchEvent", "a", "Landroid/view/Window$Callback;", "b", "Lx45;", "getOnTouch", "()Lx45;", "c", "getOnSwipe", "Landroid/view/GestureDetector;", "d", "Landroid/view/GestureDetector;", "gestureDetector", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class m implements Window.Callback {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final Window.Callback delegate;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final x45 onTouch;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final x45 onSwipe;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public GestureDetector gestureDetector;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0006"}, d2 = {"sprig/h/m$a", "Landroid/view/GestureDetector$SimpleOnGestureListener;", "Landroid/view/MotionEvent;", "e", "", "onSingleTapUp", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class a extends GestureDetector.SimpleOnGestureListener {
        public a() {
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onSingleTapUp(MotionEvent e) {
            e.getClass();
            m.this.getOnTouch().invoke(new Point((int) e.getX(), (int) e.getY()));
            return true;
        }
    }

    public m(Window.Callback callback, x45 x45Var, x45 x45Var2) {
        callback.getClass();
        x45Var.getClass();
        x45Var2.getClass();
        this.delegate = callback;
        this.onTouch = x45Var;
        this.onSwipe = x45Var2;
        this.gestureDetector = new GestureDetector((Context) null, new a());
    }

    @Override // android.view.Window.Callback
    public boolean dispatchGenericMotionEvent(MotionEvent p0) {
        return this.delegate.dispatchGenericMotionEvent(p0);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent p0) {
        return this.delegate.dispatchKeyEvent(p0);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyShortcutEvent(KeyEvent p0) {
        return this.delegate.dispatchKeyShortcutEvent(p0);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent p0) {
        return this.delegate.dispatchPopulateAccessibilityEvent(p0);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTouchEvent(MotionEvent event) {
        event.getClass();
        GestureDetector gestureDetector = this.gestureDetector;
        if (gestureDetector != null) {
            gestureDetector.onTouchEvent(event);
        }
        return this.delegate.dispatchTouchEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTrackballEvent(MotionEvent p0) {
        return this.delegate.dispatchTrackballEvent(p0);
    }

    public final x45 getOnSwipe() {
        return this.onSwipe;
    }

    public final x45 getOnTouch() {
        return this.onTouch;
    }

    @Override // android.view.Window.Callback
    public void onActionModeFinished(ActionMode p0) {
        this.delegate.onActionModeFinished(p0);
    }

    @Override // android.view.Window.Callback
    public void onActionModeStarted(ActionMode p0) {
        this.delegate.onActionModeStarted(p0);
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
    public boolean onCreatePanelMenu(int p0, Menu p1) {
        p1.getClass();
        return this.delegate.onCreatePanelMenu(p0, p1);
    }

    @Override // android.view.Window.Callback
    public View onCreatePanelView(int p0) {
        return this.delegate.onCreatePanelView(p0);
    }

    @Override // android.view.Window.Callback
    public void onDetachedFromWindow() {
        this.delegate.onDetachedFromWindow();
    }

    @Override // android.view.Window.Callback
    public boolean onMenuItemSelected(int p0, MenuItem p1) {
        p1.getClass();
        return this.delegate.onMenuItemSelected(p0, p1);
    }

    @Override // android.view.Window.Callback
    public boolean onMenuOpened(int p0, Menu p1) {
        p1.getClass();
        return this.delegate.onMenuOpened(p0, p1);
    }

    @Override // android.view.Window.Callback
    public void onPanelClosed(int p0, Menu p1) {
        p1.getClass();
        this.delegate.onPanelClosed(p0, p1);
    }

    @Override // android.view.Window.Callback
    public boolean onPreparePanel(int p0, View p1, Menu p2) {
        p2.getClass();
        return this.delegate.onPreparePanel(p0, p1, p2);
    }

    @Override // android.view.Window.Callback
    public boolean onSearchRequested() {
        return this.delegate.onSearchRequested();
    }

    @Override // android.view.Window.Callback
    public void onWindowAttributesChanged(WindowManager.LayoutParams p0) {
        this.delegate.onWindowAttributesChanged(p0);
    }

    @Override // android.view.Window.Callback
    public void onWindowFocusChanged(boolean p0) {
        this.delegate.onWindowFocusChanged(p0);
    }

    @Override // android.view.Window.Callback
    public ActionMode onWindowStartingActionMode(ActionMode.Callback p0) {
        return this.delegate.onWindowStartingActionMode(p0);
    }

    @Override // android.view.Window.Callback
    public boolean onSearchRequested(SearchEvent p0) {
        return this.delegate.onSearchRequested(p0);
    }

    @Override // android.view.Window.Callback
    public ActionMode onWindowStartingActionMode(ActionMode.Callback p0, int p1) {
        return this.delegate.onWindowStartingActionMode(p0, p1);
    }
}
