package com.bytedance.sdk.openadsdk.tn;

import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
final class ok {
    private static final int[][] ycx = {new int[]{1, 1, 1, 1, 1, 1, 1}, new int[]{1, 0, 0, 0, 0, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 0, 0, 0, 0, 1}, new int[]{1, 1, 1, 1, 1, 1, 1}};

    /* renamed from: zb, reason: collision with root package name */
    private static final int[][] f27057zb = {new int[]{1, 1, 1, 1, 1}, new int[]{1, 0, 0, 0, 1}, new int[]{1, 0, 1, 0, 1}, new int[]{1, 0, 0, 0, 1}, new int[]{1, 1, 1, 1, 1}};
    private static final int[][] sya = {new int[]{-1, -1, -1, -1, -1, -1, -1}, new int[]{6, 18, -1, -1, -1, -1, -1}, new int[]{6, 22, -1, -1, -1, -1, -1}, new int[]{6, 26, -1, -1, -1, -1, -1}, new int[]{6, 30, -1, -1, -1, -1, -1}, new int[]{6, 34, -1, -1, -1, -1, -1}, new int[]{6, 22, 38, -1, -1, -1, -1}, new int[]{6, 24, 42, -1, -1, -1, -1}, new int[]{6, 26, 46, -1, -1, -1, -1}, new int[]{6, 28, 50, -1, -1, -1, -1}, new int[]{6, 30, 54, -1, -1, -1, -1}, new int[]{6, 32, 58, -1, -1, -1, -1}, new int[]{6, 34, 62, -1, -1, -1, -1}, new int[]{6, 26, 46, 66, -1, -1, -1}, new int[]{6, 26, 48, 70, -1, -1, -1}, new int[]{6, 26, 50, 74, -1, -1, -1}, new int[]{6, 30, 54, 78, -1, -1, -1}, new int[]{6, 30, 56, 82, -1, -1, -1}, new int[]{6, 30, 58, 86, -1, -1, -1}, new int[]{6, 34, 62, 90, -1, -1, -1}, new int[]{6, 28, 50, 72, 94, -1, -1}, new int[]{6, 26, 50, 74, 98, -1, -1}, new int[]{6, 30, 54, 78, 102, -1, -1}, new int[]{6, 28, 54, 80, 106, -1, -1}, new int[]{6, 32, 58, 84, 110, -1, -1}, new int[]{6, 30, 58, 86, 114, -1, -1}, new int[]{6, 34, 62, 90, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, -1, -1}, new int[]{6, 26, 50, 74, 98, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, -1}, new int[]{6, 30, 54, 78, 102, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, -1}, new int[]{6, 26, 52, 78, 104, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, -1}, new int[]{6, 30, 56, 82, 108, Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, -1}, new int[]{6, 34, 60, 86, 112, Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, -1}, new int[]{6, 30, 58, 86, 114, 142, -1}, new int[]{6, 34, 62, 90, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 146, -1}, new int[]{6, 30, 54, 78, 102, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, PerAppFeatureCatalog.MAX_TOOLS}, new int[]{6, 24, 50, 76, 102, 128, 154}, new int[]{6, 28, 54, 80, 106, Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, 158}, new int[]{6, 32, 58, 84, 110, Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 162}, new int[]{6, 26, 54, 82, 110, Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 166}, new int[]{6, 30, 58, 86, 114, 142, 170}};

    /* renamed from: dj, reason: collision with root package name */
    private static final int[][] f27056dj = {new int[]{8, 0}, new int[]{8, 1}, new int[]{8, 2}, new int[]{8, 3}, new int[]{8, 4}, new int[]{8, 5}, new int[]{8, 7}, new int[]{8, 8}, new int[]{7, 8}, new int[]{5, 8}, new int[]{4, 8}, new int[]{3, 8}, new int[]{2, 8}, new int[]{1, 8}, new int[]{0, 8}};

