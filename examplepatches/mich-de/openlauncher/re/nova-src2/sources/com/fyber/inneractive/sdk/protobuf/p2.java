package com.fyber.inneractive.sdk.protobuf;

import java.nio.charset.Charset;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public final class p2 {

    /* renamed from: c, reason: collision with root package name */
    public static final p2 f30870c = new p2();

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f30872b = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final x1 f30871a = new x1();

    public final t2 a(Class cls) {
        t2 t2VarA;
        Class cls2;
        Charset charset = l1.f30847a;
        if (cls == null) {
            throw new NullPointerException("messageType");
        }
        t2 t2Var = (t2) this.f30872b.get(cls);
        if (t2Var != null) {
            return t2Var;
        }
        x1 x1Var = this.f30871a;
        x1Var.getClass();
        Class cls3 = u2.f30916a;
        if (!z0.class.isAssignableFrom(cls) && (cls2 = u2.f30916a) != null && !cls2.isAssignableFrom(cls)) {
            throw new IllegalArgumentException("Message classes must extend GeneratedMessage or GeneratedMessageLite");
        }
        r2 r2VarB = x1Var.f30951a.b(cls);
        if ((r2VarB.f30887d & 2) == 2) {
            if (z0.class.isAssignableFrom(cls)) {
                t2VarA = new j2(u2.f30919d, k0.f30841a, r2VarB.f30884a);
            } else {
                o3 o3Var = u2.f30917b;
                j0 j0Var = k0.f30842b;
                if (j0Var == null) {
                    throw new IllegalStateException("Protobuf runtime is not correctly loaded.");
                }
                t2VarA = new j2(o3Var, j0Var, r2VarB.f30884a);
            }
        } else if (z0.class.isAssignableFrom(cls)) {
            t2VarA = ((r2VarB.f30887d & 1) == 1 ? o2.PROTO2 : o2.PROTO3) == o2.PROTO2 ? i2.a(r2VarB, l2.f30850b, t1.f30904b, u2.f30919d, k0.f30841a, a2.f30765b) : i2.a(r2VarB, l2.f30850b, t1.f30904b, u2.f30919d, (j0) null, a2.f30765b);
        } else {
            if (((r2VarB.f30887d & 1) == 1 ? o2.PROTO2 : o2.PROTO3) == o2.PROTO2) {
                k2 k2Var = l2.f30849a;
                r1 r1Var = t1.f30903a;
                o3 o3Var2 = u2.f30917b;
                j0 j0Var2 = k0.f30842b;
                if (j0Var2 == null) {
                    throw new IllegalStateException("Protobuf runtime is not correctly loaded.");
                }
                t2VarA = i2.a(r2VarB, k2Var, r1Var, o3Var2, j0Var2, a2.f30764a);
            } else {
                t2VarA = i2.a(r2VarB, l2.f30849a, t1.f30903a, u2.f30918c, (j0) null, a2.f30764a);
            }
        }
        t2 t2Var2 = (t2) this.f30872b.putIfAbsent(cls, t2VarA);
        return t2Var2 != null ? t2Var2 : t2VarA;
    }
}
