package com.google.crypto.tink.shaded.protobuf;

import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public final class u0 {

    /* renamed from: c, reason: collision with root package name */
    public static final u0 f34670c = new u0();

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f34672b = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final i0 f34671a = new i0();

    public final x0 a(Class cls) {
        b0.a(cls, "messageType");
        ConcurrentHashMap concurrentHashMap = this.f34672b;
        x0 x0VarZ = (x0) concurrentHashMap.get(cls);
        if (x0VarZ == null) {
            i0 i0Var = this.f34671a;
            i0Var.getClass();
            y0.l(cls);
            w0 w0VarA = i0Var.f34612a.a(cls);
            if (w0VarA.c()) {
                x0VarZ = x.class.isAssignableFrom(cls) ? q0.k(y0.o(), r.f34657a, w0VarA.a()) : q0.k(y0.n(), r.a(), w0VarA.a());
            } else if (x.class.isAssignableFrom(cls)) {
                r0 r0VarB = s0.b();
                e0 e0VarB = f0.b();
                q qVar = null;
                b1 b1VarO = y0.o();
                if (b.c0.F(w0VarA.b()) != 1) {
                    qVar = r.f34657a;
                }
                x0VarZ = p0.z(w0VarA, r0VarB, e0VarB, b1VarO, qVar, l0.b());
            } else {
                q qVarA = null;
                r0 r0VarA = s0.a();
                e0 e0VarA = f0.a();
                z0 z0VarN = y0.n();
                if (b.c0.F(w0VarA.b()) != 1) {
                    qVarA = r.a();
                }
                x0VarZ = p0.z(w0VarA, r0VarA, e0VarA, z0VarN, qVarA, l0.a());
            }
            x0 x0Var = (x0) concurrentHashMap.putIfAbsent(cls, x0VarZ);
            if (x0Var != null) {
                return x0Var;
            }
        }
        return x0VarZ;
    }
}
