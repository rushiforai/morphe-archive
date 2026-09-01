package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a22 extends sv0 {
    public final boolean e;

    public a22(ad adVar, boolean z) {
        super(1, adVar);
        this.e = z;
    }

    @Override // defpackage.sv0
    public final void c(byte b) {
        if (this.e) {
            h(String.valueOf(b & 255));
            return;
        }
        String strValueOf = String.valueOf(b & 255);
        strValueOf.getClass();
        ((ad) this.c).x(strValueOf);
    }

    @Override // defpackage.sv0
    public final void e(int i) {
        if (this.e) {
            h(Long.toString(4294967295L & ((long) i), 10));
            return;
        }
        String string = Long.toString(4294967295L & ((long) i), 10);
        string.getClass();
        ((ad) this.c).x(string);
    }

    @Override // defpackage.sv0
    public final void f(long j) {
        int i = 63;
        String str = "0";
        if (this.e) {
            if (j != 0) {
                if (j > 0) {
                    str = Long.toString(j, 10);
                } else {
                    char[] cArr = new char[64];
                    long j2 = (j >>> 1) / 5;
                    cArr[63] = Character.forDigit((int) (j - (j2 * 10)), 10);
                    while (j2 > 0) {
                        i--;
                        cArr[i] = Character.forDigit((int) (j2 % 10), 10);
                        j2 /= 10;
                    }
                    str = new String(cArr, i, 64 - i);
                }
            }
            h(str);
            return;
        }
        if (j != 0) {
            if (j > 0) {
                str = Long.toString(j, 10);
            } else {
                char[] cArr2 = new char[64];
                long j3 = (j >>> 1) / 5;
                cArr2[63] = Character.forDigit((int) (j - (j3 * 10)), 10);
                while (j3 > 0) {
                    i--;
                    cArr2[i] = Character.forDigit((int) (j3 % 10), 10);
                    j3 /= 10;
                }
                str = new String(cArr2, i, 64 - i);
            }
        }
        str.getClass();
        ((ad) this.c).x(str);
    }

    @Override // defpackage.sv0
    public final void g(short s) {
        if (this.e) {
            h(String.valueOf(s & 65535));
            return;
        }
        String strValueOf = String.valueOf(s & 65535);
        strValueOf.getClass();
        ((ad) this.c).x(strValueOf);
    }
}
