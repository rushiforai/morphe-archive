package c4;

import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import c3.z1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.UUID;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import p1.e1;
import p1.g1;
import p1.m0;
import p1.n1;
import p1.o0;
import p1.t1;
import z2.r0;

/* loaded from: classes.dex */
public abstract class p {

    /* renamed from: a, reason: collision with root package name */
    public static final m0 f19625a = new m0(j.f19611j);

    /* JADX WARN: Removed duplicated region for block: B:109:0x024e  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x0258  */
    /* JADX WARN: Removed duplicated region for block: B:114:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0074  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(f0 f0Var, Function0 function0, g0 g0Var, x1.e eVar, p1.o oVar, int i5, int i11) {
        int i12;
        Function0 function02;
        g0 g0Var2;
        int i13;
        Function0 function03;
        t1 t1VarU;
        Function0 function04;
        String str;
        Object xVar;
        boolean z11;
        Function0 function05;
        int i14;
        boolean z12;
        d0 d0Var;
        y3.n nVar;
        f0 f0Var2 = f0Var;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-1772091631);
        if ((i5 & 6) == 0) {
            i12 = (tVar.f(f0Var2) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i15 = i11 & 2;
        if (i15 == 0) {
            if ((i5 & 48) == 0) {
                function02 = function0;
                i12 |= tVar.h(function02) ? 32 : 16;
            }
            if ((i5 & 384) != 0) {
                g0Var2 = g0Var;
                i12 |= tVar.f(g0Var2) ? 256 : 128;
            } else {
                g0Var2 = g0Var;
            }
            if ((i5 & 3072) == 0) {
                i12 |= tVar.h(eVar) ? 2048 : 1024;
            }
            i13 = i12;
            if (tVar.S(i13 & 1, (i13 & 1171) == 1170)) {
                tVar.V();
                function03 = function02;
            } else {
                Function0 function06 = i15 != 0 ? null : function02;
                View view = (View) tVar.j(AndroidCompositionLocals_androidKt.f14170f);
                y3.c cVar = (y3.c) tVar.j(z1.f19497h);
                String str2 = (String) tVar.j(f19625a);
                y3.n nVar2 = (y3.n) tVar.j(z1.n);
                androidx.compose.runtime.a aVarI = p1.a0.i(tVar);
                e1 e1VarM = androidx.compose.runtime.d.m(eVar, tVar);
                Object[] objArr = new Object[0];
                Object objP = tVar.P();
                g1 g1Var = p1.n.f81514a;
                if (objP == g1Var) {
                    objP = f.f19594l;
                    tVar.m0(objP);
                }
                UUID uuid = (UUID) y1.j.c(objArr, (Function0) objP, tVar, 48);
                Object objP2 = tVar.P();
                if (objP2 == g1Var) {
                    str = str2;
                    d0 d0Var2 = new d0(function06, g0Var2, view, cVar, f0Var, uuid);
                    function04 = function06;
                    f0Var2 = f0Var;
                    d0Var2.d(aVarI, new x1.e(new n(0, d0Var2, e1VarM), true, -297523940));
                    tVar.m0(d0Var2);
                    objP2 = d0Var2;
                } else {
                    function04 = function06;
                    str = str2;
                    f0Var2 = f0Var;
                }
                d0 d0Var3 = (d0) objP2;
                int i16 = i13 & 112;
                int i17 = i13 & 896;
                boolean zH = tVar.h(d0Var3) | (i16 == 32) | (i17 == 256) | tVar.f(str) | tVar.d(nVar2.ordinal());
                Object objP3 = tVar.P();
                if (zH || objP3 == g1Var) {
                    String str3 = str;
                    z11 = true;
                    function05 = function04;
                    i14 = i13;
                    z12 = false;
                    xVar = new q6.x(d0Var3, function05, g0Var, str3, nVar2);
                    str = str3;
                    tVar.m0(xVar);
                } else {
                    function05 = function04;
                    i14 = i13;
                    xVar = objP3;
                    z11 = true;
                    z12 = false;
                }
                o0.b(d0Var3, (Function1) xVar, tVar);
                boolean zH2 = (i16 == 32 ? z11 : z12) | tVar.h(d0Var3) | (i17 == 256 ? z11 : z12) | tVar.f(str) | tVar.d(nVar2.ordinal());
                Object objP4 = tVar.P();
                if (zH2 || objP4 == g1Var) {
                    String str4 = str;
                    d0Var = d0Var3;
                    b bVar = new b(d0Var, function05, g0Var, str4, nVar2);
                    nVar = nVar2;
                    tVar.m0(bVar);
                    objP4 = bVar;
                } else {
                    d0Var = d0Var3;
                    nVar = nVar2;
                }
                o0.h((Function0) objP4, tVar);
                boolean zH3 = tVar.h(d0Var);
                if ((i14 & 14) == 4) {
                    z12 = z11;
                }
                boolean z13 = z12 | zH3;
                Object objP5 = tVar.P();
                if (z13 || objP5 == g1Var) {
                    objP5 = new b0.e(6, d0Var, f0Var2);
                    tVar.m0(objP5);
                }
                o0.b(f0Var2, (Function1) objP5, tVar);
                boolean zH4 = tVar.h(d0Var);
                Object objP6 = tVar.P();
                if (zH4 || objP6 == g1Var) {
                    objP6 = new k(d0Var, (Continuation) null, 0);
                    tVar.m0(objP6);
                }
                o0.f(d0Var, (Function2) objP6, tVar);
                boolean zH5 = tVar.h(d0Var);
                Object objP7 = tVar.P();
                if (zH5 || objP7 == g1Var) {
                    objP7 = new l(d0Var, 0);
                    tVar.m0(objP7);
                }
                b2.t tVarB = androidx.compose.ui.layout.b.b(b2.r.f17024a, (Function1) objP7);
                boolean zH6 = tVar.h(d0Var) | tVar.d(nVar.ordinal());
                Object objP8 = tVar.P();
                if (zH6 || objP8 == g1Var) {
                    objP8 = new m(0, d0Var, nVar);
                    tVar.m0(objP8);
                }
                r0 r0Var = (r0) objP8;
                int iHashCode = Long.hashCode(tVar.T);
                n1 n1VarL = tVar.l();
                b2.t tVarI = fg.a.I(tVarB, tVar);
                b3.l.Po.getClass();
                Function0 function07 = b3.k.f17270b;
                tVar.f0();
                if (tVar.S) {
                    tVar.k(function07);
                } else {
                    tVar.p0();
                }
                p1.a0.j(r0Var, b3.k.f17275g, tVar);
                p1.a0.j(n1VarL, b3.k.f17274f, tVar);
                b3.i iVar = b3.k.f17278j;
                if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
                    a2.c.u(iHashCode, tVar, iHashCode, iVar);
                }
                p1.a0.j(tVarI, b3.k.f17272d, tVar);
                tVar.p(z11);
                function03 = function05;
            }
            t1VarU = tVar.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new b0.m0(f0Var2, function03, g0Var, eVar, i5, i11, 1);
                return;
            }
            return;
        }
        i12 |= 48;
        function02 = function0;
        if ((i5 & 384) != 0) {
        }
        if ((i5 & 3072) == 0) {
        }
        i13 = i12;
        if (tVar.S(i13 & 1, (i13 & 1171) == 1170)) {
        }
        t1VarU = tVar.u();
        if (t1VarU == null) {
        }
    }

    public static final boolean b(View view) {
        ViewGroup.LayoutParams layoutParams = view.getRootView().getLayoutParams();
        WindowManager.LayoutParams layoutParams2 = layoutParams instanceof WindowManager.LayoutParams ? (WindowManager.LayoutParams) layoutParams : null;
        return (layoutParams2 == null || (layoutParams2.flags & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0) ? false : true;
    }
}
