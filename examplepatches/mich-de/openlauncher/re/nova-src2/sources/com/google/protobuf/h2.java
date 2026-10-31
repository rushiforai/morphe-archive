package com.google.protobuf;

/* loaded from: classes.dex */
public final class h2 extends f2 {
    @Override // com.google.protobuf.f2
    public final g2 a(Object obj) {
        n0 n0Var = (n0) obj;
        g2 g2Var = n0Var.unknownFields;
        if (g2Var != g2.f34861f) {
            return g2Var;
        }
        g2 g2Var2 = new g2();
        n0Var.unknownFields = g2Var2;
        return g2Var2;
    }

    @Override // com.google.protobuf.f2
    public final void c(Object obj, Object obj2) {
        ((n0) obj).unknownFields = (g2) obj2;
    }
}
