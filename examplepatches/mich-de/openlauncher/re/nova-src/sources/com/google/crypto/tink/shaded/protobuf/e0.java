package com.google.crypto.tink.shaded.protobuf;

/* loaded from: classes3.dex */
public final class e0 {
    public static a0 a(long j11, Object obj) {
        a0 a0Var = (a0) g1.f34601c.i(j11, obj);
        if (((b) a0Var).f34574a) {
            return a0Var;
        }
        int size = a0Var.size();
        a0 a0VarM = a0Var.m(size == 0 ? 10 : size * 2);
        g1.p(j11, obj, a0VarM);
        return a0VarM;
    }
}
