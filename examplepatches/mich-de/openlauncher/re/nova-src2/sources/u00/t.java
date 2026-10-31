package u00;

import android.content.ComponentName;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.NovaShortcutHandler;
import com.vungle.ads.internal.protos.Sdk;
import cw.r3;
import e00.c4;
import e00.k3;
import e10.s2;
import e10.y2;
import e10.z2;
import fz.h0;
import java.util.ArrayList;
import java.util.List;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.reflect.KProperty;
import mx.g0;
import mx.k0;
import p1.e1;
import p1.o0;
import p1.t1;
import t00.c0;
import t70.j0;

/* loaded from: classes4.dex */
public abstract class t {

    /* renamed from: a, reason: collision with root package name */
    public static final List f90314a = ul.b.Q(new Pair("Nova Launcher", NovaShortcutHandler.f45670c), new Pair("Calculator", b30.e.f17446f), new Pair("Adaptive", new ComponentName("com.teslacoilsw.launcher", ":ADAPTIVE")), new Pair("Legacy", new ComponentName("com.teslacoilsw.launcher", ":LEGACY")));

    /* renamed from: b, reason: collision with root package name */
    public static final ArrayList f90315b;

    static {
        fz.d.Companion.getClass();
        f90315b = ul.b.T(fz.d.f56190k, fz.d.f56191l, fz.d.f56192m, fz.d.n, fz.d.f56198u, fz.d.D);
    }

