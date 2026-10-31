package b0;

import c0.h2;
import c0.i2;
import java.util.LinkedHashMap;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class z0 {

    /* renamed from: a, reason: collision with root package name */
    public static final i2 f16286a = new i2(t0.f16240k, t0.f16241l);

    /* renamed from: b, reason: collision with root package name */
    public static final c0.l1 f16287b = c0.f.h(0.0f, 400.0f, null, 5);

    /* renamed from: c, reason: collision with root package name */
    public static final c0.l1 f16288c;

    /* renamed from: d, reason: collision with root package name */
    public static final c0.l1 f16289d;

    static {
        long j11 = 1;
        long j12 = (j11 & 4294967295L) | (j11 << 32);
        f16288c = c0.f.h(0.0f, 400.0f, new y3.k(j12), 1);
        f16289d = c0.f.h(0.0f, 400.0f, new y3.m(j12), 1);
    }

    public static f1 a(h2 h2Var, int i5) {
        c0.c0 c0VarH = h2Var;
        if ((i5 & 1) != 0) {
            long j11 = 1;
            c0VarH = c0.f.h(0.0f, 400.0f, new y3.m((j11 & 4294967295L) | (j11 << 32)), 1);
        }
        int i11 = i5 & 2;
        b2.i iVar = b2.d.o;
        b2.i iVar2 = b2.d.f17009m;
        b2.i iVar3 = i11 != 0 ? iVar : iVar2;
        return b(Intrinsics.b(iVar3, iVar2) ? b2.d.f17000d : Intrinsics.b(iVar3, iVar) ? b2.d.f17002f : b2.d.f17001e, c0VarH, new c(14));
    }

    public static final f1 b(b2.f fVar, c0.c0 c0Var, Function1 function1) {
        return new f1(new v1((h1) null, (t1) null, new j0(fVar, c0Var, function1), (m1) null, (LinkedHashMap) null, 59));
    }

    public static f1 c(h2 h2Var, Function1 function1, int i5) {
        c0.c0 c0VarH = h2Var;
        if ((i5 & 1) != 0) {
            long j11 = 1;
            c0VarH = c0.f.h(0.0f, 400.0f, new y3.m((j11 & 4294967295L) | (j11 << 32)), 1);
        }
        int i11 = i5 & 2;
        b2.j jVar = b2.d.f17008l;
        b2.j jVar2 = b2.d.f17006j;
        b2.j jVar3 = i11 != 0 ? jVar : jVar2;
        if ((i5 & 8) != 0) {
            function1 = c.f16069u;
        }
        return b(Intrinsics.b(jVar3, jVar2) ? b2.d.f16998b : Intrinsics.b(jVar3, jVar) ? b2.d.f17004h : b2.d.f17001e, c0VarH, new y0(function1, 0));
    }

    public static f1 d(h2 h2Var, int i5) {
        c0.c0 c0VarH = h2Var;
        if ((i5 & 1) != 0) {
            c0VarH = c0.f.h(0.0f, 400.0f, null, 5);
        }
        return new f1(new v1(new h1(c0VarH), (t1) null, (j0) null, (m1) null, (LinkedHashMap) null, 62));
    }

    public static g1 e(h2 h2Var, int i5) {
        c0.c0 c0VarH = h2Var;
        if ((i5 & 1) != 0) {
            c0VarH = c0.f.h(0.0f, 400.0f, null, 5);
        }
        return new g1(new v1(new h1(c0VarH), (t1) null, (j0) null, (m1) null, (LinkedHashMap) null, 62));
    }

    public static f1 f(h2 h2Var, float f11, int i5) {
        c0.c0 c0VarH = h2Var;
        if ((i5 & 1) != 0) {
            c0VarH = c0.f.h(0.0f, 400.0f, null, 5);
        }
        if ((i5 & 2) != 0) {
            f11 = 0.0f;
        }
        return new f1(new v1((h1) null, (t1) null, (j0) null, new m1(f11, i2.y0.f61191b, c0VarH), (LinkedHashMap) null, 55));
    }

    public static g1 g() {
        return new g1(new v1((h1) null, (t1) null, (j0) null, new m1(0.0f, i2.y0.f61191b, c0.f.h(0.0f, 400.0f, null, 5)), (LinkedHashMap) null, 55));
    }

    public static g1 h(h2 h2Var, int i5) {
        c0.c0 c0VarH = h2Var;
        if ((i5 & 1) != 0) {
            long j11 = 1;
            c0VarH = c0.f.h(0.0f, 400.0f, new y3.m((j11 & 4294967295L) | (j11 << 32)), 1);
        }
        int i11 = i5 & 2;
        b2.i iVar = b2.d.o;
        b2.i iVar2 = b2.d.f17009m;
        b2.i iVar3 = i11 != 0 ? iVar : iVar2;
        return i(Intrinsics.b(iVar3, iVar2) ? b2.d.f17000d : Intrinsics.b(iVar3, iVar) ? b2.d.f17002f : b2.d.f17001e, c0VarH, new c(15));
    }

    public static final g1 i(b2.f fVar, c0.c0 c0Var, Function1 function1) {
        return new g1(new v1((h1) null, (t1) null, new j0(fVar, c0Var, function1), (m1) null, (LinkedHashMap) null, 59));
    }

    public static g1 j(h2 h2Var, int i5) {
        c0.c0 c0VarH = h2Var;
        if ((i5 & 1) != 0) {
            long j11 = 1;
            c0VarH = c0.f.h(0.0f, 400.0f, new y3.m((j11 & 4294967295L) | (j11 << 32)), 1);
        }
        int i11 = i5 & 2;
        b2.j jVar = b2.d.f17008l;
        b2.j jVar2 = b2.d.f17006j;
        b2.j jVar3 = i11 != 0 ? jVar : jVar2;
        return i(Intrinsics.b(jVar3, jVar2) ? b2.d.f16998b : Intrinsics.b(jVar3, jVar) ? b2.d.f17004h : b2.d.f17001e, c0VarH, new c(16));
    }

    public static f1 k(h2 h2Var) {
        return new f1(new v1((h1) null, new t1(h2Var, new y0(c.f16071w, 2)), (j0) null, (m1) null, (LinkedHashMap) null, 61));
    }

    public static final g1 l(c0.c0 c0Var, Function1 function1) {
        return new g1(new v1((h1) null, new t1(c0Var, new y0(function1, 3)), (j0) null, (m1) null, (LinkedHashMap) null, 61));
    }
}
