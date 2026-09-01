package defpackage;

import android.graphics.Rect;
import android.os.Build;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import com.medium.reader.R;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dd9 extends x0 {
    public final k49 A;
    public boolean B;
    public final int[] C;
    public m45 j;
    public hd9 k;
    public String l;
    public final View m;
    public final boolean n;
    public final jzb o;
    public final WindowManager p;
    public final WindowManager.LayoutParams q;
    public gd9 r;
    public ip6 s;
    public final k49 t;
    public final k49 u;
    public o46 v;
    public final j83 w;
    public final Rect x;
    public final gjc y;
    public xy z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dd9(m45 m45Var, hd9 hd9Var, String str, View view, m73 m73Var, gd9 gd9Var, UUID uuid, boolean z) {
        super(view.getContext(), null);
        int i = Build.VERSION.SDK_INT;
        jzb fd9Var = i >= 30 ? new fd9() : i >= 29 ? new ed9() : new jzb();
        this.j = m45Var;
        this.k = hd9Var;
        this.l = str;
        this.m = view;
        this.n = z;
        this.o = fd9Var;
        Object systemService = view.getContext().getSystemService("window");
        systemService.getClass();
        this.p = (WindowManager) systemService;
        WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams();
        layoutParams.gravity = 8388659;
        hd9 hd9Var2 = this.k;
        boolean zB = tr.b(view);
        boolean z2 = hd9Var2.b;
        int i2 = hd9Var2.a;
        if (z2 && zB) {
            i2 |= 8192;
        } else if (z2 && !zB) {
            i2 &= -8193;
        }
        layoutParams.flags = i2;
        layoutParams.type = this.k.g;
        layoutParams.token = view.getApplicationWindowToken();
        layoutParams.width = -2;
        layoutParams.height = -2;
        layoutParams.format = -3;
        layoutParams.setTitle(view.getContext().getResources().getString(R.string.default_popup_window_title));
        this.q = layoutParams;
        this.r = gd9Var;
        this.s = ip6.Ltr;
        this.t = qo7.u(null);
        this.u = qo7.u(null);
        this.w = bjc.b(new bd9(0, this));
        this.x = new Rect();
        this.y = new gjc(new pr(this, 2));
        setId(android.R.id.content);
        setTag(R.id.view_tree_lifecycle_owner, fp7.k(view));
        setTag(R.id.view_tree_view_model_store_owner, hp7.z(view));
        setTag(R.id.view_tree_saved_state_registry_owner, gp7.k(view));
        setTag(R.id.compose_view_saveable_id_tag, "Popup:" + uuid);
        setClipChildren(false);
        setElevation(m73Var.Z(8.0f));
        setOutlineProvider(new vb3(2));
        this.A = qo7.u(oz1.a);
        this.C = new int[2];
    }

    private final b55 getContent() {
        return (b55) this.A.getValue();
    }

    private final o46 getDisplayBounds() {
        int i = this.k.a & 512;
        View view = this.m;
        Rect rect = this.x;
        jzb jzbVar = this.o;
        if (i == 0) {
            jzbVar.getClass();
            view.getWindowVisibleDisplayFrame(rect);
        } else {
            jzbVar.q(rect, view);
        }
        return new o46(rect.left, rect.top, rect.right, rect.bottom);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final hp6 getParentLayoutCoordinates() {
        return (hp6) this.u.getValue();
    }

    private final void setContent(b55 b55Var) {
        this.A.setValue(b55Var);
    }

    private final void setParentLayoutCoordinates(hp6 hp6Var) {
        this.u.setValue(hp6Var);
    }

    @Override // defpackage.x0
    public final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-857613600);
        int i2 = (p65Var.h(this) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            getContent().invoke(p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w0(this, i, 7);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (!this.k.c) {
            return super.dispatchKeyEvent(keyEvent);
        }
        if (keyEvent.getKeyCode() == 4 || keyEvent.getKeyCode() == 111) {
            KeyEvent.DispatcherState keyDispatcherState = getKeyDispatcherState();
            if (keyDispatcherState == null) {
                return super.dispatchKeyEvent(keyEvent);
            }
            if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                keyDispatcherState.startTracking(keyEvent, this);
                return true;
            }
            if (keyEvent.getAction() == 1 && keyDispatcherState.isTracking(keyEvent) && !keyEvent.isCanceled()) {
                m45 m45Var = this.j;
                if (m45Var != null) {
                    m45Var.invoke();
                }
                return true;
            }
        }
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override // defpackage.x0
    public final void g(boolean z, int i, int i2, int i3, int i4) {
        View childAt;
        super.g(z, i, i2, i3, i4);
        if (this.k.f || (childAt = getChildAt(0)) == null) {
            return;
        }
        int measuredWidth = childAt.getMeasuredWidth();
        WindowManager.LayoutParams layoutParams = this.q;
        layoutParams.width = measuredWidth;
        layoutParams.height = childAt.getMeasuredHeight();
        this.o.getClass();
        this.p.updateViewLayout(this, layoutParams);
    }

    public final boolean getCanCalculatePosition() {
        return ((Boolean) this.w.getValue()).booleanValue();
    }

    public final WindowManager.LayoutParams getParams$ui() {
        return this.q;
    }

    public final ip6 getParentLayoutDirection() {
        return this.s;
    }

    /* JADX INFO: renamed from: getPopupContentSize-bOM6tXw, reason: not valid java name */
    public final s46 m103getPopupContentSizebOM6tXw() {
        return (s46) this.t.getValue();
    }

    public final gd9 getPositionProvider() {
        return this.r;
    }

    @Override // defpackage.x0
    public boolean getShouldCreateCompositionOnAttachedToWindow() {
        return this.B;
    }

    public final String getTestTag() {
        return this.l;
    }

    public View getViewRoot() {
        return null;
    }

    @Override // defpackage.x0
    public final void h(int i, int i2) {
        if (this.k.f) {
            super.h(i, i2);
        } else {
            o46 displayBounds = getDisplayBounds();
            super.h(View.MeasureSpec.makeMeasureSpec(displayBounds.d(), Integer.MIN_VALUE), View.MeasureSpec.makeMeasureSpec(displayBounds.b(), Integer.MIN_VALUE));
        }
    }

    public final void m(l22 l22Var, b55 b55Var) {
        setParentCompositionContext(l22Var);
        setContent(b55Var);
        this.B = true;
    }

    public final void n(m45 m45Var, hd9 hd9Var, String str, ip6 ip6Var) {
        this.j = m45Var;
        this.l = str;
        if (!g76.L(this.k, hd9Var)) {
            boolean z = hd9Var.f;
            WindowManager.LayoutParams layoutParams = this.q;
            if (z && !this.k.f) {
                layoutParams.width = -2;
                layoutParams.height = -2;
            }
            this.k = hd9Var;
            boolean zB = tr.b(this.m);
            boolean z2 = hd9Var.b;
            int i = hd9Var.a;
            if (z2 && zB) {
                i |= 8192;
            } else if (z2 && !zB) {
                i &= -8193;
            }
            layoutParams.flags = i;
            this.o.getClass();
            this.p.updateViewLayout(this, layoutParams);
        }
        int i2 = ad9.a[ip6Var.ordinal()];
        int i3 = 1;
        if (i2 == 1) {
            i3 = 0;
        } else if (i2 != 2) {
            ygf.a();
            return;
        }
        super.setLayoutDirection(i3);
    }

    public final void o() {
        hp6 parentLayoutCoordinates = getParentLayoutCoordinates();
        if (parentLayoutCoordinates != null) {
            if (!parentLayoutCoordinates.m()) {
                parentLayoutCoordinates = null;
            }
            if (parentLayoutCoordinates == null) {
                return;
            }
            long j = parentLayoutCoordinates.j();
            long jP = this.n ? parentLayoutCoordinates.p(0L) : parentLayoutCoordinates.d(0L);
            o46 o46VarS = g76.s((((long) Math.round(Float.intBitsToFloat((int) (jP >> 32)))) << 32) | (4294967295L & ((long) Math.round(Float.intBitsToFloat((int) (jP & 4294967295L))))), j);
            if (o46VarS.equals(this.v)) {
                return;
            }
            this.v = o46VarS;
            q();
        }
    }

    @Override // defpackage.x0, android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.y.e();
        if (!this.k.c || Build.VERSION.SDK_INT < 33) {
            return;
        }
        xy xyVar = this.z;
        if (xyVar == null) {
            xy xyVar2 = new xy(0, this.j);
            this.z = xyVar2;
            xyVar = xyVar2;
        }
        v4.s(this, xyVar);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        gjc gjcVar = this.y;
        o19 o19Var = gjcVar.h;
        if (o19Var != null) {
            o19Var.b();
        }
        gjcVar.a();
        if (Build.VERSION.SDK_INT >= 33) {
            v4.t(this, this.z);
        }
        this.z = null;
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (!this.k.d) {
            return super.onTouchEvent(motionEvent);
        }
        if (motionEvent != null && motionEvent.getAction() == 0 && (motionEvent.getX() < 0.0f || motionEvent.getX() >= getWidth() || motionEvent.getY() < 0.0f || motionEvent.getY() >= getHeight())) {
            m45 m45Var = this.j;
            if (m45Var != null) {
                m45Var.invoke();
            }
            return true;
        }
        if (motionEvent == null || motionEvent.getAction() != 4) {
            return super.onTouchEvent(motionEvent);
        }
        m45 m45Var2 = this.j;
        if (m45Var2 != null) {
            m45Var2.invoke();
        }
        return true;
    }

    public final void p(hp6 hp6Var) {
        setParentLayoutCoordinates(hp6Var);
        o();
    }

    public final void q() {
        s46 s46VarM103getPopupContentSizebOM6tXw;
        o46 o46Var = this.v;
        if (o46Var == null || (s46VarM103getPopupContentSizebOM6tXw = m103getPopupContentSizebOM6tXw()) == null) {
            return;
        }
        long j = s46VarM103getPopupContentSizebOM6tXw.a;
        o46 displayBounds = getDisplayBounds();
        long jB = (((long) displayBounds.b()) & 4294967295L) | (((long) displayBounds.d()) << 32);
        qya qyaVar = new qya();
        qyaVar.a = 0L;
        this.y.d(this, ox8.e, new cd9(qyaVar, this, o46Var, jB, j));
        long j2 = qyaVar.a;
        WindowManager.LayoutParams layoutParams = this.q;
        layoutParams.x = (int) (j2 >> 32);
        layoutParams.y = (int) (j2 & 4294967295L);
        boolean z = this.k.e;
        jzb jzbVar = this.o;
        if (z) {
            jzbVar.A(this, (int) (jB >> 32), (int) (jB & 4294967295L));
        }
        jzbVar.getClass();
        this.p.updateViewLayout(this, layoutParams);
    }

    public final void setParentLayoutDirection(ip6 ip6Var) {
        this.s = ip6Var;
    }

    /* JADX INFO: renamed from: setPopupContentSize-fhxjrPA, reason: not valid java name */
    public final void m104setPopupContentSizefhxjrPA(s46 s46Var) {
        this.t.setValue(s46Var);
    }

    public final void setPositionProvider(gd9 gd9Var) {
        this.r = gd9Var;
    }

    public final void setTestTag(String str) {
        this.l = str;
    }

    public static /* synthetic */ void getParams$ui$annotations() {
    }

    public x0 getSubCompositionView() {
        return this;
    }

    @Override // android.view.View
    public void setLayoutDirection(int i) {
    }
}
