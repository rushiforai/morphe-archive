package com.google.protobuf;

/* loaded from: classes.dex */
public abstract class f2 {
    public abstract g2 a(Object obj);

    public final boolean b(Object obj, a2 a2Var, int i5) throws InvalidProtocolBufferException {
        q qVar = (q) a2Var;
        int iC = qVar.c();
        int i11 = iC >>> 3;
        int i12 = iC & 7;
        if (i12 == 0) {
            ((g2) obj).f(i11 << 3, Long.valueOf(qVar.A()));
            return true;
        }
        if (i12 == 1) {
            ((g2) obj).f((i11 << 3) | 1, Long.valueOf(qVar.s()));
            return true;
        }
        if (i12 == 2) {
            ((g2) obj).f((i11 << 3) | 2, qVar.j());
            return true;
        }
        if (i12 != 3) {
            if (i12 == 4) {
                return false;
            }
            if (i12 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            ((g2) obj).f(5 | (i11 << 3), Integer.valueOf(qVar.q()));
            return true;
        }
        g2 g2Var = new g2();
        int i13 = i11 << 3;
        int i14 = i13 | 4;
        int i15 = i5 + 1;
        if (i15 >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        while (qVar.b() != Integer.MAX_VALUE && b(g2Var, qVar, i15)) {
        }
        if (i14 != qVar.c()) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
        if (g2Var.f34866e) {
            g2Var.f34866e = false;
        }
        ((g2) obj).f(i13 | 3, g2Var);
        return true;
    }

    public abstract void c(Object obj, Object obj2);
}
