package o00;

import android.content.ComponentName;
import android.content.Context;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import e00.k3;
import e10.f3;
import e10.z2;
import gy.t;
import h10.a1;
import hv.g3;
import java.io.File;
import java.util.List;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import mk.v;
import p1.e1;
import p1.n;
import p1.o;
import p1.o0;
import p1.t1;
import t70.j0;

/* loaded from: classes4.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final List f78916a = ul.b.Q(new t("Bug"), new t("Feature"), new t("Help"), new t("Other"));

    /* renamed from: b, reason: collision with root package name */
    public static final k f78917b = new k(new ComponentName(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);

    public static final void a(p6.t tVar, f3 f3Var, o oVar, int i5) {
        Context context;
        f3 f3Var2;
        p1.t tVar2;
        p6.t tVar3 = tVar;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(299023013);
        int i11 = (tVar4.h(tVar3) ? 4 : 2) | i5 | (tVar4.f(f3Var) ? 32 : 16);
        if ((i11 & 19) == 18 && tVar4.E()) {
            tVar4.V();
            f3Var2 = f3Var;
            tVar2 = tVar4;
        } else {
            Object objP = tVar4.P();
            Object obj = n.f81514a;
            if (objP == obj) {
                objP = o0.i(EmptyCoroutineContext.f71803a, tVar4);
                tVar4.m0(objP);
            }
            j0 j0Var = (j0) objP;
            v.N(tVar4);
            Context context2 = (Context) tVar4.j(AndroidCompositionLocals_androidKt.f14166b);
            tVar4.b0(127983950);
            Object objP2 = tVar4.P();
            if (objP2 == obj) {
                objP2 = androidx.compose.runtime.d.k(Boolean.FALSE);
                tVar4.m0(objP2);
            }
            e1 e1Var = (e1) objP2;
            Object objF = a2.c.f(127985790, tVar4, false);
            if (objF == obj) {
                objF = androidx.compose.runtime.d.k(EmptyList.f71733a);
                tVar4.m0(objF);
            }
            e1 e1Var2 = (e1) objF;
            tVar4.p(false);
            Unit unit = Unit.f71706a;
            tVar4.b0(127988305);
            boolean zH = tVar4.h(context2);
            Object objP3 = tVar4.P();
            Continuation continuation = null;
            if (zH || objP3 == obj) {
                objP3 = new k3(context2, e1Var2, continuation, 2);
                tVar4.m0(objP3);
            }
            tVar4.p(false);
            o0.f(unit, (Function2) objP3, tVar4);
            String str = f3Var.f51528d;
            tVar4.b0(127993709);
            Object objP4 = tVar4.P();
            if (objP4 == obj) {
                objP4 = androidx.compose.runtime.d.k(new t("Help"));
                tVar4.m0(objP4);
            }
            e1 e1Var3 = (e1) objP4;
            tVar4.p(false);
            Object[] objArr = new Object[0];
            tVar4.b0(127995938);
            Object objP5 = tVar4.P();
            if (objP5 == obj) {
                objP5 = new g3(29);
                tVar4.m0(objP5);
            }
            tVar4.p(false);
            e1 e1Var4 = (e1) y1.j.c(objArr, (Function0) objP5, tVar4, 48);
            Object[] objArr2 = new Object[0];
            tVar4.b0(127997730);
            Object objP6 = tVar4.P();
            if (objP6 == obj) {
                context = context2;
                objP6 = new d(0);
                tVar4.m0(objP6);
            } else {
                context = context2;
            }
            tVar4.p(false);
            e1 e1Var5 = (e1) y1.j.c(objArr2, (Function0) objP6, tVar4, 48);
            tVar4.b0(127999374);
            Object objP7 = tVar4.P();
            if (objP7 == obj) {
                objP7 = androidx.compose.runtime.d.k(Boolean.FALSE);
                tVar4.m0(objP7);
            }
            e1 e1Var6 = (e1) objP7;
            tVar4.p(false);
            File externalCacheDir = context.getExternalCacheDir();
            Intrinsics.d(externalCacheDir);
            File file = new File(externalCacheDir, "fileprovider_temp/share_backup");
            tVar4.b0(128004970);
            boolean zH2 = tVar4.h(j0Var) | tVar4.h(file);
            Object objP8 = tVar4.P();
            if (zH2 || objP8 == obj) {
                objP8 = new jt.e(26, j0Var, file);
                tVar4.m0(objP8);
            }
            tVar4.p(false);
            i6.d.c(unit, null, (Function1) objP8, tVar4, 6);
            i iVar = new i(context, f3Var, file, str, e1Var4, e1Var5, e1Var, e1Var3, e1Var6, e1Var2, tVar, j0Var);
            f3Var2 = f3Var;
            tVar3 = tVar;
            tVar2 = tVar4;
            z2.h(2132017677, tVar3, null, null, null, null, x1.f.d(1609410856, iVar, tVar4), tVar2, ((i11 << 3) & 112) | 1572864, 60);
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a1(tVar3, f3Var2, i5, 16);
        }
    }
}
