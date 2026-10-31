package com.android.launcher3;

import aa.l;
import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Parcelable;
import android.util.ArrayMap;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.DecelerateInterpolator;
import androidx.fragment.app.h;
import b.c0;
import com.android.launcher3.util.ParcelableSparseArray;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.workspace.CrosshairsCellLayout;
import e10.s2;
import e10.t0;
import e10.y2;
import ga.e;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Stack;
import kl.q0;
import kotlin.reflect.KProperty;
import mx.j0;
import n30.b;
import n30.c;
import o7.g0;
import o9.b3;
import o9.g3;
import o9.k;
import o9.l0;
import o9.n1;
import o9.q;
import o9.r;
import o9.t;
import o9.u;
import o9.u0;
import o9.u2;
import o9.v;
import o9.v2;
import o9.w;
import o9.z0;
import p9.a;
import x9.p;
import y9.y;
import ya.o;
import za.d;

/* loaded from: classes.dex */
public class CellLayout extends ViewGroup implements c {

    /* renamed from: g0, reason: collision with root package name */
    public static final int[] f20887g0 = {16842914};

    /* renamed from: h0, reason: collision with root package name */
    public static final Paint f20888h0 = new Paint();

    /* renamed from: i0, reason: collision with root package name */
    public static final ca.c f20889i0 = new ca.c("spring_loaded_progress", 3);

    /* renamed from: j0, reason: collision with root package name */
    public static final l f20890j0 = new l(7, Float.TYPE, "animationProgress");
    public final ArrayMap A;
    public final ArrayMap B;
    public boolean C;
    public final boolean D;
    public final RectF E;
    public final Paint F;
    public final int G;
    public float H;
    public final int I;
    public float J;
    public float K;
    public final int[] L;
    public final int[] M;
    public boolean N;
    public final DecelerateInterpolator O;
    public final b3 P;
    public final int Q;
    public final float R;
    public final ArrayList S;
    public final Rect T;
    public final int[] U;
    public final int[] V;
    public final Rect W;

    /* renamed from: a, reason: collision with root package name */
    public final d f20891a;

    /* renamed from: a0, reason: collision with root package name */
    public a f20892a0;

    /* renamed from: b, reason: collision with root package name */
    public int f20893b;

    /* renamed from: b0, reason: collision with root package name */
    public final Stack f20894b0;

    /* renamed from: c, reason: collision with root package name */
    public int f20895c;

    /* renamed from: c0, reason: collision with root package name */
    public final int[] f20896c0;

    /* renamed from: d, reason: collision with root package name */
    public int f20897d;

    /* renamed from: d0, reason: collision with root package name */
    public final int[] f20898d0;

    /* renamed from: e, reason: collision with root package name */
    public int f20899e;

    /* renamed from: e0, reason: collision with root package name */
    public final boolean f20900e0;

    /* renamed from: f, reason: collision with root package name */
    public final Point f20901f;

    /* renamed from: f0, reason: collision with root package name */
    public e f20902f0;

    /* renamed from: g, reason: collision with root package name */
    public int f20903g;

    /* renamed from: h, reason: collision with root package name */
    public int f20904h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f20905i;

    /* renamed from: j, reason: collision with root package name */
    public final int[] f20906j;

    /* renamed from: k, reason: collision with root package name */
    public final int[] f20907k;

    /* renamed from: l, reason: collision with root package name */
    public final PointF f20908l;

    /* renamed from: m, reason: collision with root package name */
    public o f20909m;
    public o n;
    public Workspace o;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayList f20910p;

    /* renamed from: q, reason: collision with root package name */
    public final y f20911q;

    /* renamed from: r, reason: collision with root package name */
    public final Drawable f20912r;

    /* renamed from: s, reason: collision with root package name */
    public int f20913s;

    /* renamed from: t, reason: collision with root package name */
    public int f20914t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f20915u;

    /* renamed from: v, reason: collision with root package name */
    public final v[] f20916v;

    /* renamed from: w, reason: collision with root package name */
    public final float[] f20917w;

    /* renamed from: x, reason: collision with root package name */
    public final u0[] f20918x;

    /* renamed from: y, reason: collision with root package name */
    public int f20919y;

    /* renamed from: z, reason: collision with root package name */
    public final Paint f20920z;

    public CellLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public static void p(float f11, float f12, int[] iArr) {
        double dAtan = Math.atan(f12 / f11);
        iArr[0] = 0;
        iArr[1] = 0;
        if (Math.abs(Math.cos(dAtan)) > 0.5d) {
            iArr[0] = (int) Math.signum(f11);
        }
        if (Math.abs(Math.sin(dAtan)) > 0.5d) {
            iArr[1] = (int) Math.signum(f12);
        }
    }

    public final float A(n30.a[] aVarArr) {
        int iC = aVarArr[0].c(this);
        int iC2 = aVarArr[1].c(this);
        E(iC, iC2, this.f20906j);
        Rect rect = this.W;
        j(iC, iC2, 1, 1, rect);
        Point point = this.f20901f;
        rect.inset((-point.x) / 2, (-point.y) / 2);
        KeyEvent.Callback callbackB = B(aVarArr[0], aVarArr[1]);
        if (!(callbackB instanceof p) || ((p) callbackB).m() != 0) {
            return (float) Math.hypot(rect.width() / 2.0f, rect.height() / 2.0f);
        }
        int i5 = this.f20900e0 ? 2 : 1;
        return Math.min(Math.min(Math.min((r8[0] - rect.left) * i5, (r8[1] - rect.top) * i5), (rect.right - r8[0]) * i5), (rect.bottom - r8[1]) * i5);
    }

    public final View B(n30.a aVar, n30.a aVar2) {
        int iC = aVar.c(this);
        int iC2 = aVar2.c(this);
        int iC3 = b.f77779c.c(this);
        int i5 = 0;
        while (true) {
            b3 b3Var = this.P;
            if (i5 >= b3Var.getChildCount()) {
                return null;
            }
            View childAt = b3Var.getChildAt(i5);
            v vVar = (v) childAt.getLayoutParams();
            if (vVar.f80177a == iC && vVar.f80178b == iC2 && vVar.f80182f == iC3 && vVar.f80183g == iC3) {
                return childAt;
            }
            i5++;
        }
    }

