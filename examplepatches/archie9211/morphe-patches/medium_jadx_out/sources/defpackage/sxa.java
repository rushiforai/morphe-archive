package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.recyclerview.widget.RecyclerView;
import com.medium.android.admin.stagebranch.uG.peNPu;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class sxa {
    public jl1 a;
    public RecyclerView b;
    public final mya c;
    public final mya d;
    public vz6 e;
    public boolean f;
    public boolean g;
    public final boolean h;
    public final boolean i;
    public int j;
    public boolean k;
    public int l;
    public int m;
    public int n;
    public int o;

    public sxa() {
        hha hhaVar = new hha(this);
        my6 my6Var = new my6(this);
        this.c = new mya((gte) hhaVar);
        this.d = new mya((gte) my6Var);
        this.f = false;
        this.g = false;
        this.h = true;
        this.i = true;
    }

    public static int A(View view) {
        Rect rect = ((txa) view.getLayoutParams()).b;
        return view.getMeasuredWidth() + rect.left + rect.right;
    }

    public static int B(View view) {
        return view.getTop() - ((txa) view.getLayoutParams()).b.top;
    }

    public static int H(View view) {
        return ((txa) view.getLayoutParams()).a.b();
    }

    public static rxa I(Context context, AttributeSet attributeSet, int i, int i2) {
        rxa rxaVar = new rxa();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, tra.a, i, i2);
        rxaVar.a = typedArrayObtainStyledAttributes.getInt(0, 1);
        rxaVar.b = typedArrayObtainStyledAttributes.getInt(10, 1);
        rxaVar.c = typedArrayObtainStyledAttributes.getBoolean(9, false);
        rxaVar.d = typedArrayObtainStyledAttributes.getBoolean(11, false);
        typedArrayObtainStyledAttributes.recycle();
        return rxaVar;
    }

    public static boolean N(int i, int i2, int i3) {
        int mode = View.MeasureSpec.getMode(i2);
        int size = View.MeasureSpec.getSize(i2);
        if (i3 > 0 && i != i3) {
            return false;
        }
        if (mode == Integer.MIN_VALUE) {
            return size >= i;
        }
        if (mode != 0) {
            return mode == 1073741824 && size == i;
        }
        return true;
    }

    public static void O(View view, int i, int i2, int i3, int i4) {
        txa txaVar = (txa) view.getLayoutParams();
        Rect rect = txaVar.b;
        view.layout(i + rect.left + ((ViewGroup.MarginLayoutParams) txaVar).leftMargin, i2 + rect.top + ((ViewGroup.MarginLayoutParams) txaVar).topMargin, (i3 - rect.right) - ((ViewGroup.MarginLayoutParams) txaVar).rightMargin, (i4 - rect.bottom) - ((ViewGroup.MarginLayoutParams) txaVar).bottomMargin);
    }

    public static int g(int i, int i2, int i3) {
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        return mode != Integer.MIN_VALUE ? mode != 1073741824 ? Math.max(i2, i3) : size : Math.min(size, Math.max(i2, i3));
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int w(boolean r4, int r5, int r6, int r7, int r8) {
        /*
            int r5 = r5 - r7
            r7 = 0
            int r5 = java.lang.Math.max(r7, r5)
            r0 = -2
            r1 = -1
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = 1073741824(0x40000000, float:2.0)
            if (r4 == 0) goto L1d
            if (r8 < 0) goto L12
        L10:
            r6 = r3
            goto L30
        L12:
            if (r8 != r1) goto L1a
            if (r6 == r2) goto L22
            if (r6 == 0) goto L1a
            if (r6 == r3) goto L22
        L1a:
            r6 = r7
            r8 = r6
            goto L30
        L1d:
            if (r8 < 0) goto L20
            goto L10
        L20:
            if (r8 != r1) goto L24
        L22:
            r8 = r5
            goto L30
        L24:
            if (r8 != r0) goto L1a
            if (r6 == r2) goto L2e
            if (r6 != r3) goto L2b
            goto L2e
        L2b:
            r8 = r5
            r6 = r7
            goto L30
        L2e:
            r8 = r5
            r6 = r2
        L30:
            int r4 = android.view.View.MeasureSpec.makeMeasureSpec(r8, r6)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sxa.w(boolean, int, int, int, int):int");
    }

    public static int z(View view) {
        Rect rect = ((txa) view.getLayoutParams()).b;
        return view.getMeasuredHeight() + rect.top + rect.bottom;
    }

    public final boolean A0(View view, int i, int i2, txa txaVar) {
        return (this.h && N(view.getMeasuredWidth(), i, ((ViewGroup.MarginLayoutParams) txaVar).width) && N(view.getMeasuredHeight(), i2, ((ViewGroup.MarginLayoutParams) txaVar).height)) ? false : true;
    }

    public abstract void B0(RecyclerView recyclerView, int i);

    public final int C() {
        RecyclerView recyclerView = this.b;
        kxa adapter = recyclerView != null ? recyclerView.getAdapter() : null;
        if (adapter != null) {
            return op8.Y(((gy6) adapter).c);
        }
        return 0;
    }

    public final int D() {
        RecyclerView recyclerView = this.b;
        if (recyclerView != null) {
            return recyclerView.getPaddingBottom();
        }
        return 0;
    }

    public boolean D0() {
        return false;
    }

    public final int E() {
        RecyclerView recyclerView = this.b;
        if (recyclerView != null) {
            return recyclerView.getPaddingLeft();
        }
        return 0;
    }

    public final int F() {
        RecyclerView recyclerView = this.b;
        if (recyclerView != null) {
            return recyclerView.getPaddingRight();
        }
        return 0;
    }

    public final int G() {
        RecyclerView recyclerView = this.b;
        if (recyclerView != null) {
            return recyclerView.getPaddingTop();
        }
        return 0;
    }

    public int J(yxa yxaVar, eya eyaVar) {
        RecyclerView recyclerView = this.b;
        if (recyclerView == null || recyclerView.m == null || !e()) {
            return 1;
        }
        return op8.Y(((gy6) this.b.m).c);
    }

    public final void K(Rect rect, View view) {
        Matrix matrix;
        Rect rect2 = ((txa) view.getLayoutParams()).b;
        rect.set(-rect2.left, -rect2.top, view.getWidth() + rect2.right, view.getHeight() + rect2.bottom);
        if (this.b != null && (matrix = view.getMatrix()) != null && !matrix.isIdentity()) {
            RectF rectF = this.b.l;
            rectF.set(rect);
            matrix.mapRect(rectF);
            rect.set((int) Math.floor(rectF.left), (int) Math.floor(rectF.top), (int) Math.ceil(rectF.right), (int) Math.ceil(rectF.bottom));
        }
        rect.offset(view.getLeft(), view.getTop());
    }

    public abstract boolean L();

    public boolean M() {
        return false;
    }

    public void P(int i) {
        RecyclerView recyclerView = this.b;
        if (recyclerView != null) {
            int iX = recyclerView.f.x();
            for (int i2 = 0; i2 < iX; i2++) {
                recyclerView.f.w(i2).offsetLeftAndRight(i);
            }
        }
    }

    public void Q(int i) {
        RecyclerView recyclerView = this.b;
        if (recyclerView != null) {
            int iX = recyclerView.f.x();
            for (int i2 = 0; i2 < iX; i2++) {
                recyclerView.f.w(i2).offsetTopAndBottom(i);
            }
        }
    }

    public void R() {
    }

    public void S(RecyclerView recyclerView) {
    }

    public abstract void T(RecyclerView recyclerView);

    public abstract View U(View view, int i, yxa yxaVar, eya eyaVar);

    public void V(AccessibilityEvent accessibilityEvent) {
        RecyclerView recyclerView = this.b;
        yxa yxaVar = recyclerView.c;
        if (accessibilityEvent == null) {
            return;
        }
        boolean z = true;
        if (!recyclerView.canScrollVertically(1) && !this.b.canScrollVertically(-1) && !this.b.canScrollHorizontally(-1) && !this.b.canScrollHorizontally(1)) {
            z = false;
        }
        accessibilityEvent.setScrollable(z);
        kxa kxaVar = this.b.m;
        if (kxaVar != null) {
            accessibilityEvent.setItemCount(op8.Y(((gy6) kxaVar).c));
        }
    }

    public void W(yxa yxaVar, eya eyaVar, y4 y4Var) {
        if (this.b.canScrollVertically(-1) || this.b.canScrollHorizontally(-1)) {
            y4Var.a(8192);
            y4Var.p(true);
            y4Var.h(67108864, true);
        }
        if (this.b.canScrollVertically(1) || this.b.canScrollHorizontally(1)) {
            y4Var.a(4096);
            y4Var.p(true);
            y4Var.h(67108864, true);
        }
        y4Var.a.setCollectionInfo(AccessibilityNodeInfo.CollectionInfo.obtain(J(yxaVar, eyaVar), x(yxaVar, eyaVar), false, 0));
    }

    public void X(yxa yxaVar, eya eyaVar, View view, y4 y4Var) {
        y4Var.j(olb.p(false, e() ? H(view) : 0, 1, d() ? H(view) : 0, 1));
    }

    public final void Y(View view, y4 y4Var) {
        pr0 pr0VarK = RecyclerView.K(view);
        if (pr0VarK == null || pr0VarK.g()) {
            return;
        }
        jl1 jl1Var = this.a;
        if (((ArrayList) jl1Var.b).contains(pr0VarK.a)) {
            return;
        }
        RecyclerView recyclerView = this.b;
        X(recyclerView.c, recyclerView.u0, view, y4Var);
    }

    public void Z(int i, int i2) {
    }

    public void a0() {
    }

    public final void b(View view, int i, boolean z) {
        pr0 pr0VarK = RecyclerView.K(view);
        if (z || pr0VarK.g()) {
            aec aecVar = (aec) this.b.g.b;
            lue lueVarA = (lue) aecVar.get(pr0VarK);
            if (lueVarA == null) {
                lueVarA = lue.a();
                aecVar.put(pr0VarK, lueVarA);
            }
            lueVarA.a |= 1;
        } else {
            this.b.g.X(pr0VarK);
        }
        txa txaVar = (txa) view.getLayoutParams();
        if (pr0VarK.o() || pr0VarK.h()) {
            if (pr0VarK.h()) {
                pr0VarK.m.m(pr0VarK);
            } else {
                pr0VarK.i &= -33;
            }
            this.a.e(view, i, view.getLayoutParams(), false);
        } else {
            ViewParent parent = view.getParent();
            RecyclerView recyclerView = this.b;
            jl1 jl1Var = this.a;
            if (parent == recyclerView) {
                il1 il1Var = (il1) jl1Var.e;
                int iIndexOfChild = ((ixa) jl1Var.d).a.indexOfChild(view);
                int iB = (iIndexOfChild == -1 || il1Var.d(iIndexOfChild)) ? -1 : iIndexOfChild - il1Var.b(iIndexOfChild);
                if (i == -1) {
                    i = this.a.x();
                }
                if (iB == -1) {
                    throw new IllegalStateException("Added View has RecyclerView as parent but view is not a real child. Unfiltered index:" + this.b.indexOfChild(view) + this.b.A());
                }
                if (iB != i) {
                    sxa sxaVar = this.b.n;
                    View viewU = sxaVar.u(iB);
                    if (viewU == null) {
                        throw new IllegalArgumentException("Cannot move a child from non-existing index:" + iB + sxaVar.b.toString());
                    }
                    sxaVar.u(iB);
                    sxaVar.a.o(iB);
                    txa txaVar2 = (txa) viewU.getLayoutParams();
                    pr0 pr0VarK2 = RecyclerView.K(viewU);
                    boolean zG = pr0VarK2.g();
                    RecyclerView recyclerView2 = sxaVar.b;
                    if (zG) {
                        aec aecVar2 = (aec) recyclerView2.g.b;
                        lue lueVarA2 = (lue) aecVar2.get(pr0VarK2);
                        if (lueVarA2 == null) {
                            lueVarA2 = lue.a();
                            aecVar2.put(pr0VarK2, lueVarA2);
                        }
                        lueVarA2.a = 1 | lueVarA2.a;
                    } else {
                        recyclerView2.g.X(pr0VarK2);
                    }
                    sxaVar.a.e(viewU, i, txaVar2, pr0VarK2.g());
                }
            } else {
                jl1Var.c(view, i, false);
                txaVar.c = true;
                vz6 vz6Var = this.e;
                if (vz6Var != null && vz6Var.e) {
                    vz6Var.b.getClass();
                    pr0 pr0VarK3 = RecyclerView.K(view);
                    if ((pr0VarK3 != null ? pr0VarK3.b() : -1) == vz6Var.a) {
                        vz6Var.f = view;
                        if (RecyclerView.Q0) {
                            Log.d("RecyclerView", "smooth scroll target view has been attached");
                        }
                    }
                }
            }
        }
        if (txaVar.d) {
            if (RecyclerView.Q0) {
                Log.d("RecyclerView", "consuming pending invalidate on child " + txaVar.a);
            }
            pr0VarK.a.invalidate();
            txaVar.d = false;
        }
    }

    public void b0(int i, int i2) {
    }

    public void c(String str) {
        RecyclerView recyclerView = this.b;
        if (recyclerView != null) {
            recyclerView.i(str);
        }
    }

    public void c0(int i, int i2) {
    }

    public abstract boolean d();

    public void d0(int i, int i2) {
    }

    public abstract boolean e();

    public abstract void e0(yxa yxaVar, eya eyaVar);

    public boolean f(txa txaVar) {
        return true;
    }

    public abstract void f0(eya eyaVar);

    public void g0(Parcelable parcelable) {
    }

    public void h(int i, int i2, eya eyaVar, ym0 ym0Var) {
    }

    public Parcelable h0() {
        return null;
    }

    public void i(int i, ym0 ym0Var) {
    }

    public void i0(int i) {
    }

    public abstract int j(eya eyaVar);

    /* JADX WARN: Removed duplicated region for block: B:18:0x0060 A[PHI: r0
      0x0060: PHI (r0v8 int) = (r0v5 int), (r0v14 int) binds: [B:24:0x007c, B:16:0x0052] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean j0(int r10, android.os.Bundle r11) {
        /*
            Method dump skipped, instruction units count: 248
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sxa.j0(int, android.os.Bundle):boolean");
    }

    public abstract int k(eya eyaVar);

    public final void k0(yxa yxaVar) {
        for (int iV = v() - 1; iV >= 0; iV--) {
            if (!RecyclerView.K(u(iV)).n()) {
                View viewU = u(iV);
                n0(iV);
                yxaVar.i(viewU);
            }
        }
    }

    public abstract int l(eya eyaVar);

    public final void l0(yxa yxaVar) {
        ArrayList arrayList;
        int size = yxaVar.a.size();
        int i = size - 1;
        while (true) {
            arrayList = yxaVar.a;
            if (i < 0) {
                break;
            }
            View view = ((pr0) arrayList.get(i)).a;
            pr0 pr0VarK = RecyclerView.K(view);
            if (!pr0VarK.n()) {
                pr0VarK.m(false);
                if (pr0VarK.i()) {
                    this.b.removeDetachedView(view, false);
                }
                pxa pxaVar = this.b.L;
                if (pxaVar != null) {
                    pxaVar.d(pr0VarK);
                }
                pr0VarK.m(true);
                pr0 pr0VarK2 = RecyclerView.K(view);
                pr0VarK2.m = null;
                pr0VarK2.n = false;
                pr0VarK2.i &= -33;
                yxaVar.j(pr0VarK2);
            }
            i--;
        }
        arrayList.clear();
        ArrayList arrayList2 = yxaVar.b;
        if (arrayList2 != null) {
            arrayList2.clear();
        }
        if (size > 0) {
            this.b.invalidate();
        }
    }

    public abstract int m(eya eyaVar);

    public final void m0(View view, yxa yxaVar) {
        jl1 jl1Var = this.a;
        ixa ixaVar = (ixa) jl1Var.d;
        int i = jl1Var.c;
        if (i == 1) {
            ygf.f("Cannot call removeView(At) within removeView(At)");
            return;
        }
        if (i == 2) {
            ygf.f("Cannot call removeView(At) within removeViewIfHidden");
            return;
        }
        try {
            jl1Var.c = 1;
            jl1Var.f = view;
            int iIndexOfChild = ixaVar.a.indexOfChild(view);
            if (iIndexOfChild >= 0) {
                if (((il1) jl1Var.e).h(iIndexOfChild)) {
                    jl1Var.S(view);
                }
                ixaVar.c(iIndexOfChild);
            }
            jl1Var.c = 0;
            jl1Var.f = null;
            yxaVar.i(view);
        } catch (Throwable th) {
            jl1Var.c = 0;
            jl1Var.f = null;
            throw th;
        }
    }

    public abstract int n(eya eyaVar);

    public final void n0(int i) {
        if (u(i) != null) {
            jl1 jl1Var = this.a;
            ixa ixaVar = (ixa) jl1Var.d;
            int i2 = jl1Var.c;
            if (i2 == 1) {
                ygf.f("Cannot call removeView(At) within removeView(At)");
                return;
            }
            if (i2 == 2) {
                ygf.f("Cannot call removeView(At) within removeViewIfHidden");
                return;
            }
            try {
                int iA = jl1Var.A(i);
                View childAt = ixaVar.a.getChildAt(iA);
                if (childAt == null) {
                    jl1Var.c = 0;
                    jl1Var.f = null;
                    return;
                }
                jl1Var.c = 1;
                jl1Var.f = childAt;
                if (((il1) jl1Var.e).h(iA)) {
                    jl1Var.S(childAt);
                }
                ixaVar.c(iA);
                jl1Var.c = 0;
                jl1Var.f = null;
            } catch (Throwable th) {
                jl1Var.c = 0;
                jl1Var.f = null;
                throw th;
            }
        }
    }

    public abstract int o(eya eyaVar);

    /* JADX WARN: Removed duplicated region for block: B:28:0x00b0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean o0(androidx.recyclerview.widget.RecyclerView r9, android.view.View r10, android.graphics.Rect r11, boolean r12, boolean r13) {
        /*
            r8 = this;
            int r0 = r8.E()
            int r1 = r8.G()
            int r2 = r8.n
            int r3 = r8.F()
            int r2 = r2 - r3
            int r3 = r8.o
            int r4 = r8.D()
            int r3 = r3 - r4
            int r4 = r10.getLeft()
            int r5 = r11.left
            int r4 = r4 + r5
            int r5 = r10.getScrollX()
            int r4 = r4 - r5
            int r5 = r10.getTop()
            int r6 = r11.top
            int r5 = r5 + r6
            int r10 = r10.getScrollY()
            int r5 = r5 - r10
            int r10 = r11.width()
            int r10 = r10 + r4
            int r11 = r11.height()
            int r11 = r11 + r5
            int r4 = r4 - r0
            r0 = 0
            int r6 = java.lang.Math.min(r0, r4)
            int r5 = r5 - r1
            int r1 = java.lang.Math.min(r0, r5)
            int r10 = r10 - r2
            int r2 = java.lang.Math.max(r0, r10)
            int r11 = r11 - r3
            int r11 = java.lang.Math.max(r0, r11)
            androidx.recyclerview.widget.RecyclerView r3 = r8.b
            int r3 = r3.getLayoutDirection()
            r7 = 1
            if (r3 != r7) goto L5e
            if (r2 == 0) goto L59
            goto L66
        L59:
            int r2 = java.lang.Math.max(r6, r10)
            goto L66
        L5e:
            if (r6 == 0) goto L61
            goto L65
        L61:
            int r6 = java.lang.Math.min(r4, r2)
        L65:
            r2 = r6
        L66:
            if (r1 == 0) goto L69
            goto L6d
        L69:
            int r1 = java.lang.Math.min(r5, r11)
        L6d:
            int[] r10 = new int[]{r2, r1}
            r11 = r10[r0]
            r10 = r10[r7]
            if (r13 == 0) goto Lb0
            android.view.View r13 = r9.getFocusedChild()
            if (r13 != 0) goto L7e
            goto Lb5
        L7e:
            int r1 = r8.E()
            int r2 = r8.G()
            int r3 = r8.n
            int r4 = r8.F()
            int r3 = r3 - r4
            int r4 = r8.o
            int r5 = r8.D()
            int r4 = r4 - r5
            androidx.recyclerview.widget.RecyclerView r5 = r8.b
            android.graphics.Rect r5 = r5.j
            r8.y(r5, r13)
            int r8 = r5.left
            int r8 = r8 - r11
            if (r8 >= r3) goto Lb5
            int r8 = r5.right
            int r8 = r8 - r11
            if (r8 <= r1) goto Lb5
            int r8 = r5.top
            int r8 = r8 - r10
            if (r8 >= r4) goto Lb5
            int r8 = r5.bottom
            int r8 = r8 - r10
            if (r8 > r2) goto Lb0
            goto Lb5
        Lb0:
            if (r11 != 0) goto Lb6
            if (r10 == 0) goto Lb5
            goto Lb6
        Lb5:
            return r0
        Lb6:
            if (r12 == 0) goto Lbc
            r9.scrollBy(r11, r10)
            return r7
        Lbc:
            r9.g0(r11, r10, r0)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sxa.o0(androidx.recyclerview.widget.RecyclerView, android.view.View, android.graphics.Rect, boolean, boolean):boolean");
    }

    public final void p(yxa yxaVar) {
        for (int iV = v() - 1; iV >= 0; iV--) {
            View viewU = u(iV);
            pr0 pr0VarK = RecyclerView.K(viewU);
            if (pr0VarK.n()) {
                if (RecyclerView.Q0) {
                    Log.d("RecyclerView", "ignoring view " + pr0VarK);
                }
            } else if (!pr0VarK.e() || pr0VarK.g()) {
                u(iV);
                this.a.o(iV);
                yxaVar.k(viewU);
                this.b.g.X(pr0VarK);
            } else {
                this.b.m.getClass();
                n0(iV);
                yxaVar.j(pr0VarK);
            }
        }
    }

    public final void p0() {
        RecyclerView recyclerView = this.b;
        if (recyclerView != null) {
            recyclerView.requestLayout();
        }
    }

    public View q(int i) {
        int iV = v();
        for (int i2 = 0; i2 < iV; i2++) {
            View viewU = u(i2);
            pr0 pr0VarK = RecyclerView.K(viewU);
            if (pr0VarK != null && pr0VarK.b() == i && !pr0VarK.n() && (this.b.u0.g || !pr0VarK.g())) {
                return viewU;
            }
        }
        return null;
    }

    public abstract int q0(int i, yxa yxaVar, eya eyaVar);

    public abstract txa r();

    public abstract void r0(int i);

    public txa s(Context context, AttributeSet attributeSet) {
        return new txa(context, attributeSet);
    }

    public abstract int s0(int i, yxa yxaVar, eya eyaVar);

    public txa t(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof txa ? new txa((txa) layoutParams) : layoutParams instanceof ViewGroup.MarginLayoutParams ? new txa((ViewGroup.MarginLayoutParams) layoutParams) : new txa(layoutParams);
    }

    public final void t0(RecyclerView recyclerView) {
        u0(View.MeasureSpec.makeMeasureSpec(recyclerView.getWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(recyclerView.getHeight(), 1073741824));
    }

    public final View u(int i) {
        jl1 jl1Var = this.a;
        if (jl1Var != null) {
            return jl1Var.w(i);
        }
        return null;
    }

    public final void u0(int i, int i2) {
        this.n = View.MeasureSpec.getSize(i);
        int mode = View.MeasureSpec.getMode(i);
        this.l = mode;
        if (mode == 0 && !RecyclerView.T0) {
            this.n = 0;
        }
        this.o = View.MeasureSpec.getSize(i2);
        int mode2 = View.MeasureSpec.getMode(i2);
        this.m = mode2;
        if (mode2 != 0 || RecyclerView.T0) {
            return;
        }
        this.o = 0;
    }

    public final int v() {
        jl1 jl1Var = this.a;
        if (jl1Var != null) {
            return jl1Var.x();
        }
        return 0;
    }

    public void v0(Rect rect, int i, int i2) {
        int iF = F() + E() + rect.width();
        int iD = D() + G() + rect.height();
        RecyclerView recyclerView = this.b;
        WeakHashMap weakHashMap = ute.a;
        this.b.setMeasuredDimension(g(i, iF, recyclerView.getMinimumWidth()), g(i2, iD, this.b.getMinimumHeight()));
    }

    public final void w0(int i, int i2) {
        int iV = v();
        if (iV == 0) {
            this.b.o(i, i2);
            return;
        }
        int i3 = Integer.MIN_VALUE;
        int i4 = Integer.MAX_VALUE;
        int i5 = Integer.MIN_VALUE;
        int i6 = Integer.MAX_VALUE;
        for (int i7 = 0; i7 < iV; i7++) {
            View viewU = u(i7);
            Rect rect = this.b.j;
            y(rect, viewU);
            int i8 = rect.left;
            if (i8 < i6) {
                i6 = i8;
            }
            int i9 = rect.right;
            if (i9 > i3) {
                i3 = i9;
            }
            int i10 = rect.top;
            if (i10 < i4) {
                i4 = i10;
            }
            int i11 = rect.bottom;
            if (i11 > i5) {
                i5 = i11;
            }
        }
        this.b.j.set(i6, i4, i3, i5);
        v0(this.b.j, i, i2);
    }

    public int x(yxa yxaVar, eya eyaVar) {
        RecyclerView recyclerView = this.b;
        if (recyclerView == null || recyclerView.m == null || !d()) {
            return 1;
        }
        return op8.Y(((gy6) this.b.m).c);
    }

    public final void x0(RecyclerView recyclerView) {
        if (recyclerView == null) {
            this.b = null;
            this.a = null;
            this.n = 0;
            this.o = 0;
        } else {
            this.b = recyclerView;
            this.a = recyclerView.f;
            this.n = recyclerView.getWidth();
            this.o = recyclerView.getHeight();
        }
        this.l = 1073741824;
        this.m = 1073741824;
    }

    public void y(Rect rect, View view) {
        boolean z = RecyclerView.P0;
        txa txaVar = (txa) view.getLayoutParams();
        Rect rect2 = txaVar.b;
        rect.set((view.getLeft() - rect2.left) - ((ViewGroup.MarginLayoutParams) txaVar).leftMargin, (view.getTop() - rect2.top) - ((ViewGroup.MarginLayoutParams) txaVar).topMargin, view.getRight() + rect2.right + ((ViewGroup.MarginLayoutParams) txaVar).rightMargin, view.getBottom() + rect2.bottom + ((ViewGroup.MarginLayoutParams) txaVar).bottomMargin);
    }

    public final boolean y0(View view, int i, int i2, txa txaVar) {
        return (!view.isLayoutRequested() && this.h && N(view.getWidth(), i, ((ViewGroup.MarginLayoutParams) txaVar).width) && N(view.getHeight(), i2, ((ViewGroup.MarginLayoutParams) txaVar).height)) ? false : true;
    }

    public boolean z0() {
        return false;
    }

    public final void C0(vz6 vz6Var) {
        vz6 vz6Var2 = this.e;
        if (vz6Var2 != null && vz6Var != vz6Var2 && vz6Var2.e) {
            vz6Var2.h();
        }
        this.e = vz6Var;
        RecyclerView recyclerView = this.b;
        hya hyaVar = recyclerView.r0;
        hyaVar.g.removeCallbacks(hyaVar);
        hyaVar.c.abortAnimation();
        if (vz6Var.h) {
            Log.w(peNPu.LEVSpmVjEUJse, "An instance of " + vz6Var.getClass().getSimpleName() + " was started more than once. Each instance of" + vz6Var.getClass().getSimpleName() + " is intended to only be used once. You should create a new instance for each use.");
        }
        vz6Var.b = recyclerView;
        vz6Var.c = this;
        int i = vz6Var.a;
        if (i == -1) {
            ay0.e("Invalid target position");
            return;
        }
        recyclerView.u0.a = i;
        vz6Var.e = true;
        vz6Var.d = true;
        vz6Var.f = recyclerView.n.q(i);
        vz6Var.b.r0.b();
        vz6Var.h = true;
    }
}
