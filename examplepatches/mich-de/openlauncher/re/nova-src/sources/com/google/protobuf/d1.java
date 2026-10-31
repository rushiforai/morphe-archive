package com.google.protobuf;

/* loaded from: classes.dex */
public final class d1 {
    public static z0 a(long j11, Object obj) {
        z0 z0Var = (z0) m2.f34911c.j(j11, obj);
        if (((d) z0Var).f34834a) {
            return z0Var;
        }
        int size = z0Var.size();
        z0 z0VarM = z0Var.m(size == 0 ? 10 : size * 2);
        m2.n(j11, obj, z0VarM);
        return z0VarM;
    }
}
