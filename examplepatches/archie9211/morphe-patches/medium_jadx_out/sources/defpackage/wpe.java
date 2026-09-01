package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wpe implements pj6 {
    public static final wpe a = new wpe();
    public static final u0a b = new u0a("kotlin.uuid.Uuid", r0a.m);

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        tpe tpeVar = (tpe) obj;
        tpeVar.getClass();
        xtcVar.r(tpeVar.toString());
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        String strR = kw2Var.r();
        strR.getClass();
        int length = strR.length();
        if (length == 32) {
            long jB = kj5.b(0, 16, strR);
            long jB2 = kj5.b(16, 32, strR);
            if (jB != 0 || jB2 != 0) {
                return new tpe(jB, jB2);
            }
        } else {
            if (length != 36) {
                StringBuilder sb = new StringBuilder("Expected either a 36-char string in the standard hex-and-dash UUID format or a 32-char hexadecimal string, but was \"");
                sb.append(strR.length() <= 64 ? strR : strR.substring(0, 64).concat("..."));
                sb.append("\" of length ");
                sb.append(strR.length());
                throw new IllegalArgumentException(sb.toString());
            }
            long jB3 = kj5.b(0, 8, strR);
            ek7.w(8, strR);
            long jB4 = kj5.b(9, 13, strR);
            ek7.w(13, strR);
            long jB5 = kj5.b(14, 18, strR);
            ek7.w(18, strR);
            long jB6 = kj5.b(19, 23, strR);
            ek7.w(23, strR);
            long j = (jB4 << 16) | (jB3 << 32) | jB5;
            long jB7 = kj5.b(24, 36, strR) | (jB6 << 48);
            if (j != 0 || jB7 != 0) {
                return new tpe(j, jB7);
            }
        }
        return tpe.c;
    }
}