    public int C() {
        int measuredWidth = (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
        int i5 = this.f20903g;
        return (measuredWidth - (this.f20893b * i5)) - ((i5 - 1) * this.f20901f.x);
    }

    public final void D(int i5, int i11, int i12, int i13, View view, Rect rect, ArrayList arrayList) {
        if (rect != null) {
            rect.set(i5, i11, i5 + i12, i11 + i13);
        }
        arrayList.clear();
        Rect rect2 = new Rect(i5, i11, i12 + i5, i13 + i11);
        Rect rect3 = new Rect();
        b3 b3Var = this.P;
        int childCount = b3Var.getChildCount();
        for (int i14 = 0; i14 < childCount; i14++) {
            View childAt = b3Var.getChildAt(i14);
            if (childAt != view) {
                v vVar = (v) childAt.getLayoutParams();
                int i15 = vVar.f80177a;
                int i16 = vVar.f80178b;
                rect3.set(i15, i16, vVar.f80182f + i15, vVar.f80183g + i16);
                if (Rect.intersects(rect2, rect3)) {
                    this.S.add(childAt);
                    if (rect != null) {
                        rect.union(rect3);
                    }
                }
            }
        }
    }

    public final void E(int i5, int i11, int[] iArr) {
        KeyEvent.Callback callbackA = this.P.a(i5, i11);
        if (callbackA instanceof p) {
            p pVar = (p) callbackA;
            if (pVar.m() == 0) {
                i(i5, i11, iArr);
                Rect rect = this.W;
                pVar.d(rect);
                rect.offset(iArr[0], iArr[1]);
                iArr[0] = rect.centerX();
                iArr[1] = rect.centerY();
                return;
            }
        }
        N(i5, i11, 1, 1, iArr);
    }

    public final boolean F(n30.a aVar, n30.a aVar2, b bVar, b bVar2) {
        int iC = aVar.c(this);
        int iC2 = aVar2.c(this);
        int iC3 = bVar.c(this);
        int iC4 = bVar2.c(this);
        if (iC < 0 || iC2 < 0 || iC + iC3 >= this.f20903g + 1 || iC2 + iC4 >= this.f20904h + 1) {
            StringBuilder sbT = c0.t(iC, "Position[", ", ", iC2, " ");
            c0.A(sbT, iC3, " x ", iC4, "] exceeds the bound of this CellLayout (");
            sbT.append(this.f20903g);
            sbT.append(" x");
            throw new RuntimeException(c0.o(sbT, this.f20904h, ")"));
        }
        for (int i5 = 0; i5 < iC3; i5++) {
            for (int i11 = 0; i11 < iC4; i11++) {
                if (this.f20909m.f97183c[iC + i5][iC2 + i11]) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void G(View view) {
        if (view == null || view.getParent() != this.P) {
            return;
        }
        v vVar = (v) view.getLayoutParams();
        this.f20909m.d(vVar.f80177a, vVar.f80178b, vVar.f80182f, vVar.f80183g, true);
    }

    public final void H(View view) {
        if (view != null) {
            ViewParent parent = view.getParent();
            b3 b3Var = this.P;
            if (parent != b3Var) {
                return;
            }
            v vVar = (v) view.getLayoutParams();
            this.f20909m.d(vVar.f80177a, vVar.f80178b, vVar.f80182f, vVar.f80183g, false);
            int i5 = vVar.f80177a;
            int i11 = vVar.f80178b;
            Rect rect = new Rect(i5, i11, vVar.f80182f + i5, vVar.f80183g + i11);
            Rect rect2 = new Rect();
            int childCount = b3Var.getChildCount();
            for (int i12 = 0; i12 < childCount; i12++) {
                View childAt = b3Var.getChildAt(i12);
                if (childAt != view) {
                    v vVar2 = (v) childAt.getLayoutParams();
                    int i13 = vVar2.f80177a;
                    int i14 = vVar2.f80178b;
                    rect2.set(i13, i14, vVar2.f80182f + i13, vVar2.f80183g + i14);
                    if (rect2.intersect(rect)) {
                        o oVar = this.f20909m;
                        oVar.getClass();
                        oVar.d(rect2.left, rect2.top, rect2.width(), rect2.height(), true);
                    }
                }
            }
        }
    }

    public void I() {
        this.N = true;
    }

    public void J() {
        if (this.N) {
            this.N = false;
        }
        int[] iArr = this.L;
        iArr[1] = -1;
        iArr[0] = -1;
        int[] iArr2 = this.M;
        iArr2[1] = -1;
        iArr2[0] = -1;
        int i5 = this.f20919y;
        u0[] u0VarArr = this.f20918x;
        u0VarArr[i5].a(2);
        this.f20919y = (this.f20919y + 1) % u0VarArr.length;
        O();
        Q(false);
    }

    public final void K(View view) {
        ((v) view.getLayoutParams()).f80188l = true;
        view.requestLayout();
        G(view);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r19v0 */
    /* JADX WARN: Type inference failed for: r19v1 */
    /* JADX WARN: Type inference failed for: r19v2 */
    /* JADX WARN: Type inference failed for: r2v28 */
    /* JADX WARN: Type inference failed for: r2v29 */
    /* JADX WARN: Type inference failed for: r2v9 */
    public final n30.a[] L(int i5, int i11, b bVar, b bVar2, b bVar3, b bVar4, View view, n30.a[] aVarArr, b[] bVarArr, int i12) {
        int i13;
        boolean z11;
        int i14;
        int i15;
        boolean z12;
        int i16;
        int i17;
        boolean z13;
        int i18;
        boolean z14;
        ?? r22;
        char c11;
        boolean z15;
        CellLayout cellLayout = this;
        int iC = bVar.c(cellLayout);
        int iC2 = bVar2.c(cellLayout);
        int iC3 = bVar3.c(cellLayout);
        int iC4 = bVar4.c(cellLayout);
        int[] iArrV = cellLayout.v(i5, i11, iC3, iC4, iC3, iC4, false, cellLayout.f20896c0, null);
        int[] iArr = cellLayout.f20898d0;
        int[] iArr2 = iArr == null ? new int[2] : iArr;
        int[] iArr3 = cellLayout.V;
        int[] iArr4 = cellLayout.U;
        if ((i12 == 2 || i12 == 3 || i12 == 4) && (i13 = iArr3[0]) != -100) {
            iArr4[0] = i13;
            iArr4[1] = iArr3[1];
            if (i12 == 2 || i12 == 3) {
                iArr3[0] = -100;
                iArr3[1] = -100;
            }
            z11 = 0;
            i14 = iC2;
            i15 = iC3;
            z12 = true;
            i16 = iC;
            i17 = iC4;
        } else {
            int[] iArr5 = new int[2];
            z11 = 0;
            i14 = iC2;
            z12 = true;
            cellLayout.v(i5, i11, iC3, iC4, iC3, iC4, false, iArr5, null);
            Rect rect = new Rect();
            cellLayout = this;
            cellLayout.j(iArr5[0], iArr5[1], iC3, iC4, rect);
            rect.offset(i5 - rect.centerX(), i11 - rect.centerY());
            Rect rect2 = new Rect();
            cellLayout.D(iArr5[0], iArr5[1], iC3, iC4, view, rect2, cellLayout.S);
            i17 = iC4;
            i15 = iC3;
            int iWidth = rect2.width();
            int iHeight = rect2.height();
            cellLayout.j(rect2.left, rect2.top, rect2.width(), rect2.height(), rect2);
            int iCenterX = (rect2.centerX() - i5) / i15;
            int iCenterY = (rect2.centerY() - i11) / i17;
            int i19 = cellLayout.f20903g;
            if (iWidth == i19 || i15 == i19) {
                iCenterX = 0;
            }
            int i21 = cellLayout.f20904h;
            if (iHeight == i21 || i17 == i21) {
                iCenterY = 0;
            }
            if (iCenterX == 0 && iCenterY == 0) {
                iArr4[0] = 1;
                iArr4[1] = 0;
            } else {
                p(iCenterX, iCenterY, iArr4);
            }
            iArr3[0] = iArr4[0];
            iArr3[1] = iArr4[1];
            i16 = iC;
        }
        boolean z16 = z12;
        int i22 = i17;
        int i23 = i15;
        int i24 = i14;
        u uVarW = cellLayout.w(i5, i11, i16, i24, i23, i22, cellLayout.U, view, true, new u(), false);
        u uVar = new u();
        int[] iArr6 = new int[2];
        int[] iArr7 = new int[2];
        v(i5, i11, i16, i24, i23, i22, true, iArr6, iArr7);
        if (iArr6[z11] < 0 || iArr6[z16 ? 1 : 0] < 0) {
            uVar.f80145i = z11;
        } else {
            q(uVar);
            uVar.f97095a = iArr6[z11];
            uVar.f97096b = iArr6[z16 ? 1 : 0];
            uVar.f97097c = iArr7[z11];
            uVar.f97098d = iArr7[z16 ? 1 : 0];
            uVar.f80145i = z16;
        }
        if (!uVarW.f80145i || uVarW.b() < uVar.b()) {
            uVarW = uVar.f80145i ? uVar : null;
        }
        if (i12 == 0) {
            if (uVarW != null) {
                z15 = false;
                g(uVarW, view, 0);
                iArrV[0] = uVarW.f97095a;
                iArrV[1] = uVarW.f97096b;
                iArr2[0] = uVarW.f97097c;
                iArr2[1] = uVarW.f97098d;
            } else {
                z15 = false;
                iArr2[1] = -1;
                iArr2[0] = -1;
                iArrV[1] = -1;
                iArrV[0] = -1;
            }
            i18 = 2;
            r22 = z15;
        } else {
            boolean z17 = false;
            R(true);
            if (uVarW != null) {
                iArrV[0] = uVarW.f97095a;
                iArrV[1] = uVarW.f97096b;
                iArr2[0] = uVarW.f97097c;
                iArr2[1] = uVarW.f97098d;
                if (i12 == 1 || i12 == 2 || i12 == 3) {
                    r(view, uVarW);
                    this.C = true;
                    c(uVarW, view, i12 == 2);
                    if (i12 == 2 || i12 == 3) {
                        n(view, uVarW);
                        o();
                        z14 = false;
                        this.C = false;
                        z13 = true;
                        z17 = z14;
                    } else {
                        g(uVarW, view, 1);
                        z14 = false;
                        z13 = true;
                        z17 = z14;
                    }
                } else {
                    z14 = false;
                    z13 = true;
                    z17 = z14;
                }
            } else {
                iArr2[1] = -1;
                iArr2[0] = -1;
                iArrV[1] = -1;
                iArrV[0] = -1;
                z13 = false;
            }
            i18 = 2;
            if (i12 == 2 || !z13) {
                R(z17);
            }
            this.P.requestLayout();
            r22 = z17;
        }
        n30.a[] aVarArr2 = aVarArr == null ? new n30.a[i18] : aVarArr;
        if (bVarArr != null) {
            bVarArr[r22] = b.b(this, iArr[r22]);
            c11 = 1;
            bVarArr[1] = b.b(this, iArr[1]);
        } else {
            c11 = 1;
        }
        aVarArr2[r22] = n30.a.b(this, iArrV[r22]);
        aVarArr2[c11] = n30.a.b(this, iArrV[c11]);
        return aVarArr2;
    }

    public final boolean M(ArrayList arrayList, Rect rect, int[] iArr, View view, u uVar) {
        int i5;
        int i11;
        ArrayList arrayList2;
        ArrayMap arrayMap = uVar.f80141e;
        o9.y yVar = new o9.y(this, arrayList, uVar);
        Rect rectB = yVar.b();
        boolean z11 = false;
        int i12 = iArr[0];
        if (i12 < 0) {
            i5 = rectB.right - rect.left;
            i11 = 1;
        } else if (i12 > 0) {
            i5 = rect.right - rectB.left;
            i11 = 4;
        } else if (iArr[1] < 0) {
            i5 = rectB.bottom - rect.top;
            i11 = 2;
        } else {
            i5 = rect.bottom - rectB.top;
            i11 = 8;
        }
        if (i5 <= 0) {
            return false;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            this.n.e((ya.a) arrayMap.get((View) it.next()), false);
        }
        uVar.e();
        yVar.f(i11);
        boolean z12 = false;
        while (true) {
            arrayList2 = yVar.f80250a;
            if (i5 <= 0 || z12) {
                break;
            }
            Iterator it2 = uVar.f80143g.iterator();
            while (true) {
                if (it2.hasNext()) {
                    View view2 = (View) it2.next();
                    if (!arrayList2.contains(view2) && view2 != view && yVar.c(i11, view2)) {
                        if (!((v) view2.getLayoutParams()).f80185i) {
                            z12 = true;
                            break;
                        }
                        yVar.a(view2);
                        this.n.e((ya.a) arrayMap.get(view2), false);
                    }
                }
            }
            i5--;
            yVar.e(i11);
        }
        Rect rectB2 = yVar.b();
        if (z12 || rectB2.left < 0 || rectB2.right > this.f20903g || rectB2.top < 0 || rectB2.bottom > this.f20904h) {
            uVar.d();
        } else {
            z11 = true;
        }
        Iterator it3 = arrayList2.iterator();
        while (it3.hasNext()) {
            this.n.e((ya.a) arrayMap.get((View) it3.next()), true);
        }
        return z11;
    }

    public final void N(int i5, int i11, int i12, int i13, int[] iArr) {
        j(i5, i11, i12, i13, this.W);
        Rect rect = this.W;
        iArr[0] = rect.centerX();
        iArr[1] = rect.centerY();
    }

    public final void O() {
        o();
        if (this.C) {
            b3 b3Var = this.P;
            int childCount = b3Var.getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = b3Var.getChildAt(i5);
                v vVar = (v) childAt.getLayoutParams();
                int i11 = vVar.f80179c;
                int i12 = vVar.f80177a;
                if (i11 != i12 || vVar.f80180d != vVar.f80178b) {
                    vVar.f80179c = i12;
                    int i13 = vVar.f80178b;
                    vVar.f80180d = i13;
                    b(childAt, i12, i13, PerAppFeatureCatalog.MAX_TOOLS, 0, false, false);
                }
            }
            this.C = false;
        }
    }

    public final void P(int i5, int i11) {
        this.f20903g = i5;
        this.f20904h = i11;
        this.f20909m = new o(i5, i11);
        this.n = new o(this.f20903g, this.f20904h);
        this.f20894b0.clear();
        this.P.getClass();
        requestLayout();
    }

    public final void Q(boolean z11) {
        if (this.f20915u != z11) {
            this.f20915u = z11;
            this.f20912r.setState(z11 ? f20887g0 : View.EMPTY_STATE_SET);
            invalidate();
        }
    }

    public final void R(boolean z11) {
        b3 b3Var = this.P;
        int childCount = b3Var.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            ((v) b3Var.getChildAt(i5).getLayoutParams()).f80181e = z11;
        }
    }

    public void S(v vVar, float f11, float f12, Rect rect) {
        if (vVar.f80184h) {
            int i5 = vVar.f80182f;
            int i11 = vVar.f80183g;
            boolean z11 = vVar.f80181e;
            int i12 = z11 ? vVar.f80179c : vVar.f80177a;
            int i13 = z11 ? vVar.f80180d : vVar.f80178b;
            b3 b3Var = this.P;
            if (b3Var.f79779f && g3.p(b3Var.getResources())) {
                i12 = (this.f20903g - i12) - vVar.f80182f;
            }
            Point point = this.f20901f;
            int i14 = (i5 - 1) * point.x;
            int i15 = (i11 - 1) * point.y;
            float f13 = ((i5 * this.f20893b) + i14) / f11;
            ((ViewGroup.MarginLayoutParams) vVar).width = (Math.round(f13) - ((ViewGroup.MarginLayoutParams) vVar).leftMargin) - ((ViewGroup.MarginLayoutParams) vVar).rightMargin;
            int iRound = Math.round(((i11 * this.f20895c) + i15) / f12);
            int i16 = ((ViewGroup.MarginLayoutParams) vVar).topMargin;
            int i17 = (iRound - i16) - ((ViewGroup.MarginLayoutParams) vVar).bottomMargin;
            ((ViewGroup.MarginLayoutParams) vVar).height = i17;
            int i18 = (i12 * point.x) + (this.f20893b * i12) + ((ViewGroup.MarginLayoutParams) vVar).leftMargin;
            vVar.f80186j = i18;
            int i19 = (i13 * point.y) + (this.f20895c * i13) + i16;
            vVar.f80187k = i19;
            if (rect != null) {
                int i21 = rect.left;
                vVar.f80186j = i18 - i21;
                int i22 = rect.top;
                vVar.f80187k = i19 - i22;
                ((ViewGroup.MarginLayoutParams) vVar).width = i21 + rect.right + ((ViewGroup.MarginLayoutParams) vVar).width;
                ((ViewGroup.MarginLayoutParams) vVar).height = i22 + rect.bottom + i17;
            }
        }
    }

    public final void T() {
        b3 b3Var = this.P;
        int childCount = b3Var.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = b3Var.getChildAt(i5);
            e eVar = (e) childAt.getTag();
            boolean zB = b3Var.b(childAt, null);
            if (eVar.f57303q.e() != zB) {
                ea.b.a("CellLayout", "updateOverlappingStateOfItems " + zB + " " + eVar);
                eVar.f57303q.h(zB);
                q0 q0Var = n1.C0;
                ((n1) this.f20891a).f80002c0.j(eVar, eVar.f57291c, eVar.f57292d, eVar.f57293e, eVar.f57294f, eVar.f57295g, eVar.f57296h);
            }
        }
    }

    public void U(int i5, int i11, int i12, int i13, l0 l0Var) {
        int[] iArr = this.L;
        int i14 = iArr[0];
        int[] iArr2 = this.M;
        if (i14 == i5 && iArr[1] == i11 && iArr2[0] == i12 && iArr2[1] == i13) {
            return;
        }
        iArr[0] = i5;
        iArr[1] = i11;
        iArr2[0] = i12;
        iArr2[1] = i13;
        View view = l0Var.f79954f.f95669a;
        if (view instanceof ab.o) {
            Context context = getContext();
            q0 q0Var = n1.C0;
            ((NovaLauncher) k.Y(context)).O.M0(this);
            j(iArr[0], iArr[1], i12, i13, this.W);
            ((ab.o) view).y();
        }
        int i15 = this.f20919y;
        u0[] u0VarArr = this.f20918x;
        u0VarArr[i15].a(2);
        v[] vVarArr = this.f20916v;
        int length = (i15 + 1) % vVarArr.length;
        this.f20919y = length;
        v vVar = vVarArr[length];
        vVar.f80177a = i5;
        vVar.f80178b = i11;
        vVar.f80182f = i12;
        vVar.f80183g = i13;
        u0VarArr[length].a(1);
        invalidate();
        g0 g0Var = l0Var.f79960l;
        if (g0Var != null) {
            g0Var.a(z(i5, i11));
        }
    }

    public void V(Canvas canvas) {
        int i5;
        int i11;
        this.f20891a.P();
        int i12 = 0;
        float f11 = 0;
        float f12 = this.f20893b;
        float f13 = this.f20895c;
        RectF rectF = this.E;
        rectF.set(f11, f11, f12, f13);
        Paint paint = this.F;
        paint.setStrokeWidth(8.0f);
        int i13 = (int) (this.H * 120.0f);
        int i14 = this.I;
        paint.setColor(r4.a.n(i14, i13));
        if (!this.D) {
            return;
        }
        while (true) {
            v[] vVarArr = this.f20916v;
            if (i12 >= vVarArr.length) {
                return;
            }
            float f14 = this.f20917w[i12];
            if (f14 <= 0.0f) {
                i5 = i12;
                i11 = i14;
            } else {
                paint.setAlpha(255);
                v vVar = vVarArr[i12];
                int i15 = vVar.f80177a;
                int i16 = vVar.f80178b;
                int i17 = vVar.f80182f;
                int i18 = vVar.f80183g;
                int i19 = this.f20900e0 ? 2 : 1;
                int i21 = this.f20893b * i15;
                Point point = this.f20901f;
                rectF.offsetTo(getPaddingLeft() + (point.x * i15 * i19) + i21, getPaddingTop() + (point.y * i16 * i19) + (this.f20895c * i16));
                if (this instanceof CrosshairsCellLayout) {
                    CrosshairsCellLayout crosshairsCellLayout = (CrosshairsCellLayout) this;
                    int i22 = crosshairsCellLayout.f20893b;
                    int i23 = crosshairsCellLayout.f20903g;
                    int i24 = crosshairsCellLayout.f46507w0;
                    int i25 = crosshairsCellLayout.f46508x0;
                    int i26 = i22 * i15;
                    if (i15 > 0) {
                        i26 += i24;
                    }
                    int i27 = i23 / 2;
                    if (i15 == i27) {
                        i26 = (i25 / 2) + i26;
                    } else if (i15 > i27) {
                        i26 += i25;
                    }
                    int i28 = i26;
                    i5 = i12;
                    int i29 = crosshairsCellLayout.f20895c;
                    int i31 = crosshairsCellLayout.f20904h;
                    int i32 = crosshairsCellLayout.f46509y0;
                    int i33 = crosshairsCellLayout.f46510z0;
                    int i34 = i29 * i16;
                    if (i16 > 0) {
                        i34 += i32;
                    }
                    int i35 = i31 / 2;
                    if (i16 == i35) {
                        i34 = (i33 / 2) + i34;
                    } else if (i16 > i35) {
                        i34 += i33;
                    }
                    int i36 = i34;
                    i11 = i14;
                    this.E.set(i28, i36, CrosshairsCellLayout.W(i15, i17, i22, i23, i24, i25) + i28, CrosshairsCellLayout.W(i16, i18, crosshairsCellLayout.f20895c, crosshairsCellLayout.f20904h, crosshairsCellLayout.f46509y0, crosshairsCellLayout.f46510z0) + i36);
                } else {
                    i5 = i12;
                    i11 = i14;
                }
                paint.setStyle(Paint.Style.STROKE);
                paint.setColor(Color.argb((int) f14, Color.red(i11), Color.green(i11), Color.blue(i11)));
                float f15 = this.G;
                canvas.drawRoundRect(rectF, f15, f15, paint);
            }
            i12 = i5 + 1;
            i14 = i11;
        }
    }

    public boolean a(View view, int i5, int i11, v vVar, boolean z11) {
        int i12;
        view.setScaleX(1.0f);
        view.setScaleY(1.0f);
        int i13 = vVar.f80177a;
        if (i13 < 0) {
            return false;
        }
        int i14 = this.f20903g;
        if (i13 > i14 - 1 || (i12 = vVar.f80178b) < 0) {
            return false;
        }
        int i15 = this.f20904h;
        if (i12 > i15 - 1) {
            return false;
        }
        if (vVar.f80182f < 0) {
            vVar.f80182f = i14;
        }
        if (vVar.f80183g < 0) {
            vVar.f80183g = i15;
        }
        view.setId(i11);
        this.P.addView(view, i5, vVar);
        if (z11) {
            G(view);
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean b(View view, int i5, int i11, int i12, int i13, boolean z11, boolean z12) {
        int i14;
        int i15;
        b3 b3Var = this.P;
        if (b3Var.indexOfChild(view) == -1 || !(view instanceof v2)) {
            return false;
        }
        v vVar = (v) view.getLayoutParams();
        e eVar = (e) view.getTag();
        v2 v2Var = (v2) view;
        ArrayMap arrayMap = this.A;
        if (arrayMap.containsKey(vVar)) {
            ((Animator) arrayMap.get(vVar)).cancel();
            arrayMap.remove(vVar);
        }
        if (z12) {
            o oVar = z11 ? this.f20909m : this.n;
            oVar.d(vVar.f80177a, vVar.f80178b, vVar.f80182f, vVar.f80183g, false);
            i14 = i5;
            i15 = i11;
            oVar.d(i14, i15, vVar.f80182f, vVar.f80183g, true);
        } else {
            i14 = i5;
            i15 = i11;
        }
        int i16 = vVar.f80186j;
        int i17 = vVar.f80187k;
        vVar.f80184h = true;
        if (z11) {
            vVar.f80177a = i14;
            vVar.f80178b = i15;
            eVar.f57293e = n30.a.b(this, i14);
            eVar.f57294f = n30.a.b(this, i15);
        } else {
            vVar.f80179c = i14;
            vVar.f80180d = i15;
        }
        b3Var.e(view);
        int i18 = vVar.f80186j;
        int i19 = vVar.f80187k;
        vVar.f80186j = i16;
        vVar.f80187k = i17;
        vVar.f80184h = false;
        PointF pointF = this.f20908l;
        v2Var.o(pointF);
        float f11 = pointF.x;
        float f12 = pointF.y;
        float f13 = i18 - i16;
        float f14 = i19 - i17;
        if (f13 == 0.0f && f14 == 0.0f && f11 == 0.0f && f12 == 0.0f) {
            vVar.f80184h = true;
            return true;
        }
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        valueAnimatorOfFloat.setDuration(i12);
        arrayMap.put(vVar, valueAnimatorOfFloat);
        valueAnimatorOfFloat.addUpdateListener(new r(f11, f13, f12, f14, v2Var));
        valueAnimatorOfFloat.addListener(new h(this, vVar, v2Var, view));
        valueAnimatorOfFloat.setStartDelay(i13);
        valueAnimatorOfFloat.start();
        return true;
    }

    public final void c(u uVar, View view, boolean z11) {
        ya.a aVar;
        CellLayout cellLayout = this;
        o oVar = cellLayout.n;
        oVar.d(0, 0, oVar.f97181a, oVar.f97182b, false);
        b3 b3Var = cellLayout.P;
        int childCount = b3Var.getChildCount();
        int i5 = 0;
        while (i5 < childCount) {
            View childAt = b3Var.getChildAt(i5);
            if (childAt != view && (aVar = (ya.a) uVar.f80141e.get(childAt)) != null) {
                cellLayout.b(childAt, aVar.f97095a, aVar.f97096b, PerAppFeatureCatalog.MAX_TOOLS, 0, false, false);
                oVar.e(aVar, true);
            }
            i5++;
            cellLayout = this;
        }
        if (z11) {
            oVar.e(uVar, true);
        }
    }

    @Override // android.view.View
    public final void cancelLongPress() {
        super.cancelLongPress();
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            getChildAt(i5).cancelLongPress();
        }
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof v;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.P.getAlpha() <= 0.5f) {
            return;
        }
        int i5 = 0;
        while (true) {
            ArrayList arrayList = this.f20910p;
            if (i5 >= arrayList.size()) {
                return;
            }
            t tVar = (t) arrayList.get(i5);
            i(tVar.f80127a, tVar.f80128b, this.f20907k);
            canvas.save();
            canvas.translate(r5[0], r5[1]);
            y yVar = (y) tVar;
            if (yVar.f96988q) {
                yVar.c(canvas);
            }
            canvas.restore();
            i5++;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchHoverEvent(MotionEvent motionEvent) {
        a aVar = this.f20892a0;
        if (aVar == null || !aVar.j(motionEvent)) {
            return super.dispatchHoverEvent(motionEvent);
        }
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchRestoreInstanceState(SparseArray sparseArray) {
        Parcelable parcelable = (Parcelable) sparseArray.get(2131427645);
        super.dispatchRestoreInstanceState(parcelable instanceof ParcelableSparseArray ? (ParcelableSparseArray) parcelable : new ParcelableSparseArray());
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchSaveInstanceState(SparseArray sparseArray) {
        Parcelable parcelable = (Parcelable) sparseArray.get(2131427645);
        ParcelableSparseArray parcelableSparseArray = parcelable instanceof ParcelableSparseArray ? (ParcelableSparseArray) parcelable : new ParcelableSparseArray();
        super.dispatchSaveInstanceState(parcelableSparseArray);
        sparseArray.put(2131427645, parcelableSparseArray);
    }

    @Override // n30.c
    public final boolean f() {
        return this.f20900e0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void g(u uVar, View view, int i5) {
        ArrayList arrayList;
        CellLayout cellLayout = this;
        b3 b3Var = cellLayout.P;
        int childCount = b3Var.getChildCount();
        int i11 = 0;
        while (i11 < childCount) {
            View childAt = b3Var.getChildAt(i11);
            if (childAt != view) {
                ya.a aVar = (ya.a) uVar.f80141e.get(childAt);
                boolean z11 = (i5 != 0 || (arrayList = uVar.f80144h) == null || arrayList.contains(childAt)) ? false : true;
                v vVar = (v) childAt.getLayoutParams();
                if (aVar != null && !z11 && (childAt instanceof v2)) {
                    new w(cellLayout, (v2) childAt, i5, vVar.f80177a, vVar.f80178b, aVar.f97095a, aVar.f97096b, aVar.f97097c, aVar.f97098d).b();
                }
            }
            i11++;
            cellLayout = this;
        }
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        v vVar = new v(getContext(), attributeSet);
        vVar.f80184h = true;
        vVar.f80185i = true;
        vVar.f80182f = 1;
        vVar.f80183g = 1;
        return vVar;
    }

    public void h(int i5, int i11) {
        Point point = this.f20901f;
        int iA = j0.a(i5, point.x, this.f20903g);
        int i12 = point.y;
        int i13 = this.f20904h;
        int i14 = (i11 - ((i13 - 1) * i12)) / i13;
        if (iA == this.f20893b && i14 == this.f20895c) {
            return;
        }
        this.f20893b = iA;
        this.f20895c = i14;
        this.P.getClass();
    }

    public final void i(int i5, int i11, int[] iArr) {
        j(i5, i11, 1, 1, this.W);
        Rect rect = this.W;
        iArr[0] = rect.left;
        iArr[1] = rect.top;
    }

    public final void j(int i5, int i11, int i12, int i13, Rect rect) {
        int i14 = this.f20893b;
        int i15 = this.f20895c;
        int paddingLeft = getPaddingLeft() + ((int) Math.ceil(C() / 2.0f));
        int paddingTop = getPaddingTop();
        Point point = this.f20901f;
        int i16 = point.x;
        int i17 = (i5 * i14) + (i5 * i16) + paddingLeft;
        int i18 = point.y;
        int i19 = (i11 * i15) + (i11 * i18) + paddingTop;
        rect.set(i17, i19, ((i12 - 1) * i16) + (i14 * i12) + i17, ((i13 - 1) * i18) + (i15 * i13) + i19);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0125 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void n(View view, u uVar) {
        b3 b3Var;
        int i5;
        boolean z11;
        boolean z12;
        View view2 = view;
        this.n.a(this.f20909m);
        q0 q0Var = n1.C0;
        n1 n1Var = (n1) this.f20891a;
        int iM0 = n1Var.O.M0(this);
        int i11 = this.Q == 1 ? -101 : -100;
        b3 b3Var2 = this.P;
        int childCount = b3Var2.getChildCount();
        int i12 = 0;
        while (i12 < childCount) {
            View childAt = b3Var2.getChildAt(i12);
            v vVar = (v) childAt.getLayoutParams();
            e eVar = (e) childAt.getTag();
            if (eVar == null || childAt == view2) {
                b3Var = b3Var2;
                i5 = i12;
            } else {
                if (b3Var2.b(childAt, view2)) {
                    b3Var = b3Var2;
                    i5 = i12;
                } else {
                    if (uVar != null) {
                        v vVar2 = (v) childAt.getLayoutParams();
                        boolean z13 = vVar2.f80181e;
                        int i13 = z13 ? vVar2.f80179c : vVar2.f80177a;
                        int i14 = z13 ? vVar2.f80180d : vVar2.f80178b;
                        int i15 = uVar.f97095a;
                        int i16 = uVar.f97096b;
                        b3Var = b3Var2;
                        i5 = i12;
                        if (new Rect(i15, i16, uVar.f97097c + i15, uVar.f97098d + i16).intersect(i13, i14, vVar2.f80182f + i13, vVar2.f80183g + i14)) {
                        }
                        z12 = (eVar.f57293e.c(this) == vVar.f80179c && eVar.f57294f.c(this) == vVar.f80180d && eVar.f57295g.c(this) == vVar.f80182f && eVar.f57296h.c(this) == vVar.f80183g && eVar.f57303q.e() == z11) ? false : true;
                        int i17 = vVar.f80179c;
                        vVar.f80177a = i17;
                        vVar.f80178b = vVar.f80180d;
                        eVar.f57293e = n30.a.b(this, i17);
                        eVar.f57294f = n30.a.b(this, vVar.f80178b);
                        eVar.f57295g = b.b(this, vVar.f80182f);
                        eVar.f57296h = b.b(this, vVar.f80183g);
                        if (!eVar.f57303q.e() && z11) {
                            ea.b.a("CellLayout", "updateOverlapping " + z11 + " " + eVar);
                        }
                        eVar.f57303q.h(z11);
                        if (!z12) {
                            n1Var.f80002c0.j(eVar, i11, iM0, eVar.f57293e, eVar.f57294f, eVar.f57295g, eVar.f57296h);
                        }
                    } else {
                        b3Var = b3Var2;
                        i5 = i12;
                    }
                    z11 = false;
                    if (eVar.f57293e.c(this) == vVar.f80179c) {
                        int i172 = vVar.f80179c;
                        vVar.f80177a = i172;
                        vVar.f80178b = vVar.f80180d;
                        eVar.f57293e = n30.a.b(this, i172);
                        eVar.f57294f = n30.a.b(this, vVar.f80178b);
                        eVar.f57295g = b.b(this, vVar.f80182f);
                        eVar.f57296h = b.b(this, vVar.f80183g);
                        if (!eVar.f57303q.e()) {
                            ea.b.a("CellLayout", "updateOverlapping " + z11 + " " + eVar);
                        }
                        eVar.f57303q.h(z11);
                        if (!z12) {
                        }
                    }
                }
                z11 = true;
                if (eVar.f57293e.c(this) == vVar.f80179c) {
                }
            }
            i12 = i5 + 1;
            view2 = view;
            b3Var2 = b3Var;
        }
        postDelayed(new g.p(this, 24), Math.max(PerAppFeatureCatalog.MAX_TOOLS, Math.max(650, 300)));
    }

    public final void o() {
        ArrayMap arrayMap = this.B;
        Iterator it = arrayMap.values().iterator();
        while (it.hasNext()) {
            ((w) it.next()).c();
        }
        arrayMap.clear();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        Canvas canvas2;
        int i5;
        Drawable drawable = this.f20912r;
        if (drawable.getAlpha() > 0) {
            drawable.draw(canvas);
        }
        float alpha = this.P.getAlpha();
        int[] iArr = this.f20907k;
        if (alpha > 0.5f) {
            int i11 = 0;
            while (true) {
                ArrayList arrayList = this.f20910p;
                if (i11 >= arrayList.size()) {
                    break;
                }
                t tVar = (t) arrayList.get(i11);
                i(tVar.f80127a, tVar.f80128b, iArr);
                canvas.save();
                canvas.translate(iArr[0], iArr[1]);
                y yVar = (y) tVar;
                yVar.b(canvas);
                if (!yVar.f96988q) {
                    yVar.c(canvas);
                }
                canvas.restore();
                i11++;
            }
        }
        y yVar2 = this.f20911q;
        int i12 = yVar2.f80127a;
        if (i12 < 0 || (i5 = yVar2.f80128b) < 0) {
            canvas2 = canvas;
        } else {
            i(i12, i5, iArr);
            canvas.save();
            canvas.translate(iArr[0], iArr[1]);
            float f11 = yVar2.f96978e;
            yVar2.f96978e = 0.5f;
            Paint paint = yVar2.f96977d;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.argb(160, 245, 245, 245));
            canvas2 = canvas;
            yVar2.f96993v.f56204a.d(canvas2, yVar2.f(), yVar2.g(), yVar2.h(), paint);
            yVar2.f96978e = f11;
            canvas2.restore();
        }
        if (this.D) {
            V(canvas2);
        }
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (this.f20892a0 != null) {
            return true;
        }
        Workspace workspace = this.o;
        return workspace != null && workspace.onTouch(this, motionEvent);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int paddingLeft = getPaddingLeft() + ((int) Math.ceil(C() / 2.0f));
        int paddingRight = ((i12 - i5) - getPaddingRight()) - ((int) Math.ceil(C() / 2.0f));
        int paddingTop = getPaddingTop();
        int paddingBottom = (i13 - i11) - getPaddingBottom();
        Drawable drawable = this.f20912r;
        Rect rect = this.W;
        drawable.getPadding(rect);
        drawable.setBounds((paddingLeft - rect.left) - getPaddingLeft(), (paddingTop - rect.top) - getPaddingTop(), getPaddingRight() + rect.right + paddingRight, getPaddingBottom() + rect.bottom + paddingBottom);
        this.P.layout(paddingLeft, paddingTop, paddingRight, paddingBottom);
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        int i12;
        int mode = View.MeasureSpec.getMode(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i5);
        int size2 = View.MeasureSpec.getSize(i11);
        int paddingRight = size - (getPaddingRight() + getPaddingLeft());
        int paddingBottom = size2 - (getPaddingBottom() + getPaddingTop());
        if (this.f20897d < 0 || this.f20899e < 0) {
            h(paddingRight, paddingBottom);
        }
        int i13 = this.f20913s;
        if (i13 > 0 && (i12 = this.f20914t) > 0) {
            paddingRight = i13;
            paddingBottom = i12;
        } else if (mode == 0 || mode2 == 0) {
            throw new RuntimeException("CellLayout cannot have UNSPECIFIED dimensions");
        }
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(paddingRight, 1073741824);
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(paddingBottom, 1073741824);
        b3 b3Var = this.P;
        b3Var.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
        int measuredWidth = b3Var.getMeasuredWidth();
        int measuredHeight = b3Var.getMeasuredHeight();
        if (this.f20913s <= 0 || this.f20914t <= 0) {
            setMeasuredDimension(size, size2);
        } else {
            setMeasuredDimension(measuredWidth, measuredHeight);
        }
    }

    public final void q(u uVar) {
        b3 b3Var = this.P;
        int childCount = b3Var.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = b3Var.getChildAt(i5);
            v vVar = (v) childAt.getLayoutParams();
            int i11 = vVar.f80177a;
            int i12 = vVar.f80178b;
            int i13 = vVar.f80182f;
            int i14 = vVar.f80183g;
            ya.a aVar = new ya.a();
            aVar.f97095a = i11;
            aVar.f97096b = i12;
            aVar.f97097c = i13;
            aVar.f97098d = i14;
            uVar.a(childAt, aVar);
        }
    }

    public final void r(View view, u uVar) {
        o oVar = this.n;
        oVar.d(0, 0, oVar.f97181a, oVar.f97182b, false);
        b3 b3Var = this.P;
        int childCount = b3Var.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = b3Var.getChildAt(i5);
            if (childAt != view) {
                v vVar = (v) childAt.getLayoutParams();
                ya.a aVar = (ya.a) uVar.f80141e.get(childAt);
                if (aVar != null) {
                    vVar.f80179c = aVar.f97095a;
                    vVar.f80180d = aVar.f97096b;
                    vVar.f80182f = aVar.f97097c;
                    vVar.f80183g = aVar.f97098d;
                    this.n.e(aVar, true);
                }
            }
        }
        this.n.e(uVar, true);
    }

    @Override // android.view.ViewGroup
    public final void removeAllViews() {
        o oVar = this.f20909m;
        oVar.d(0, 0, oVar.f97181a, oVar.f97182b, false);
        this.P.removeAllViews();
    }

    @Override // android.view.ViewGroup
    public final void removeAllViewsInLayout() {
        b3 b3Var = this.P;
        if (b3Var.getChildCount() > 0) {
            o oVar = this.f20909m;
            oVar.d(0, 0, oVar.f97181a, oVar.f97182b, false);
            b3Var.removeAllViewsInLayout();
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void removeView(View view) {
        H(view);
        this.P.removeView(view);
    }

    @Override // android.view.ViewGroup
    public final void removeViewAt(int i5) {
        b3 b3Var = this.P;
        H(b3Var.getChildAt(i5));
        b3Var.removeViewAt(i5);
    }

    @Override // android.view.ViewGroup
    public final void removeViewInLayout(View view) {
        H(view);
        this.P.removeViewInLayout(view);
    }

    @Override // android.view.ViewGroup
    public final void removeViews(int i5, int i11) {
        int i12 = i5;
        while (true) {
            int i13 = i5 + i11;
            b3 b3Var = this.P;
            if (i12 >= i13) {
                b3Var.removeViews(i5, i11);
                return;
            } else {
                H(b3Var.getChildAt(i12));
                i12++;
            }
        }
    }

    @Override // android.view.ViewGroup
    public final void removeViewsInLayout(int i5, int i11) {
        int i12 = i5;
        while (true) {
            int i13 = i5 + i11;
            b3 b3Var = this.P;
            if (i12 >= i13) {
                b3Var.removeViewsInLayout(i5, i11);
                return;
            } else {
                H(b3Var.getChildAt(i12));
                i12++;
            }
        }
    }

    public final void s(boolean z11) {
        this.P.setLayerType(z11 ? 2 : 0, f20888h0);
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }

    public final boolean t(n30.a[] aVarArr, b bVar, b bVar2) {
        int iC = bVar.c(this);
        int iC2 = bVar2.c(this);
        int[] iArr = this.f20896c0;
        if (this.f20909m.b(iC, iC2, iArr == null ? new int[2] : iArr)) {
            aVarArr[0] = n30.a.b(this, iArr[0]);
            aVarArr[1] = n30.a.b(this, iArr[1]);
            return true;
        }
        n30.a aVar = n30.a.f77776b;
        aVarArr[0] = aVar;
        aVarArr[1] = aVar;
        return false;
    }

    public final void u(int i5, int i11, int i12, int i13, int[] iArr, boolean[][] zArr, boolean[][] zArr2, int[] iArr2) {
        int i14;
        int[] iArr3 = iArr2 != null ? iArr2 : new int[2];
        int i15 = this.f20903g;
        int i16 = this.f20904h;
        int i17 = Integer.MIN_VALUE;
        float f11 = Float.MAX_VALUE;
        for (int i18 = 0; i18 < i16 - (i13 - 1); i18++) {
            for (int i19 = 0; i19 < i15 - (i12 - 1); i19++) {
                for (int i21 = 0; i21 < i12; i21++) {
                    for (int i22 = 0; i22 < i13; i22++) {
                        if (zArr[i19 + i21][i18 + i22] && (zArr2 == null || zArr2[i21][i22])) {
                            i14 = i17;
                            break;
                        }
                    }
                }
                int i23 = i19 - i5;
                int i24 = i18 - i11;
                int i25 = i17;
                float fHypot = (float) Math.hypot(i23, i24);
                int[] iArr4 = this.f20906j;
                p(i23, i24, iArr4);
                i17 = (iArr[1] * iArr4[1]) + (iArr[0] * iArr4[0]);
                if (Float.compare(fHypot, f11) >= 0) {
                    if (Float.compare(fHypot, f11) == 0) {
                        i14 = i25;
                        if (i17 > i14) {
                        }
                    } else {
                        i14 = i25;
                    }
                    i17 = i14;
                }
                iArr3[0] = i19;
                iArr3[1] = i18;
                f11 = fHypot;
            }
        }
        if (f11 == Float.MAX_VALUE) {
            iArr3[0] = -1;
            iArr3[1] = -1;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:80:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0148  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x014e  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0151  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int[] v(int i5, int i11, int i12, int i13, int i14, int i15, boolean z11, int[] iArr, int[] iArr2) {
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        int i22;
        boolean z12;
        int i23;
        int i24;
        Stack stack;
        int i25;
        int i26;
        int i27;
        boolean z13;
        int i28;
        int i29;
        CellLayout cellLayout = this;
        Stack stack2 = cellLayout.f20894b0;
        if (stack2.isEmpty()) {
            for (int i31 = 0; i31 < cellLayout.f20903g * cellLayout.f20904h; i31++) {
                stack2.push(new Rect());
            }
        }
        int i32 = (int) (i5 - (((i14 - 1) * cellLayout.f20893b) / 2.0f));
        int i33 = (int) (i11 - (((i15 - 1) * cellLayout.f20895c) / 2.0f));
        int[] iArr3 = iArr != null ? iArr : new int[2];
        Rect rect = new Rect(-1, -1, -1, -1);
        Stack stack3 = new Stack();
        int i34 = cellLayout.f20903g;
        int i35 = cellLayout.f20904h;
        if (i12 > 0 && i13 > 0 && i14 > 0 && i15 > 0 && i14 >= i12 && i15 >= i13) {
            Stack stack4 = stack3;
            double d5 = Double.MAX_VALUE;
            int i36 = 0;
            while (i36 < i35 - (i13 - 1)) {
                int i37 = 0;
                while (i37 < i34 - (i12 - 1)) {
                    if (z11) {
                        int i38 = 0;
                        while (i38 < i12) {
                            int i39 = i37;
                            int i40 = 0;
                            while (i40 < i13) {
                                int i41 = i40;
                                if (cellLayout.f20909m.f97183c[i39 + i38][i36 + i41]) {
                                    i24 = i36;
                                    i21 = i34;
                                    stack = stack4;
                                    i23 = i39;
                                    i22 = i35;
                                    break;
                                }
                                i40 = i41 + 1;
                            }
                            i38++;
                            i37 = i39;
                        }
                        i16 = i37;
                        boolean z14 = i12 >= i14;
                        boolean z15 = i13 >= i15;
                        boolean z16 = z14;
                        i17 = i36;
                        int i42 = i12;
                        int i43 = i13;
                        boolean z17 = true;
                        while (true) {
                            if (z16 && z15) {
                                break;
                            }
                            if (!z17 || z16) {
                                i25 = i43;
                                i26 = i34;
                                if (z15) {
                                    i27 = i42;
                                } else {
                                    int i44 = 0;
                                    while (i44 < i42) {
                                        int i45 = i17 + i25;
                                        int i46 = i42;
                                        if (i45 > i35 - 1 || cellLayout.f20909m.f97183c[i16 + i44][i45]) {
                                            z15 = true;
                                        }
                                        i44++;
                                        i42 = i46;
                                    }
                                    i27 = i42;
                                    if (!z15) {
                                        z13 = z16;
                                        i29 = i25 + 1;
                                        i28 = i27;
                                        boolean z18 = z13 | (i28 < i14);
                                        z15 |= i29 < i15;
                                        z17 = !z17;
                                        z16 = z18;
                                        i42 = i28;
                                        i43 = i29;
                                        i34 = i26;
                                    }
                                }
                                z13 = z16;
                                i28 = i27;
                            } else {
                                boolean z19 = z16;
                                i26 = i34;
                                int i47 = 0;
                                while (i47 < i43) {
                                    int i48 = i43;
                                    int i49 = i16 + i42;
                                    int i51 = i47;
                                    if (i49 > i26 - 1 || cellLayout.f20909m.f97183c[i49][i17 + i51]) {
                                        z19 = true;
                                    }
                                    i47 = i51 + 1;
                                    i43 = i48;
                                }
                                i25 = i43;
                                if (!z19) {
                                    i42++;
                                }
                                i28 = i42;
                                z13 = z19;
                            }
                            i29 = i25;
                            boolean z182 = z13 | (i28 < i14);
                            z15 |= i29 < i15;
                            z17 = !z17;
                            z16 = z182;
                            i42 = i28;
                            i43 = i29;
                            i34 = i26;
                        }
                        i18 = i42;
                        i19 = i43;
                    } else {
                        i16 = i37;
                        i17 = i36;
                        i18 = -1;
                        i19 = -1;
                    }
                    i21 = i34;
                    Stack stack5 = stack4;
                    int i52 = i16;
                    i22 = i35;
                    int i53 = i17;
                    cellLayout.N(i52, i53, 1, 1, cellLayout.f20906j);
                    Rect rect2 = (Rect) stack2.pop();
                    rect2.set(i52, i53, i52 + i18, i53 + i19);
                    Iterator it = stack5.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            z12 = false;
                            break;
                        }
                        if (((Rect) it.next()).contains(rect2)) {
                            z12 = true;
                            break;
                        }
                    }
                    stack5.push(rect2);
                    i23 = i52;
                    i24 = i53;
                    stack = stack5;
                    boolean z21 = z12;
                    double dHypot = Math.hypot(r5[0] - i32, r5[1] - i33);
                    if ((dHypot <= d5 && !z21) || rect2.contains(rect)) {
                        iArr3[0] = i23;
                        iArr3[1] = i24;
                        if (iArr2 != null) {
                            iArr2[0] = i18;
                            iArr2[1] = i19;
                        }
                        rect.set(rect2);
                        d5 = dHypot;
                    }
                    i37 = i23 + 1;
                    cellLayout = this;
                    stack4 = stack;
                    i36 = i24;
                    i35 = i22;
                    i34 = i21;
                }
                i36++;
                cellLayout = this;
            }
            Stack stack6 = stack4;
            if (d5 == Double.MAX_VALUE) {
                iArr3[0] = -1;
                iArr3[1] = -1;
            }
            while (!stack6.isEmpty()) {
                stack2.push((Rect) stack6.pop());
            }
        }
        return iArr3;
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.f20912r;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:102:0x03a3  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x03ae  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x03f3  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x013e A[PHI: r9
      0x013e: PHI (r9v14 int) = (r9v8 int), (r9v8 int), (r9v8 int), (r9v15 int), (r9v15 int), (r9v15 int), (r9v15 int) binds: [B:47:0x01a9, B:50:0x01c4, B:53:0x01e4, B:34:0x013c, B:37:0x0156, B:40:0x0173, B:43:0x0188] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0223  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x022b  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0335  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final u w(int i5, int i11, int i12, int i13, int i14, int i15, int[] iArr, View view, boolean z11, u uVar, boolean z12) {
        int iMin;
        int iMin2;
        int i16;
        int i17;
        int i18;
        int i19;
        int[] iArr2;
        boolean z13;
        int i21;
        int i22;
        int i23;
        ArrayList arrayList;
        u uVar2;
        int size;
        Rect rect;
        int i24;
        int i25;
        int i26;
        boolean z14;
        int i27;
        CellLayout cellLayout = this;
        ArrayMap arrayMap = uVar.f80141e;
        y2.f51877a.getClass();
        s2 s2Var = y2.f51879a1;
        KProperty kProperty = y2.f51881b[100];
        s2Var.getClass();
        boolean zBooleanValue = z12 | ((Boolean) s2Var.l()).booleanValue();
        if (zBooleanValue) {
            int iMin3 = Math.min(cellLayout.f20903g, i14);
            int iMin4 = Math.min(cellLayout.f20904h, i15);
            i16 = iMin3;
            iMin = Math.min(cellLayout.f20903g, i12);
            iMin2 = Math.min(cellLayout.f20904h, i13);
            i17 = iMin4;
        } else {
            iMin = i12;
            iMin2 = i13;
            i16 = i14;
            i17 = i15;
        }
        cellLayout.q(uVar);
        cellLayout.f20909m.a(cellLayout.n);
        int i28 = i16;
        int[] iArrV = cellLayout.v(i5, i11, i28, i17, i16, i17, false, new int[2], null);
        int i29 = i28;
        int i31 = i17;
        if (zBooleanValue) {
            i18 = i29;
            i19 = i31;
            iArr2 = iArrV;
        } else {
            int i32 = iArrV[0];
            int i33 = iArrV[1];
            if (i32 < 0 || i33 < 0) {
                i18 = i29;
                i19 = i31;
                iArr2 = iArrV;
            } else {
                ArrayList arrayList2 = cellLayout.S;
                arrayList2.clear();
                int i34 = i32 + i29;
                int i35 = i33 + i31;
                boolean z15 = false;
                Rect rect2 = cellLayout.T;
                rect2.set(i32, i33, i34, i35);
                if (view != null) {
                    i22 = 1;
                    ya.a aVar = (ya.a) arrayMap.get(view);
                    if (aVar != null) {
                        aVar.f97095a = i32;
                        aVar.f97096b = i33;
                    }
                } else {
                    i22 = 1;
                }
                Rect rect3 = new Rect(i32, i33, i34, i35);
                Rect rect4 = new Rect();
                Iterator it = arrayMap.keySet().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        int i36 = i29;
                        int i37 = i31;
                        iArr2 = iArrV;
                        uVar.f80144h = new ArrayList(arrayList2);
                        int iAbs = Math.abs(iArr[i22]) + Math.abs(iArr[0]);
                        Rect rect5 = cellLayout.T;
                        int i38 = i22;
                        if (iAbs > i38) {
                            int i39 = iArr[i38];
                            iArr[i38] = 0;
                            i23 = i38;
                            if (!cellLayout.M(arrayList2, rect5, iArr, view, uVar)) {
                                iArr[i23] = i39;
                                int i40 = iArr[0];
                                iArr[0] = 0;
                                if (!M(arrayList2, rect5, iArr, view, uVar)) {
                                    iArr[0] = i40;
                                    iArr[0] = i40 * (-1);
                                    int i41 = iArr[i23] * (-1);
                                    iArr[i23] = i41;
                                    iArr[i23] = 0;
                                    if (!M(arrayList2, rect5, iArr, view, uVar)) {
                                        iArr[i23] = i41;
                                        int i42 = iArr[0];
                                        iArr[0] = 0;
                                        if (!M(arrayList2, rect5, iArr, view, uVar)) {
                                            iArr[0] = i42;
                                            iArr[0] = i42 * (-1);
                                            iArr[i23] = iArr[i23] * (-1);
                                            cellLayout = this;
                                            uVar2 = uVar;
                                            arrayList = arrayList2;
                                            size = arrayList.size();
                                            int[] iArr3 = cellLayout.f20907k;
                                            if (size != 0) {
                                                i18 = i36;
                                                i19 = i37;
                                                rect = rect2;
                                                i25 = i23;
                                            } else {
                                                Rect rect6 = new Rect();
                                                uVar2.c(arrayList, rect6);
                                                Iterator it2 = arrayList.iterator();
                                                while (it2.hasNext()) {
                                                    cellLayout.n.e((ya.a) arrayMap.get((View) it2.next()), false);
                                                }
                                                o oVar = new o(rect6.width(), rect6.height());
                                                int i43 = rect6.top;
                                                int i44 = rect6.left;
                                                Iterator it3 = arrayList.iterator();
                                                while (it3.hasNext()) {
                                                    ya.a aVar2 = (ya.a) arrayMap.get((View) it3.next());
                                                    oVar.d(aVar2.f97095a - i44, aVar2.f97096b - i43, aVar2.f97097c, aVar2.f97098d, true);
                                                }
                                                o oVar2 = cellLayout.n;
                                                oVar2.getClass();
                                                oVar2.d(rect2.left, rect2.top, rect2.width(), rect2.height(), true);
                                                i18 = i36;
                                                i19 = i37;
                                                boolean z16 = i23;
                                                rect = rect2;
                                                z15 = false;
                                                cellLayout.u(rect6.left, rect6.top, rect6.width(), rect6.height(), iArr, cellLayout.n.f97183c, oVar.f97183c, cellLayout.f20907k);
                                                int i45 = iArr3[0];
                                                if (i45 < 0 || (i26 = iArr3[z16 ? 1 : 0]) < 0) {
                                                    i24 = 0;
                                                } else {
                                                    int i46 = i45 - rect6.left;
                                                    int i47 = i26 - rect6.top;
                                                    Iterator it4 = arrayList.iterator();
                                                    while (it4.hasNext()) {
                                                        ya.a aVar3 = (ya.a) arrayMap.get((View) it4.next());
                                                        aVar3.f97095a += i46;
                                                        aVar3.f97096b += i47;
                                                    }
                                                    i24 = z16 ? 1 : 0;
                                                }
                                                Iterator it5 = arrayList.iterator();
                                                while (it5.hasNext()) {
                                                    cellLayout.n.e((ya.a) arrayMap.get((View) it5.next()), z16);
                                                }
                                                i25 = i24;
                                            }
                                            if (i25 == 0) {
                                                Iterator it6 = arrayList.iterator();
                                                while (it6.hasNext()) {
                                                    ya.a aVar4 = (ya.a) arrayMap.get((View) it6.next());
                                                    cellLayout.n.e(aVar4, z15);
                                                    o oVar3 = cellLayout.n;
                                                    oVar3.getClass();
                                                    oVar3.d(rect.left, rect.top, rect.width(), rect.height(), true);
                                                    cellLayout.u(aVar4.f97095a, aVar4.f97096b, aVar4.f97097c, aVar4.f97098d, iArr, cellLayout.n.f97183c, null, cellLayout.f20907k);
                                                    int i48 = iArr3[0];
                                                    if (i48 < 0 || (i27 = iArr3[1]) < 0) {
                                                        z14 = false;
                                                    } else {
                                                        aVar4.f97095a = i48;
                                                        aVar4.f97096b = i27;
                                                        z14 = true;
                                                    }
                                                    cellLayout.n.e(aVar4, true);
                                                    if (z14) {
                                                        z15 = false;
                                                    }
                                                }
                                            }
                                            i21 = 1;
                                        }
                                    }
                                }
                            }
                            cellLayout = this;
                            i18 = i36;
                            i19 = i37;
                            i21 = i23;
                        } else {
                            i23 = i38;
                            if (cellLayout.M(arrayList2, rect5, iArr, view, uVar)) {
                                cellLayout = this;
                                i18 = i36;
                                i19 = i37;
                                i21 = i23;
                            } else {
                                iArr[0] = iArr[0] * (-1);
                                iArr[i23] = iArr[i23] * (-1);
                                if (!M(arrayList2, rect5, iArr, view, uVar)) {
                                    int i49 = iArr[0] * (-1);
                                    iArr[0] = i49;
                                    int i51 = iArr[i23] * (-1);
                                    iArr[i23] = i51;
                                    iArr[i23] = i49;
                                    iArr[0] = i51;
                                    if (!M(arrayList2, rect5, iArr, view, uVar)) {
                                        iArr[0] = iArr[0] * (-1);
                                        iArr[i23] = iArr[i23] * (-1);
                                        cellLayout = this;
                                        arrayList = arrayList2;
                                        uVar2 = uVar;
                                        if (!cellLayout.M(arrayList2, rect5, iArr, view, uVar)) {
                                            int i52 = iArr[0] * (-1);
                                            iArr[0] = i52;
                                            int i53 = iArr[i23] * (-1);
                                            iArr[i23] = i53;
                                            iArr[i23] = i52;
                                            iArr[0] = i53;
                                            size = arrayList.size();
                                            int[] iArr32 = cellLayout.f20907k;
                                            if (size != 0) {
                                            }
                                            if (i25 == 0) {
                                            }
                                            i21 = 1;
                                        }
                                    }
                                    i18 = i36;
                                    i19 = i37;
                                    i21 = i23;
                                }
                            }
                        }
                        if (!z13) {
                            uVar.f80145i = true;
                            uVar.f97095a = iArr2[0];
                            uVar.f97096b = iArr2[1];
                            uVar.f97097c = i18;
                            uVar.f97098d = i19;
                            return uVar;
                        }
                        int i54 = i18;
                        int i55 = i19;
                        if (i54 > iMin && (iMin2 == i55 || z11)) {
                            return cellLayout.w(i5, i11, iMin, iMin2, i54 - 1, i55, iArr, view, false, uVar, false);
                        }
                        int i56 = iMin;
                        int i57 = iMin2;
                        if (i55 > i57) {
                            return w(i5, i11, i56, i57, i54, i55 - 1, iArr, view, true, uVar, false);
                        }
                        uVar.f80145i = false;
                        return uVar;
                    }
                    View view2 = (View) it.next();
                    if (view2 != view) {
                        ya.a aVar5 = (ya.a) arrayMap.get(view2);
                        Iterator it7 = it;
                        v vVar = (v) view2.getLayoutParams();
                        int i58 = i29;
                        int i59 = aVar5.f97095a;
                        int i61 = i31;
                        int i62 = aVar5.f97096b;
                        iArr2 = iArrV;
                        rect4.set(i59, i62, aVar5.f97097c + i59, aVar5.f97098d + i62);
                        if (Rect.intersects(rect3, rect4)) {
                            if (!vVar.f80185i) {
                                i21 = 0;
                                i18 = i58;
                                i19 = i61;
                                break;
                            }
                            arrayList2.add(view2);
                        }
                        it = it7;
                        i29 = i58;
                        i31 = i61;
                        iArrV = iArr2;
                    }
                }
                if (i21 != 0) {
                    z13 = false;
                }
                if (!z13) {
                }
            }
            i21 = 0;
            if (i21 != 0) {
            }
            if (!z13) {
            }
        }
        z13 = true;
        if (!z13) {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0043  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final float x(float f11, float f12, n30.a[] aVarArr) {
        View viewB = B(aVarArr[0], aVarArr[1]);
        if (viewB == 0) {
            return Float.MAX_VALUE;
        }
        boolean z11 = viewB instanceof p;
        int[] iArr = this.f20906j;
        if (z11) {
            p pVar = (p) viewB;
            if (pVar.m() == 0) {
                i(aVarArr[0].c(this), aVarArr[1].c(this), iArr);
                Rect rect = this.W;
                pVar.d(rect);
                rect.offset(iArr[0], iArr[1]);
                iArr[0] = rect.centerX();
                iArr[1] = rect.centerY();
            } else {
                v vVar = (v) viewB.getLayoutParams();
                N(vVar.f80177a, vVar.f80178b, vVar.f80182f, vVar.f80183g, iArr);
            }
        }
        return (float) Math.hypot(f11 - iArr[0], f12 - iArr[1]);
    }

    public final float y(n30.a[] aVarArr) {
        return (A(aVarArr) + ((this.f20891a.P().D * 0.92f) / 2.0f)) / 2.0f;
    }

    public final String z(int i5, int i11) {
        if (this.Q == 1) {
            return getContext().getString(2132018644, Integer.valueOf(Math.max(i5, i11) + 1));
        }
        String strD = n30.a.b(this, i5).d();
        return getContext().getString(2132018643, n30.a.b(this, i11).d(), strD);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CellLayout(Context context, AttributeSet attributeSet, int i5) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        this.f20905i = false;
        this.f20906j = new int[2];
        this.f20907k = new int[2];
        this.f20908l = new PointF();
        this.f20910p = new ArrayList();
        y yVar = new y();
        this.f20911q = yVar;
        this.f20913s = -1;
        this.f20914t = -1;
        this.f20915u = false;
        this.f20916v = new v[4];
        this.f20917w = new float[4];
        this.f20918x = new u0[4];
        this.f20919y = 0;
        this.f20920z = new Paint();
        this.A = new ArrayMap();
        this.B = new ArrayMap();
        this.C = false;
        this.D = true;
        this.E = new RectF();
        this.F = new Paint(1);
        this.H = 0.0f;
        this.I = 0;
        this.J = 0.0f;
        this.K = 0.0f;
        int[] iArr = new int[2];
        this.L = iArr;
        int[] iArr2 = new int[2];
        this.M = iArr2;
        this.N = false;
        this.S = new ArrayList();
        this.T = new Rect();
        this.U = new int[2];
        int[] iArr3 = new int[2];
        this.V = iArr3;
        this.W = new Rect();
        new RectF();
        this.f20894b0 = new Stack();
        this.f20896c0 = new int[2];
        this.f20898d0 = new int[2];
        this.f20902f0 = null;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80154c, 0, 0);
        int integer = typedArrayObtainStyledAttributes.getInteger(2, -1);
        this.Q = integer;
        typedArrayObtainStyledAttributes.recycle();
        boolean z11 = integer == 0 && ((t0) y2.f51877a.u().l()).f51823c;
        this.f20900e0 = z11;
        setWillNotDraw(false);
        setClipToPadding(false);
        d dVar = (d) d.p(context);
        this.f20891a = dVar;
        j0 j0VarP = dVar.P();
        this.f20901f = integer == 2 ? new Point(j0VarP.O) : new Point(j0VarP.f77167t);
        this.f20895c = -1;
        this.f20893b = -1;
        this.f20899e = -1;
        this.f20897d = -1;
        z0 z0Var = j0VarP.f77131a;
        int i11 = z0Var.f80269b * (z11 ? 2 : 1);
        this.f20903g = i11;
        int i12 = z0Var.f80268a * (z11 ? 2 : 1);
        this.f20904h = i12;
        this.f20909m = new o(i11, i12);
        this.n = new o(this.f20903g, this.f20904h);
        iArr3[0] = -100;
        iArr3[1] = -100;
        yVar.f80127a = -1;
        yVar.f80128b = -1;
        setAlwaysDrawnWithCacheEnabled(false);
        Resources resources = getResources();
        Drawable drawable = getContext().getDrawable(2131231158);
        this.f20912r = drawable;
        drawable.setCallback(this);
        drawable.setAlpha(0);
        drawable.setTint(dVar.C().f90098a.f90178a);
        this.I = dVar.C().f90098a.f90180c;
        resources.getDimensionPixelSize(2131165529);
        this.G = w20.e.k(10);
        this.R = j0VarP.D * 0.12f;
        this.O = s9.k.f86796i;
        iArr[1] = -1;
        iArr[0] = -1;
        iArr2[1] = -1;
        iArr2[0] = -1;
        int i13 = 0;
        while (true) {
            v[] vVarArr = this.f20916v;
            if (i13 >= vVarArr.length) {
                break;
            }
            vVarArr[i13] = new v(0, 0, 0, 0);
            i13++;
        }
        this.f20920z.setColor(aa.p.b(context, 2130970363));
        int integer2 = resources.getInteger(2131492871);
        float integer3 = resources.getInteger(2131492872);
        Arrays.fill(this.f20917w, 0.0f);
        for (int i14 = 0; i14 < this.f20918x.length; i14++) {
            u0 u0Var = new u0(integer3, integer2);
            u0Var.f80149c.setInterpolator(this.O);
            u0Var.f80149c.addUpdateListener(new q(this, i14));
            this.f20918x[i14] = u0Var;
        }
        b3 b3Var = new b3(context, this.Q);
        this.P = b3Var;
        addView(b3Var);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        v vVar = new v(layoutParams);
        vVar.f80184h = true;
        vVar.f80185i = true;
        vVar.f80182f = 1;
        vVar.f80183g = 1;
        return vVar;
    }
}
