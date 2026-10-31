package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f28976a = {1, 2, 3, 6};

    /* renamed from: b, reason: collision with root package name */
    public static final int[] f28977b = {48000, 44100, 32000};

    /* renamed from: c, reason: collision with root package name */
    public static final int[] f28978c = {24000, 22050, 16000};

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f28979d = {2, 1, 2, 3, 3, 4, 4, 5};

    /* renamed from: e, reason: collision with root package name */
    public static final int[] f28980e = {32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 256, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 384, 448, EventBridgeChannel.QUEUE_CAPACITY, 576, 640};

    /* renamed from: f, reason: collision with root package name */
    public static final int[] f28981f = {69, 87, 104, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 139, 174, Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 243, 278, 348, TTAdConstant.DOWNLOAD_URL_AND_PACKAGE_NAME, 487, 557, 696, 835, 975, 1114, 1253, 1393};

    public static int a(int i5, int i11) {
        int i12 = i11 / 2;
        if (i5 < 0) {
            return -1;
        }
        int[] iArr = f28977b;
        if (i5 >= 3 || i11 < 0) {
            return -1;
        }
        int[] iArr2 = f28981f;
        if (i12 >= 19) {
            return -1;
        }
        int i13 = iArr[i5];
        if (i13 == 44100) {
            return ((i11 % 2) + iArr2[i12]) * 2;
        }
        int i14 = f28980e[i12];
        return i13 == 32000 ? i14 * 6 : i14 * 4;
    }
}
