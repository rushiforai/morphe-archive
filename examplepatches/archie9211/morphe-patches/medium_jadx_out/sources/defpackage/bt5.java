package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class bt5 {
    static {
        h21 h21Var = h21.d;
        dq1.o("\"\\");
        dq1.o("\t ,=");
    }

    public static final boolean a(adb adbVar) {
        if (g76.L(adbVar.a.b, "HEAD")) {
            return false;
        }
        int i = adbVar.d;
        if (((i < 100 || i >= 200) && i != 204 && i != 304) || ggf.e(adbVar) != -1) {
            return true;
        }
        String strD = adbVar.f.d("Transfer-Encoding");
        if (strD == null) {
            strD = null;
        }
        return "chunked".equalsIgnoreCase(strD);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01a8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(defpackage.ba2 r36, defpackage.qt5 r37, defpackage.yi5 r38) {
        /*
            Method dump skipped, instruction units count: 543
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bt5.b(ba2, qt5, yi5):void");
    }
}
