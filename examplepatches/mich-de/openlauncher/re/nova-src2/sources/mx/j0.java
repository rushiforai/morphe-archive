package mx;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.Size;
import android.util.TypedValue;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import e10.a3;
import e10.i3;
import e10.j3;
import e10.s1;
import e10.y2;
import e10.z2;
import java.util.LinkedHashMap;
import java.util.regex.Pattern;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import o9.g3;

/* loaded from: classes.dex */
public final class j0 {
    public final int A;
    public final int A0;
    public final int B;
    public final f B0;
    public float C;
    public final f C0;
    public int D;
    public final f D0;
    public int E;
    public final f E0;
    public int F;
    public final f F0;
    public final int G;
    public final int G0;
    public float H;
    public int H0;
    public int I;
    public final LinkedHashMap I0;
    public int J;
    public final LinkedHashMap J0;
    public final int K;
    public int K0;
    public int L;
    public int M;
    public int N;
    public final Point O;
    public final int P;
    public final int Q;
    public int R;
    public int S;
    public int T;
    public int U;
    public int V;
    public final int W;
    public int X;
    public final int Y;
    public final int Z;

    /* renamed from: a, reason: collision with root package name */
    public final o9.z0 f77131a;

    /* renamed from: a0, reason: collision with root package name */
    public final int f77132a0;

    /* renamed from: b, reason: collision with root package name */
    public final ya.e f77133b;

    /* renamed from: b0, reason: collision with root package name */
    public final int f77134b0;

    /* renamed from: c, reason: collision with root package name */
    public final DisplayMetrics f77135c;

    /* renamed from: c0, reason: collision with root package name */
    public final int f77136c0;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f77137d;

    /* renamed from: d0, reason: collision with root package name */
    public int f77138d0;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f77139e;

    /* renamed from: e0, reason: collision with root package name */
    public int f77140e0;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f77141f;

    /* renamed from: f0, reason: collision with root package name */
    public int f77142f0;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f77143g;

    /* renamed from: g0, reason: collision with root package name */
    public int f77144g0;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f77145h;

    /* renamed from: h0, reason: collision with root package name */
    public final int f77146h0;

    /* renamed from: i, reason: collision with root package name */
    public final int f77147i;

    /* renamed from: i0, reason: collision with root package name */
    public float f77148i0;

    /* renamed from: j, reason: collision with root package name */
    public final int f77149j;

    /* renamed from: j0, reason: collision with root package name */
    public final int f77150j0;

    /* renamed from: k, reason: collision with root package name */
    public final int f77151k;

    /* renamed from: k0, reason: collision with root package name */
    public final int f77152k0;

    /* renamed from: l, reason: collision with root package name */
    public final int f77153l;

    /* renamed from: m, reason: collision with root package name */
    public final int f77155m;

    /* renamed from: m0, reason: collision with root package name */
    public final int f77156m0;
    public final int n;

    /* renamed from: n0, reason: collision with root package name */
    public final int f77157n0;
    public final float o;

    /* renamed from: o0, reason: collision with root package name */
    public final int f77158o0;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f77159p;

    /* renamed from: q, reason: collision with root package name */
    public final int f77161q;

    /* renamed from: r, reason: collision with root package name */
    public final int f77163r;

    /* renamed from: s, reason: collision with root package name */
    public int f77165s;

    /* renamed from: s0, reason: collision with root package name */
    public boolean f77166s0;

    /* renamed from: t, reason: collision with root package name */
    public Point f77167t;

    /* renamed from: t0, reason: collision with root package name */
    public final int f77168t0;

    /* renamed from: u, reason: collision with root package name */
    public final int f77169u;

    /* renamed from: u0, reason: collision with root package name */
    public final int f77170u0;

    /* renamed from: v, reason: collision with root package name */
    public final int f77171v;

    /* renamed from: v0, reason: collision with root package name */
    public int f77172v0;

    /* renamed from: w, reason: collision with root package name */
    public final int f77173w;

    /* renamed from: w0, reason: collision with root package name */
    public int f77174w0;

    /* renamed from: x, reason: collision with root package name */
    public float f77175x;

    /* renamed from: x0, reason: collision with root package name */
    public final int f77176x0;

    /* renamed from: y, reason: collision with root package name */
    public final int f77177y;

    /* renamed from: y0, reason: collision with root package name */
    public final int f77178y0;

