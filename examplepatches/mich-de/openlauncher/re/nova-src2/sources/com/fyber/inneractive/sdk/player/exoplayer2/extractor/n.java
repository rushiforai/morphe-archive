package com.fyber.inneractive.sdk.player.exoplayer2.extractor;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: h, reason: collision with root package name */
    public static final String[] f29656h = {"audio/mpeg-L1", "audio/mpeg-L2", "audio/mpeg"};

    /* renamed from: i, reason: collision with root package name */
    public static final int[] f29657i = {44100, 48000, 32000};

    /* renamed from: j, reason: collision with root package name */
    public static final int[] f29658j = {32, 64, 96, 128, 160, 192, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 256, 288, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 352, 384, TTAdConstant.PACKAGE_NAME_CODE, 448};

    /* renamed from: k, reason: collision with root package name */
    public static final int[] f29659k = {32, 48, 56, 64, 80, 96, 112, 128, 144, 160, 176, 192, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 256};

    /* renamed from: l, reason: collision with root package name */
    public static final int[] f29660l = {32, 48, 56, 64, 80, 96, 112, 128, 160, 192, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 256, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 384};

    /* renamed from: m, reason: collision with root package name */
    public static final int[] f29661m = {32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 256, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE};
    public static final int[] n = {8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 144, 160};

    /* renamed from: a, reason: collision with root package name */
    public int f29662a;

    /* renamed from: b, reason: collision with root package name */
    public String f29663b;

    /* renamed from: c, reason: collision with root package name */
    public int f29664c;

    /* renamed from: d, reason: collision with root package name */
    public int f29665d;

    /* renamed from: e, reason: collision with root package name */
    public int f29666e;

    /* renamed from: f, reason: collision with root package name */
    public int f29667f;

    /* renamed from: g, reason: collision with root package name */
    public int f29668g;

    public static int a(int i5) {
        int i11;
        int i12;
        int i13;
        int i14;
        if ((i5 & (-2097152)) != -2097152 || (i11 = (i5 >>> 19) & 3) == 1 || (i12 = (i5 >>> 17) & 3) == 0 || (i13 = (i5 >>> 12) & 15) == 0 || i13 == 15 || (i14 = (i5 >>> 10) & 3) == 3) {
            return -1;
        }
        int i15 = f29657i[i14];
        if (i11 == 2) {
            i15 /= 2;
        } else if (i11 == 0) {
            i15 /= 4;
        }
        int i16 = (i5 >>> 9) & 1;
        if (i12 == 3) {
            return ((((i11 == 3 ? f29658j[i13 - 1] : f29659k[i13 - 1]) * 12000) / i15) + i16) * 4;
        }
        int i17 = i11 == 3 ? i12 == 2 ? f29660l[i13 - 1] : f29661m[i13 - 1] : n[i13 - 1];
        if (i11 == 3) {
            return a2.c.A(i17, 144000, i15, i16);
        }
        return a2.c.A(i12 == 1 ? 72000 : 144000, i17, i15, i16);
    }

    public static boolean a(int i5, n nVar) {
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        int iA;
        int i16;
        if ((i5 & (-2097152)) != -2097152 || (i11 = (i5 >>> 19) & 3) == 1 || (i12 = (i5 >>> 17) & 3) == 0 || (i13 = (i5 >>> 12) & 15) == 0 || i13 == 15 || (i14 = (i5 >>> 10) & 3) == 3) {
            return false;
        }
        int i17 = f29657i[i14];
        if (i11 == 2) {
            i17 /= 2;
        } else if (i11 == 0) {
            i17 /= 4;
        }
        int i18 = (i5 >>> 9) & 1;
        if (i12 == 3) {
            i15 = i11 == 3 ? f29658j[i13 - 1] : f29659k[i13 - 1];
            iA = (((i15 * 12000) / i17) + i18) * 4;
            i16 = 384;
        } else {
            if (i11 == 3) {
                i15 = i12 == 2 ? f29660l[i13 - 1] : f29661m[i13 - 1];
                iA = a2.c.A(i15, 144000, i17, i18);
            } else {
                i15 = n[i13 - 1];
                i = i12 == 1 ? 576 : 1152;
                iA = a2.c.A(i12 == 1 ? 72000 : 144000, i15, i17, i18);
            }
            i16 = i;
        }
        String str = f29656h[3 - i12];
        int i19 = ((i5 >> 6) & 3) == 3 ? 1 : 2;
        nVar.f29662a = i11;
        nVar.f29663b = str;
        nVar.f29664c = iA;
        nVar.f29665d = i17;
        nVar.f29666e = i19;
        nVar.f29667f = i15 * 1000;
        nVar.f29668g = i16;
        return true;
    }
}
