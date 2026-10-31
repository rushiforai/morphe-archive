package b4;

import a5.a0;
import a5.a1;
import a5.f2;
import a5.h2;
import a5.s0;
import a5.y;
import a5.z;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.Region;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.Owner;
import androidx.core.graphics.Insets;
import b0.v0;
import b3.g2;
import b3.t1;
import c3.b4;
import java.util.LinkedHashMap;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Lambda;
import t70.m0;
import z2.r1;

/* loaded from: classes.dex */
public abstract class m extends ViewGroup implements y, p1.k, g2, a0 {

    /* renamed from: z, reason: collision with root package name */
    public static final /* synthetic */ int f17480z = 0;

    /* renamed from: a, reason: collision with root package name */
    public final x7.h f17481a;

    /* renamed from: b, reason: collision with root package name */
    public final View f17482b;

    /* renamed from: c, reason: collision with root package name */
    public final Owner f17483c;

    /* renamed from: d, reason: collision with root package name */
    public Lambda f17484d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f17485e;

    /* renamed from: f, reason: collision with root package name */
    public Lambda f17486f;

    /* renamed from: g, reason: collision with root package name */
    public Lambda f17487g;

    /* renamed from: h, reason: collision with root package name */
    public b2.t f17488h;

    /* renamed from: i, reason: collision with root package name */
    public final d f17489i;

    /* renamed from: j, reason: collision with root package name */
    public y3.c f17490j;

    /* renamed from: k, reason: collision with root package name */
    public final b0.x f17491k;

    /* renamed from: l, reason: collision with root package name */
    public h6.a0 f17492l;

    /* renamed from: m, reason: collision with root package name */
    public a7.h f17493m;
    public final int[] n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public h2 f17494p;

    /* renamed from: q, reason: collision with root package name */
    public final l f17495q;

    /* renamed from: r, reason: collision with root package name */
    public final l f17496r;

    /* renamed from: s, reason: collision with root package name */
    public final f20.h f17497s;

    /* renamed from: t, reason: collision with root package name */
    public final int[] f17498t;

    /* renamed from: u, reason: collision with root package name */
    public int f17499u;

    /* renamed from: v, reason: collision with root package name */
    public int f17500v;

    /* renamed from: w, reason: collision with root package name */
    public final z f17501w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f17502x;

    /* renamed from: y, reason: collision with root package name */
    public final LayoutNode f17503y;

    public m(Context context, androidx.compose.runtime.a aVar, int i5, x7.h hVar, View view, Owner owner) {
        super(context);
        this.f17481a = hVar;
        this.f17482b = view;
        this.f17483c = owner;
        LinkedHashMap linkedHashMap = b4.f19233a;
        setTag(2131427488, aVar);
        int i11 = 0;
        setSaveFromParentEnabled(false);
        addView(view);
        a1.n(this, new a(this));
        s0.l(this, this);
        this.f17484d = k.f17476m;
        this.f17486f = k.f17475l;
        this.f17487g = k.f17474k;
        b2.r rVar = b2.r.f17024a;
        this.f17488h = rVar;
        this.f17490j = v70.o.c();
        int i12 = 2;
        this.n = new int[2];
        this.o = 0L;
        int i13 = 1;
        this.f17495q = new l(this, i13);
        this.f17496r = new l(this, i11);
        this.f17498t = new int[2];
        this.f17499u = Integer.MIN_VALUE;
        this.f17500v = Integer.MIN_VALUE;
        this.f17501w = new z();
        LayoutNode layoutNode = new LayoutNode(false, 0, 3, null);
        layoutNode.setInteropViewFactoryHolder$ui_release(this);
        b2.t tVarB = j3.n.b(androidx.compose.ui.input.nestedscroll.a.a(rVar, o.f17504a, hVar), true, c.f17451l);
        v2.a0 a0Var = new v2.a0();
        a0Var.f91909a = new f(this, i13);
        f20.h hVar2 = new f20.h();
        f20.h hVar3 = a0Var.f91910b;
        if (hVar3 != null) {
            hVar3.f54272b = null;
        }
        a0Var.f91910b = hVar2;
        hVar2.f54272b = a0Var;
        this.f17497s = hVar2;
        b2.t tVarB2 = androidx.compose.ui.layout.b.b(androidx.compose.ui.draw.a.a(tVarB.then(a0Var), new v0(i13, this, layoutNode, this)), new e(this, layoutNode, i12));
        layoutNode.setCompositeKeyHash(i5);
        layoutNode.setModifier(this.f17488h.then(tVarB2));
        this.f17489i = new d(i11, layoutNode, tVarB2);
        layoutNode.setDensity(this.f17490j);
        this.f17491k = new b0.x(layoutNode, 7);
        layoutNode.setOnAttach$ui_release(new e(this, layoutNode, i11));
        layoutNode.setOnDetach$ui_release(new f(this, i11));
        layoutNode.setMeasurePolicy(new h(this, layoutNode));
        this.f17503y = layoutNode;
    }

