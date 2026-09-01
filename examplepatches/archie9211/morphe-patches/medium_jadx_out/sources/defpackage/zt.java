package defpackage;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.Region;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import com.medium.reader.R;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zt extends ViewGroup implements pd8, f12, nx8, yp8 {
    public final cd8 a;
    public final View b;
    public final mx8 c;
    public m45 d;
    public boolean e;
    public m45 f;
    public m45 g;
    public r28 h;
    public x45 i;
    public m73 j;
    public x45 k;
    public iy6 l;
    public hpb m;
    public final int[] n;
    public long o;
    public z4f p;
    public x45 q;
    public final yt r;
    public final yt s;
    public x45 t;
    public final int[] u;
    public int v;
    public int w;
    public final qd8 x;
    public boolean y;
    public final aq6 z;

    public zt(Context context, n65 n65Var, int i, cd8 cd8Var, View view, mx8 mx8Var) {
        super(context);
        this.a = cd8Var;
        this.b = view;
        this.c = mx8Var;
        f78 f78Var = t5f.a;
        setTag(R.id.androidx_compose_ui_view_composition_context, n65Var);
        int i2 = 0;
        setSaveFromParentEnabled(false);
        addView(view);
        due dueVar = (due) this;
        st stVar = new st(dueVar, i2);
        WeakHashMap weakHashMap = ute.a;
        f4f.a(this, stVar);
        mte.c(this, this);
        this.d = co.n;
        this.f = co.m;
        this.g = co.l;
        o28 o28Var = o28.b;
        this.h = o28Var;
        this.j = sgg.n();
        int i3 = 2;
        this.n = new int[2];
        this.o = 0L;
        int i4 = 1;
        this.r = new yt(dueVar, i4);
        this.s = new yt(dueVar, i2);
        this.u = new int[2];
        this.v = Integer.MIN_VALUE;
        this.w = Integer.MIN_VALUE;
        this.x = new qd8();
        aq6 aq6Var = new aq6(3);
        aq6Var.o = dueVar;
        r28 r28VarA = wxb.a(rv8.J(o28Var, s42.a, cd8Var), true, fn.m);
        yb9 yb9Var = new yb9();
        yb9Var.b = new ut(dueVar, i3);
        k0b k0bVar = new k0b();
        k0b k0bVar2 = yb9Var.c;
        if (k0bVar2 != null) {
            k0bVar2.b = null;
        }
        yb9Var.c = k0bVar;
        k0bVar.b = yb9Var;
        setOnRequestDisallowInterceptTouchEvent$ui(k0bVar);
        r28 r28VarB = pwd.V(guc.A(r28VarA.b(yb9Var), new vt(dueVar, aq6Var, dueVar)), new tt(dueVar, aq6Var, i3)).b(new ly0(new ut(dueVar, i4)));
        aq6Var.d0(this.h.b(r28VarB));
        int i5 = 5;
        this.i = new jr(aq6Var, i5, r28VarB);
        aq6Var.Z(this.j);
        this.k = new ce(i5, aq6Var);
        aq6Var.M = new tt(dueVar, aq6Var, i2);
        aq6Var.N = new ut(dueVar, i2);
        aq6Var.c0(new qr(dueVar, i4, aq6Var));
        this.z = aq6Var;
    }

    public static b36 d(b36 b36Var, int i, int i2, int i3, int i4) {
        int i5 = b36Var.a - i;
        if (i5 < 0) {
            i5 = 0;
        }
        int i6 = b36Var.b - i2;
        if (i6 < 0) {
            i6 = 0;
        }
        int i7 = b36Var.c - i3;
        if (i7 < 0) {
            i7 = 0;
        }
        int i8 = b36Var.d - i4;
        return b36.c(i5, i6, i7, i8 >= 0 ? i8 : 0);
    }

    public static int f(int i, int i2, int i3) {
        return (i3 >= 0 || i == i2) ? View.MeasureSpec.makeMeasureSpec(iq7.v(i3, i, i2), 1073741824) : (i3 != -2 || i2 == Integer.MAX_VALUE) ? (i3 != -1 || i2 == Integer.MAX_VALUE) ? View.MeasureSpec.makeMeasureSpec(0, 0) : View.MeasureSpec.makeMeasureSpec(i2, 1073741824) : View.MeasureSpec.makeMeasureSpec(i2, Integer.MIN_VALUE);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final px8 getSnapshotObserver() {
        if (!isAttachedToWindow()) {
            b26.b("Expected AndroidViewHolder to be attached when observing reads.");
        }
        return ((mn) this.c).getSnapshotObserver();
    }

    @Override // defpackage.yp8
    public final z4f W(View view, z4f z4fVar) {
        this.p = new z4f(z4fVar);
        return e(z4fVar);
    }

    @Override // defpackage.f12
    public final void a() {
        this.g.invoke();
    }

    @Override // defpackage.f12
    public final void b() {
        this.f.invoke();
        removeAllViewsInLayout();
    }

    public final z4f e(z4f z4fVar) {
        w4f w4fVar = z4fVar.a;
        b36 b36VarI = w4fVar.i(-1);
        b36 b36Var = b36.e;
        if (!b36VarI.equals(b36Var) || !w4fVar.j(-9).equals(b36Var) || w4fVar.h() != null) {
            l26 l26Var = (l26) this.z.F.d;
            if (l26Var.S.n) {
                long jC0 = d46.c0(l26Var.I(0L));
                int i = (int) (jC0 >> 32);
                if (i < 0) {
                    i = 0;
                }
                int i2 = (int) (jC0 & 4294967295L);
                if (i2 < 0) {
                    i2 = 0;
                }
                long j = sgg.K(l26Var).j();
                int i3 = (int) (j >> 32);
                int i4 = (int) (j & 4294967295L);
                long j2 = l26Var.c;
                long jC02 = d46.c0(l26Var.I((((long) Float.floatToRawIntBits((int) (j2 >> 32))) << 32) | (((long) Float.floatToRawIntBits((int) (j2 & 4294967295L))) & 4294967295L)));
                int i5 = i3 - ((int) (jC02 >> 32));
                if (i5 < 0) {
                    i5 = 0;
                }
                int i6 = i4 - ((int) (4294967295L & jC02));
                int i7 = i6 >= 0 ? i6 : 0;
                if (i != 0 || i2 != 0 || i5 != 0 || i7 != 0) {
                    return z4fVar.a.r(i, i2, i5, i7);
                }
            }
        }
        return z4fVar;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean gatherTransparentRegion(Region region) {
        if (region == null) {
            return true;
        }
        int[] iArr = this.u;
        getLocationInWindow(iArr);
        int i = iArr[0];
        region.op(i, iArr[1], getWidth() + i, getHeight() + iArr[1], Region.Op.DIFFERENCE);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public CharSequence getAccessibilityClassName() {
        return getClass().getName();
    }

    public final m73 getDensity() {
        return this.j;
    }

    public final View getInteropView() {
        return this.b;
    }

    public final aq6 getLayoutNode() {
        return this.z;
    }

    @Override // android.view.View
    public ViewGroup.LayoutParams getLayoutParams() {
        ViewGroup.LayoutParams layoutParams = this.b.getLayoutParams();
        return layoutParams == null ? new ViewGroup.LayoutParams(-1, -1) : layoutParams;
    }

    public final iy6 getLifecycleOwner() {
        return this.l;
    }

    public final r28 getModifier() {
        return this.h;
    }

    @Override // android.view.ViewGroup
    public int getNestedScrollAxes() {
        qd8 qd8Var = this.x;
        return qd8Var.b | qd8Var.a;
    }

    public final x45 getOnDensityChanged$ui() {
        return this.k;
    }

    public final x45 getOnModifierChanged$ui() {
        return this.i;
    }

    public final x45 getOnRequestDisallowInterceptTouchEvent$ui() {
        return this.t;
    }

    public final m45 getRelease() {
        return this.g;
    }

    public final m45 getReset() {
        return this.f;
    }

    public final hpb getSavedStateRegistryOwner() {
        return this.m;
    }

    public final m45 getUpdate() {
        return this.d;
    }

    public final View getView() {
        return this.b;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final ViewParent invalidateChildInParent(int[] iArr, Rect rect) {
        super.invalidateChildInParent(iArr, rect);
        if (!this.y) {
            this.z.C();
            return null;
        }
        this.b.postOnAnimation(new wm(3, this.s));
        return null;
    }

    @Override // android.view.View
    public final boolean isNestedScrollingEnabled() {
        return this.b.isNestedScrollingEnabled();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.r.invoke();
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onDescendantInvalidated(View view, View view2) {
        super.onDescendantInvalidated(view, view2);
        if (!this.y) {
            this.z.C();
        } else {
            this.b.postOnAnimation(new wm(3, this.s));
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        getSnapshotObserver().a.b(this);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        this.b.layout(0, 0, i3 - i, i4 - i2);
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        View view = this.b;
        if (view.getParent() != this) {
            setMeasuredDimension(View.MeasureSpec.getSize(i), View.MeasureSpec.getSize(i2));
            return;
        }
        if (view.getVisibility() == 8) {
            setMeasuredDimension(0, 0);
            return;
        }
        view.measure(i, i2);
        setMeasuredDimension(view.getMeasuredWidth(), view.getMeasuredHeight());
        this.v = i;
        this.w = i2;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedFling(View view, float f, float f2, boolean z) {
        if (!this.b.isNestedScrollingEnabled()) {
            return false;
        }
        vx0.c0(this.a.c(), null, null, new wt(z, this, ok7.u(f * (-1.0f), f2 * (-1.0f)), null), 3);
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedPreFling(View view, float f, float f2) {
        if (!this.b.isNestedScrollingEnabled()) {
            return false;
        }
        vx0.c0(this.a.c(), null, null, new xt(this, ok7.u(f * (-1.0f), f2 * (-1.0f)), null, 0), 3);
        return false;
    }

    @Override // defpackage.od8
    public final void onNestedPreScroll(View view, int i, int i2, int[] iArr, int i3) {
        if (this.b.isNestedScrollingEnabled()) {
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(i * (-1.0f))) << 32) | (((long) Float.floatToRawIntBits(i2 * (-1.0f))) & 4294967295L);
            int i4 = i3 == 0 ? 1 : 2;
            hd8 hd8VarD = this.a.d();
            long jK = hd8VarD != null ? hd8VarD.K(i4, jFloatToRawIntBits) : 0L;
            iArr[0] = jq7.i(Float.intBitsToFloat((int) (jK >> 32)));
            iArr[1] = jq7.i(Float.intBitsToFloat((int) (jK & 4294967295L)));
        }
    }

    @Override // defpackage.pd8
    public final void onNestedScroll(View view, int i, int i2, int i3, int i4, int i5, int[] iArr) {
        if (this.b.isNestedScrollingEnabled()) {
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(i * (-1.0f))) << 32) | (((long) Float.floatToRawIntBits(i2 * (-1.0f))) & 4294967295L);
            long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(i3 * (-1.0f))) << 32) | (((long) Float.floatToRawIntBits(i4 * (-1.0f))) & 4294967295L);
            int i6 = i5 == 0 ? 1 : 2;
            hd8 hd8VarD = this.a.d();
            long jN0 = hd8VarD != null ? hd8VarD.n0(jFloatToRawIntBits, jFloatToRawIntBits2, i6) : 0L;
            iArr[0] = jq7.i(Float.intBitsToFloat((int) (jN0 >> 32)));
            iArr[1] = jq7.i(Float.intBitsToFloat((int) (jN0 & 4294967295L)));
        }
    }

    @Override // defpackage.od8
    public final void onNestedScrollAccepted(View view, View view2, int i, int i2) {
        qd8 qd8Var = this.x;
        if (i2 == 1) {
            qd8Var.b = i;
        } else {
            qd8Var.a = i;
        }
    }

    @Override // defpackage.od8
    public final boolean onStartNestedScroll(View view, View view2, int i, int i2) {
        return ((i & 2) == 0 && (i & 1) == 0) ? false : true;
    }

    @Override // defpackage.od8
    public final void onStopNestedScroll(View view, int i) {
        qd8 qd8Var = this.x;
        if (i == 1) {
            qd8Var.b = 0;
        } else {
            qd8Var.a = 0;
        }
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i) {
        super.onWindowVisibilityChanged(i);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z) {
        x45 x45Var = this.q;
        if (x45Var == null) {
            return true;
        }
        x45Var.invoke(rect != null ? new zwa(rect.left, rect.top, rect.right, rect.bottom) : null);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z) {
        x45 x45Var = this.t;
        if (x45Var != null) {
            x45Var.invoke(Boolean.valueOf(z));
        }
        super.requestDisallowInterceptTouchEvent(z);
    }

    public final void setDensity(m73 m73Var) {
        if (m73Var != this.j) {
            this.j = m73Var;
            x45 x45Var = this.k;
            if (x45Var != null) {
                x45Var.invoke(m73Var);
            }
        }
    }

    public final void setLifecycleOwner(iy6 iy6Var) {
        if (iy6Var != this.l) {
            this.l = iy6Var;
            setTag(R.id.view_tree_lifecycle_owner, iy6Var);
        }
    }

    public final void setModifier(r28 r28Var) {
        if (r28Var != this.h) {
            this.h = r28Var;
            x45 x45Var = this.i;
            if (x45Var != null) {
                x45Var.invoke(r28Var);
            }
        }
    }

    public final void setOnDensityChanged$ui(x45 x45Var) {
        this.k = x45Var;
    }

    public final void setOnModifierChanged$ui(x45 x45Var) {
        this.i = x45Var;
    }

    public final void setOnRequestDisallowInterceptTouchEvent$ui(x45 x45Var) {
        this.t = x45Var;
    }

    public final void setRelease(m45 m45Var) {
        this.g = m45Var;
    }

    public final void setReset(m45 m45Var) {
        this.f = m45Var;
    }

    public final void setSavedStateRegistryOwner(hpb hpbVar) {
        if (hpbVar != this.m) {
            this.m = hpbVar;
            setTag(R.id.view_tree_saved_state_registry_owner, hpbVar);
        }
    }

    public final void setUpdate(m45 m45Var) {
        this.d = m45Var;
        this.e = true;
        this.r.invoke();
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return true;
    }

    @Override // defpackage.nx8
    public final boolean t() {
        return isAttachedToWindow();
    }

    @Override // defpackage.od8
    public final void onNestedScroll(View view, int i, int i2, int i3, int i4, int i5) {
        if (this.b.isNestedScrollingEnabled()) {
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(i * (-1.0f))) << 32) | (((long) Float.floatToRawIntBits(i2 * (-1.0f))) & 4294967295L);
            long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(i3 * (-1.0f))) << 32) | (((long) Float.floatToRawIntBits(i4 * (-1.0f))) & 4294967295L);
            int i6 = i5 == 0 ? 1 : 2;
            hd8 hd8VarD = this.a.d();
            if (hd8VarD != null) {
                hd8VarD.n0(jFloatToRawIntBits, jFloatToRawIntBits2, i6);
            }
        }
    }
}
