package defpackage;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class is5 {
    public static final h21 a;
    public static final String[] b;
    public static final String[] c;
    public static final String[] d;

    public static String a(int i) {
        String[] strArr = b;
        return i < strArr.length ? strArr[i] : ggf.d("0x%02x", Integer.valueOf(i));
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0055  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String b(boolean r9, int r10, int r11, int r12, int r13) {
        /*
            java.lang.String r0 = a(r12)
            r1 = 1
            r2 = 5
            r3 = 3
            r4 = 2
            r5 = 4
            if (r13 != 0) goto Le
            java.lang.String r12 = ""
            goto L57
        Le:
            java.lang.String[] r6 = defpackage.is5.d
            if (r12 == r4) goto L55
            if (r12 == r3) goto L55
            if (r12 == r5) goto L4d
            r7 = 6
            if (r12 == r7) goto L4d
            r7 = 7
            if (r12 == r7) goto L55
            r7 = 8
            if (r12 == r7) goto L55
            java.lang.String[] r7 = defpackage.is5.c
            int r8 = r7.length
            if (r13 >= r8) goto L2b
            r6 = r7[r13]
            r6.getClass()
            goto L2d
        L2b:
            r6 = r6[r13]
        L2d:
            if (r12 != r2) goto L3c
            r7 = r13 & 4
            if (r7 == 0) goto L3c
            java.lang.String r12 = "HEADERS"
            java.lang.String r13 = "PUSH_PROMISE"
            java.lang.String r12 = defpackage.tuc.L(r6, r12, r13)
            goto L57
        L3c:
            if (r12 != 0) goto L4b
            r12 = r13 & 32
            if (r12 == 0) goto L4b
            java.lang.String r12 = "PRIORITY"
            java.lang.String r13 = "COMPRESSED"
            java.lang.String r12 = defpackage.tuc.L(r6, r12, r13)
            goto L57
        L4b:
            r12 = r6
            goto L57
        L4d:
            if (r13 != r1) goto L52
            java.lang.String r12 = "ACK"
            goto L57
        L52:
            r12 = r6[r13]
            goto L57
        L55:
            r12 = r6[r13]
        L57:
            if (r9 == 0) goto L5c
            java.lang.String r9 = "<<"
            goto L5e
        L5c:
            java.lang.String r9 = ">>"
        L5e:
            java.lang.Integer r10 = java.lang.Integer.valueOf(r10)
            java.lang.Integer r11 = java.lang.Integer.valueOf(r11)
            java.lang.Object[] r13 = new java.lang.Object[r2]
            r2 = 0
            r13[r2] = r9
            r13[r1] = r10
            r13[r4] = r11
            r13[r3] = r0
            r13[r5] = r12
            java.lang.String r9 = "%s 0x%08x %5d %-13s %s"
            java.lang.String r9 = defpackage.ggf.d(r9, r13)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.is5.b(boolean, int, int, int, int):java.lang.String");
    }

    public static String c(boolean z, int i, int i2, long j) {
        return ggf.d("%s 0x%08x %5d %-13s %d", z ? "<<" : ">>", Integer.valueOf(i), Integer.valueOf(i2), a(8), Long.valueOf(j));
    }

    static {
        h21 h21Var = h21.d;
        a = dq1.o(PqkdNGCEoxOKZk.ZlTsOTigldSc);
        b = new String[]{"DATA", "HEADERS", "PRIORITY", "RST_STREAM", "SETTINGS", "PUSH_PROMISE", "PING", "GOAWAY", "WINDOW_UPDATE", "CONTINUATION"};
        c = new String[64];
        String[] strArr = new String[256];
        for (int i = 0; i < 256; i++) {
            String binaryString = Integer.toBinaryString(i);
            binaryString.getClass();
            String strReplace = ggf.d("%8s", binaryString).replace(' ', '0');
            strReplace.getClass();
            strArr[i] = strReplace;
        }
        d = strArr;
        String[] strArr2 = c;
        strArr2[0] = "";
        strArr2[1] = "END_STREAM";
        int[] iArr = {1};
        strArr2[8] = "PADDED";
        int i2 = iArr[0];
        strArr2[i2 | 8] = ka1.v(new StringBuilder(), strArr2[i2], "|PADDED");
        strArr2[4] = "END_HEADERS";
        strArr2[32] = "PRIORITY";
        strArr2[36] = "END_HEADERS|PRIORITY";
        int[] iArr2 = {4, 32, 36};
        for (int i3 = 0; i3 < 3; i3++) {
            int i4 = iArr2[i3];
            int i5 = iArr[0];
            String[] strArr3 = c;
            int i6 = i5 | i4;
            strArr3[i6] = strArr3[i5] + '|' + strArr3[i4];
            StringBuilder sb = new StringBuilder();
            sb.append(strArr3[i5]);
            sb.append('|');
            strArr3[i6 | 8] = ka1.v(sb, strArr3[i4], "|PADDED");
        }
        int length = c.length;
        for (int i7 = 0; i7 < length; i7++) {
            String[] strArr4 = c;
            if (strArr4[i7] == null) {
                strArr4[i7] = d[i7];
            }
        }
    }
}
