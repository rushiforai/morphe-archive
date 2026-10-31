package com.bytedance.sdk.openadsdk.tn;

import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public final class uh {
    private static final uh[] ycx = dj();

    /* renamed from: dj, reason: collision with root package name */
    private final int f27072dj;
    private final zb[] sya;

    /* renamed from: zb, reason: collision with root package name */
    private final int f27073zb;

    public static final class ycx {
        private final int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final int f27074zb;

        public ycx(int i5, int i11) {
            this.ycx = i5;
            this.f27074zb = i11;
        }

        public int ycx() {
            return this.ycx;
        }

        public int zb() {
            return this.f27074zb;
        }
    }

    public static final class zb {
        private final int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final ycx[] f27075zb;

        public zb(int i5, ycx... ycxVarArr) {
            this.ycx = i5;
            this.f27075zb = ycxVarArr;
        }

        public ycx[] dj() {
            return this.f27075zb;
        }

        public int sya() {
            return zb() * this.ycx;
        }

        public int ycx() {
            return this.ycx;
        }

        public int zb() {
            int iYcx = 0;
            for (ycx ycxVar : this.f27075zb) {
                iYcx += ycxVar.ycx();
            }
            return iYcx;
        }
    }

    private uh(int i5, int[] iArr, zb... zbVarArr) {
        this.f27073zb = i5;
        this.sya = zbVarArr;
        int iYcx = zbVarArr[0].ycx();
        int iZb = 0;
        for (ycx ycxVar : zbVarArr[0].dj()) {
            iZb += (ycxVar.zb() + iYcx) * ycxVar.ycx();
        }
        this.f27072dj = iZb;
    }

    private static uh[] dj() {
        return new uh[]{new uh(1, new int[0], new zb(7, new ycx(1, 19)), new zb(10, new ycx(1, 16)), new zb(13, new ycx(1, 13)), new zb(17, new ycx(1, 9))), new uh(2, new int[]{6, 18}, new zb(10, new ycx(1, 34)), new zb(16, new ycx(1, 28)), new zb(22, new ycx(1, 22)), new zb(28, new ycx(1, 16))), new uh(3, new int[]{6, 22}, new zb(15, new ycx(1, 55)), new zb(26, new ycx(1, 44)), new zb(18, new ycx(2, 17)), new zb(22, new ycx(2, 13))), new uh(4, new int[]{6, 26}, new zb(20, new ycx(1, 80)), new zb(18, new ycx(2, 32)), new zb(26, new ycx(2, 24)), new zb(16, new ycx(4, 9))), new uh(5, new int[]{6, 30}, new zb(26, new ycx(1, 108)), new zb(24, new ycx(2, 43)), new zb(18, new ycx(2, 15), new ycx(2, 16)), new zb(22, new ycx(2, 11), new ycx(2, 12))), new uh(6, new int[]{6, 34}, new zb(18, new ycx(2, 68)), new zb(16, new ycx(4, 27)), new zb(24, new ycx(4, 19)), new zb(28, new ycx(4, 15))), new uh(7, new int[]{6, 22, 38}, new zb(20, new ycx(2, 78)), new zb(18, new ycx(4, 31)), new zb(18, new ycx(2, 14), new ycx(4, 15)), new zb(26, new ycx(4, 13), new ycx(1, 14))), new uh(8, new int[]{6, 24, 42}, new zb(24, new ycx(2, 97)), new zb(22, new ycx(2, 38), new ycx(2, 39)), new zb(22, new ycx(4, 18), new ycx(2, 19)), new zb(26, new ycx(4, 14), new ycx(2, 15))), new uh(9, new int[]{6, 26, 46}, new zb(30, new ycx(2, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE)), new zb(22, new ycx(3, 36), new ycx(2, 37)), new zb(20, new ycx(4, 16), new ycx(4, 17)), new zb(24, new ycx(4, 12), new ycx(4, 13))), new uh(10, new int[]{6, 28, 50}, new zb(18, new ycx(2, 68), new ycx(2, 69)), new zb(26, new ycx(4, 43), new ycx(1, 44)), new zb(24, new ycx(6, 19), new ycx(2, 20)), new zb(28, new ycx(6, 15), new ycx(2, 16))), new uh(11, new int[]{6, 30, 54}, new zb(20, new ycx(4, 81)), new zb(30, new ycx(1, 50), new ycx(4, 51)), new zb(28, new ycx(4, 22), new ycx(4, 23)), new zb(24, new ycx(3, 12), new ycx(8, 13))), new uh(12, new int[]{6, 32, 58}, new zb(24, new ycx(2, 92), new ycx(2, 93)), new zb(22, new ycx(6, 36), new ycx(2, 37)), new zb(26, new ycx(4, 20), new ycx(6, 21)), new zb(28, new ycx(7, 14), new ycx(4, 15))), new uh(13, new int[]{6, 34, 62}, new zb(26, new ycx(4, 107)), new zb(22, new ycx(8, 37), new ycx(1, 38)), new zb(24, new ycx(8, 20), new ycx(4, 21)), new zb(22, new ycx(12, 11), new ycx(4, 12))), new uh(14, new int[]{6, 26, 46, 66}, new zb(30, new ycx(3, 115), new ycx(1, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE)), new zb(24, new ycx(4, 40), new ycx(5, 41)), new zb(20, new ycx(11, 16), new ycx(5, 17)), new zb(24, new ycx(11, 12), new ycx(5, 13))), new uh(15, new int[]{6, 26, 48, 70}, new zb(22, new ycx(5, 87), new ycx(1, 88)), new zb(24, new ycx(5, 41), new ycx(5, 42)), new zb(30, new ycx(5, 24), new ycx(7, 25)), new zb(24, new ycx(11, 12), new ycx(7, 13))), new uh(16, new int[]{6, 26, 50, 74}, new zb(24, new ycx(5, 98), new ycx(1, 99)), new zb(28, new ycx(7, 45), new ycx(3, 46)), new zb(24, new ycx(15, 19), new ycx(2, 20)), new zb(30, new ycx(3, 15), new ycx(13, 16))), new uh(17, new int[]{6, 30, 54, 78}, new zb(28, new ycx(1, 107), new ycx(5, 108)), new zb(28, new ycx(10, 46), new ycx(1, 47)), new zb(28, new ycx(1, 22), new ycx(15, 23)), new zb(28, new ycx(2, 14), new ycx(17, 15))), new uh(18, new int[]{6, 30, 56, 82}, new zb(30, new ycx(5, 120), new ycx(1, Sdk.SDKError.Reason.TPAT_ERROR_VALUE)), new zb(26, new ycx(9, 43), new ycx(4, 44)), new zb(28, new ycx(17, 22), new ycx(1, 23)), new zb(28, new ycx(2, 14), new ycx(19, 15))), new uh(19, new int[]{6, 30, 58, 86}, new zb(28, new ycx(3, 113), new ycx(4, 114)), new zb(26, new ycx(3, 44), new ycx(11, 45)), new zb(26, new ycx(17, 21), new ycx(4, 22)), new zb(26, new ycx(9, 13), new ycx(16, 14))), new uh(20, new int[]{6, 34, 62, 90}, new zb(28, new ycx(3, 107), new ycx(5, 108)), new zb(26, new ycx(3, 41), new ycx(13, 42)), new zb(30, new ycx(15, 24), new ycx(5, 25)), new zb(28, new ycx(15, 15), new ycx(10, 16))), new uh(21, new int[]{6, 28, 50, 72, 94}, new zb(28, new ycx(4, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), new ycx(4, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE)), new zb(26, new ycx(17, 42)), new zb(28, new ycx(17, 22), new ycx(6, 23)), new zb(30, new ycx(19, 16), new ycx(6, 17))), new uh(22, new int[]{6, 26, 50, 74, 98}, new zb(28, new ycx(2, 111), new ycx(7, 112)), new zb(28, new ycx(17, 46)), new zb(30, new ycx(7, 24), new ycx(16, 25)), new zb(24, new ycx(34, 13))), new uh(23, new int[]{6, 30, 54, 78, 102}, new zb(30, new ycx(4, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), new ycx(5, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)), new zb(28, new ycx(4, 47), new ycx(14, 48)), new zb(30, new ycx(11, 24), new ycx(14, 25)), new zb(30, new ycx(16, 15), new ycx(14, 16))), new uh(24, new int[]{6, 28, 54, 80, 106}, new zb(30, new ycx(6, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE), new ycx(4, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE)), new zb(28, new ycx(6, 45), new ycx(14, 46)), new zb(30, new ycx(11, 24), new ycx(16, 25)), new zb(30, new ycx(30, 16), new ycx(2, 17))), new uh(25, new int[]{6, 32, 58, 84, 110}, new zb(26, new ycx(8, 106), new ycx(4, 107)), new zb(28, new ycx(8, 47), new ycx(13, 48)), new zb(30, new ycx(7, 24), new ycx(22, 25)), new zb(30, new ycx(22, 15), new ycx(13, 16))), new uh(26, new int[]{6, 30, 58, 86, 114}, new zb(28, new ycx(10, 114), new ycx(2, 115)), new zb(28, new ycx(19, 46), new ycx(4, 47)), new zb(28, new ycx(28, 22), new ycx(6, 23)), new zb(30, new ycx(33, 16), new ycx(4, 17))), new uh(27, new int[]{6, 34, 62, 90, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE}, new zb(30, new ycx(8, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), new ycx(4, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE)), new zb(28, new ycx(22, 45), new ycx(3, 46)), new zb(30, new ycx(8, 23), new ycx(26, 24)), new zb(30, new ycx(12, 15), new ycx(28, 16))), new uh(28, new int[]{6, 26, 50, 74, 98, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE}, new zb(30, new ycx(3, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE), new ycx(10, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE)), new zb(28, new ycx(3, 45), new ycx(23, 46)), new zb(30, new ycx(4, 24), new ycx(31, 25)), new zb(30, new ycx(11, 15), new ycx(31, 16))), new uh(29, new int[]{6, 30, 54, 78, 102, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE}, new zb(30, new ycx(7, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), new ycx(7, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE)), new zb(28, new ycx(21, 45), new ycx(7, 46)), new zb(30, new ycx(1, 23), new ycx(37, 24)), new zb(30, new ycx(19, 15), new ycx(26, 16))), new uh(30, new int[]{6, 26, 52, 78, 104, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE}, new zb(30, new ycx(5, 115), new ycx(10, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE)), new zb(28, new ycx(19, 47), new ycx(10, 48)), new zb(30, new ycx(15, 24), new ycx(25, 25)), new zb(30, new ycx(23, 15), new ycx(25, 16))), new uh(31, new int[]{6, 30, 56, 82, 108, Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE}, new zb(30, new ycx(13, 115), new ycx(3, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE)), new zb(28, new ycx(2, 46), new ycx(29, 47)), new zb(30, new ycx(42, 24), new ycx(1, 25)), new zb(30, new ycx(23, 15), new ycx(28, 16))), new uh(32, new int[]{6, 34, 60, 86, 112, Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE}, new zb(30, new ycx(17, 115)), new zb(28, new ycx(10, 46), new ycx(23, 47)), new zb(30, new ycx(10, 24), new ycx(35, 25)), new zb(30, new ycx(19, 15), new ycx(35, 16))), new uh(33, new int[]{6, 30, 58, 86, 114, 142}, new zb(30, new ycx(17, 115), new ycx(1, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE)), new zb(28, new ycx(14, 46), new ycx(21, 47)), new zb(30, new ycx(29, 24), new ycx(19, 25)), new zb(30, new ycx(11, 15), new ycx(46, 16))), new uh(34, new int[]{6, 34, 62, 90, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 146}, new zb(30, new ycx(13, 115), new ycx(6, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE)), new zb(28, new ycx(14, 46), new ycx(23, 47)), new zb(30, new ycx(44, 24), new ycx(7, 25)), new zb(30, new ycx(59, 16), new ycx(1, 17))), new uh(35, new int[]{6, 30, 54, 78, 102, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, PerAppFeatureCatalog.MAX_TOOLS}, new zb(30, new ycx(12, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), new ycx(7, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)), new zb(28, new ycx(12, 47), new ycx(26, 48)), new zb(30, new ycx(39, 24), new ycx(14, 25)), new zb(30, new ycx(22, 15), new ycx(41, 16))), new uh(36, new int[]{6, 24, 50, 76, 102, 128, 154}, new zb(30, new ycx(6, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), new ycx(14, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)), new zb(28, new ycx(6, 47), new ycx(34, 48)), new zb(30, new ycx(46, 24), new ycx(10, 25)), new zb(30, new ycx(2, 15), new ycx(64, 16))), new uh(37, new int[]{6, 28, 54, 80, 106, Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, 158}, new zb(30, new ycx(17, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), new ycx(4, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE)), new zb(28, new ycx(29, 46), new ycx(14, 47)), new zb(30, new ycx(49, 24), new ycx(10, 25)), new zb(30, new ycx(24, 15), new ycx(46, 16))), new uh(38, new int[]{6, 32, 58, 84, 110, Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 162}, new zb(30, new ycx(4, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), new ycx(18, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE)), new zb(28, new ycx(13, 46), new ycx(32, 47)), new zb(30, new ycx(48, 24), new ycx(14, 25)), new zb(30, new ycx(42, 15), new ycx(32, 16))), new uh(39, new int[]{6, 26, 54, 82, 110, Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 166}, new zb(30, new ycx(20, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE), new ycx(4, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE)), new zb(28, new ycx(40, 47), new ycx(7, 48)), new zb(30, new ycx(43, 24), new ycx(22, 25)), new zb(30, new ycx(10, 15), new ycx(67, 16))), new uh(40, new int[]{6, 30, 58, 86, 114, 142, 170}, new zb(30, new ycx(19, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), new ycx(6, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE)), new zb(28, new ycx(18, 47), new ycx(31, 48)), new zb(30, new ycx(34, 24), new ycx(34, 25)), new zb(30, new ycx(20, 15), new ycx(61, 16)))};
    }

    public int sya() {
        return (this.f27073zb * 4) + 17;
    }

    public int ycx() {
        return this.f27073zb;
    }

    public int zb() {
        return this.f27072dj;
    }

    public zb ycx(fby fbyVar) {
        return this.sya[fbyVar.ordinal()];
    }

    public static uh ycx(int i5) {
        if (i5 > 0 && i5 <= 40) {
            return ycx[i5 - 1];
        }
        throw new IllegalArgumentException();
    }
}
