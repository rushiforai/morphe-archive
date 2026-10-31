package sn;

import b.c0;
import com.google.zxing.WriterException;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: classes3.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final int[][] f87547a = {new int[]{1, 1, 1, 1, 1, 1, 1}, new int[]{1, 0, 0, 0, 0, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 0, 0, 0, 0, 1}, new int[]{1, 1, 1, 1, 1, 1, 1}};

    /* renamed from: b, reason: collision with root package name */
    public static final int[][] f87548b = {new int[]{1, 1, 1, 1, 1}, new int[]{1, 0, 0, 0, 1}, new int[]{1, 0, 1, 0, 1}, new int[]{1, 0, 0, 0, 1}, new int[]{1, 1, 1, 1, 1}};

    /* renamed from: c, reason: collision with root package name */
    public static final int[][] f87549c = {new int[]{-1, -1, -1, -1, -1, -1, -1}, new int[]{6, 18, -1, -1, -1, -1, -1}, new int[]{6, 22, -1, -1, -1, -1, -1}, new int[]{6, 26, -1, -1, -1, -1, -1}, new int[]{6, 30, -1, -1, -1, -1, -1}, new int[]{6, 34, -1, -1, -1, -1, -1}, new int[]{6, 22, 38, -1, -1, -1, -1}, new int[]{6, 24, 42, -1, -1, -1, -1}, new int[]{6, 26, 46, -1, -1, -1, -1}, new int[]{6, 28, 50, -1, -1, -1, -1}, new int[]{6, 30, 54, -1, -1, -1, -1}, new int[]{6, 32, 58, -1, -1, -1, -1}, new int[]{6, 34, 62, -1, -1, -1, -1}, new int[]{6, 26, 46, 66, -1, -1, -1}, new int[]{6, 26, 48, 70, -1, -1, -1}, new int[]{6, 26, 50, 74, -1, -1, -1}, new int[]{6, 30, 54, 78, -1, -1, -1}, new int[]{6, 30, 56, 82, -1, -1, -1}, new int[]{6, 30, 58, 86, -1, -1, -1}, new int[]{6, 34, 62, 90, -1, -1, -1}, new int[]{6, 28, 50, 72, 94, -1, -1}, new int[]{6, 26, 50, 74, 98, -1, -1}, new int[]{6, 30, 54, 78, 102, -1, -1}, new int[]{6, 28, 54, 80, 106, -1, -1}, new int[]{6, 32, 58, 84, 110, -1, -1}, new int[]{6, 30, 58, 86, 114, -1, -1}, new int[]{6, 34, 62, 90, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, -1, -1}, new int[]{6, 26, 50, 74, 98, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, -1}, new int[]{6, 30, 54, 78, 102, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, -1}, new int[]{6, 26, 52, 78, 104, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, -1}, new int[]{6, 30, 56, 82, 108, Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, -1}, new int[]{6, 34, 60, 86, 112, Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, -1}, new int[]{6, 30, 58, 86, 114, 142, -1}, new int[]{6, 34, 62, 90, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 146, -1}, new int[]{6, 30, 54, 78, 102, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, PerAppFeatureCatalog.MAX_TOOLS}, new int[]{6, 24, 50, 76, 102, 128, 154}, new int[]{6, 28, 54, 80, 106, Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, 158}, new int[]{6, 32, 58, 84, 110, Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 162}, new int[]{6, 26, 54, 82, 110, Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 166}, new int[]{6, 30, 58, 86, 114, 142, 170}};

    /* renamed from: d, reason: collision with root package name */
    public static final int[][] f87550d = {new int[]{8, 0}, new int[]{8, 1}, new int[]{8, 2}, new int[]{8, 3}, new int[]{8, 4}, new int[]{8, 5}, new int[]{8, 7}, new int[]{8, 8}, new int[]{7, 8}, new int[]{5, 8}, new int[]{4, 8}, new int[]{3, 8}, new int[]{2, 8}, new int[]{1, 8}, new int[]{0, 8}};

    public static int a(com.google.android.gms.internal.consent_sdk.a aVar, boolean z11) {
        int i5 = aVar.f31984b;
        int i11 = aVar.f31985c;
        int i12 = z11 ? i11 : i5;
        if (!z11) {
            i5 = i11;
        }
        byte[][] bArr = (byte[][]) aVar.f31986d;
        int i13 = 0;
        for (int i14 = 0; i14 < i12; i14++) {
            byte b11 = -1;
            int i15 = 0;
            for (int i16 = 0; i16 < i5; i16++) {
                byte b12 = z11 ? bArr[i14][i16] : bArr[i16][i14];
                if (b12 == b11) {
                    i15++;
                } else {
                    if (i15 >= 5) {
                        i13 += i15 - 2;
                    }
                    i15 = 1;
                    b11 = b12;
                }
            }
            if (i15 >= 5) {
                i13 = (i15 - 2) + i13;
            }
        }
        return i13;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:118:0x023b  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x023e  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0242  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void b(on.a aVar, int i5, rn.b bVar, int i11, com.google.android.gms.internal.consent_sdk.a aVar2) throws WriterException {
        char c11;
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        int i17;
        int i18;
        int i19;
        byte[][] bArr = (byte[][]) aVar2.f31986d;
        int i21 = aVar2.f31984b;
        int i22 = aVar2.f31985c;
        for (byte[] bArr2 : bArr) {
            Arrays.fill(bArr2, (byte) -1);
        }
        int length = f87547a[0].length;
        e(0, 0, aVar2);
        int i23 = i21 - length;
        e(i23, 0, aVar2);
        e(0, i23, aVar2);
        d(0, 7, aVar2);
        int i24 = i21 - 8;
        d(i24, 7, aVar2);
        d(0, i24, aVar2);
        f(7, 0, aVar2);
        int i25 = i22 - 8;
        f(i25, 0, aVar2);
        int i26 = i22 - 7;
        f(7, i26, aVar2);
        if (aVar2.s(8, i25) == 0) {
            throw new WriterException();
        }
        aVar2.W(8, i25, 1);
        int i27 = bVar.f86124a;
        if (i27 < 2) {
            c11 = 1;
        } else {
            c11 = 1;
            int[] iArr = f87549c[i27 - 1];
            int length2 = iArr.length;
            int i28 = 0;
            while (i28 < length2) {
                int i29 = iArr[i28];
                if (i29 >= 0) {
                    int length3 = iArr.length;
                    int i31 = 0;
                    while (i31 < length3) {
                        byte[][] bArr3 = bArr;
                        int i32 = iArr[i31];
                        if (i32 >= 0 && g(aVar2.s(i32, i29))) {
                            int i33 = i32 - 2;
                            int i34 = i29 - 2;
                            i12 = i21;
                            int i35 = 0;
                            while (true) {
                                if (i35 >= 5) {
                                    break;
                                }
                                int[] iArr2 = f87548b[i35];
                                int i36 = i35;
                                int i37 = 0;
                                for (int i38 = 5; i37 < i38; i38 = 5) {
                                    int i39 = i37;
                                    aVar2.W(i33 + i37, i34 + i36, iArr2[i39]);
                                    i37 = i39 + 1;
                                    i29 = i29;
                                }
                                i35 = i36 + 1;
                            }
                        } else {
                            i12 = i21;
                        }
                        i31++;
                        bArr = bArr3;
                        i21 = i12;
                        i29 = i29;
                    }
                }
                i28++;
                bArr = bArr;
                i21 = i21;
            }
        }
        byte[][] bArr4 = bArr;
        int i40 = i21;
        int i41 = 8;
        while (i41 < i24) {
            int i42 = i41 + 1;
            int i43 = i42 % 2;
            if (g(aVar2.s(i41, 6))) {
                aVar2.W(i41, 6, i43);
            }
            if (g(aVar2.s(6, i41))) {
                aVar2.W(6, i41, i43);
            }
            i41 = i42;
        }
        on.a aVar3 = new on.a();
        if (i11 < 0 || i11 >= 8) {
            throw new WriterException("Invalid mask pattern");
        }
        int i44 = 1;
        if (i5 != 1) {
            i44 = 2;
            if (i5 == 2) {
                i44 = 0;
            } else if (i5 == 3) {
                i44 = 3;
            } else if (i5 != 4) {
                throw null;
            }
        }
        int i45 = (i44 << 3) | i11;
        aVar3.c(i45, 5);
        aVar3.c(c(i45, 1335), 10);
        on.a aVar4 = new on.a();
        aVar4.c(21522, 15);
        if (aVar3.f80533b != aVar4.f80533b) {
            throw new IllegalArgumentException("Sizes don't match");
        }
        int i46 = 0;
        while (true) {
            int[] iArr3 = aVar3.f80532a;
            if (i46 >= iArr3.length) {
                break;
            }
            iArr3[i46] = iArr3[i46] ^ aVar4.f80532a[i46];
            i46++;
        }
        if (aVar3.f80533b != 15) {
            throw new WriterException("should not happen but we got: " + aVar3.f80533b);
        }
        int i47 = 0;
        while (true) {
            int i48 = aVar3.f80533b;
            if (i47 >= i48) {
                break;
            }
            boolean zE = aVar3.e((i48 - 1) - i47);
            int[] iArr4 = f87550d[i47];
            int i49 = iArr4[0];
            byte[] bArr5 = bArr4[iArr4[c11]];
            byte b11 = zE ? (byte) 1 : (byte) 0;
            bArr5[i49] = b11;
            if (i47 < 8) {
                i19 = (i40 - i47) - 1;
                i18 = 8;
            } else {
                i18 = (i47 - 8) + i26;
                i19 = 8;
            }
            bArr4[i18][i19] = b11;
            i47++;
        }
        if (i27 >= 7) {
            on.a aVar5 = new on.a();
            aVar5.c(i27, 6);
            aVar5.c(c(i27, 7973), 12);
            if (aVar5.f80533b != 18) {
                throw new WriterException("should not happen but we got: " + aVar5.f80533b);
            }
            int i51 = 17;
            for (int i52 = 0; i52 < 6; i52++) {
                for (int i53 = 0; i53 < 3; i53++) {
                    boolean zE2 = aVar5.e(i51);
                    i51--;
                    int i54 = (i22 - 11) + i53;
                    byte[] bArr6 = bArr4[i54];
                    byte b12 = zE2 ? (byte) 1 : (byte) 0;
                    bArr6[i52] = b12;
                    bArr4[i52][i54] = b12;
                }
            }
        }
        int i55 = i40 - 1;
        int i56 = i22 - 1;
        int i57 = 0;
        int i58 = -1;
        while (i55 > 0) {
            if (i55 == 6) {
                i55--;
            }
            while (i56 >= 0 && i56 < i22) {
                for (int i59 = 0; i59 < 2; i59++) {
                    int i61 = i55 - i59;
                    if (g(aVar2.s(i61, i56))) {
                        if (i57 < aVar.f80533b) {
                            boolean zE3 = aVar.e(i57);
                            i57++;
                            i13 = zE3;
                        } else {
                            i13 = 0;
                        }
                        if (i11 != -1) {
                            switch (i11) {
                                case 0:
                                    i14 = i56 + i61;
                                    i15 = i14 & 1;
                                    if ((i15 != 0 ? c11 : (char) 0) != 0) {
                                        i13 = ~i13;
                                        break;
                                    }
                                    break;
                                case 1:
                                    i15 = i56 & 1;
                                    if ((i15 != 0 ? c11 : (char) 0) != 0) {
                                    }
                                    break;
                                case 2:
                                    i15 = i61 % 3;
                                    if ((i15 != 0 ? c11 : (char) 0) != 0) {
                                    }
                                    break;
                                case 3:
                                    i15 = (i56 + i61) % 3;
                                    if ((i15 != 0 ? c11 : (char) 0) != 0) {
                                    }
                                    break;
                                case 4:
                                    i15 = ((i61 / 3) + (i56 / 2)) & 1;
                                    if ((i15 != 0 ? c11 : (char) 0) != 0) {
                                    }
                                    break;
                                case 5:
                                    int i62 = i56 * i61;
                                    i15 = (i62 % 3) + (i62 & 1);
                                    if ((i15 != 0 ? c11 : (char) 0) != 0) {
                                    }
                                    break;
                                case 6:
                                    int i63 = i56 * i61;
                                    i16 = i63 & 1;
                                    i17 = i63 % 3;
                                    i14 = i17 + i16;
                                    i15 = i14 & 1;
                                    if ((i15 != 0 ? c11 : (char) 0) != 0) {
                                    }
                                    break;
                                case 7:
                                    i17 = (i56 * i61) % 3;
                                    i16 = (i56 + i61) & 1;
                                    i14 = i17 + i16;
                                    i15 = i14 & 1;
                                    if ((i15 != 0 ? c11 : (char) 0) != 0) {
                                    }
                                    break;
                                default:
                                    throw new IllegalArgumentException(c0.h(i11, "Invalid mask pattern: "));
                            }
                        }
                        bArr4[i56][i61] = (byte) i13;
                    }
                }
                i56 += i58;
            }
            i58 = -i58;
            i56 += i58;
            i55 -= 2;
        }
        if (i57 == aVar.f80533b) {
            return;
        }
        throw new WriterException("Not all bits consumed: " + i57 + '/' + aVar.f80533b);
    }

    public static int c(int i5, int i11) {
        if (i11 == 0) {
            throw new IllegalArgumentException("0 polynomial");
        }
        int iNumberOfLeadingZeros = Integer.numberOfLeadingZeros(i11);
        int i12 = 32 - iNumberOfLeadingZeros;
        int iNumberOfLeadingZeros2 = i5 << (31 - iNumberOfLeadingZeros);
        while (32 - Integer.numberOfLeadingZeros(iNumberOfLeadingZeros2) >= i12) {
            iNumberOfLeadingZeros2 ^= i11 << ((32 - Integer.numberOfLeadingZeros(iNumberOfLeadingZeros2)) - i12);
        }
        return iNumberOfLeadingZeros2;
    }

    public static void d(int i5, int i11, com.google.android.gms.internal.consent_sdk.a aVar) throws WriterException {
        for (int i12 = 0; i12 < 8; i12++) {
            int i13 = i5 + i12;
            if (!g(aVar.s(i13, i11))) {
                throw new WriterException();
            }
            aVar.W(i13, i11, 0);
        }
    }

    public static void e(int i5, int i11, com.google.android.gms.internal.consent_sdk.a aVar) {
        for (int i12 = 0; i12 < 7; i12++) {
            int[] iArr = f87547a[i12];
            for (int i13 = 0; i13 < 7; i13++) {
                aVar.W(i5 + i13, i11 + i12, iArr[i13]);
            }
        }
    }

    public static void f(int i5, int i11, com.google.android.gms.internal.consent_sdk.a aVar) throws WriterException {
        for (int i12 = 0; i12 < 7; i12++) {
            int i13 = i11 + i12;
            if (!g(aVar.s(i5, i13))) {
                throw new WriterException();
            }
            aVar.W(i5, i13, 0);
        }
    }

    public static boolean g(int i5) {
        return i5 == -1;
    }
}
