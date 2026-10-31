package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes.dex */
public final class o3 {
    public static void a(Object obj, Object obj2) {
        ((z0) obj).unknownFields = (n3) obj2;
    }

    public static boolean a(Object obj, s2 s2Var) throws n1 {
        int iE = s2Var.e();
        int i5 = iE >>> 3;
        int i11 = iE & 7;
        if (i11 == 0) {
            ((n3) obj).a(i5 << 3, Long.valueOf(s2Var.o()));
            return true;
        }
        if (i11 == 1) {
            ((n3) obj).a((i5 << 3) | 1, Long.valueOf(s2Var.g()));
            return true;
        }
        if (i11 == 2) {
            ((n3) obj).a((i5 << 3) | 2, s2Var.a());
            return true;
        }
        if (i11 != 3) {
            if (i11 == 4) {
                return false;
            }
            if (i11 == 5) {
                ((n3) obj).a((i5 << 3) | 5, Integer.valueOf(s2Var.q()));
                return true;
            }
            int i12 = n1.f30859a;
            throw new m1();
        }
        n3 n3Var = new n3();
        int i13 = i5 << 3;
        int i14 = i13 | 4;
        while (s2Var.s() != Integer.MAX_VALUE && a((Object) n3Var, s2Var)) {
        }
        if (i14 == s2Var.e()) {
            n3Var.f30865e = false;
            ((n3) obj).a(i13 | 3, n3Var);
            return true;
        }
        throw new n1("Protocol message end-group tag did not match expected tag.");
    }
}
