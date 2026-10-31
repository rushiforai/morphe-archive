package ra;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.View;
import android.widget.FrameLayout;
import androidx.compose.ui.platform.ComposeView;
import b.c0;
import b00.h1;
import b00.l0;
import c3.k3;
import com.android.launcher3.Workspace;
import com.android.launcher3.allapps.FloatingHeaderView;
import com.android.launcher3.pageindicators.WorkspacePageIndicator;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.gms.internal.measurement.v6;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.ads.DrawerAdFloatingHeaderView;
import com.teslacoilsw.launcher.appwidget.WidgetsPeekingSheet;
import com.teslacoilsw.launcher.desktoppreview.DesktopLockBottomSheet;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import da.t;
import da.u;
import dx.i0;
import e10.d0;
import e10.y2;
import fa.f0;
import fa.x;
import h6.a0;
import h6.y0;
import java.io.Serializable;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;
import mk.w;
import mx.g0;
import mx.s0;
import o9.b1;
import o9.g3;
import o9.j2;
import o9.l2;
import o9.n1;
import ox.i;
import p1.e1;
import p1.s2;
import pp.o;
import qx.k;
import qx.q;
import qx.w0;
import s9.m;
import td.l;
import ya.j;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85759a = 1;

    /* renamed from: b, reason: collision with root package name */
    public Object f85760b;

    /* renamed from: c, reason: collision with root package name */
    public Object f85761c;

    /* renamed from: d, reason: collision with root package name */
    public Object f85762d;

    /* renamed from: e, reason: collision with root package name */
    public Serializable f85763e;

    /* renamed from: f, reason: collision with root package name */
    public Object f85764f;

    /* renamed from: g, reason: collision with root package name */
    public Object f85765g;

    /* renamed from: h, reason: collision with root package name */
    public Object f85766h;

    /* renamed from: i, reason: collision with root package name */
    public Object f85767i;

    /* renamed from: j, reason: collision with root package name */
    public Object f85768j;

    /* renamed from: k, reason: collision with root package name */
    public Object f85769k;

    public /* synthetic */ f() {
    }

    public void a(String str, String str2) {
        HashMap map = (HashMap) this.f85765g;
        if (map == null) {
            throw new IllegalStateException("Property \"autoMetadata\" has not been set");
        }
        map.put(str, str2);
    }

    public void b(e eVar) {
        ((ArrayList) this.f85763e).add(eVar);
    }

    public td.h c() {
        String strE = ((String) this.f85760b) == null ? " transportName" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (((l) this.f85762d) == null) {
            strE = strE.concat(" encodedPayload");
        }
        if (((Long) this.f85763e) == null) {
            strE = c0.E(strE, " eventMillis");
        }
        if (((Long) this.f85764f) == null) {
            strE = c0.E(strE, " uptimeMillis");
        }
        if (((HashMap) this.f85765g) == null) {
            strE = c0.E(strE, " autoMetadata");
        }
        if (strE.isEmpty()) {
            return new td.h((String) this.f85760b, (Integer) this.f85761c, (l) this.f85762d, ((Long) this.f85763e).longValue(), ((Long) this.f85764f).longValue(), (HashMap) this.f85765g, (Integer) this.f85766h, (String) this.f85767i, (byte[]) this.f85768j, (byte[]) this.f85769k);
        }
        throw new IllegalStateException("Missing required properties:".concat(strE));
    }

    public void d() {
        c cVar = (c) this.f85760b;
        cVar.b();
        while (true) {
            if (cVar.f85756e == null && cVar.f85755d == null) {
                return;
            } else {
                cVar.b();
            }
        }
    }

    public m e(a aVar) {
        c cVar = (c) this.f85760b;
        m mVar = new m(cVar.f87094a);
        for (d dVar : f()) {
            dVar.e(aVar, cVar, mVar);
        }
        mVar.f86812c.addListener(new b(this, aVar));
        AnimatorSet animatorSetF = mVar.f();
        cVar.f85756e = animatorSetF;
        cVar.f85757f = aVar;
        animatorSetF.addListener(cVar);
        return mVar;
    }

    public d[] f() {
        if (((d[]) this.f85769k) == null) {
            ArrayList arrayList = new ArrayList();
            n1 n1Var = (n1) this.f85762d;
            arrayList.add(n1Var.W);
            arrayList.add(n1Var.O);
            this.f85769k = (d[]) arrayList.toArray(new d[arrayList.size()]);
        }
        return (d[]) this.f85769k;
    }

    public void g(j2 j2Var) {
        j(j2Var, true, 500L, null);
    }

    public void h(a aVar) {
        n1 n1Var = (n1) this.f85762d;
        n1Var.getClass();
        i(aVar, n1Var.a0());
    }

    public void i(a aVar, boolean z11) {
        j(aVar, z11, 0L, null);
    }

    public void j(a aVar, boolean z11, long j11, Animator.AnimatorListener animatorListener) {
        c cVar = (c) this.f85760b;
        boolean zA = z11 & g3.a();
        if (((n1) this.f85762d).t0(aVar)) {
            AnimatorSet animatorSet = cVar.f85756e;
            if (animatorSet == null) {
                if (animatorListener != null) {
                    animatorListener.onAnimationEnd(null);
                    return;
                }
                return;
            } else if (!cVar.f87095b && zA && cVar.f85757f == aVar) {
                if (animatorListener != null) {
                    animatorSet.addListener(animatorListener);
                    return;
                }
                return;
            }
        }
        a aVar2 = (a) this.f85765g;
        d();
        if (zA) {
            if (j11 <= 0) {
                k(aVar, aVar2, animatorListener);
                return;
            } else {
                ((Handler) this.f85761c).postDelayed(new f0(cVar.f85758g, 2, this, aVar, aVar2, animatorListener), j11);
                return;
            }
        }
        for (Animator animator : (Animator[]) ((v6) this.f85768j).f33136b) {
            if (animator != null) {
                animator.cancel();
            }
        }
        m(aVar);
        for (d dVar : f()) {
            dVar.j(aVar);
        }
        l(aVar);
        if (animatorListener != null) {
            animatorListener.onAnimationEnd(null);
        }
    }

    public void k(a aVar, a aVar2, Animator.AnimatorListener animatorListener) {
        ((c) this.f85760b).f87094a = aVar == ((a) this.f85764f) ? aVar2.c() : aVar.c();
        ((v6) this.f85768j).getClass();
        AnimatorSet animatorSetF = e(aVar).f();
        if (animatorListener != null) {
            animatorSetF.addListener(animatorListener);
        }
        ((Handler) this.f85761c).post(new w((Object) this, (Object) animatorSetF, false, 14));
    }

    public void l(a aVar) {
        i0 i0Var;
        DrawerAdFloatingHeaderView drawerAdFloatingHeaderView;
        i0 i0Var2;
        a aVar2 = (a) this.f85767i;
        if (aVar != aVar2) {
            this.f85766h = aVar.a(aVar2);
            this.f85767i = aVar;
        }
        NovaLauncher novaLauncher = (NovaLauncher) ((n1) this.f85762d);
        novaLauncher.getClass();
        l2 l2Var = (l2) aVar;
        q qVar = q.f84576a;
        int i5 = 0;
        q.f84581f = false;
        ab.m mVar = novaLauncher.S;
        Object obj = l2.f79974m;
        int i11 = 1;
        mVar.d(2, l2Var == obj);
        novaLauncher.O.setClipChildren(!l2Var.n(l2.f79965d));
        novaLauncher.m();
        novaLauncher.k0(64);
        novaLauncher.getWindow().getDecorView().sendAccessibilityEvent(32);
        ps.f.r(novaLauncher, l2Var.f79982a);
        if (l2Var == obj) {
            x xVar = (x) x.f54523e.h(novaLauncher);
            int i12 = xVar.f54526c & (-5);
            xVar.f54526c = i12;
            if (i12 == 0) {
                j.f97149d.a(new ae.m(xVar, 6));
            }
            sa.b bVar = novaLauncher.f80013n0;
            if (bVar.f87089e != 0) {
                bVar.f87089e = 0;
                bVar.a();
            }
        }
        xa.a aVar3 = l2.o;
        if (aVar3.equals(novaLauncher.f80021v0) && !aVar3.equals(l2Var) && novaLauncher.f80020u0 != null) {
            novaLauncher.V.q(false);
            ea.e eVarA = novaLauncher.O().a();
            da.c cVarR = da.d.r();
            t tVarH = u.h();
            tVarH.e(novaLauncher.O.f80106f);
            cVarR.o(tVarH);
            eVarA.b(ea.d.LAUNCHER_ALLAPPS_EXIT);
            novaLauncher.f80020u0 = null;
        }
        if (!l2Var.equals(l2.f79980u)) {
            o9.a aVarP = o9.a.P(novaLauncher, 7471103);
            h1 h1Var = aVarP instanceof h1 ? (h1) aVarP : null;
            if (h1Var != null) {
                h1Var.K(true);
            }
        }
        if (!l2Var.equals(l2.f79978s) && !novaLauncher.Q.o()) {
            novaLauncher.O.o1();
        }
        y2 y2Var = y2.f51877a;
        ((x20.e) y2Var.U0().l()).d(novaLauncher);
        if (l2Var.equals(obj)) {
            FloatingHeaderView floatingHeaderView = novaLauncher.V.o;
            if (floatingHeaderView != null && (drawerAdFloatingHeaderView = (DrawerAdFloatingHeaderView) floatingHeaderView.findViewById(2131427919)) != null && (i0Var2 = drawerAdFloatingHeaderView.f45685k) != null) {
                i0Var2.b(false);
            }
            Context context = g0.f77088a;
            g0.i().b(new o(pp.w.f82781e));
        } else if (l2Var.equals(aVar3)) {
            FloatingHeaderView floatingHeaderView2 = novaLauncher.V.o;
            DrawerAdFloatingHeaderView drawerAdFloatingHeaderView2 = floatingHeaderView2 != null ? (DrawerAdFloatingHeaderView) floatingHeaderView2.findViewById(2131427919) : null;
            if (drawerAdFloatingHeaderView2 != null) {
                boolean z11 = y2Var.W().l() == d0.f51461d;
                qx.l lVar = qx.l.f84545g;
                boolean z12 = lVar.h() && !z11;
                if (px.c.f83110a.e(drawerAdFloatingHeaderView2.getContext())) {
                    if (!z12) {
                        ComposeView composeView = drawerAdFloatingHeaderView2.f45684j;
                        if (composeView != null) {
                            drawerAdFloatingHeaderView2.removeView(composeView);
                            drawerAdFloatingHeaderView2.f45684j = null;
                            drawerAdFloatingHeaderView2.f45680f = false;
                            drawerAdFloatingHeaderView2.setVisibility(8);
                            FloatingHeaderView floatingHeaderView3 = drawerAdFloatingHeaderView2.f45681g;
                            if (floatingHeaderView3 != null) {
                                floatingHeaderView3.onHeightUpdated();
                            }
                        }
                    } else if (drawerAdFloatingHeaderView2.f45684j == null) {
                        FrameLayout frameLayout = drawerAdFloatingHeaderView2.f45683i;
                        if (frameLayout != null) {
                            drawerAdFloatingHeaderView2.removeView(frameLayout);
                            drawerAdFloatingHeaderView2.f45683i = null;
                            drawerAdFloatingHeaderView2.f45682h = false;
                            drawerAdFloatingHeaderView2.f45680f = false;
                        }
                        WeakReference weakReference = new WeakReference(drawerAdFloatingHeaderView2);
                        a0 a0VarC = y0.c(drawerAdFloatingHeaderView2);
                        if (a0VarC == null) {
                            Object context2 = drawerAdFloatingHeaderView2.getContext();
                            a0VarC = context2 instanceof a0 ? (a0) context2 : null;
                        }
                        i0 i0Var3 = a0VarC != null ? new i0(a0VarC) : null;
                        drawerAdFloatingHeaderView2.f45685k = i0Var3;
                        ComposeView composeView2 = new ComposeView(drawerAdFloatingHeaderView2.getContext(), null, 0, 6, null);
                        composeView2.setLayoutParams(new FrameLayout.LayoutParams(-1, -2));
                        composeView2.setViewCompositionStrategy(k3.f19374a);
                        composeView2.setContent(new x1.e(new l0(i0Var3, weakReference, i11), true, -1949699482));
                        drawerAdFloatingHeaderView2.addView(composeView2);
                        drawerAdFloatingHeaderView2.f45684j = composeView2;
                        drawerAdFloatingHeaderView2.f45680f = false;
                        drawerAdFloatingHeaderView2.setVisibility(8);
                    }
                    i0 i0Var4 = drawerAdFloatingHeaderView2.f45685k;
                    if (i0Var4 != null) {
                        i0Var4.b(true);
                    }
                } else {
                    long jB = k.b(lVar, (d0) y2Var.W().l(), 4);
                    if (z12 && !drawerAdFloatingHeaderView2.f45682h) {
                        FrameLayout frameLayout2 = new FrameLayout(drawerAdFloatingHeaderView2.getContext());
                        drawerAdFloatingHeaderView2.f45683i = frameLayout2;
                        drawerAdFloatingHeaderView2.addView(frameLayout2, new FrameLayout.LayoutParams(-1, -2));
                        w0.m(ox.f.f81065a.a(lVar), frameLayout2, "drawer_header", "floating_header", new i(drawerAdFloatingHeaderView2, i11), k.b(lVar, (d0) y2Var.W().l(), 4), 32);
                        drawerAdFloatingHeaderView2.f45682h = true;
                    } else if (z12 && drawerAdFloatingHeaderView2.f45682h && !drawerAdFloatingHeaderView2.f45680f) {
                        w0 w0VarA = ox.f.f81065a.a(lVar);
                        FrameLayout frameLayout3 = drawerAdFloatingHeaderView2.f45683i;
                        Intrinsics.d(frameLayout3);
                        w0.m(w0VarA, frameLayout3, "drawer_header", "floating_header", new i(drawerAdFloatingHeaderView2, i5), jB, 32);
                    } else if (z12 && drawerAdFloatingHeaderView2.f45680f) {
                        w0 w0VarA2 = ox.f.f81065a.a(lVar);
                        FrameLayout frameLayout4 = drawerAdFloatingHeaderView2.f45683i;
                        Intrinsics.d(frameLayout4);
                        w0VarA2.n(frameLayout4, "drawer_header", "floating_header", null, jB);
                    } else if (!z12 && drawerAdFloatingHeaderView2.f45682h) {
                        FrameLayout frameLayout5 = drawerAdFloatingHeaderView2.f45683i;
                        if (frameLayout5 != null) {
                            ox.f.f81065a.a(lVar).i("drawer_headerfloating_header");
                            drawerAdFloatingHeaderView2.removeView(frameLayout5);
                            drawerAdFloatingHeaderView2.f45683i = null;
                        }
                        drawerAdFloatingHeaderView2.f45682h = false;
                        drawerAdFloatingHeaderView2.f45680f = false;
                        drawerAdFloatingHeaderView2.setVisibility(8);
                        FloatingHeaderView floatingHeaderView4 = drawerAdFloatingHeaderView2.f45681g;
                        if (floatingHeaderView4 != null) {
                            floatingHeaderView4.onHeightUpdated();
                        }
                    }
                }
            }
            AppSearchResultsView appSearchResultsView = novaLauncher.V.L;
            if (appSearchResultsView != null && appSearchResultsView.M && drawerAdFloatingHeaderView2 != null && (i0Var = drawerAdFloatingHeaderView2.f45685k) != null) {
                i0Var.b(false);
            }
            Context context3 = g0.f77088a;
            g0.i().b(new o(pp.w.f82780d));
            g0.i().b(new o(pp.w.f82779c));
        }
        for (int size = ((ArrayList) this.f85763e).size() - 1; size >= 0; size--) {
            ((e) ((ArrayList) this.f85763e).get(size)).t(aVar);
        }
    }

    public void m(a aVar) {
        AppSearchResultsView appSearchResultsView;
        this.f85765g = aVar;
        NovaLauncher novaLauncher = (NovaLauncher) ((n1) this.f85762d);
        novaLauncher.getClass();
        l2 l2Var = (l2) aVar;
        q qVar = q.f84576a;
        q.f84581f = true;
        if (novaLauncher.K) {
            novaLauncher.s0();
        }
        if (novaLauncher.f80015p0) {
            Handler handler = novaLauncher.I;
            b1 b1Var = novaLauncher.f80016q0;
            handler.removeCallbacks(b1Var);
            Pattern pattern = g3.f79846a;
            Message messageObtain = Message.obtain(handler, b1Var);
            messageObtain.setAsynchronous(true);
            handler.sendMessage(messageObtain);
        }
        novaLauncher.A |= 64;
        if (l2Var.n(l2.f79971j)) {
            o9.a.M(novaLauncher, !l2Var.n(1), 7471103);
            novaLauncher.m();
        }
        sa.c cVar = l2.n;
        int i5 = 2;
        if (l2Var == cVar || l2Var == l2.f79978s) {
            ((x) x.f54523e.h(novaLauncher)).f54526c |= 4;
            sa.b bVar = novaLauncher.f80013n0;
            if (bVar.f87089e != 2) {
                bVar.f87089e = 2;
                bVar.a();
            }
            Workspace workspace = novaLauncher.O;
            View view = workspace.E;
            if (view != null) {
                WorkspacePageIndicator workspacePageIndicator = (WorkspacePageIndicator) view;
                int scrollX = workspace.getScrollX();
                int childCount = workspace.getChildCount();
                workspacePageIndicator.g(scrollX, childCount > 0 ? workspace.N(workspace.T() ? 0 : childCount - 1) : 0);
            }
            novaLauncher.O.setClipChildren(false);
        }
        ry.e eVar = l2.f79978s;
        if (l2Var == eVar) {
            ((WorkspacePageIndicator) novaLauncher.O.E).setVisibility(4);
        } else {
            novaLauncher.V0(l2Var, novaLauncher.Q.o());
        }
        l2 l2Var2 = (l2) ((a) novaLauncher.M.f85767i);
        novaLauncher.f80021v0 = l2Var2;
        if (l2Var2 != l2Var && l2.o.equals(l2Var) && novaLauncher.f80020u0 == null) {
            novaLauncher.f80020u0 = new ag(1, false).m();
            novaLauncher.O().a().b(u9.b.f90694g.f90687d ? ea.d.LAUNCHER_ALLAPPS_ENTRY_WITH_DEVICE_SEARCH : ea.d.LAUNCHER_ALLAPPS_ENTRY);
        }
        if (l2Var.equals(l2.o) && (appSearchResultsView = novaLauncher.V.L) != null && appSearchResultsView.f46185d0 && appSearchResultsView.M) {
            e1 e1Var = appSearchResultsView.f46189f0;
            int i11 = appSearchResultsView.f46193h0 + 1;
            appSearchResultsView.f46193h0 = i11;
            ((s2) e1Var).setValue(c0.h(i11, "search_"));
        }
        novaLauncher.L.g(l2Var.equals(l2.f79974m));
        if (!l2Var.equals(cVar)) {
            o9.a.M(novaLauncher, true, 1);
        }
        if (l2Var.equals(eVar)) {
            novaLauncher.P.announceForAccessibility(novaLauncher.getString(2132018763));
            s0 s0Var = new s0(novaLauncher, i5);
            y2.f51877a.getClass();
            if (y2.d()) {
                int i12 = DesktopLockBottomSheet.f45718z;
                DesktopLockBottomSheet desktopLockBottomSheetL = ps.j.l(novaLauncher);
                desktopLockBottomSheetL.h0(new k5.d(11, novaLauncher, s0Var));
                desktopLockBottomSheetL.g0(s0Var);
            } else {
                int i13 = WidgetsPeekingSheet.f45705j0;
                t2.c.K(novaLauncher).v0(s0Var);
                novaLauncher.O.x0();
                o10.b.a("home_page_added", novaLauncher);
            }
        } else {
            o9.a.M(novaLauncher, true, 4);
            o9.a.M(novaLauncher, true, 16);
            o9.a.M(novaLauncher, true, 4194304);
        }
        for (int size = ((ArrayList) this.f85763e).size() - 1; size >= 0; size--) {
            ((e) ((ArrayList) this.f85763e).get(size)).j(aVar);
        }
    }

    public void n(boolean z11) {
        c cVar = (c) this.f85760b;
        boolean z12 = cVar.f85756e != null;
        if (z11) {
            for (Animator animator : (Animator[]) ((v6) this.f85768j).f33136b) {
                if (animator != null) {
                    animator.cancel();
                }
            }
            d();
        }
        if (cVar.f85756e == null) {
            for (d dVar : f()) {
                dVar.j((a) this.f85765g);
            }
            if (z12) {
                l((a) this.f85765g);
            }
        }
    }

    public void o(e eVar) {
        ((ArrayList) this.f85763e).remove(eVar);
    }

    public String toString() {
        switch (this.f85759a) {
            case 0:
                StringBuilder sb2 = new StringBuilder(" StateManager(mLastStableState:");
                sb2.append((a) this.f85766h);
                sb2.append(", mCurrentStableState:");
                sb2.append((a) this.f85767i);
                sb2.append(", mState:");
                sb2.append((a) this.f85765g);
                sb2.append(", mRestState:null, isInTransition:");
                return a80.m.k(sb2, ((c) this.f85760b).f85756e != null, ")");
            default:
                return super.toString();
        }
    }

    public f(n1 n1Var, j2 j2Var) {
        c cVar = new c();
        cVar.f85758g = 0;
        this.f85760b = cVar;
        this.f85763e = new ArrayList();
        this.f85761c = new Handler(Looper.getMainLooper());
        this.f85762d = n1Var;
        this.f85764f = j2Var;
        this.f85767i = j2Var;
        this.f85766h = j2Var;
        this.f85765g = j2Var;
        this.f85768j = new v6(18);
    }
}
