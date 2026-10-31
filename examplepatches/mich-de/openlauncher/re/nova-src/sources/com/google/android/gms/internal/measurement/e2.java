package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class e2 {

    /* renamed from: a, reason: collision with root package name */
    public final mg.l f32490a;

    public e2(g3 g3Var, g3 g3Var2, Object obj) {
        this.f32490a = new mg.l(14, g3Var, g3Var2, obj);
    }

    public static void a(c1 c1Var, mg.l lVar, Object obj, Object obj2) {
        g1.b(c1Var, (g3) lVar.f76309b, 1, obj);
        g1.b(c1Var, (g3) lVar.f76310c, 2, obj2);
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0178  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0184  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x019e  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x01ab  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01b4  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01dc  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01e2  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x01ee  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01f9  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0204  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x020b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int b(mg.l lVar, Object obj, Object obj2) throws e3 {
        int iQ;
        int iB;
        int iP;
        int iB2;
        int iP2;
        g3 g3Var = (g3) lVar.f76309b;
        g3 g3Var2 = (g3) lVar.f76310c;
        int i5 = g1.f32551c;
        int iQ2 = 8;
        int iP3 = c1.p(8);
        g3 g3Var3 = g3.f32556d;
        if (g3Var == g3Var3) {
            iP3 += iP3;
        }
        h3 h3Var = h3.f32592a;
        switch (g3Var.ordinal()) {
            case 0:
                ((Double) obj).getClass();
                iQ = 8;
                int i11 = iQ + iP3;
                int iP4 = c1.p(16);
                if (g3Var2 == g3Var3) {
                    iP4 += iP4;
                }
                switch (g3Var2.ordinal()) {
                    case 0:
                        ((Double) obj2).getClass();
                        return iQ2 + iP4 + i11;
                    case 1:
                        ((Float) obj2).getClass();
                        iQ2 = 4;
                        return iQ2 + iP4 + i11;
                    case 2:
                        iQ2 = c1.q(((Long) obj2).longValue());
                        return iQ2 + iP4 + i11;
                    case 3:
                        iQ2 = c1.q(((Long) obj2).longValue());
                        return iQ2 + iP4 + i11;
                    case 4:
                        iQ2 = c1.q(((Integer) obj2).intValue());
                        return iQ2 + iP4 + i11;
                    case 5:
                        ((Long) obj2).getClass();
                        return iQ2 + iP4 + i11;
                    case 6:
                        ((Integer) obj2).getClass();
                        iQ2 = 4;
                        return iQ2 + iP4 + i11;
                    case 7:
                        ((Boolean) obj2).getClass();
                        iQ2 = 1;
                        return iQ2 + iP4 + i11;
                    case 8:
                        if (obj2 instanceof v0) {
                            iB2 = ((v0) obj2).d();
                            iP2 = c1.p(iB2);
                        } else {
                            iB2 = f3.b((String) obj2);
                            iP2 = c1.p(iB2);
                        }
                        iQ2 = iP2 + iB2;
                        return iQ2 + iP4 + i11;
                    case 9:
                        iQ2 = ((o1) ((n0) obj2)).n();
                        return iQ2 + iP4 + i11;
                    case 10:
                        iB2 = ((o1) ((n0) obj2)).n();
                        iP2 = c1.p(iB2);
                        iQ2 = iP2 + iB2;
                        return iQ2 + iP4 + i11;
                    case 11:
                        if (obj2 instanceof v0) {
                            iB2 = ((v0) obj2).d();
                            iP2 = c1.p(iB2);
                        } else {
                            iB2 = ((byte[]) obj2).length;
                            iP2 = c1.p(iB2);
                        }
                        iQ2 = iP2 + iB2;
                        return iQ2 + iP4 + i11;
                    case 12:
                        iQ2 = c1.p(((Integer) obj2).intValue());
                        return iQ2 + iP4 + i11;
                    case 13:
                        iQ2 = obj2 instanceof q1 ? c1.q(((q1) obj2).zza()) : c1.q(((Integer) obj2).intValue());
                        return iQ2 + iP4 + i11;
                    case 14:
                        ((Integer) obj2).getClass();
                        iQ2 = 4;
                        return iQ2 + iP4 + i11;
                    case 15:
                        ((Long) obj2).getClass();
                        return iQ2 + iP4 + i11;
                    case 16:
                        int iIntValue = ((Integer) obj2).intValue();
                        iQ2 = c1.p((iIntValue >> 31) ^ (iIntValue + iIntValue));
                        return iQ2 + iP4 + i11;
                    case 17:
                        long jLongValue = ((Long) obj2).longValue();
                        iQ2 = c1.q((jLongValue >> 63) ^ (jLongValue + jLongValue));
                        return iQ2 + iP4 + i11;
                    default:
                        throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                }
            case 1:
                ((Float) obj).getClass();
                iQ = 4;
                int i112 = iQ + iP3;
                int iP42 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 2:
                iQ = c1.q(((Long) obj).longValue());
                int i1122 = iQ + iP3;
                int iP422 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 3:
                iQ = c1.q(((Long) obj).longValue());
                int i11222 = iQ + iP3;
                int iP4222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 4:
                iQ = c1.q(((Integer) obj).intValue());
                int i112222 = iQ + iP3;
                int iP42222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 5:
                ((Long) obj).getClass();
                iQ = 8;
                int i1122222 = iQ + iP3;
                int iP422222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 6:
                ((Integer) obj).getClass();
                iQ = 4;
                int i11222222 = iQ + iP3;
                int iP4222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 7:
                ((Boolean) obj).getClass();
                iQ = 1;
                int i112222222 = iQ + iP3;
                int iP42222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 8:
                if (obj instanceof v0) {
                    iB = ((v0) obj).d();
                    iP = c1.p(iB);
                } else {
                    iB = f3.b((String) obj);
                    iP = c1.p(iB);
                }
                iQ = iB + iP;
                int i1122222222 = iQ + iP3;
                int iP422222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 9:
                iQ = ((o1) ((n0) obj)).n();
                int i11222222222 = iQ + iP3;
                int iP4222222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 10:
                iB = ((o1) ((n0) obj)).n();
                iP = c1.p(iB);
                iQ = iB + iP;
                int i112222222222 = iQ + iP3;
                int iP42222222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 11:
                if (obj instanceof v0) {
                    iB = ((v0) obj).d();
                    iP = c1.p(iB);
                } else {
                    iB = ((byte[]) obj).length;
                    iP = c1.p(iB);
                }
                iQ = iB + iP;
                int i1122222222222 = iQ + iP3;
                int iP422222222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 12:
                iQ = c1.p(((Integer) obj).intValue());
                int i11222222222222 = iQ + iP3;
                int iP4222222222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 13:
                iQ = obj instanceof q1 ? c1.q(((q1) obj).zza()) : c1.q(((Integer) obj).intValue());
                int i112222222222222 = iQ + iP3;
                int iP42222222222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 14:
                ((Integer) obj).getClass();
                iQ = 4;
                int i1122222222222222 = iQ + iP3;
                int iP422222222222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 15:
                ((Long) obj).getClass();
                iQ = 8;
                int i11222222222222222 = iQ + iP3;
                int iP4222222222222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 16:
                int iIntValue2 = ((Integer) obj).intValue();
                iQ = c1.p((iIntValue2 >> 31) ^ (iIntValue2 + iIntValue2));
                int i112222222222222222 = iQ + iP3;
                int iP42222222222222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            case 17:
                long jLongValue2 = ((Long) obj).longValue();
                iQ = c1.q((jLongValue2 >> 63) ^ (jLongValue2 + jLongValue2));
                int i1122222222222222222 = iQ + iP3;
                int iP422222222222222222 = c1.p(16);
                if (g3Var2 == g3Var3) {
                }
                switch (g3Var2.ordinal()) {
                }
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
    }

    public final mg.l c() {
        return this.f32490a;
    }
}