    private static void dj(int i5, int i11, sya syaVar) {
        for (int i12 = 0; i12 < 7; i12++) {
            int[] iArr = ycx[i12];
            for (int i13 = 0; i13 < 7; i13++) {
                syaVar.ycx(i5 + i13, i11 + i12, iArr[i13]);
            }
        }
    }

    private static void sya(sya syaVar) throws htf {
        if (syaVar.ycx(8, syaVar.ycx() - 8) == 0) {
            throw new htf();
        }
        syaVar.ycx(8, syaVar.ycx() - 8, 1);
    }

    public static void ycx(sya syaVar) {
        syaVar.ycx((byte) -1);
    }

    private static boolean zb(int i5) {
        return i5 == -1;
    }

    public static void ycx(ycx ycxVar, fby fbyVar, uh uhVar, int i5, sya syaVar) throws htf {
        ycx(syaVar);
        ycx(uhVar, syaVar);
        ycx(fbyVar, i5, syaVar);
        zb(uhVar, syaVar);
        ycx(ycxVar, i5, syaVar);
    }

    public static void zb(uh uhVar, sya syaVar) throws htf {
        if (uhVar.ycx() < 7) {
            return;
        }
        ycx ycxVar = new ycx();
        ycx(uhVar, ycxVar);
        int i5 = 17;
        for (int i11 = 0; i11 < 6; i11++) {
            for (int i12 = 0; i12 < 3; i12++) {
                boolean zYcx = ycxVar.ycx(i5);
                i5--;
                syaVar.ycx(i11, (syaVar.ycx() - 11) + i12, zYcx);
                syaVar.ycx((syaVar.ycx() - 11) + i12, i11, zYcx);
            }
        }
    }

    private static void dj(sya syaVar) throws htf {
        int length = ycx[0].length;
        dj(0, 0, syaVar);
        dj(syaVar.zb() - length, 0, syaVar);
        dj(0, syaVar.zb() - length, syaVar);
        ycx(0, 7, syaVar);
        ycx(syaVar.zb() - 8, 7, syaVar);
        ycx(0, syaVar.zb() - 8, syaVar);
        zb(7, 0, syaVar);
        zb(syaVar.ycx() - 8, 0, syaVar);
        zb(7, syaVar.ycx() - 7, syaVar);
    }

    private static void sya(int i5, int i11, sya syaVar) {
        for (int i12 = 0; i12 < 5; i12++) {
            int[] iArr = f27057zb[i12];
            for (int i13 = 0; i13 < 5; i13++) {
                syaVar.ycx(i5 + i13, i11 + i12, iArr[i13]);
            }
        }
    }

    private static void sya(uh uhVar, sya syaVar) {
        if (uhVar.ycx() < 2) {
            return;
        }
        int[] iArr = sya[uhVar.ycx() - 1];
        for (int i5 : iArr) {
            if (i5 >= 0) {
                for (int i11 : iArr) {
                    if (i11 >= 0 && zb(syaVar.ycx(i11, i5))) {
                        sya(i11 - 2, i5 - 2, syaVar);
                    }
                }
            }
        }
    }

    public static void ycx(uh uhVar, sya syaVar) throws htf {
        dj(syaVar);
        sya(syaVar);
        sya(uhVar, syaVar);
        zb(syaVar);
    }

    private static void zb(sya syaVar) {
        int i5 = 8;
        while (i5 < syaVar.zb() - 8) {
            int i11 = i5 + 1;
            int i12 = i11 % 2;
            if (zb(syaVar.ycx(i5, 6))) {
                syaVar.ycx(i5, 6, i12);
            }
            if (zb(syaVar.ycx(6, i5))) {
                syaVar.ycx(6, i5, i12);
            }
            i5 = i11;
        }
    }

