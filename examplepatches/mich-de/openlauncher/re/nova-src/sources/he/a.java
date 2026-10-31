package he;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.android.exoplayer2.ParserException;
import com.google.android.gms.internal.measurement.wg;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f59654a = {96000, 88200, 64000, 48000, 44100, 32000, 24000, 22050, 16000, 12000, 11025, 8000, 7350};

    /* renamed from: b, reason: collision with root package name */
    public static final int[] f59655b = {0, 1, 2, 3, 4, 5, 6, 8, -1, -1, -1, 7, 8, -1, 8, -1};

    /* renamed from: c, reason: collision with root package name */
    public static final int[] f59656c = {1, 2, 3, 6};

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f59657d = {48000, 44100, 32000};

    /* renamed from: e, reason: collision with root package name */
    public static final int[] f59658e = {24000, 22050, 16000};

    /* renamed from: f, reason: collision with root package name */
    public static final int[] f59659f = {2, 1, 2, 3, 3, 4, 4, 5};

    /* renamed from: g, reason: collision with root package name */
    public static final int[] f59660g = {32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 256, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 384, 448, EventBridgeChannel.QUEUE_CAPACITY, 576, 640};

    /* renamed from: h, reason: collision with root package name */
    public static final int[] f59661h = {69, 87, 104, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 139, 174, Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 243, 278, 348, TTAdConstant.DOWNLOAD_URL_AND_PACKAGE_NAME, 487, 557, 696, 835, 975, 1114, 1253, 1393};

    /* renamed from: i, reason: collision with root package name */
    public static final int[] f59662i = {2002, 2000, 1920, 1601, 1600, 1001, 1000, 960, 800, 800, 480, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 2048};

    /* renamed from: j, reason: collision with root package name */
    public static final int[] f59663j = {1, 2, 2, 2, 2, 3, 3, 4, 4, 5, 6, 6, 6, 7, 8, 8};

    /* renamed from: k, reason: collision with root package name */
    public static final int[] f59664k = {-1, 8000, 16000, 32000, -1, -1, 11025, 22050, 44100, -1, -1, 12000, 24000, 48000, -1, -1};

    /* renamed from: l, reason: collision with root package name */
    public static final int[] f59665l = {64, 112, 128, 192, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 256, 384, 448, EventBridgeChannel.QUEUE_CAPACITY, 640, 768, 896, 1024, 1152, 1280, 1536, 1920, 2048, 2304, 2560, 2688, 2816, 2823, 2944, 3072, 3840, u1.FLAG_APPEARED_IN_PRE_LAYOUT, 6144, 7680};

    /* renamed from: m, reason: collision with root package name */
    public static final String[] f59666m = {"audio/mpeg-L1", "audio/mpeg-L2", "audio/mpeg"};
    public static final int[] n = {44100, 48000, 32000};
    public static final int[] o = {32000, 64000, 96000, 128000, 160000, 192000, 224000, 256000, 288000, 320000, 352000, 384000, 416000, 448000};

    /* renamed from: p, reason: collision with root package name */
    public static final int[] f59667p = {32000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 144000, 160000, 176000, 192000, 224000, 256000};

    /* renamed from: q, reason: collision with root package name */
    public static final int[] f59668q = {32000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 160000, 192000, 224000, 256000, 320000, 384000};

    /* renamed from: r, reason: collision with root package name */
    public static final int[] f59669r = {32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 160000, 192000, 224000, 256000, 320000};

    /* renamed from: s, reason: collision with root package name */
    public static final int[] f59670s = {8000, 16000, 24000, 32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 144000, 160000};

    public static ArrayList a(byte[] bArr) {
        ArrayList arrayList = new ArrayList(3);
        arrayList.add(bArr);
        arrayList.add(ByteBuffer.allocate(8).order(ByteOrder.nativeOrder()).putLong(((((bArr[11] & 255) << 8) | (bArr[10] & 255)) * 1000000000) / 48000).array());
        arrayList.add(ByteBuffer.allocate(8).order(ByteOrder.nativeOrder()).putLong(80000000L).array());
        return arrayList;
    }

    public static int b(int i5, int i11) {
        int i12 = i11 / 2;
        if (i5 < 0 || i5 >= 3 || i11 < 0 || i12 >= 19) {
            return -1;
        }
        int i13 = f59657d[i5];
        if (i13 == 44100) {
            return ((i11 % 2) + f59661h[i12]) * 2;
        }
        int i14 = f59660g[i12];
        return i13 == 32000 ? i14 * 6 : i14 * 4;
    }

    public static void c(int i5, com.google.android.gms.internal.consent_sdk.a aVar) {
        aVar.U(7);
        byte[] bArr = (byte[]) aVar.f31986d;
        bArr[0] = -84;
        bArr[1] = 64;
        bArr[2] = -1;
        bArr[3] = -1;
        bArr[4] = (byte) ((i5 >> 16) & 255);
        bArr[5] = (byte) ((i5 >> 8) & 255);
        bArr[6] = (byte) (i5 & 255);
    }

    public static int d(int i5) {
        int i11;
        int i12;
        int i13;
        int i14;
        if ((i5 & (-2097152)) != -2097152 || (i11 = (i5 >>> 19) & 3) == 1 || (i12 = (i5 >>> 17) & 3) == 0 || (i13 = (i5 >>> 12) & 15) == 0 || i13 == 15 || (i14 = (i5 >>> 10) & 3) == 3) {
            return -1;
        }
        int i15 = n[i14];
        if (i11 == 2) {
            i15 /= 2;
        } else if (i11 == 0) {
            i15 /= 4;
        }
        int i16 = (i5 >>> 9) & 1;
        if (i12 == 3) {
            return ((((i11 == 3 ? o[i13 - 1] : f59667p[i13 - 1]) * 12) / i15) + i16) * 4;
        }
        int i17 = i11 == 3 ? i12 == 2 ? f59668q[i13 - 1] : f59669r[i13 - 1] : f59670s[i13 - 1];
        if (i11 == 3) {
            return a2.c.A(i17, 144, i15, i16);
        }
        return a2.c.A(i12 == 1 ? 72 : 144, i17, i15, i16);
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0090  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static wg e(ke.x xVar) {
        int i5;
        int i11;
        int i12 = xVar.i(16);
        int i13 = xVar.i(16);
        if (i13 == 65535) {
            i13 = xVar.i(24);
            i5 = 7;
        } else {
            i5 = 4;
        }
        int i14 = i13 + i5;
        if (i12 == 44097) {
            i14 += 2;
        }
        if (xVar.i(2) == 3) {
            do {
                xVar.i(2);
            } while (xVar.h());
        }
        int i15 = xVar.i(10);
        if (xVar.h() && xVar.i(3) > 0) {
            xVar.r(2);
        }
        int i16 = xVar.h() ? 48000 : 44100;
        int i17 = xVar.i(4);
        int[] iArr = f59662i;
        if (i16 == 44100 && i17 == 13) {
            i11 = iArr[i17];
        } else if (i16 != 48000 || i17 >= 14) {
            i11 = 0;
        } else {
            int i18 = iArr[i17];
            int i19 = i15 % 5;
            if (i19 == 1) {
                i11 = (i17 == 3 || i17 == 8) ? i18 + 1 : i18;
            } else if (i19 != 2) {
                if (i19 != 3) {
                    if (i19 == 4 && (i17 == 3 || i17 == 8 || i17 == 11)) {
                    }
                }
            } else if (i17 == 8 || i17 == 11) {
            }
        }
        return new wg(i16, i14, i11);
    }

    public static com.google.android.gms.internal.consent_sdk.a f(ke.x xVar, boolean z11) throws ParserException {
        int i5;
        int i11;
        int i12 = xVar.i(5);
        if (i12 == 31) {
            i12 = xVar.i(6) + 32;
        }
        int i13 = xVar.i(4);
        int[] iArr = f59654a;
        if (i13 == 15) {
            i5 = xVar.i(24);
        } else {
            if (i13 >= 13) {
                throw ParserException.a(null, null);
            }
            i5 = iArr[i13];
        }
        int i14 = xVar.i(4);
        String strH = b.c0.h(i12, "mp4a.40.");
        if (i12 == 5 || i12 == 29) {
            int i15 = xVar.i(4);
            if (i15 == 15) {
                i11 = xVar.i(24);
            } else {
                if (i15 >= 13) {
                    throw ParserException.a(null, null);
                }
                i11 = iArr[i15];
            }
            i5 = i11;
            int i16 = xVar.i(5);
            if (i16 == 31) {
                i16 = xVar.i(6) + 32;
            }
            i12 = i16;
            if (i12 == 22) {
                i14 = xVar.i(4);
            }
        }
        if (z11) {
            if (i12 != 1 && i12 != 2 && i12 != 3 && i12 != 4 && i12 != 6 && i12 != 7 && i12 != 17) {
                switch (i12) {
                    case 19:
                    case 20:
                    case 21:
                    case 22:
                    case 23:
                        break;
                    default:
                        throw ParserException.b("Unsupported audio object type: " + i12);
                }
            }
            if (xVar.h()) {
                wf.a.D("AacUtil", "Unexpected frameLengthFlag = 1");
            }
            if (xVar.h()) {
                xVar.r(14);
            }
            boolean zH = xVar.h();
            if (i14 == 0) {
                throw new UnsupportedOperationException();
            }
            if (i12 == 6 || i12 == 20) {
                xVar.r(3);
            }
            if (zH) {
                if (i12 == 22) {
                    xVar.r(16);
                }
                if (i12 == 17 || i12 == 19 || i12 == 20 || i12 == 23) {
                    xVar.r(3);
                }
                xVar.r(1);
            }
            switch (i12) {
                case 17:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                    int i17 = xVar.i(2);
                    if (i17 == 2 || i17 == 3) {
                        throw ParserException.b("Unsupported epConfig: " + i17);
                    }
            }
        }
        int i18 = f59655b[i14];
        if (i18 != -1) {
            return new com.google.android.gms.internal.consent_sdk.a(strH, i5, i18, 2);
        }
        throw ParserException.a(null, null);
    }

    public static int g(int i5) {
        int i11;
        int i12;
        if ((i5 & (-2097152)) == -2097152 && (i11 = (i5 >>> 19) & 3) != 1 && (i12 = (i5 >>> 17) & 3) != 0) {
            int i13 = (i5 >>> 12) & 15;
            int i14 = (i5 >>> 10) & 3;
            if (i13 != 0 && i13 != 15 && i14 != 3) {
                if (i12 == 1) {
                    return i11 == 3 ? 1152 : 576;
                }
                if (i12 == 2) {
                    return 1152;
                }
                if (i12 == 3) {
                    return 384;
                }
                throw new IllegalArgumentException();
            }
        }
        return -1;
    }
}