    public static final int d(m mVar, int i5, int i11, int i12) {
        return (i12 >= 0 || i5 == i11) ? View.MeasureSpec.makeMeasureSpec(kotlin.ranges.a.e0(i12, i5, i11), 1073741824) : (i12 != -2 || i11 == Integer.MAX_VALUE) ? (i12 != -1 || i11 == Integer.MAX_VALUE) ? View.MeasureSpec.makeMeasureSpec(0, 0) : View.MeasureSpec.makeMeasureSpec(i11, 1073741824) : View.MeasureSpec.makeMeasureSpec(i11, Integer.MIN_VALUE);
    }

    public static Insets h(Insets insets, int i5, int i11, int i12, int i13) {
        int i14 = insets.left - i5;
        if (i14 < 0) {
            i14 = 0;
        }
        int i15 = insets.top - i11;
        if (i15 < 0) {
            i15 = 0;
        }
        int i16 = insets.right - i12;
        if (i16 < 0) {
            i16 = 0;
        }
        int i17 = insets.bottom - i13;
        return Insets.of(i14, i15, i16, i17 >= 0 ? i17 : 0);
    }

    @Override // a5.x
    public final void a(int i5, View view) {
        z zVar = this.f17501w;
        if (i5 == 1) {
            zVar.f385b = 0;
        } else {
            zVar.f384a = 0;
        }
    }

    @Override // a5.x
    public final void b(View view, View view2, int i5, int i11) {
        z zVar = this.f17501w;
        if (i11 == 1) {
            zVar.f385b = i5;
        } else {
            zVar.f384a = i5;
        }
    }

    @Override // a5.x
    public final void c(View view, int i5, int i11, int[] iArr, int i12) {
        if (this.f17482b.isNestedScrollingEnabled()) {
            float f11 = i5;
            float f12 = -1;
            long jFloatToRawIntBits = (Float.floatToRawIntBits(f11 * f12) << 32) | (Float.floatToRawIntBits(i11 * f12) & 4294967295L);
            int i13 = i12 == 0 ? 1 : 2;
            u2.f fVar = (u2.f) this.f17481a.f95137b;
            u2.f fVar2 = null;
            if (fVar != null && fVar.getIsAttached()) {
                fVar2 = (u2.f) t2.c.t(fVar);
            }
            long jG = fVar2 != null ? fVar2.g(i13, jFloatToRawIntBits) : 0L;
            iArr[0] = ic.b.z(Float.intBitsToFloat((int) (jG >> 32)));
            iArr[1] = ic.b.z(Float.intBitsToFloat((int) (jG & 4294967295L)));
        }
    }