    /* renamed from: z, reason: collision with root package name */
    public final int f77179z;

    /* renamed from: z0, reason: collision with root package name */
    public final int f77180z0;

    /* renamed from: l0, reason: collision with root package name */
    public final PointF f77154l0 = new PointF(1.0f, 1.0f);

    /* renamed from: p0, reason: collision with root package name */
    public final Rect f77160p0 = new Rect();

    /* renamed from: q0, reason: collision with root package name */
    public final Rect f77162q0 = new Rect();

    /* renamed from: r0, reason: collision with root package name */
    public final Rect f77164r0 = new Rect();

    public j0(Context context, o9.z0 z0Var, ya.e eVar, ya.q0 q0Var, boolean z11, boolean z12) throws Resources.NotFoundException {
        float f11;
        int i5;
        io.sentry.g1 g1Var;
        g gVar = g.f77083a;
        y2 y2Var = y2.f51877a;
        f fVar = new f(gVar, (j) y2Var.s().l(), false);
        this.B0 = fVar;
        f fVar2 = new f(g.f77084b, (j) y2.C().l(), false);
        this.C0 = fVar2;
        f fVar3 = new f(g.f77086d, (j) y2.h0().l(), false);
        this.D0 = fVar3;
        g gVar2 = g.f77085c;
        f fVar4 = new f(gVar2, (j) y2Var.K().l(), true);
        this.E0 = fVar4;
        j jVar = (j) y2Var.K().l();
        j.Companion.getClass();
        f fVar5 = new f(gVar2, j.a(jVar, 0.0f, true, 0.0f, false, null, false, false, TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173), false);
        this.F0 = fVar5;
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(2131165300);
        this.f77170u0 = dimensionPixelSize;
        this.f77131a = z0Var;
        Point point = q0Var.f97208c;
        boolean z13 = point.x > point.y;
        this.f77143g = z13;
        this.f77145h = z11;
        this.f77141f = z12;
        Rect rect = q0Var.f97206a;
        this.f77147i = rect.left;
        this.f77149j = rect.top;
        boolean z14 = (!z0Var.f80280m || o() || z11) ? false : true;
        this.f77159p = z14;
        this.f77151k = rect.width();
        this.f77153l = rect.height();
        Point point2 = q0Var.f97208c;
        int i11 = point2.x;
        this.f77155m = i11;
        this.n = point2.y;
        this.f77133b = eVar;
        boolean zA = eVar.a(q0Var);
        this.f77137d = zA;
        boolean z15 = z14;
        this.f77139e = !zA;
        float fMax = Math.max(r10, r15) / Math.min(r10, r15);
        this.o = fMax;
        boolean z16 = Float.compare(fMax, 2.0f) >= 0;
        if (o()) {
            f11 = 2.0f;
            i5 = 2;
        } else {
            f11 = 2.0f;
            i5 = 1;
        }
        boolean z17 = z13;
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        configuration.orientation = i5;
        configuration.densityDpi = eVar.f97117d;
        Context contextCreateConfigurationContext = context.createConfigurationContext(configuration);
        DisplayMetrics displayMetrics = contextCreateConfigurationContext.getResources().getDisplayMetrics();
        this.f77135c = displayMetrics;
        Resources resources = contextCreateConfigurationContext.getResources();
        if (z17) {
            this.f77161q = 1;
        } else {
            this.f77161q = 0;
        }
        resources.getDimensionPixelSize(2131166370);
        DisplayMetrics displayMetrics2 = contextCreateConfigurationContext.getResources().getDisplayMetrics();
        int i12 = (int) (dimensionPixelSize * 1.2f);
        this.f77152k0 = i12;
        boolean z18 = z16;
        int dimensionPixelSize2 = contextCreateConfigurationContext.getResources().getDimensionPixelSize(2131166564);
        float f12 = i12;
        int i13 = (int) (f12 * 3.0f);
        float f13 = i11;
        double d5 = f13 / (i13 + dimensionPixelSize2);
        double dFloor = (float) (d5 - Math.floor(d5));
        if (dFloor < 0.3d || dFloor > 0.8d) {
            float fFloor = ((f13 / (((float) Math.floor(r2 + 0.3f)) + 0.3f)) - dimensionPixelSize2) / f12;
            int i14 = (int) (f12 * ((fFloor <= f11 || fFloor >= 4.0f) ? 3.0f : fFloor));
            this.f77150j0 = i14;
            this.f77152k0 = i14 / 3;
        } else {
            this.f77150j0 = i13;
        }
        fVar.b(displayMetrics2, dimensionPixelSize, 1.0f);
        fVar2.b(displayMetrics2, dimensionPixelSize, 1.0f);
        fVar3.b(displayMetrics2, dimensionPixelSize, 1.0f);
        fVar4.b(displayMetrics2, dimensionPixelSize, 1.0f);
        fVar5.b(displayMetrics2, dimensionPixelSize, 1.0f);
        this.f77173w = resources.getDimensionPixelSize(2131165447);
        int iJ = j((s1) y2Var.A().l(), z0Var, resources);
        this.f77165s = iJ;
        this.f77163r = iJ;
        resources.getDimensionPixelSize(2131165287);
        this.Q = resources.getDimensionPixelSize(2131165516);
        resources.getDimensionPixelSize(2131165517);
        this.f77167t = g(z0Var);
        new Point(0, 0);
        new Point(this.f77167t);
        int iX = ul.b.X(z0Var.f80275h, displayMetrics);
        this.P = iX;
        this.O = new Point(iX, iX);
        int i15 = (o() || !zA) ? 1 : 4;
        int iMin = Math.min(resources.getDimensionPixelSize(((s1) y2Var.A().l()).f51804a), resources.getDimensionPixelSize(2131165444));
        if (z17) {
            this.f77169u = 0;
            this.f77171v = iMin;
        } else {
            this.f77169u = i15 * iMin;
            this.f77171v = 0;
        }
        int dimensionPixelSize3 = resources.getDimensionPixelSize(2131166580);
        this.B = dimensionPixelSize3;
        resources.getDimensionPixelSize(2131166582);
        this.G = resources.getDimensionPixelSize(2131165450);
        this.f77156m0 = resources.getDimensionPixelSize(2131165446);
        this.f77157n0 = resources.getDimensionPixelSize(2131165439);
        this.f77158o0 = resources.getDimensionPixelSize(2131165441);
        this.f77177y = resources.getDimensionPixelSize(2131165452);
        this.K = resources.getDimensionPixelSize(2131165445);
        this.W = z0Var.f80277j;
        this.f77146h0 = ((e10.t0) y2Var.L().l()).f51822b;
        j3 j3Var = (j3) y2Var.q1().l();
        if (j3Var == j3.f51611d) {
            this.Z = resources.getDimensionPixelSize(2131165544);
            this.f77132a0 = 0;
        } else if (j3Var == j3.f51612e) {
            this.Z = 0;
            this.f77132a0 = resources.getDimensionPixelSize(2131165544);
        } else {
            this.Z = 0;
            this.f77132a0 = 0;
        }
        int dimensionPixelSize4 = resources.getDimensionPixelSize(2131165449);
        this.f77136c0 = dimensionPixelSize4;
        dimensionPixelSize3 = o() ? dimensionPixelSize3 : 0;
        this.f77134b0 = dimensionPixelSize3;
        resources.getDimensionPixelSize(2131165448);
        int dimensionPixelSize5 = (resources.getDimensionPixelSize(((s1) y2.E().l()).f51804a) * 2) + fVar2.f77074g;
        this.X = dimensionPixelSize5;
        int i16 = dimensionPixelSize5 + this.Z + this.f77132a0 + (o() ? dimensionPixelSize3 + dimensionPixelSize4 : 0);
        this.Y = i16;
        if (!a3.f51435a.f51550f || ((Boolean) y2.F().l()).booleanValue()) {
            this.A0 = 0;
        } else {
            this.A0 = i16;
        }
        this.f77176x0 = resources.getDimensionPixelOffset(2131165453);
        this.f77178y0 = resources.getDimensionPixelSize(((s1) y2.v().l()).f51804a);
        this.f77180z0 = y2.H().l() == s1.AUTO ? -1 : resources.getDimensionPixelSize(((s1) y2.H().l()).f51804a);
        this.X = fVar2.f77074g;
        if (z15) {
            resources.getDimensionPixelSize(2131166377);
        }
        boolean z19 = zA && u9.b.f90704s.b();
        if (z19) {
            resources.getDimensionPixelSize(2131166321);
        } else {
            resources.getDimensionPixelSize(2131166320);
        }
        resources.getDimensionPixelSize(2131166322);
        resources.getDimensionPixelSize(2131166520);
        resources.getDimensionPixelSize(2131166518);
        resources.getDimensionPixelSize(2131166519);
        if (z19) {
            if (z17) {
                resources.getDimensionPixelSize(2131166312);
                resources.getDimensionPixelSize(2131166306);
                resources.getDimensionPixelSize(2131166318);
            } else {
                resources.getDimensionPixelSize(2131166313);
                resources.getDimensionPixelSize(2131166307);
                resources.getDimensionPixelSize(2131166319);
            }
            resources.getDimensionPixelSize(2131166309);
        } else {
            resources.getDimensionPixelSize(2131166310);
            resources.getDimensionPixelSize(2131166317);
            resources.getDimensionPixelSize(2131166308);
        }
        resources.getDimensionPixelSize(2131166311);
        resources.getDimensionPixelSize(2131166314);
        if (z17) {
            resources.getDimensionPixelSize(2131166315);
        } else {
            resources.getDimensionPixelSize(2131166316);
        }
        s(resources);
        if (z15 && (g1Var = z0Var.f80284s) != null) {
            int i17 = (int) (0 / this.H);
            o9.g0 g0VarD = g1Var.d(i17);
            int iD = g0VarD.d(i17);
            int iC = g0VarD.c(i17);
            g0VarD.a(i17);
            this.f77179z = Math.round(iD * this.H);
            this.A = Math.round(iC * this.H);
        } else if (!o() && !zA && z18) {
            if (Float.compare(fMax, 2.15f) >= 0 && ((int) (252.0f * Resources.getSystem().getDisplayMetrics().density)) <= 0) {
                this.f77179z = ((((h(null).y - this.D) - (this.F * 2)) * z0Var.f80268a) / (((int) (268.0f * Resources.getSystem().getDisplayMetrics().density)) > 0 ? 7 : 5)) / 8;
            }
            this.X = fVar2.f77074g;
            s(resources);
        }
        u();
        this.f77168t0 = resources.getDimensionPixelSize(2131165436);
        Path pathC = aa.p.c();
        new aa.k(this.D, pathC);
        int i18 = this.D;
        int i19 = this.f77140e0;
        if (i18 != i19) {
            new aa.k(i19, pathC);
        }
        s(resources);
        int i21 = Build.VERSION.SDK_INT;
        this.G0 = i21 >= 30 ? 3 : i21 >= 28 ? 1 : 0;
        this.I0 = new LinkedHashMap();
        this.J0 = new LinkedHashMap();
    }

