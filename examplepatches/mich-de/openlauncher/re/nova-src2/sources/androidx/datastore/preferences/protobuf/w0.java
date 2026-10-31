package androidx.datastore.preferences.protobuf;

import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public final class w0 {

    /* renamed from: c, reason: collision with root package name */
    public static final w0 f14415c = new w0();

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f14417b = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final j0 f14416a = new j0();

    public final z0 a(Class cls) {
        z0 z0VarW;
        Class cls2;
        b0.a(cls, "messageType");
        ConcurrentHashMap concurrentHashMap = this.f14417b;
        z0 z0Var = (z0) concurrentHashMap.get(cls);
        if (z0Var != null) {
            return z0Var;
        }
        j0 j0Var = this.f14416a;
        j0Var.getClass();
        Class cls3 = a1.f14274a;
        if (!y.class.isAssignableFrom(cls) && (cls2 = a1.f14274a) != null && !cls2.isAssignableFrom(cls)) {
            throw new IllegalArgumentException("Message classes must extend GeneratedMessage or GeneratedMessageLite");
        }
        y0 y0VarA = ((i0) j0Var.f14337a).a(cls);
        int i5 = y0VarA.f14435d;
        a aVar = y0VarA.f14432a;
        if ((i5 & 2) == 2) {
            if (y.class.isAssignableFrom(cls)) {
                z0VarW = r0.j(a1.f14276c, r.f14389a, aVar);
            } else {
                f1 f1Var = a1.f14275b;
                q qVar = r.f14390b;
                if (qVar == null) {
                    throw new IllegalStateException("Protobuf runtime is not correctly loaded.");
                }
                z0VarW = r0.j(f1Var, qVar, aVar);
            }
        } else if (y.class.isAssignableFrom(cls)) {
            q qVar2 = null;
            s0 s0Var = t0.f14404b;
            f0 f0VarB = g0.b();
            h1 h1Var = a1.f14276c;
            if (b.c0.F(y0VarA.a()) != 1) {
                qVar2 = r.f14389a;
            }
            q qVar3 = qVar2;
            m0 m0Var = n0.f14362b;
            if (!(y0VarA instanceof y0)) {
                int[] iArr = q0.n;
                y0VarA.getClass();
                throw new ClassCastException();
            }
            z0VarW = q0.w(y0VarA, s0Var, f0VarB, h1Var, qVar3, m0Var);
        } else {
            q qVar4 = null;
            s0 s0Var2 = t0.f14403a;
            e0 e0VarA = g0.a();
            f1 f1Var2 = a1.f14275b;
            if (b.c0.F(y0VarA.a()) != 1 && (qVar4 = r.f14390b) == null) {
                throw new IllegalStateException("Protobuf runtime is not correctly loaded.");
            }
            q qVar5 = qVar4;
            m0 m0Var2 = n0.f14361a;
            if (!(y0VarA instanceof y0)) {
                int[] iArr2 = q0.n;
                y0VarA.getClass();
                throw new ClassCastException();
            }
            z0VarW = q0.w(y0VarA, s0Var2, e0VarA, f1Var2, qVar5, m0Var2);
        }
        z0 z0Var2 = (z0) concurrentHashMap.putIfAbsent(cls, z0VarW);
        return z0Var2 != null ? z0Var2 : z0VarW;
    }
}