    public static final void a(p6.t tVar, r3 r3Var, p1.o oVar, int i5) {
        j0 j0Var;
        boolean z11;
        c0 c0Var;
        p6.t tVar2 = tVar;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(787590577);
        int i11 = (tVar3.h(tVar2) ? 4 : 2) | i5;
        if ((i11 & 3) == 2 && tVar3.E()) {
            tVar3.V();
        } else {
            androidx.compose.runtime.e eVar = AndroidCompositionLocals_androidKt.f14166b;
            Context context = (Context) tVar3.j(eVar);
            Object objP = tVar3.P();
            Object obj = p1.n.f81514a;
            if (objP == obj) {
                objP = o0.i(EmptyCoroutineContext.f71803a, tVar3);
                tVar3.m0(objP);
            }
            j0 j0Var2 = (j0) objP;
            c0 c0VarQ = ps.j0.q(null, tVar3, 3);
            c0VarQ.a(j0Var2, tVar3, 0);
            mx.f fVar = new mx.f(mx.g.f77083a, new mx.j(0.0f, true, 0.0f, false, (String) null, false, false, 253), true);
            fVar.a(((Context) tVar3.j(eVar)).getResources(), 1.0f);
            tz.m mVar = tz.n.Companion;
            tz.c.Companion.getClass();
            mVar.getClass();
            fVar.f77077j = new tz.u(0, tz.m.a(0), tz.n.f90140b, 0L, Sdk.SDKError.Reason.TPAT_ERROR_VALUE).d((g30.b) g30.b.f57016l.h(context)).f90179b;
            y2 y2Var = y2.f51877a;
            y2Var.getClass();
            q00.l lVarN0 = z2.n0(y2.F0(), tVar3);
            p1.y2 y2Var2 = lVarN0.f83363b;
            boolean z12 = ((gz.j) y2Var2.getValue()).f58653b != gz.e.f58645c;
            q00.l lVarN02 = z2.n0(y2Var.i(), tVar3);
            p1.y2 y2Var3 = lVarN02.f83363b;
            q00.l lVarN03 = z2.n0(y2Var.h(), tVar3);
            p1.y2 y2Var4 = lVarN03.f83363b;
            p1.y2 y2Var5 = z2.n0(y2Var.E0(), tVar3).f83363b;
            s2 s2Var = y2.D1;
            KProperty kProperty = y2.f51881b[129];
            s2Var.getClass();
            q00.l lVarN04 = z2.n0(s2Var, tVar3);
            p1.y2 y2Var6 = lVarN04.f83363b;
            q00.l lVarN05 = z2.n0(y2Var.g(), tVar3);
            ComponentName componentName = k0.f77184z;
            int iH = ul.b.H(fVar.f77071d);
            tVar3.b0(247428049);
            boolean zF = tVar3.f(lVarN0);
            Object objP2 = tVar3.P();
            if (zF || objP2 == obj) {
                objP2 = ((gz.j) y2Var2.getValue()).b(context, iH);
                tVar3.m0(objP2);
            }
            gz.f fVar2 = (gz.f) objP2;
            tVar3.p(false);
            tVar3.b0(247431177);
            boolean zF2 = tVar3.f(lVarN0);
            Object objP3 = tVar3.P();
            if (zF2 || objP3 == obj) {
                j0Var = j0Var2;
                objP3 = Boolean.valueOf(fVar2.i(context, NovaLauncher.f45646r1, new ColorDrawable(-65536)) != null);
                tVar3.m0(objP3);
            } else {
                j0Var = j0Var2;
            }
            boolean zBooleanValue = ((Boolean) objP3).booleanValue();
            tVar3.p(false);
            tVar3.b0(247433803);
            boolean zF3 = tVar3.f(lVarN0);
            Object objP4 = tVar3.P();
            if (zF3 || objP4 == obj) {
                z11 = zBooleanValue;
                c0Var = c0VarQ;
                objP4 = new h0(context, new fz.u(iH, fVar.f77071d, (fz.d) y2Var3.getValue(), fVar2));
                tVar3.m0(objP4);
            } else {
                z11 = zBooleanValue;
                c0Var = c0VarQ;
            }
            h0 h0Var = (h0) objP4;
            tVar3.p(false);
            Object obj2 = (fz.d) y2Var3.getValue();
            Object obj3 = (e10.q) y2Var4.getValue();
            boolean zBooleanValue2 = ((Boolean) y2Var5.getValue()).booleanValue();
            boolean zBooleanValue3 = ((Boolean) y2Var6.getValue()).booleanValue();
            tVar3.b0(247438447);
            boolean zF4 = tVar3.f(obj2) | tVar3.f(obj3) | tVar3.g(zBooleanValue2) | tVar3.g(zBooleanValue3);
            Object objP5 = tVar3.P();
            if (zF4 || objP5 == obj) {
                Object k0Var = new k0(context, 0, 0, (fz.d) y2Var3.getValue(), ((Boolean) y2Var5.getValue()).booleanValue(), (e10.q) y2Var4.getValue(), ((Boolean) y2Var6.getValue()).booleanValue(), -1, 6);
                tVar3.m0(k0Var);
                objP5 = k0Var;
            }
            tVar3.p(false);
            tVar2 = tVar;
            z2.o(2132019244, tVar2, 0L, null, null, null, x1.f.d(-1459224164, new n(lVarN05, fVar, (k0) objP5, h0Var, lVarN02, c0Var, j0Var, lVarN0, z11, z12, lVarN03, lVarN04, context), tVar3), tVar3, ((i11 << 3) & 112) | 1572864, 60);
        }
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new e00.a(tVar2, r3Var, i5, 4);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:27:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(h0 h0Var, Function0 function0, Function1 function1, p1.o oVar, int i5) {
        p1.t tVar;
        t1 t1VarU;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1443669396);
        if (((i5 | (tVar2.h(function1) ? 256 : 128)) & 145) != 144 || !tVar2.E()) {
            tVar2.b0(89509460);
            Object objP = tVar2.P();
            Object obj = p1.n.f81514a;
            if (objP == obj) {
                objP = androidx.compose.runtime.d.k(EmptyList.f71733a);
                tVar2.m0(objP);
            }
            e1 e1Var = (e1) objP;
            tVar2.p(false);
            float f11 = 48;
            Context context = (Context) tVar2.j(AndroidCompositionLocals_androidKt.f14166b);
            Unit unit = Unit.f71706a;
            tVar2.b0(89516423);
            boolean zH = tVar2.h(context);
            Object objP2 = tVar2.P();
            if (zH || objP2 == obj) {
                objP2 = new k3(context, e1Var, null, 4);
                tVar2.m0(objP2);
            }
            tVar2.p(false);
            o0.f(unit, (Function2) objP2, tVar2);
            if (!((List) e1Var.getValue()).isEmpty()) {
                tVar = tVar2;
                jy.k.a(function0, i.f90246g, null, null, x1.f.d(-1521213033, new c4(context, 3), tVar2), null, 0L, 0.0f, 0L, 0L, 0L, null, x1.f.d(-789156318, new s(f11, context, function0, function1, e1Var), tVar2), tVar, 196662, 3072, 8156);
            }
            t1VarU = tVar.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new n00.m(i5, 12, h0Var, function0, function1);
                return;
            }
            return;
        }
        tVar2.V();
        tVar = tVar2;
        t1VarU = tVar.u();
        if (t1VarU == null) {
        }
    }

    public static final void c() {
        Context context = g0.f77088a;
        g0.a(new a10.a(8));
    }
}