    public static int a(int i5, int i11, int i12) {
        return (i5 - ((i12 - 1) * i11)) / i12;
    }

    public final Rect b(int i5, boolean z11, boolean z12, int i11, s1 s1Var, int i12, Rect rect) {
        if (rect == null) {
            rect = new Rect();
        }
        boolean zO = o();
        int i13 = this.A0;
        int i14 = this.f77173w;
        if (zO) {
            rect.top = 0;
            rect.bottom = i14;
            int i15 = this.f77134b0;
            if (i13 == 0) {
                rect.left = i15;
                rect.right = i15;
                if (n()) {
                    rect.right += i5;
                    return rect;
                }
                rect.left = i5;
                return rect;
            }
            boolean zN = n();
            int i16 = this.Y;
            if (zN) {
                rect.left = i16;
                rect.right = i15 + i5;
                return rect;
            }
            rect.left = i15 + i5;
            rect.right = i16;
            return rect;
        }
        int i17 = this.f77160p0.top;
        int i18 = (i17 == 0 ? 0 : i12) + i5;
        int i19 = (z11 || z12) ? this.B : 0;
        int i21 = i13 == 0 ? i19 + i12 : i19 + i13 + i12;
        if (i17 == 0) {
            i21 += i12;
        }
        if (!this.f77137d || s1Var == s1.NONE) {
            rect.set(i11, i18, i11, i21);
            return rect;
        }
        o9.z0 z0Var = this.f77131a;
        int i22 = z0Var.f80269b;
        int i23 = this.I;
        int i24 = ((i22 - 1) * i23) + (i22 * i23);
        int iMin = ((int) Math.min(Math.max(0, r9 - i24), this.f77151k * 0.14f)) / 2;
        int iMax = Math.max(0, (((this.f77153l - i14) - i21) - ((z0Var.f80268a * 2) * this.J)) - (this.Z + this.f77132a0)) / 2;
        rect.set(iMin, i14 + iMax, iMin, i21 + iMax);
        return rect;
    }

