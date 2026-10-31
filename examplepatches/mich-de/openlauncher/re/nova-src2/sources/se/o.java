package se;

/* loaded from: classes3.dex */
public abstract class o {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f87326a = {1769172845, 1769172786, 1769172787, 1769172788, 1769172789, 1769172790, 1769172793, 1635148593, 1752589105, 1751479857, 1635135537, 1836069937, 1836069938, 862401121, 862401122, 862417462, 862417718, 862414134, 862414646, 1295275552, 1295270176, 1714714144, 1801741417, 1295275600, 1903435808, 1297305174, 1684175153, 1769172332, 1885955686};

    public static boolean a(ke.k kVar, boolean z11, boolean z12) {
        boolean z13;
        int i5;
        int i11;
        long length = kVar.getLength();
        long j11 = -1;
        int i12 = (length > (-1L) ? 1 : (length == (-1L) ? 0 : -1));
        long j12 = 4096;
        if (i12 != 0 && length <= 4096) {
            j12 = length;
        }
        int i13 = (int) j12;
        com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(64);
        int i14 = 0;
        int i15 = 0;
        boolean z14 = false;
        while (i15 < i13) {
            aVar.U(8);
            if (!kVar.d((byte[]) aVar.f31986d, i14, 8, true)) {
                break;
            }
            long jO = aVar.O();
            int iA = aVar.A();
            if (jO == 1) {
                kVar.b(8, 8, (byte[]) aVar.f31986d);
                aVar.X(16);
                i5 = i15;
                i11 = 16;
                jO = aVar.H();
            } else {
                if (jO == 0) {
                    long length2 = kVar.getLength();
                    if (length2 != j11) {
                        jO = (length2 - kVar.g()) + 8;
                    }
                }
                i5 = i15;
                i11 = 8;
            }
            long j13 = i11;
            if (jO < j13) {
                return false;
            }
            int i16 = i5 + i11;
            if (iA == 1836019574) {
                i13 += (int) jO;
                if (i12 != 0 && i13 > length) {
                    i13 = (int) length;
                }
                i15 = i16;
            } else {
                if (iA == 1836019558 || iA == 1836475768) {
                    z13 = true;
                    break;
                }
                int i17 = i12;
                if ((i16 + jO) - j13 >= i13) {
                    break;
                }
                int i18 = (int) (jO - j13);
                i15 = i16 + i18;
                if (iA == 1718909296) {
                    if (i18 < 8) {
                        return false;
                    }
                    aVar.U(i18);
                    kVar.b(0, i18, (byte[]) aVar.f31986d);
                    int i19 = i18 / 4;
                    for (int i21 = 0; i21 < i19; i21++) {
                        if (i21 != 1) {
                            int iA2 = aVar.A();
                            if ((iA2 >>> 8) != 3368816 && (iA2 != 1751476579 || !z12)) {
                                for (int i22 = 0; i22 < 29; i22++) {
                                    if (f87326a[i22] != iA2) {
                                    }
                                }
                            }
                            z14 = true;
                            break;
                        }
                        aVar.Z(4);
                    }
                    if (!z14) {
                        return false;
                    }
                } else if (i18 != 0) {
                    kVar.k(i18);
                }
                i12 = i17;
            }
            j11 = -1;
            i14 = 0;
        }
        z13 = false;
        return z14 && z11 == z13;
    }
}
