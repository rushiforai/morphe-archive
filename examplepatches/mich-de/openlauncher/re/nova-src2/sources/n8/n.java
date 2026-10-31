package n8;

import android.content.Context;
import androidx.compose.ui.CompositionLocalMapInjectionElement;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b0.l0;
import b0.q0;
import c3.n3;
import c3.p2;
import c3.z1;
import i2.c0;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import p1.a0;
import p1.s2;
import p1.t1;

/* loaded from: classes.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public static final m f78001a = new m();

    public static final void a(Object obj, String str, b2.t tVar, z2.l lVar, i2.t tVar2, p1.o oVar, int i5, int i11) {
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-941517612);
        b2.t tVar4 = (i11 & 4) != 0 ? b2.r.f17024a : tVar;
        z2.l lVar2 = (i11 & 64) != 0 ? z2.k.f98095b : lVar;
        i2.t tVar5 = (i11 & 256) != 0 ? null : tVar2;
        int i12 = i5 & (-1879055361);
        m8.k kVarA = (m8.k) tVar3.j(v.f78025a);
        if (kVarA == null) {
            kVarA = m8.a.a((Context) tVar3.j(AndroidCompositionLocals_androidKt.f14166b));
        }
        int i13 = i12 << 3;
        b(obj, str, kVarA, tVar4, lVar2, tVar5, tVar3, (i5 & 112) | 520 | (i13 & 7168) | (458752 & i13) | (3670016 & i13) | (29360128 & i13) | (234881024 & i13) | (i13 & 1879048192), 0);
        t1 t1VarU = tVar3.u();
        if (t1VarU == null) {
            return;
        }
        t1VarU.f81583d = new l0(obj, str, tVar4, lVar2, tVar5, i5, i11);
    }

    public static final void b(Object obj, String str, m8.k kVar, b2.t tVar, z2.l lVar, i2.t tVar2, p1.o oVar, int i5, int i11) {
        x8.k kVarA;
        y8.g dVar;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-2030202961);
        int i12 = w.f78027b;
        if (obj instanceof x8.k) {
            kVarA = (x8.k) obj;
        } else {
            x8.i iVar = new x8.i((Context) tVar3.j(AndroidCompositionLocals_androidKt.f14166b));
            iVar.f95306c = obj;
            kVarA = iVar.a();
        }
        tVar3.c0(402368983);
        if (kVarA.f95348y.f95294b == null) {
            if (Intrinsics.b(lVar, z2.k.f98097d)) {
                dVar = new y8.d(y8.f.f96844c);
            } else {
                tVar3.c0(-492369756);
                Object objP = tVar3.P();
                if (objP == p1.n.f81514a) {
                    objP = new r();
                    tVar3.m0(objP);
                }
                tVar3.p(false);
                dVar = (y8.g) objP;
            }
            x8.i iVarA = x8.k.a(kVarA);
            iVarA.f95320s = dVar;
            iVarA.c();
            kVarA = iVarA.a();
        }
        tVar3.p(false);
        int i13 = i5 >> 9;
        int i14 = 57344 & i13;
        l lVarD = d(kVarA, kVar, lVar, tVar3);
        y8.g gVar = kVarA.f95342s;
        c(gVar instanceof r ? tVar.then((b2.t) gVar) : tVar, lVarD, str, lVar, tVar2, tVar3, i14 | ((i5 << 3) & 896) | (i13 & 7168) | (458752 & i13) | (i13 & 3670016));
        t1 t1VarU = tVar3.u();
        if (t1VarU == null) {
            return;
        }
        t1VarU.f81583d = new a(obj, str, kVar, tVar, lVar, tVar2, i5, i11);
    }

    public static final void c(b2.t tVar, l lVar, String str, z2.l lVar2, i2.t tVar2, p1.o oVar, int i5) {
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(10290533);
        b2.t tVarThen = fg.a.h(str != null ? j3.n.b(tVar, false, new j3.o(str, 5)) : tVar).then(new s(lVar, lVar2, tVar2));
        tVar3.c0(544976794);
        y3.c cVar = (y3.c) tVar3.j(z1.f19497h);
        y3.n nVar = (y3.n) tVar3.j(z1.n);
        n3 n3Var = (n3) tVar3.j(z1.f19506s);
        if (tVarThen != b2.r.f17024a) {
            tVarThen = fg.a.I(new CompositionLocalMapInjectionElement(tVar3.l()).then(tVarThen), tVar3);
        }
        b3.l.Po.getClass();
        Function0 function0 = b3.k.f17270b;
        tVar3.c0(1405779621);
        tVar3.f0();
        if (tVar3.S) {
            tVar3.k(new a3.e(function0, 21));
        } else {
            tVar3.p0();
        }
        a0.j(c.f77977a, b3.k.f17275g, tVar3);
        a0.j(cVar, b3.k.f17273e, tVar3);
        a0.j(nVar, b3.k.f17276h, tVar3);
        a0.j(n3Var, b3.k.f17277i, tVar3);
        a0.j(tVarThen, b3.k.f17272d, tVar3);
        tVar3.p(true);
        tVar3.p(false);
        tVar3.p(false);
        t1 t1VarU = tVar3.u();
        if (t1VarU == null) {
            return;
        }
        t1VarU.f81583d = new q0(tVar, lVar, str, lVar2, tVar2, i5);
    }

    public static final l d(Object obj, m8.k kVar, z2.l lVar, p1.o oVar) {
        x8.k kVarA;
        b bVar = b.f77975l;
        p1.t tVar = (p1.t) oVar;
        tVar.c0(-2020614074);
        int i5 = w.f78027b;
        if (obj instanceof x8.k) {
            kVarA = (x8.k) obj;
        } else {
            x8.i iVar = new x8.i((Context) tVar.j(AndroidCompositionLocals_androidKt.f14166b));
            iVar.f95306c = obj;
            kVarA = iVar.a();
        }
        Object obj2 = kVarA.f95327b;
        if (obj2 instanceof x8.i) {
            throw new IllegalArgumentException("Unsupported type: ImageRequest.Builder. Did you forget to call ImageRequest.Builder.build()?");
        }
        if (obj2 instanceof c0) {
            e("ImageBitmap");
            throw null;
        }
        if (obj2 instanceof o2.g) {
            e("ImageVector");
            throw null;
        }
        if (obj2 instanceof n2.c) {
            e("Painter");
            throw null;
        }
        if (kVarA.f95328c != null) {
            throw new IllegalArgumentException("request.target must be null.");
        }
        tVar.c0(-492369756);
        Object objP = tVar.P();
        if (objP == p1.n.f81514a) {
            objP = new l(kVarA, kVar);
            tVar.m0(objP);
        }
        tVar.p(false);
        l lVar2 = (l) objP;
        lVar2.f77996l = bVar;
        lVar2.f77997m = lVar;
        lVar2.n = 1;
        lVar2.o = ((Boolean) tVar.j(p2.f19399a)).booleanValue();
        ((s2) lVar2.f78000r).setValue(kVar);
        ((s2) lVar2.f77999q).setValue(kVarA);
        lVar2.a();
        tVar.p(false);
        return lVar2;
    }

    public static void e(String str) {
        throw new IllegalArgumentException(b.c0.m("Unsupported type: ", str, ". ", b.c0.l("If you wish to display this ", str, ", use androidx.compose.foundation.Image.")));
    }
}