    public final Rect c() {
        boolean zO = o();
        int i5 = this.n;
        int i11 = this.Y;
        int i12 = this.f77155m;
        int i13 = this.f77173w;
        int i14 = this.f77156m0;
        Rect rect = this.f77160p0;
        if (zO) {
            int i15 = rect.left;
            int i16 = rect.top;
            return new Rect(i14 + i15 + i13, i16, ((i15 + i12) - i11) - i13, i5 + i16);
        }
        int i17 = rect.left;
        int i18 = rect.top;
        return new Rect(i17 + i13, i14 + i18 + i13, (i17 + i12) - i13, (((i18 + i5) - i11) - this.B) - i13);
    }

    public final int d() {
        return ((e10.t0) (this.f77143g ? y2.f51877a.M() : y2.f51877a.L()).l()).f51822b;
    }

    public final int e() {
        return ((e10.t0) (this.f77143g ? y2.f51877a.M() : y2.f51877a.L()).l()).f51821a;
    }

    public final Size f(Resources resources, g gVar) {
        Size size = new Size(this.f77155m, this.n);
        int iOrdinal = gVar.ordinal();
        if (iOrdinal == 0) {
            Point pointL = l();
            return new Size(size.getWidth() - pointL.x, size.getHeight() - pointL.y);
        }
        if (iOrdinal == 1) {
            Rect rectK = k(resources);
            Point point = new Point(rectK.left + rectK.right, rectK.top + rectK.bottom);
            return new Size(size.getWidth() - point.x, size.getHeight() - point.y);
        }
        if (iOrdinal != 2) {
            if (iOrdinal != 3) {
                throw new NoWhenBranchMatchedException();
            }
            u();
            return u90.b.I(resources, size, (e10.n0) y2.f51877a.j0().l(), this.f77173w, this.f77162q0, o() ? 0 : this.Y);
        }
        y2 y2Var = y2.f51877a;
        Object objL = y2Var.a0().l();
        e10.c0 c0Var = e10.c0.f51450b;
        boolean z11 = objL != c0Var;
        boolean z12 = y2Var.S().l() != c0Var;
        int i5 = this.f77144g0;
        int height = size.getHeight();
        if (z11) {
            height -= resources.getDimensionPixelSize(2131165281);
        }
        if (z12) {
            height -= resources.getDimensionPixelSize(2131165453);
        }
        return new Size(size.getWidth() - (i5 * 2), height);
    }

