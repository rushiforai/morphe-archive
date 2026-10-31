package o9;

import android.animation.ValueAnimator;
import android.util.FloatProperty;
import android.view.View;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import com.android.launcher3.CellLayout;
import com.android.launcher3.Workspace;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.launcher3.NovaAppDrawerSearchBar;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public final class n4 implements xn.d {

    /* renamed from: e, reason: collision with root package name */
    public static n4 f80034e;

    /* renamed from: a, reason: collision with root package name */
    public float f80035a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f80036b;

    /* renamed from: c, reason: collision with root package name */
    public Object f80037c;

    /* renamed from: d, reason: collision with root package name */
    public Object f80038d;

    public n4(o2.f fVar, o7.a aVar) {
        this.f80035a = 0.0f;
        this.f80036b = aVar;
    }

    public static void b(l2 l2Var, CellLayout cellLayout, int i5, c0.g2 g2Var, s9.o oVar, sa.d dVar) {
        float fD = g2Var.d(i5);
        oVar.a(cellLayout, CellLayout.f20889i0, l2Var.n(l2.f79968g) ? 1.0f : 0.0f, s9.k.f86804s);
        oVar.a(cellLayout.P, p1.f80067f, fD, dVar.a(3, (Interpolator) g2Var.f18817a));
    }

    public static n4 c() {
        if (f80034e == null) {
            f80034e = new n4(new o2.f(16), new o7.a(15));
        }
        return f80034e;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [com.android.systemui.plugins.ResourceProvider] */
    public static ValueAnimator d(NovaLauncher novaLauncher, View view, float f11) {
        ya.h hVar = (ya.h) ya.h.f97142c.h(novaLauncher);
        ?? r02 = hVar.f97144b;
        if (r02 != 0) {
            hVar = r02;
        }
        float f12 = hVar.getFloat(2131165538);
        float f13 = hVar.getFloat(2131165539);
        float dimension = hVar.getDimension(2131165540);
        s9.s sVar = new s9.s(view.getContext());
        sVar.g(f13);
        sVar.b(f12);
        sVar.d();
        sVar.c(f11);
        ca.c cVar = p1.f80062a;
        sVar.e(((Float) cVar.get(view)).floatValue());
        sVar.f(dimension);
        return sVar.a(view, cVar);
    }

    @Override // xn.d
    public void a(boolean z11) {
        if (z11) {
            bo.a.c().getClass();
            bo.a.d();
        } else {
            bo.a.c().getClass();
            bo.a.b();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:78:0x01f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void e(l2 l2Var, s9.o oVar, sa.d dVar) {
        boolean z11;
        float f11;
        float f12;
        float f13;
        float f14;
        float f15;
        Interpolator interpolatorA;
        NovaLauncher novaLauncher = (NovaLauncher) this.f80036b;
        b0.j1 j1VarL = l2Var.l(novaLauncher);
        b0.j1 j1VarF = l2Var.f(novaLauncher);
        b0.j1 j1VarG = l2Var.g(novaLauncher);
        b0.j1 j1VarE = l2Var.e(novaLauncher);
        this.f80035a = j1VarL.f16154a;
        c0.g2 g2VarK = l2Var.k(novaLauncher);
        Workspace workspace = (Workspace) this.f80037c;
        int childCount = workspace.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            b(l2Var, (CellLayout) workspace.getChildAt(i5), i5, g2VarK, oVar, dVar);
        }
        int i11 = l2Var.i(novaLauncher);
        Interpolator interpolatorA2 = dVar.a(3, (Interpolator) g2VarK.f18817a);
        View view = workspace.f21013s0.T;
        androidx.recyclerview.widget.j1 j1Var = s9.k.f86804s;
        Interpolator interpolatorA3 = dVar.a(1, j1Var);
        boolean z12 = (oVar instanceof s9.m) && ((l2) ((ra.a) novaLauncher.M.f85765g)) == l2.f79975p && l2Var == l2.f79974m;
        if (z12) {
            z11 = z12;
            ((s9.m) oVar).e(d(novaLauncher, workspace, this.f80035a));
        } else {
            z11 = z12;
            oVar.a(workspace, p1.f80062a, this.f80035a, interpolatorA3);
        }
        view.setPivotY(((workspace.getPivotY() + workspace.getTop()) - view.getTop()) - view.getTranslationY());
        view.setPivotX(((workspace.getPivotX() + workspace.getLeft()) - view.getLeft()) - view.getTranslationX());
        float f16 = j1VarF.f16154a;
        float f17 = j1VarF.f16155b;
        if (z11) {
            ((s9.m) oVar).e(d(novaLauncher, view, f16));
        } else {
            oVar.a(view, p1.f80062a, f16, dVar.a(4, interpolatorA3));
        }
        int i12 = i11 & 1;
        float f18 = i12 != 0 ? 1.0f : 0.0f;
        oVar.c(view, f18, interpolatorA2);
        oVar.c(novaLauncher.O.E, (i11 & 32) != 0 ? 1.0f : 0.0f, interpolatorA2);
        Interpolator interpolatorA4 = dVar.a(2, j1Var);
        oVar.a(workspace, p1.f80065d, 0.0f, interpolatorA4);
        FloatProperty floatProperty = p1.f80066e;
        oVar.a(workspace, floatProperty, j1VarL.f16155b, interpolatorA4);
        Interpolator interpolatorA5 = dVar.a(0, interpolatorA4);
        oVar.a(view, floatProperty, f17, interpolatorA5);
        oVar.a(workspace.E, floatProperty, f17, interpolatorA5);
        Object obj = novaLauncher.P.f21088w;
        FloatProperty floatProperty2 = z9.e.f98367f;
        float fJ = l2Var.j();
        LinearInterpolator linearInterpolator = s9.k.f86788a;
        oVar.a(obj, floatProperty2, fJ, linearInterpolator);
        oVar.a(novaLauncher.L.f20972f, z9.h.f98385s, l2Var.n(l2.f79970i) ? 1.0f : 0.0f, linearInterpolator);
        oVar.d(novaLauncher.X, l2Var.m(novaLauncher), dVar.a(11, s9.k.f86791d));
        Object obj2 = novaLauncher.V.f21031m;
        View view2 = novaLauncher.A0;
        if (view2 != null) {
            oVar.c(view2, f18, interpolatorA2);
        }
        oVar.c(novaLauncher.O.E, f18, interpolatorA2);
        AllAppsContainerView allAppsContainerView = novaLauncher.V;
        if (allAppsContainerView.G != e10.c0.f51451c || allAppsContainerView.H != e10.c0.f51452d) {
            oVar.a(obj2, floatProperty, j1VarG.f16155b, interpolatorA5);
        }
        if (i12 == 0 && (i11 & 2) == 0) {
            oVar.c(novaLauncher.X, 0.0f, interpolatorA2);
            f11 = 1.0f;
        } else {
            f11 = 1.0f;
            oVar.c(novaLauncher.X, 1.0f, interpolatorA2);
        }
        boolean z13 = (i11 & 2048) != 0;
        oVar.c(novaLauncher.B0, z13 ? 1.0f : 0.0f, z13 ? s9.k.a(linearInterpolator, 0.0f, f11) : s9.k.a(s9.k.f86795h, 0.0f, 0.5f));
        oVar.a(novaLauncher.B0, p1.f80062a, j1VarE.f16154a, interpolatorA3);
        View view3 = novaLauncher.K0;
        if (view3 != null) {
            boolean z14 = l2Var == l2.f79974m;
            if (z14) {
                f12 = 1.0f;
                f13 = 0.0f;
                interpolatorA = s9.k.a(linearInterpolator, 0.0f, 1.0f);
            } else {
                f12 = 1.0f;
                f13 = 0.0f;
                interpolatorA = s9.k.a(s9.k.f86795h, 0.0f, 0.5f);
            }
            oVar.c(view3, z14 ? f12 : f13, interpolatorA);
        } else {
            f12 = 1.0f;
            f13 = 0.0f;
        }
        if (l2Var != l2.f79974m) {
            f14 = (i11 & 1024) != 0 ? f12 : f13;
        } else if (e10.a3.f51435a.f51550f) {
            int i13 = NovaAppDrawerSearchBar.f45803w;
            if (!jz.g.d()) {
            }
        }
        oVar.c(novaLauncher.V.f21031m, f14, interpolatorA2);
        Object obj3 = novaLauncher.X;
        if (obj3 instanceof sy.e) {
            f15 = f17;
            oVar.a((sy.e) obj3, sy.e.F, -f15, interpolatorA5);
        } else {
            f15 = f17;
        }
        Object obj4 = novaLauncher.L;
        FloatProperty floatProperty3 = (g30.e) this.f80038d;
        e10.y2.f51877a.getClass();
        e10.s2 s2Var = e10.y2.f51878a0;
        KProperty kProperty = e10.y2.f51881b[46];
        s2Var.getClass();
        oVar.a(obj4, floatProperty3, (((Boolean) s2Var.l()).booleanValue() && l2Var.f79982a == 0) ? f13 : f12, dVar.a(1, j1Var));
        if (view2 != null) {
            oVar.a(view2, floatProperty, f15, interpolatorA5);
        }
    }

    public n4(NovaLauncher novaLauncher, Workspace workspace) {
        this.f80036b = novaLauncher;
        this.f80037c = workspace;
        g30.f fVarB = g30.f.b(novaLauncher);
        y70.d dVar = novaLauncher.J0;
        g30.e eVar = new g30.e("WALLPAPER_ZOOM");
        eVar.f57032b = fVarB;
        eVar.f57031a = dVar;
        this.f80038d = eVar;
    }
}
