package com.google.protobuf;

/* loaded from: classes.dex */
public final class g1 implements m1 {

    /* renamed from: a, reason: collision with root package name */
    public m1[] f34860a;

    @Override // com.google.protobuf.m1
    public final z1 a(Class cls) {
        for (m1 m1Var : this.f34860a) {
            if (m1Var.b(cls)) {
                return m1Var.a(cls);
            }
        }
        throw new UnsupportedOperationException("No factory is available for message type: ".concat(cls.getName()));
    }

    @Override // com.google.protobuf.m1
    public final boolean b(Class cls) {
        for (m1 m1Var : this.f34860a) {
            if (m1Var.b(cls)) {
                return true;
            }
        }
        return false;
    }
}