    @Override // a5.y
    public final void e(View view, int i5, int i11, int i12, int i13, int i14, int[] iArr) {
        if (this.f17482b.isNestedScrollingEnabled()) {
            float f11 = i5;
            float f12 = -1;
            long jFloatToRawIntBits = (Float.floatToRawIntBits(f11 * f12) << 32) | (Float.floatToRawIntBits(i11 * f12) & 4294967295L);
            long jFloatToRawIntBits2 = (Float.floatToRawIntBits(i12 * f12) << 32) | (Float.floatToRawIntBits(i13 * f12) & 4294967295L);
            int i15 = i14 == 0 ? 1 : 2;
            u2.f fVar = (u2.f) this.f17481a.f95137b;
            u2.f fVar2 = null;
            if (fVar != null && fVar.getIsAttached()) {
                fVar2 = (u2.f) t2.c.t(fVar);
            }
            u2.f fVar3 = fVar2;
            long jM = fVar3 != null ? fVar3.m(i15, jFloatToRawIntBits, jFloatToRawIntBits2) : 0L;
            iArr[0] = ic.b.z(Float.intBitsToFloat((int) (jM >> 32)));
            iArr[1] = ic.b.z(Float.intBitsToFloat((int) (jM & 4294967295L)));
        }
    }

    @Override // a5.x
    public final void f(View view, int i5, int i11, int i12, int i13, int i14) {
        if (this.f17482b.isNestedScrollingEnabled()) {
            float f11 = -1;
            long jFloatToRawIntBits = (Float.floatToRawIntBits(i5 * f11) << 32) | (Float.floatToRawIntBits(i11 * f11) & 4294967295L);
            long jFloatToRawIntBits2 = (Float.floatToRawIntBits(i12 * f11) << 32) | (Float.floatToRawIntBits(i13 * f11) & 4294967295L);
            int i15 = i14 == 0 ? 1 : 2;
            u2.f fVar = (u2.f) this.f17481a.f95137b;
            u2.f fVar2 = null;
            if (fVar != null && fVar.getIsAttached()) {
                fVar2 = (u2.f) t2.c.t(fVar);
            }
            if (fVar2 != null) {
                fVar2.m(i15, jFloatToRawIntBits, jFloatToRawIntBits2);
            }
        }
    }

