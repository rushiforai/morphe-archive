package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes.dex */
public final class z1 {
    public static y1 a(Object obj, Object obj2) {
        y1 y1Var = (y1) obj;
        y1 y1Var2 = (y1) obj2;
        if (y1Var2.isEmpty()) {
            return y1Var;
        }
        if (!y1Var.f30965a) {
            y1Var = y1Var.isEmpty() ? new y1() : new y1(y1Var);
        }
        if (!y1Var.f30965a) {
            throw new UnsupportedOperationException();
        }
        if (!y1Var2.isEmpty()) {
            y1Var.putAll(y1Var2);
        }
        return y1Var;
    }
}
