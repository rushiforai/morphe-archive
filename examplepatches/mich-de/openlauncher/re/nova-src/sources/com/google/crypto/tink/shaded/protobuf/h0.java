package com.google.crypto.tink.shaded.protobuf;

/* loaded from: classes.dex */
public final class h0 implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public m0[] f34606a;

    @Override // com.google.crypto.tink.shaded.protobuf.m0
    public final w0 a(Class cls) {
        for (m0 m0Var : this.f34606a) {
            if (m0Var.b(cls)) {
                return m0Var.a(cls);
            }
        }
        throw new UnsupportedOperationException("No factory is available for message type: ".concat(cls.getName()));
    }

    @Override // com.google.crypto.tink.shaded.protobuf.m0
    public final boolean b(Class cls) {
        for (m0 m0Var : this.f34606a) {
            if (m0Var.b(cls)) {
                return true;
            }
        }
        return false;
    }
}
