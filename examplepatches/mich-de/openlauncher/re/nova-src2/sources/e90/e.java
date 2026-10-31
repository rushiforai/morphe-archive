package e90;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final m90.j f52313a;

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f52314b;

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f52315c;

    /* renamed from: d, reason: collision with root package name */
    public static final String[] f52316d;

    static {
        m90.j jVar = m90.j.f76130d;
        f52313a = lm.e.n("PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n");
        f52314b = new String[]{"DATA", "HEADERS", "PRIORITY", "RST_STREAM", "SETTINGS", "PUSH_PROMISE", "PING", "GOAWAY", "WINDOW_UPDATE", "CONTINUATION"};
        f52315c = new String[64];
        String[] strArr = new String[256];
        for (int i5 = 0; i5 < 256; i5++) {
            String binaryString = Integer.toBinaryString(i5);
            Intrinsics.f(binaryString, "toBinaryString(it)");
            strArr[i5] = r70.j.E0(y80.c.g("%8s", binaryString), ' ', '0');
        }
        f52316d = strArr;
        String[] strArr2 = f52315c;
        strArr2[0] = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        strArr2[1] = "END_STREAM";
        int[] iArr = {1};
        strArr2[8] = "PADDED";
        int i11 = iArr[0];
        strArr2[i11 | 8] = b.c0.q(new StringBuilder(), strArr2[i11], "|PADDED");
        strArr2[4] = "END_HEADERS";
        strArr2[32] = "PRIORITY";
        strArr2[36] = "END_HEADERS|PRIORITY";
        int[] iArr2 = {4, 32, 36};
        for (int i12 = 0; i12 < 3; i12++) {
            int i13 = iArr2[i12];
            int i14 = iArr[0];
            String[] strArr3 = f52315c;
            int i15 = i14 | i13;
            strArr3[i15] = strArr3[i14] + '|' + strArr3[i13];
            StringBuilder sb2 = new StringBuilder();
            sb2.append(strArr3[i14]);
            sb2.append('|');
            strArr3[i15 | 8] = b.c0.q(sb2, strArr3[i13], "|PADDED");
        }
        int length = f52315c.length;
        for (int i16 = 0; i16 < length; i16++) {
            String[] strArr4 = f52315c;
            if (strArr4[i16] == null) {
                strArr4[i16] = f52316d[i16];
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String a(int i5, int i11, int i12, int i13, boolean z11) {
        String strF0;
        String str;
        String[] strArr = f52314b;
        String strG = i12 < strArr.length ? strArr[i12] : y80.c.g("0x%02x", Integer.valueOf(i12));
        if (i13 == 0) {
            strF0 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            String[] strArr2 = f52316d;
            if (i12 == 2 || i12 == 3) {
                strF0 = strArr2[i13];
            } else if (i12 == 4 || i12 == 6) {
                strF0 = i13 == 1 ? "ACK" : strArr2[i13];
            } else if (i12 != 7 && i12 != 8) {
                String[] strArr3 = f52315c;
                if (i13 < strArr3.length) {
                    str = strArr3[i13];
                    Intrinsics.d(str);
                } else {
                    str = strArr2[i13];
                }
                strF0 = (i12 != 5 || (i13 & 4) == 0) ? (i12 != 0 || (i13 & 32) == 0) ? str : r70.j.F0(str, "PRIORITY", "COMPRESSED", false) : r70.j.F0(str, "HEADERS", "PUSH_PROMISE", false);
            }
        }
        return y80.c.g("%s 0x%08x %5d %-13s %s", z11 ? "<<" : ">>", Integer.valueOf(i5), Integer.valueOf(i11), strG, strF0);
    }
}