    public static void ycx(fby fbyVar, int i5, sya syaVar) throws htf {
        int iYcx;
        ycx ycxVar = new ycx();
        ycx(fbyVar, i5, ycxVar);
        for (int i11 = 0; i11 < ycxVar.ycx(); i11++) {
            boolean zYcx = ycxVar.ycx((ycxVar.ycx() - 1) - i11);
            int[] iArr = f27056dj[i11];
            syaVar.ycx(iArr[0], iArr[1], zYcx);
            int iZb = 8;
            if (i11 < 8) {
                iYcx = 8;
                iZb = (syaVar.zb() - i11) - 1;
            } else {
                iYcx = (i11 - 8) + (syaVar.ycx() - 7);
            }
            syaVar.ycx(iZb, iYcx, zYcx);
        }
    }

    private static void zb(int i5, int i11, sya syaVar) throws htf {
        for (int i12 = 0; i12 < 7; i12++) {
            int i13 = i11 + i12;
            if (zb(syaVar.ycx(i5, i13))) {
                syaVar.ycx(i5, i13, 0);
            } else {
                throw new htf();
            }
        }
    }

    public static void ycx(ycx ycxVar, int i5, sya syaVar) throws htf {
        boolean zYcx;
        int iZb = syaVar.zb() - 1;
        int iYcx = syaVar.ycx() - 1;
        int i11 = 0;
        int i12 = -1;
        while (iZb > 0) {
            if (iZb == 6) {
                iZb--;
            }
            while (iYcx >= 0 && iYcx < syaVar.ycx()) {
                for (int i13 = 0; i13 < 2; i13++) {
                    int i14 = iZb - i13;
                    if (zb(syaVar.ycx(i14, iYcx))) {
                        if (i11 < ycxVar.ycx()) {
                            zYcx = ycxVar.ycx(i11);
                            i11++;
                        } else {
                            zYcx = false;
                        }
                        if (i5 != -1 && ea.ycx(i5, i14, iYcx)) {
                            zYcx = !zYcx;
                        }
                        syaVar.ycx(i14, iYcx, zYcx);
                    }
                }
                iYcx += i12;
            }
            i12 = -i12;
            iYcx += i12;
            iZb -= 2;
        }
        if (i11 == ycxVar.ycx()) {
            return;
        }
        throw new htf("Not all bits consumed: " + i11 + '/' + ycxVar.ycx());
    }

    public static int ycx(int i5) {
        return 32 - Integer.numberOfLeadingZeros(i5);
    }

    public static int ycx(int i5, int i11) {
        if (i11 != 0) {
            int iYcx = ycx(i11);
            int iYcx2 = i5 << (iYcx - 1);
            while (ycx(iYcx2) >= iYcx) {
                iYcx2 ^= i11 << (ycx(iYcx2) - iYcx);
            }
            return iYcx2;
        }
        throw new IllegalArgumentException("0 polynomial");
    }

    public static void ycx(fby fbyVar, int i5, ycx ycxVar) throws htf {
        if (syc.ycx(i5)) {
            int iYcx = (fbyVar.ycx() << 3) | i5;
            ycxVar.ycx(iYcx, 5);
            ycxVar.ycx(ycx(iYcx, 1335), 10);
            ycx ycxVar2 = new ycx();
            ycxVar2.ycx(21522, 15);
            ycxVar.zb(ycxVar2);
            if (ycxVar.ycx() == 15) {
                return;
            }
            throw new htf("should not happen but we got: " + ycxVar.ycx());
        }
        throw new htf("Invalid mask pattern");
    }

    public static void ycx(uh uhVar, ycx ycxVar) throws htf {
        ycxVar.ycx(uhVar.ycx(), 6);
        ycxVar.ycx(ycx(uhVar.ycx(), 7973), 12);
        if (ycxVar.ycx() == 18) {
            return;
        }
        throw new htf("should not happen but we got: " + ycxVar.ycx());
    }

    private static void ycx(int i5, int i11, sya syaVar) throws htf {
        for (int i12 = 0; i12 < 8; i12++) {
            int i13 = i5 + i12;
            if (zb(syaVar.ycx(i13, i11))) {
                syaVar.ycx(i13, i11, 0);
            } else {
                throw new htf();
            }
        }
    }
}