    public final Point g(o9.z0 z0Var) {
        if (!this.f77159p) {
            return new Point(0, 0);
        }
        PointF[] pointFArr = z0Var.f80274g;
        int i5 = this.f77161q;
        float f11 = pointFArr[i5].x;
        DisplayMetrics displayMetrics = this.f77135c;
        return new Point(ul.b.X(f11, displayMetrics), ul.b.X(z0Var.f80274g[i5].y, displayMetrics));
    }

    public final Point h(Point point) {
        if (point == null) {
            point = new Point();
        }
        Point pointL = l();
        o9.z0 z0Var = this.f77131a;
        point.x = a((this.f77155m - pointL.x) - (this.f77169u * 2), this.f77167t.x, z0Var.f80269b);
        int i5 = (this.n - pointL.y) - this.f77171v;
        int i11 = this.f77167t.y;
        int i12 = z0Var.f80268a;
        point.y = (i5 - ((i12 - 1) * i11)) / i12;
        return point;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x002d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final aa.k i(int i5) {
        int i11;
        mz.g gVar;
        Integer numValueOf = Integer.valueOf(i5);
        LinkedHashMap linkedHashMap = this.I0;
        aa.k kVar = (aa.k) linkedHashMap.get(numValueOf);
        if (kVar != null) {
            return kVar;
        }
        y2 y2Var = y2.f51877a;
        if (!((Boolean) y2Var.E0().l()).booleanValue()) {
            o9.z0 z0Var = this.f77131a;
            Intrinsics.e(z0Var, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaInvariantDeviceProfile");
            if (((l0) z0Var).f77203x) {
                i11 = i5;
                gVar = new mz.g(i11, ((fz.d) y2Var.i().l()).e(), null, null, null, 120);
            } else {
                gVar = new mz.g(i5, fz.d.n.e(), null, null, null, 120);
                i11 = i5;
            }
        }
        linkedHashMap.put(Integer.valueOf(i11), gVar);
        return gVar;
    }

    public final int j(s1 s1Var, o9.z0 z0Var, Resources resources) {
        if (!o()) {
            if (this.f77159p) {
                return ul.b.X(z0Var.f80276i[this.f77161q], this.f77135c);
            }
            int dimensionPixelSize = resources.getDimensionPixelSize(s1Var.f51804a) - Math.min(resources.getDimensionPixelSize(((s1) y2.f51877a.A().l()).f51804a), resources.getDimensionPixelSize(2131165444));
            if (dimensionPixelSize >= 0) {
                return dimensionPixelSize;
            }
        }
        return 0;
    }

    public final Rect k(Resources resources) {
        int i5;
        boolean zO = o();
        int i11 = this.Z;
        int i12 = this.f77132a0;
        Rect rect = this.f77160p0;
        Rect rect2 = this.f77164r0;
        if (zO) {
            boolean zN = n();
            int i13 = this.f77136c0;
            int i14 = this.f77134b0;
            if (zN) {
                rect2.set(rect.left + i14 + i12, rect.top, i13 + i11, rect.bottom);
                return rect2;
            }
            rect2.set(i13 + i11, rect.top, rect.right + i14 + i12, rect.bottom);
            return rect2;
        }
        int i15 = this.f77180z0;
        if (i15 == -1) {
            float f11 = this.f77151k;
            o9.z0 z0Var = this.f77131a;
            int iMax = Math.max(0, Math.round(((f11 / z0Var.f80269b) - (f11 / z0Var.f80277j)) / 2.0f));
            Rect rect3 = this.f77162q0;
            int i16 = rect3.left + iMax;
            int i17 = this.f77169u;
            i5 = iMax + rect3.right + i17;
            i15 = i16 + i17;
        } else {
            i5 = i15;
        }
        rect2.set(i15 + rect.left, i11, i5 + rect.right, i12 + rect.bottom + this.f77171v);
        return rect2;
    }

    public final Point l() {
        u();
        Rect rect = this.f77162q0;
        return new Point(rect.left + rect.right, rect.top + rect.bottom);
    }

    public final void m() {
        float fD = g3.d(this.E);
        int i5 = h(null).y;
        int i11 = this.D;
        if (((i5 - i11) - this.F) - fD < fD) {
            this.E = 0;
            this.F = 0;
            this.J = (int) Math.ceil(i11 * 1.125f);
            this.f77138d0 = this.E0.f77074g;
        }
    }

    public final boolean n() {
        return o() && this.f77166s0;
    }

    public final boolean o() {
        return this.f77143g && this.f77141f;
    }

    public final String p(String str, float f11) {
        return "\t" + str + ": " + f11 + "px (" + g3.f(f11, this.f77135c.densityDpi) + "dp)";
    }

    public final boolean q() {
        Point point;
        int i5;
        int i11;
        Rect rect = this.f77131a.f80286u;
        int i12 = rect.top;
        return this.f77179z > i12 && (i5 = (point = this.f77167t).x) > rect.left && (i11 = point.y) > i12 && i5 > rect.right && i11 > rect.bottom;
    }

    public final o9.i0 r(o9.l lVar) {
        ya.q0 q0Var = new ya.q0(this.f77151k, this.f77153l, this.f77155m, this.n);
        q0Var.f97206a.offsetTo(this.f77147i, this.f77149j);
        o9.i0 i0Var = new o9.i0(lVar, this.f77131a, this.f77133b);
        i0Var.f79881d = q0Var;
        i0Var.f79882e = this.f77145h;
        return i0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0130  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void s(Resources resources) {
        float fD;
        this.H0 = resources.getDimensionPixelSize(2131165509);
        y2 y2Var = y2.f51877a;
        this.C = Math.min(1.0f, 1.0f);
        this.H = 1.0f;
        boolean zO = o();
        j jVar = (j) y2Var.s().l();
        this.D = (int) (jVar.c(resources) * 1.0f);
        float f11 = jVar.f77125c;
        Pattern pattern = g3.f79846a;
        DisplayMetrics displayMetrics = this.f77135c;
        this.E = (int) (Math.round(TypedValue.applyDimension(2, f11, displayMetrics) * 1.0f) * 1.0f);
        int i5 = this.G;
        this.F = (int) (i5 * 1.0f);
        o9.z0 z0Var = this.f77131a;
        Point pointG = g(z0Var);
        this.f77167t = new Point((int) (pointG.x * 1.0f), (int) (pointG.y * 1.0f));
        if (this.f77159p) {
            PointF[] pointFArr = z0Var.f80273f;
            int i11 = this.f77161q;
            this.I = ul.b.X(pointFArr[i11].x, displayMetrics);
            this.J = ul.b.X(z0Var.f80273f[i11].y, displayMetrics);
            this.L = Math.max(0, this.J - (g3.d(this.E) + (this.D + this.F))) / 2;
            this.f77165s = (int) (this.f77163r * 1.0f);
        } else {
            this.I = this.F + this.D;
            this.J = g3.d(this.E) + ((int) Math.ceil(r5 * 1.125f)) + this.F;
            int i12 = h(null).y;
            int i13 = this.J;
            int i14 = (i12 - i13) / 2;
            int i15 = this.F;
            if (i15 > i14 && !zO && !this.f77145h) {
                this.J = i13 - (i15 - i14);
                this.F = i14;
            }
        }
        j jVar2 = (j) y2Var.K().l();
        this.f77140e0 = jVar2.c(resources);
        this.f77148i0 = ((jVar2.f77125c * this.f77133b.f97116c) * r7.f97117d) / 160.0f;
        this.f77142f0 = i5;
        f fVar = this.E0;
        this.f77138d0 = fVar.f77074g;
        int i16 = this.f77165s + this.f77169u;
        this.f77144g0 = i16;
        int i17 = this.H0;
        if (i16 < i17) {
            i16 = i17;
        }
        this.f77144g0 = i16;
        int i18 = this.f77155m;
        int i19 = i18 - (i16 * 2);
        if (!((Boolean) y2Var.E0().l()).booleanValue()) {
            Intrinsics.e(z0Var, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaInvariantDeviceProfile");
            fD = ((l0) z0Var).f77203x ? ((fz.d) y2Var.i().l()).d() : 1.0f;
        }
        int iB = MathKt.b(fD * this.f77140e0);
        Object objL = y2Var.W().l();
        e10.d0 d0Var = e10.d0.f51460c;
        if (objL != d0Var) {
            this.K0 = Math.max((i18 - (i19 - (a(i19, this.f77167t.x, d()) - iB))) / 2, 0);
        } else {
            this.K0 = Math.max((i18 - ((i19 - (this.f77140e0 - iB)) - (this.K * 2))) / 2, 0);
        }
        if (zO) {
            m();
        }
        this.X = this.C0.f77074g;
        int i21 = this.n;
        if (zO) {
            this.f77175x = resources.getInteger(2131492880) / 100.0f;
        } else {
            this.f77175x = Math.min(resources.getInteger(2131492880) / 100.0f, 1.0f - ((this.f77156m0 + this.f77177y) / (((i21 - this.A0) - this.B) - this.f77173w)));
        }
        float fD2 = ((fz.d) y2Var.i().l()).d();
        int i22 = this.D;
        int i23 = (int) (fD2 * i22);
        this.M = i23;
        this.N = (i22 - i23) / 2;
        Size sizeF = f(resources, g.f77083a);
        int i24 = z0Var.f80268a;
        int i25 = z0Var.f80269b;
        f fVar2 = this.B0;
        float fC = z2.C(fVar2, sizeF, i24, i25);
        DisplayMetrics displayMetrics2 = resources.getDisplayMetrics();
        int i26 = this.f77170u0;
        fVar2.b(displayMetrics2, i26, fC);
        this.D = fVar2.f77071d;
        this.E = fVar2.f77076i;
        this.F = fVar2.f77075h;
        this.J = fVar2.f77074g;
        float fC2 = y2Var.W().l() != d0Var ? z2.C(fVar, f(resources, g.f77085c), e(), d()) : 1.0f;
        fVar.b(resources.getDisplayMetrics(), i26, fC2);
        this.F0.b(resources.getDisplayMetrics(), i26, fC2);
        this.f77140e0 = fVar.f77071d;
        this.f77148i0 = fVar.f77076i;
        this.f77142f0 = fVar.f77075h;
        int dimensionPixelSize = i21 - (y2Var.S().l() == e10.c0.f51450b ? 0 : resources.getDimensionPixelSize(2131165544));
        boolean z11 = this.f77143g;
        int i27 = dimensionPixelSize / ((e10.t0) (z11 ? y2Var.M() : y2Var.L()).l()).f51821a;
        if (i27 > fVar.f77074g && y2Var.W().l() != d0Var) {
            fVar.f77074g = i27;
        }
        e10.n0 n0Var = (e10.n0) y2Var.j0().l();
        Size sizeF2 = f(resources, g.f77086d);
        e10.p0 p0Var = n0Var.f51677a;
        e10.p0 p0Var2 = e10.p0.f51735c;
        f fVar3 = this.D0;
        if (p0Var == p0Var2) {
            int i28 = n0Var.f51683g;
            this.f77172v0 = i28;
            int i29 = n0Var.f51684h;
            this.f77174w0 = i29;
            float fC3 = z2.C(fVar3, sizeF2, i28, i29);
            if (fC3 < 1.0f) {
                fVar3.b(resources.getDisplayMetrics(), i26, fC3);
            }
        } else {
            this.f77172v0 = (bh.g.N(resources.getDisplayMetrics(), 8) + sizeF2.getHeight()) / fVar3.f77074g;
            int width = sizeF2.getWidth() / fVar3.f77072e;
            this.f77174w0 = width;
            int i31 = this.f77172v0;
            if (i31 < 2 || width < 2) {
                if (i31 < 2) {
                    i31 = 2;
                }
                this.f77172v0 = i31;
                int i32 = width >= 2 ? width : 2;
                this.f77174w0 = i32;
                float fC4 = z2.C(fVar3, sizeF2, i31, i32);
                float f12 = i26;
                float f13 = fC4 * f12;
                float fN = bh.g.N(resources.getDisplayMetrics(), 16);
                if (f13 < fN) {
                    mc0.d.f76206a.n("Folder icon size too small, forcing minimum", new Object[0]);
                    fC4 = fN / f12;
                }
                fVar3.b(resources.getDisplayMetrics(), i26, fC4);
            }
            if (this.f77174w0 > 4) {
                int width2 = (sizeF2.getWidth() - (fVar3.f77073f * 4)) / fVar3.f77072e;
                this.f77174w0 = (width2 >= 0 ? width2 : 0) + 4;
            }
            if (z11) {
                int i33 = this.f77174w0;
                int iFloor = (int) Math.floor(this.f77172v0 * 1.5d);
                int i34 = this.f77172v0 + 1;
                if (iFloor < i34) {
                    iFloor = i34;
                }
                if (i33 > iFloor) {
                    i33 = iFloor;
                }
                this.f77174w0 = i33;
            } else {
                int i35 = this.f77172v0;
                int iFloor2 = (int) Math.floor(this.f77174w0 * 1.5d);
                int i36 = this.f77174w0 + 1;
                if (iFloor2 < i36) {
                    iFloor2 = i36;
                }
                if (i35 > iFloor2) {
                    i35 = iFloor2;
                }
                this.f77172v0 = i35;
            }
        }
        this.T = fVar3.f77071d;
        this.U = fVar3.f77076i;
        this.S = fVar3.f77074g;
        this.V = fVar3.f77075h;
        this.R = kotlin.ranges.a.e0(sizeF2.getWidth() / this.f77174w0, fVar3.f77072e, fVar3.f77073f);
    }

    public final boolean t(o9.l lVar) {
        if (o()) {
            boolean z11 = ((ya.g) ya.g.f97130h.h(lVar)).f97136f.f97115b == 3;
            if (this.f77166s0 != z11) {
                this.f77166s0 = z11;
                return true;
            }
        }
        return false;
    }

    public final void u() {
        y2 y2Var = y2.f51877a;
        boolean z11 = false;
        int i5 = y2Var.q1().l() == j3.f51613f ? this.f77176x0 : 0;
        i3 i3Var = (i3) y2Var.y().l();
        i3Var.getClass();
        if (i3Var != i3.f51594a && i3Var != i3.f51595b) {
            z11 = true;
        }
        b(i5, z11, ((Boolean) y2Var.X().l()).booleanValue(), this.f77165s, (s1) y2Var.A().l(), this.f77178y0, this.f77162q0);
    }
}
