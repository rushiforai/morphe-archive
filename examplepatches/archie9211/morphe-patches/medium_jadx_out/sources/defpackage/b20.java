package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.widget.PopupWindow;
import androidx.appcompat.widget.ActionBarContextView;
import androidx.appcompat.widget.ViewStubCompat;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b20 implements Window.Callback {
    public final Window.Callback a;
    public boolean b;
    public boolean c;
    public boolean d;
    public final /* synthetic */ f20 e;

    public b20(f20 f20Var, Window.Callback callback) {
        this.e = f20Var;
        if (callback != null) {
            this.a = callback;
        } else {
            ay0.e("Window callback may not be null");
            throw null;
        }
    }

    public final void a(Window.Callback callback) {
        try {
            this.b = true;
            callback.onContentChanged();
        } finally {
            this.b = false;
        }
    }

    public final boolean b(int i, Menu menu) {
        return this.a.onMenuOpened(i, menu);
    }

    public final void c(int i, Menu menu) {
        this.a.onPanelClosed(i, menu);
    }

    public final void d(List list, Menu menu, int i) {
        r3f.a(this.a, list, menu, i);
    }

    @Override // android.view.Window.Callback
    public final boolean dispatchGenericMotionEvent(MotionEvent motionEvent) {
        return this.a.dispatchGenericMotionEvent(motionEvent);
    }

    @Override // android.view.Window.Callback
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        boolean z = this.c;
        Window.Callback callback = this.a;
        return z ? callback.dispatchKeyEvent(keyEvent) : this.e.t(keyEvent) || callback.dispatchKeyEvent(keyEvent);
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x003c  */
    @Override // android.view.Window.Callback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean dispatchKeyShortcutEvent(android.view.KeyEvent r6) {
        /*
            r5 = this;
            android.view.Window$Callback r0 = r5.a
            boolean r0 = r0.dispatchKeyShortcutEvent(r6)
            r1 = 1
            if (r0 != 0) goto L6a
            int r0 = r6.getKeyCode()
            f20 r5 = r5.e
            r5.A()
            v3f r2 = r5.n
            r3 = 0
            if (r2 == 0) goto L3c
            u3f r2 = r2.i
            if (r2 != 0) goto L1d
        L1b:
            r0 = r3
            goto L39
        L1d:
            lx7 r2 = r2.e
            if (r2 == 0) goto L1b
            int r4 = r6.getDeviceId()
            android.view.KeyCharacterMap r4 = android.view.KeyCharacterMap.load(r4)
            int r4 = r4.getKeyboardType()
            if (r4 == r1) goto L31
            r4 = r1
            goto L32
        L31:
            r4 = r3
        L32:
            r2.setQwertyMode(r4)
            boolean r0 = r2.performShortcut(r0, r6, r3)
        L39:
            if (r0 == 0) goto L3c
            goto L6a
        L3c:
            e20 r0 = r5.M
            if (r0 == 0) goto L51
            int r2 = r6.getKeyCode()
            boolean r0 = r5.F(r0, r2, r6)
            if (r0 == 0) goto L51
            e20 r5 = r5.M
            if (r5 == 0) goto L6a
            r5.l = r1
            return r1
        L51:
            e20 r0 = r5.M
            if (r0 != 0) goto L69
            e20 r0 = r5.z(r3)
            r5.G(r0, r6)
            int r2 = r6.getKeyCode()
            boolean r5 = r5.F(r0, r2, r6)
            r0.k = r3
            if (r5 == 0) goto L69
            goto L6a
        L69:
            return r3
        L6a:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b20.dispatchKeyShortcutEvent(android.view.KeyEvent):boolean");
    }

    @Override // android.view.Window.Callback
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return this.a.dispatchPopulateAccessibilityEvent(accessibilityEvent);
    }

    @Override // android.view.Window.Callback
    public final boolean dispatchTouchEvent(MotionEvent motionEvent) {
        return this.a.dispatchTouchEvent(motionEvent);
    }

    @Override // android.view.Window.Callback
    public final boolean dispatchTrackballEvent(MotionEvent motionEvent) {
        return this.a.dispatchTrackballEvent(motionEvent);
    }

    @Override // android.view.Window.Callback
    public final void onActionModeFinished(ActionMode actionMode) {
        this.a.onActionModeFinished(actionMode);
    }

    @Override // android.view.Window.Callback
    public final void onActionModeStarted(ActionMode actionMode) {
        this.a.onActionModeStarted(actionMode);
    }

    @Override // android.view.Window.Callback
    public final void onAttachedToWindow() {
        this.a.onAttachedToWindow();
    }

    @Override // android.view.Window.Callback
    public final void onContentChanged() {
        if (this.b) {
            this.a.onContentChanged();
        }
    }

    @Override // android.view.Window.Callback
    public final boolean onCreatePanelMenu(int i, Menu menu) {
        if (i != 0 || (menu instanceof lx7)) {
            return this.a.onCreatePanelMenu(i, menu);
        }
        return false;
    }

    @Override // android.view.Window.Callback
    public final View onCreatePanelView(int i) {
        return this.a.onCreatePanelView(i);
    }

    @Override // android.view.Window.Callback
    public final void onDetachedFromWindow() {
        this.a.onDetachedFromWindow();
    }

    @Override // android.view.Window.Callback
    public final boolean onMenuItemSelected(int i, MenuItem menuItem) {
        return this.a.onMenuItemSelected(i, menuItem);
    }

    @Override // android.view.Window.Callback
    public final boolean onMenuOpened(int i, Menu menu) {
        b(i, menu);
        if (i == 108) {
            f20 f20Var = this.e;
            f20Var.A();
            v3f v3fVar = f20Var.n;
            if (v3fVar != null) {
                ArrayList arrayList = v3fVar.m;
                if (true != v3fVar.l) {
                    v3fVar.l = true;
                    if (arrayList.size() > 0) {
                        arrayList.get(0).getClass();
                        rd6.m();
                        return false;
                    }
                }
            }
        }
        return true;
    }

    @Override // android.view.Window.Callback
    public final void onPanelClosed(int i, Menu menu) {
        if (this.d) {
            this.a.onPanelClosed(i, menu);
            return;
        }
        c(i, menu);
        f20 f20Var = this.e;
        if (i != 108) {
            if (i == 0) {
                e20 e20VarZ = f20Var.z(i);
                if (e20VarZ.m) {
                    f20Var.r(e20VarZ, false);
                    return;
                }
                return;
            }
            return;
        }
        f20Var.A();
        v3f v3fVar = f20Var.n;
        if (v3fVar != null) {
            ArrayList arrayList = v3fVar.m;
            if (v3fVar.l) {
                v3fVar.l = false;
                if (arrayList.size() <= 0) {
                    return;
                }
                arrayList.get(0).getClass();
                rd6.m();
            }
        }
    }

    @Override // android.view.Window.Callback
    public final void onPointerCaptureChanged(boolean z) {
        s3f.a(this.a, z);
    }

    @Override // android.view.Window.Callback
    public final boolean onPreparePanel(int i, View view, Menu menu) {
        lx7 lx7Var = menu instanceof lx7 ? (lx7) menu : null;
        if (i == 0 && lx7Var == null) {
            return false;
        }
        if (lx7Var != null) {
            lx7Var.x = true;
        }
        boolean zOnPreparePanel = this.a.onPreparePanel(i, view, menu);
        if (lx7Var != null) {
            lx7Var.x = false;
        }
        return zOnPreparePanel;
    }

    @Override // android.view.Window.Callback
    public final void onProvideKeyboardShortcuts(List list, Menu menu, int i) {
        lx7 lx7Var = this.e.z(0).h;
        if (lx7Var != null) {
            d(list, lx7Var, i);
        } else {
            d(list, menu, i);
        }
    }

    @Override // android.view.Window.Callback
    public final boolean onSearchRequested(SearchEvent searchEvent) {
        return q3f.a(this.a, searchEvent);
    }

    @Override // android.view.Window.Callback
    public final void onWindowAttributesChanged(WindowManager.LayoutParams layoutParams) {
        this.a.onWindowAttributesChanged(layoutParams);
    }

    @Override // android.view.Window.Callback
    public final void onWindowFocusChanged(boolean z) {
        this.a.onWindowFocusChanged(z);
    }

    @Override // android.view.Window.Callback
    public final ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int i) {
        ViewGroup viewGroup;
        f20 f20Var = this.e;
        Context context = f20Var.k;
        if (!f20Var.y || i != 0) {
            return q3f.b(this.a, callback, i);
        }
        o2b o2bVar = new o2b(context, callback);
        l6 l6Var = f20Var.t;
        if (l6Var != null) {
            l6Var.b();
        }
        lig ligVar = new lig(f20Var, 7, o2bVar);
        f20Var.A();
        v3f v3fVar = f20Var.n;
        int i2 = 1;
        if (v3fVar != null) {
            u3f u3fVar = v3fVar.i;
            if (u3fVar != null) {
                u3fVar.b();
            }
            v3fVar.c.setHideOnContentScrollEnabled(false);
            v3fVar.f.e();
            u3f u3fVar2 = new u3f(v3fVar, v3fVar.f.getContext(), ligVar);
            lx7 lx7Var = u3fVar2.e;
            lx7Var.w();
            try {
                if (((o2b) u3fVar2.f.b).A(u3fVar2, lx7Var)) {
                    v3fVar.i = u3fVar2;
                    u3fVar2.j();
                    v3fVar.f.c(u3fVar2);
                    v3fVar.a(true);
                } else {
                    u3fVar2 = null;
                }
                f20Var.t = u3fVar2;
            } finally {
                lx7Var.v();
            }
        }
        if (f20Var.t == null) {
            jve jveVar = f20Var.x;
            if (jveVar != null) {
                jveVar.b();
            }
            l6 l6Var2 = f20Var.t;
            if (l6Var2 != null) {
                l6Var2.b();
            }
            if (f20Var.u == null) {
                if (f20Var.I) {
                    TypedValue typedValue = new TypedValue();
                    Resources.Theme theme = context.getTheme();
                    theme.resolveAttribute(R.attr.actionBarTheme, typedValue, true);
                    if (typedValue.resourceId != 0) {
                        Resources.Theme themeNewTheme = context.getResources().newTheme();
                        themeNewTheme.setTo(theme);
                        themeNewTheme.applyStyle(typedValue.resourceId, true);
                        l92 l92Var = new l92(context, 0);
                        l92Var.getTheme().setTo(themeNewTheme);
                        context = l92Var;
                    }
                    f20Var.u = new ActionBarContextView(context);
                    PopupWindow popupWindow = new PopupWindow(context, (AttributeSet) null, R.attr.actionModePopupWindowStyle);
                    f20Var.v = popupWindow;
                    popupWindow.setWindowLayoutType(2);
                    f20Var.v.setContentView(f20Var.u);
                    f20Var.v.setWidth(-1);
                    context.getTheme().resolveAttribute(R.attr.actionBarSize, typedValue, true);
                    f20Var.u.setContentHeight(TypedValue.complexToDimensionPixelSize(typedValue.data, context.getResources().getDisplayMetrics()));
                    f20Var.v.setHeight(-2);
                    f20Var.w = new u10(f20Var, i2);
                } else {
                    ViewStubCompat viewStubCompat = (ViewStubCompat) f20Var.A.findViewById(R.id.action_mode_bar_stub);
                    if (viewStubCompat != null) {
                        f20Var.A();
                        v3f v3fVar2 = f20Var.n;
                        Context contextB = v3fVar2 != null ? v3fVar2.b() : null;
                        if (contextB != null) {
                            context = contextB;
                        }
                        viewStubCompat.setLayoutInflater(LayoutInflater.from(context));
                        f20Var.u = (ActionBarContextView) viewStubCompat.a();
                    }
                }
            }
            if (f20Var.u != null) {
                jve jveVar2 = f20Var.x;
                if (jveVar2 != null) {
                    jveVar2.b();
                }
                f20Var.u.e();
                Context context2 = f20Var.u.getContext();
                ActionBarContextView actionBarContextView = f20Var.u;
                dnc dncVar = new dnc();
                dncVar.d = context2;
                dncVar.e = actionBarContextView;
                dncVar.f = ligVar;
                lx7 lx7Var2 = new lx7(actionBarContextView.getContext());
                lx7Var2.l = 1;
                dncVar.i = lx7Var2;
                lx7Var2.e = dncVar;
                if (((o2b) ligVar.b).A(dncVar, lx7Var2)) {
                    dncVar.j();
                    f20Var.u.c(dncVar);
                    f20Var.t = dncVar;
                    boolean z = f20Var.z && (viewGroup = f20Var.A) != null && viewGroup.isLaidOut();
                    ActionBarContextView actionBarContextView2 = f20Var.u;
                    if (z) {
                        actionBarContextView2.setAlpha(0.0f);
                        jve jveVarA = ute.a(f20Var.u);
                        jveVarA.a(1.0f);
                        f20Var.x = jveVarA;
                        jveVarA.d(new w10(i2, f20Var));
                    } else {
                        actionBarContextView2.setAlpha(1.0f);
                        f20Var.u.setVisibility(0);
                        if (f20Var.u.getParent() instanceof View) {
                            View view = (View) f20Var.u.getParent();
                            WeakHashMap weakHashMap = ute.a;
                            view.requestApplyInsets();
                        }
                    }
                    if (f20Var.v != null) {
                        f20Var.l.getDecorView().post(f20Var.w);
                    }
                } else {
                    f20Var.t = null;
                }
            }
            f20Var.I();
            f20Var.t = f20Var.t;
        }
        f20Var.I();
        l6 l6Var3 = f20Var.t;
        if (l6Var3 != null) {
            return o2bVar.i(l6Var3);
        }
        return null;
    }

    @Override // android.view.Window.Callback
    public final boolean onSearchRequested() {
        return this.a.onSearchRequested();
    }

    @Override // android.view.Window.Callback
    public final ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
        return null;
    }
}
