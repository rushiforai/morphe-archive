package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j6g {
    public final /* synthetic */ int a;
    public final char b;

    public /* synthetic */ j6g(char c, int i) {
        this.a = i;
        this.b = c;
    }

    public final String toString() {
        int i = this.a;
        int i2 = this.b;
        int i3 = 0;
        switch (i) {
            case 0:
                char[] cArr = new char[6];
                cArr[0] = '\\';
                cArr[1] = 'u';
                cArr[2] = 0;
                cArr[3] = 0;
                cArr[4] = 0;
                cArr[5] = 0;
                while (i3 < 4) {
                    cArr[5 - i3] = "0123456789ABCDEF".charAt(i2 & 15);
                    i2 = (char) (i2 >> 4);
                    i3++;
                }
                return ev6.x("CharMatcher.is('", String.copyValueOf(cArr), "')");
            default:
                char[] cArr2 = new char[6];
                cArr2[0] = '\\';
                cArr2[1] = 'u';
                cArr2[2] = 0;
                cArr2[3] = 0;
                cArr2[4] = 0;
                cArr2[5] = 0;
                while (i3 < 4) {
                    cArr2[5 - i3] = "0123456789ABCDEF".charAt(i2 & 15);
                    i2 >>= 4;
                    i3++;
                }
                String strCopyValueOf = String.copyValueOf(cArr2);
                return y30.s(new StringBuilder(String.valueOf(strCopyValueOf).length() + 18), "CharMatcher.is('", strCopyValueOf, "')");
        }
    }
}