    @Override // a5.x
    public final boolean g(View view, View view2, int i5, int i11) {
        return ((i5 & 2) == 0 && (i5 & 1) == 0) ? false : true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean gatherTransparentRegion(Region region) {
        if (region == null) {
            return true;
        }
        int[] iArr = this.f17498t;
        getLocationInWindow(iArr);
        int i5 = iArr[0];
        region.op(i5, iArr[1], getWidth() + i5, getHeight() + iArr[1], Region.Op.DIFFERENCE);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final CharSequence getAccessibilityClassName() {
        return getClass().getName();
    }

    @Override // android.view.View
    public final ViewGroup.LayoutParams getLayoutParams() {
        ViewGroup.LayoutParams layoutParams = this.f17482b.getLayoutParams();
        return layoutParams == null ? new ViewGroup.LayoutParams(-1, -1) : layoutParams;
    }

    @Override // android.view.ViewGroup
    public final int getNestedScrollAxes() {
        return this.f17501w.a();
    }

    public final h2 i(h2 h2Var) {
        f2 f2Var = h2Var.f296a;
        Insets insetsG = f2Var.g(-1);
        Insets insets = Insets.NONE;
        if (insetsG.equals(insets) && f2Var.h(-9).equals(insets) && f2Var.f() == null) {
            return h2Var;
        }
        t1 innerCoordinator$ui_release = this.f17503y.getInnerCoordinator$ui_release();
        if (innerCoordinator$ui_release.isAttached()) {
            long jN = w.b.n(innerCoordinator$ui_release.M(0L));
            int i5 = (int) (jN >> 32);
            if (i5 < 0) {
                i5 = 0;
            }
            int i11 = (int) (jN & 4294967295L);
            if (i11 < 0) {
                i11 = 0;
            }
            long jG = r1.f(innerCoordinator$ui_release).g();
            int i12 = (int) (jG >> 32);
            int i13 = (int) (jG & 4294967295L);
            long j11 = innerCoordinator$ui_release.f98083c;
            long jN2 = w.b.n(innerCoordinator$ui_release.M((Float.floatToRawIntBits((int) (j11 >> 32)) << 32) | (Float.floatToRawIntBits((int) (j11 & 4294967295L)) & 4294967295L)));
            int i14 = i12 - ((int) (jN2 >> 32));
            if (i14 < 0) {
                i14 = 0;
            }
            int i15 = i13 - ((int) (4294967295L & jN2));
            int i16 = i15 >= 0 ? i15 : 0;
            if (i5 != 0 || i11 != 0 || i14 != 0 || i16 != 0) {
                return h2Var.f296a.n(i5, i11, i14, i16);
            }
        }
        return h2Var;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final ViewParent invalidateChildInParent(int[] iArr, Rect rect) {
        super.invalidateChildInParent(iArr, rect);
        if (!this.f17502x) {
            this.f17503y.invalidateLayer$ui_release();
            return null;
        }
        this.f17482b.postOnAnimation(new b2.b(this.f17496r, 1));
        return null;
    }

    @Override // android.view.View
    public final boolean isNestedScrollingEnabled() {
        return this.f17482b.isNestedScrollingEnabled();
    }

    @Override // b3.g2
    public final boolean isValidOwnerScope() {
        return isAttachedToWindow();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f17495q.invoke();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    @Override // p1.k
    public final void onDeactivate() {
        this.f17486f.invoke();
        removeAllViewsInLayout();
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onDescendantInvalidated(View view, View view2) {
        super.onDescendantInvalidated(view, view2);
        if (!this.f17502x) {
            this.f17503y.invalidateLayer$ui_release();
        } else {
            this.f17482b.postOnAnimation(new b2.b(this.f17496r, 1));
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (!isAttachedToWindow()) {
            y2.a.b("Expected AndroidViewHolder to be attached when observing reads.");
        }
        this.f17483c.getSnapshotObserver().f17258a.b(this);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        this.f17482b.layout(0, 0, i12 - i5, i13 - i11);
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        View view = this.f17482b;
        if (view.getParent() != this) {
            setMeasuredDimension(View.MeasureSpec.getSize(i5), View.MeasureSpec.getSize(i11));
            return;
        }
        if (view.getVisibility() == 8) {
            setMeasuredDimension(0, 0);
            return;
        }
        view.measure(i5, i11);
        setMeasuredDimension(view.getMeasuredWidth(), view.getMeasuredHeight());
        this.f17499u = i5;
        this.f17500v = i11;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedFling(View view, float f11, float f12, boolean z11) {
        if (!this.f17482b.isNestedScrollingEnabled()) {
            return false;
        }
        m0.t(this.f17481a.h(), null, null, new i(z11, this, p6.u.c(f11 * (-1.0f), f12 * (-1.0f)), null, 0), 3);
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedPreFling(View view, float f11, float f12) {
        if (!this.f17482b.isNestedScrollingEnabled()) {
            return false;
        }
        m0.t(this.f17481a.h(), null, null, new j(this, p6.u.c(f11 * (-1.0f), f12 * (-1.0f)), (Continuation) null, 0), 3);
        return false;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    @Override // p1.k
    public final void onRelease() {
        this.f17487g.invoke();
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z11) {
        f20.h hVar = this.f17497s;
        if (hVar != null) {
            hVar.invoke(Boolean.valueOf(z11));
        }
        super.requestDisallowInterceptTouchEvent(z11);
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return true;
    }

    @Override // a5.a0
    public final h2 u(View view, h2 h2Var) {
        this.f17494p = new h2(h2Var);
        return i(h2Var);
    }
}
