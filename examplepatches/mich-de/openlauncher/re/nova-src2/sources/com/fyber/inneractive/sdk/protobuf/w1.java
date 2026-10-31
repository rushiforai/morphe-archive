package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes.dex */
public final class w1 implements b2 {

    /* renamed from: a, reason: collision with root package name */
    public final b2[] f30937a;

    public w1(b2... b2VarArr) {
        this.f30937a = b2VarArr;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b2
    public final boolean a(Class cls) {
        for (b2 b2Var : this.f30937a) {
            if (b2Var.a(cls)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b2
    public final r2 b(Class cls) {
        for (b2 b2Var : this.f30937a) {
            if (b2Var.a(cls)) {
                return b2Var.b(cls);
            }
        }
        throw new UnsupportedOperationException("No factory is available for message type: ".concat(cls.getName()));
    }
}
