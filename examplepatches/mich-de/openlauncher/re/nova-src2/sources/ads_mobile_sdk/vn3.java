package ads_mobile_sdk;

import b.c0;
import b.k9;

/* loaded from: classes2.dex */
public abstract class vn3 {

    /* renamed from: a, reason: collision with root package name */
    public static final k9 f10832a;

    /* renamed from: b, reason: collision with root package name */
    public static final boolean f10833b;

    static {
        boolean z11;
        k9 k9Var = qe.b() ? new k9(0) : System.getenv("PROTOBUF_FORCE_MOBILE_UTF8_PROCESSOR_FOR_TESTING") != null ? new k9(0) : tn3.f10018a != null ? new tn3(1) : new k9(1);
        f10832a = k9Var;
        switch (k9Var.f15911b) {
            case 0:
                z11 = false;
                break;
            default:
                z11 = true;
                break;
        }
        f10833b = z11;
    }

    public static int a(String str, int i5) throws un3 {
        int length = str.length();
        int i11 = 0;
        while (i5 < length) {
            char cCharAt = str.charAt(i5);
            if (cCharAt < 2048) {
                i11 += (127 - cCharAt) >>> 31;
            } else {
                i11 += 2;
                if (55296 <= cCharAt && cCharAt <= 57343) {
                    if (Character.codePointAt(str, i5) < 65536) {
                        throw new un3(c0.g(i5, length, "Unpaired surrogate at index ", " of "));
                    }
                    i5++;
                }
            }
            i5++;
        }
        return i11;
    }

    public static boolean b(byte[] bArr, int i5, int i11) {
        while (i5 < i11 && bArr[i5] >= 0) {
            i5++;
        }
        if (i5 >= i11) {
            return true;
        }
        while (i5 < i11) {
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                i5 = i12;
            } else if (b11 < -32) {
                if (i12 >= i11 || b11 < -62) {
                    return false;
                }
                i5 += 2;
                if (bArr[i12] > -65) {
                    return false;
                }
            } else if (b11 < -16) {
                if (i12 >= i11 - 1) {
                    return false;
                }
                int i13 = i5 + 2;
                byte b12 = bArr[i12];
                if (b12 > -65) {
                    return false;
                }
                if (b11 == -32 && b12 < -96) {
                    return false;
                }
                if (b11 == -19 && b12 >= -96) {
                    return false;
                }
                i5 += 3;
                if (bArr[i13] > -65) {
                    return false;
                }
            } else {
                if (i12 >= i11 - 2) {
                    return false;
                }
                int i14 = i5 + 2;
                byte b13 = bArr[i12];
                if (b13 > -65) {
                    return false;
                }
                if ((((b13 + 112) + (b11 << 28)) >> 30) != 0) {
                    return false;
                }
                int i15 = i5 + 3;
                if (bArr[i14] > -65) {
                    return false;
                }
                i5 += 4;
                if (bArr[i15] > -65) {
                    return false;
                }
            }
        }
        return true;
    }

    public static boolean a(int i5, int i11, byte[] bArr) {
        return b(bArr, i5, i11);
    }
}
