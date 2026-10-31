package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.os.Handler;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2b, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C05882b {
    public static byte[] A0J;
    public static String[] A0K = {"YcCIPLCDTe1wGTKdO7xqYhpFwQzvmXtt", "FfIdHaSVTal814YVh5tJNVr21T0wsSAo", "HLDls6wic6LzndIKtUvgWnGJ4QMP07cO", "ccYpD8PuArRKO9YkPTuVfhIh5pDN1br2", "LFFD576NBTVByEN649EglQB81U0zBBuc", "sO5gz1O188I9hNkbLLxzl8j4JWiDgVKK", "Hord6YvHX1lmSPmhXyMRW660HCYjcXOm", "5HbQDpK1pfSpB47EOovGOWVGJlrw1BSl"};
    public static final C2c A0L;
    public C2f A00;
    public boolean A01;
    public boolean A02;
    public final Rect A03;
    public final Rect A04;
    public final Handler A05;
    public final YO A06;
    public final AnonymousClass30 A07;
    public final InterfaceC05952p A08;
    public final InterfaceC05942o A09;
    public final AnonymousClass13 A0A;
    public final C05892e A0B;
    public final AnonymousClass12 A0C;
    public final Runnable A0D;
    public final List<Rect> A0E;
    public final List<C2K> A0F;
    public final List<C05912l<?, ?>> A0G;
    public final List<Rect> A0H;
    public final Map<String, Set<String>> A0I;

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0J, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 73);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A0J = new byte[]{-48, -11, -14, -16, -8, -83, -13, -18, -10, -7, -14, -15, -69, -97, -78, -82, -64, -71, -72, -78, -73, -67, -100, -84, -86, -73, -73, -82, -69, 105, -84, -69, -82, -86, -67, -82, -83, 105, -79, -82, -69, -82, -93, -74, -78, -60, -67, -68, -74, -69, -63, -96, -80, -82, -69, -69, -78, -65, 123, -78, -69, -79, -94, -67, -79, -82, -63, -78, -90, -71, -75, -57, -64, -65, -71, -66, -60, -93, -77, -79, -66, -66, -75, -62, 126, -73, -75, -60, -107, -68, -71, -73, -71, -78, -68, -75, -90, -71, -75, -57, -61, -6, 13, 9, 27, 20, 19, 13, 18, 24, -9, 7, 5, 18, 18, 9, 22, -46, 13, 24, 9, 22, 5, 24, 9, -26, -7, -11, 7, 0, -1, -7, -2, 4, -29, -13, -15, -2, -2, -11, 2, -66, -2, -1, 4, -7, -10, 9, -26, -7, -11, 7, 3, -33, -10, -10, -29, -13, 2, -11, -11, -2, -34, -15, -19, -1, -8, -9, -15, -10, -4, -37, -21, -23, -10, -10, -19, -6, -74, -8, -23, -3, -5, -19, -44, -15, -5, -4, -19, -10, -15, -10, -17, -25, -6, -10, 8, 1, 0, -6, -1, 5, -28, -12, -14, -1, -1, -10, 3, -65, 1, -10, 3, -9, 0, 3, -2, -28, -12, -14, -1, -11, 8, 4, 22, 15, 14, 8, 13, 19, -14, 2, 0, 13, 13, 4, 17, -51, 18, 19, 0, 17, 19, -21, 8, 18, 19, 4, 13, 8, 13, 6, -1, 8, 11, -1, 7, 19, 12, 25, 15, 23, 16, 29, -57, -47, -83, -63, -63, -54, -45, -62, -61, -62, 7, 14, 2, -32, 12, 11, 3, 6, 4, 21, 8, 22, 8, 23, 47, 31, 29, 42, 8, 37, 47, 48, 33, 42, 33, 46, 61, 56, 44, 41, 60, 45, -27, -40, -44, -26, -33, -34, -40, -35, -29, -78, -34, -35, -29, -48, -40, -35, -44, -31, -10, -23, -27, -9, -16, -17, -23, -18, -12, -46, -27, -25, -23, -13, -12, -14, -7, 62, 49, 45, 63, 56, 55, 49, 54, 60, 27, 54, 41, 56, 59, 48, 55, 60, 26, 45, 44, 61, 43, 45, 58};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private final void A07(long j11) {
        C2Q.A01.A02(A05(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 37, 71));
        if (!this.A0F.isEmpty()) {
            throw new IllegalStateException(A05(0, 13, 68));
        }
        this.A09.AAD(this.A0E);
        C2Y.A02(this.A0C, j11, this.A0E, null, 4, null);
        this.A0C.A6y(null);
    }

    static {
        A06();
        A0L = new C2c(null);
    }

    public C05882b(AnonymousClass13 anonymousClass13, InterfaceC05942o interfaceC05942o, YO yo2, AnonymousClass12 anonymousClass12, C05892e c05892e, InterfaceC05952p interfaceC05952p, Handler handler, AnonymousClass30 anonymousClass30, final int i5) {
        C1h.A09(anonymousClass13, A05(275, 8, 84));
        C1h.A09(interfaceC05942o, A05(306, 18, 38));
        C1h.A09(yo2, A05(252, 5, 83));
        C1h.A09(anonymousClass12, A05(341, 24, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
        C1h.A09(c05892e, A05(324, 17, 55));
        C1h.A09(handler, A05(257, 7, 98));
        this.A0A = anonymousClass13;
        this.A09 = interfaceC05942o;
        this.A06 = yo2;
        this.A0C = anonymousClass12;
        this.A0B = c05892e;
        this.A08 = interfaceC05952p;
        this.A05 = handler;
        this.A07 = anonymousClass30;
        this.A04 = new Rect();
        this.A03 = new Rect();
        this.A0H = new ArrayList();
        this.A0F = new ArrayList();
        this.A0G = new ArrayList();
        this.A0I = new HashMap();
        this.A0E = new ArrayList();
        final Exception exc = new Exception(A05(13, 29, 0));
        this.A0D = new Runnable() { // from class: com.facebook.ads.redexgen.X.2d
            public static byte[] A03;
            public static String[] A04 = {"dpzU5luUOUHn3PWLQSytUkpXF5uf76Gb", "OIXAlbgxv8lxL6Dw2D3vNQ6xborOE6Ab", "016lHYH9eT2TKwrcc2bnFjN8P1e", "T3DTHKpc", "xtrZuPGJxZVhMxMYehMPzz7RP9cUVZ", "GHqsJR2NBv7dmhvhUyJ2cgs96CqPd5ri", "JC4MWKMVQLy9m", "a7WpfUfSeSK3qdCMwJm40hXORQEICpVd"};

            public static String A00(int i11, int i12, int i13) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i11, i11 + i12);
                for (int i14 = 0; i14 < bArrCopyOfRange.length; i14++) {
                    bArrCopyOfRange[i14] = (byte) ((bArrCopyOfRange[i14] ^ i13) ^ Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A01() {
                A03 = new byte[]{75, 73, 88, 104, 73, 64, 77, 85};
            }

            static {
                A01();
            }

            @Override // java.lang.Runnable
            public final void run() throws Throwable {
                if (AbstractC2311oi.A02(this)) {
                    return;
                }
                try {
                    try {
                        if (this.A01.A0J()) {
                            if (!AnonymousClass14.A0E || !this.A01.A0C()) {
                                if (!this.A01.A02 && (!AnonymousClass14.A0D || !this.A01.A0B.A0D())) {
                                    this.A01.A08(this.A01.A06.ADW());
                                }
                                C05882b.A02(this.A01);
                                if (A04[4].length() == 16) {
                                    throw new RuntimeException();
                                }
                                A04[3] = "b6O1Nd";
                                if (0 == 0) {
                                    int delay = i5;
                                    this.A01.A05.postDelayed(this.A01.A0D, delay);
                                    return;
                                } else {
                                    C05882b.A02(this.A01);
                                    throw new NullPointerException(A00(0, 8, 81));
                                }
                            }
                            this.A01.A0F();
                        }
                    } catch (Exception ex2) {
                        C2A.A02(ex2, exc);
                        throw ex2;
                    }
                } catch (Throwable th2) {
                    AbstractC2311oi.A00(th2, this);
                }
            }
        };
    }

    public /* synthetic */ C05882b(AnonymousClass13 anonymousClass13, InterfaceC05942o interfaceC05942o, YO yo2, AnonymousClass12 anonymousClass12, C05892e c05892e, InterfaceC05952p interfaceC05952p, Handler handler, AnonymousClass30 anonymousClass30, int i5, int i11, AbstractC05811i abstractC05811i) {
        this(anonymousClass13, interfaceC05942o, yo2, anonymousClass12, c05892e, interfaceC05952p, handler, anonymousClass30, (i11 & 256) != 0 ? 100 : i5);
    }

    public static final /* synthetic */ AnonymousClass30 A02(C05882b c05882b) {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0118 A[Catch: all -> 0x0153, TryCatch #0 {, blocks: (B:3:0x000f, B:10:0x0043, B:12:0x004b, B:14:0x0053, B:19:0x0081, B:21:0x008b, B:22:0x008d, B:24:0x0094, B:41:0x0101, B:43:0x0114, B:45:0x0118, B:48:0x011e, B:49:0x012c, B:50:0x012d, B:53:0x013e, B:26:0x009c, B:30:0x00b2, B:40:0x0100, B:31:0x00cd, B:27:0x00a1, B:55:0x0140, B:56:0x0141, B:57:0x0146, B:58:0x0147, B:59:0x014c, B:60:0x014d, B:61:0x0152, B:42:0x010d, B:32:0x00d0, B:33:0x00d6, B:35:0x00dc, B:37:0x00e8, B:38:0x00f5, B:15:0x005f, B:17:0x0065, B:18:0x0073), top: B:64:0x000f, inners: #1, #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x011e A[Catch: all -> 0x0153, TryCatch #0 {, blocks: (B:3:0x000f, B:10:0x0043, B:12:0x004b, B:14:0x0053, B:19:0x0081, B:21:0x008b, B:22:0x008d, B:24:0x0094, B:41:0x0101, B:43:0x0114, B:45:0x0118, B:48:0x011e, B:49:0x012c, B:50:0x012d, B:53:0x013e, B:26:0x009c, B:30:0x00b2, B:40:0x0100, B:31:0x00cd, B:27:0x00a1, B:55:0x0140, B:56:0x0141, B:57:0x0146, B:58:0x0147, B:59:0x014c, B:60:0x014d, B:61:0x0152, B:42:0x010d, B:32:0x00d0, B:33:0x00d6, B:35:0x00dc, B:37:0x00e8, B:38:0x00f5, B:15:0x005f, B:17:0x0065, B:18:0x0073), top: B:64:0x000f, inners: #1, #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x012d A[Catch: all -> 0x0153, TryCatch #0 {, blocks: (B:3:0x000f, B:10:0x0043, B:12:0x004b, B:14:0x0053, B:19:0x0081, B:21:0x008b, B:22:0x008d, B:24:0x0094, B:41:0x0101, B:43:0x0114, B:45:0x0118, B:48:0x011e, B:49:0x012c, B:50:0x012d, B:53:0x013e, B:26:0x009c, B:30:0x00b2, B:40:0x0100, B:31:0x00cd, B:27:0x00a1, B:55:0x0140, B:56:0x0141, B:57:0x0146, B:58:0x0147, B:59:0x014c, B:60:0x014d, B:61:0x0152, B:42:0x010d, B:32:0x00d0, B:33:0x00d6, B:35:0x00dc, B:37:0x00e8, B:38:0x00f5, B:15:0x005f, B:17:0x0065, B:18:0x0073), top: B:64:0x000f, inners: #1, #2, #3 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A08(long j11) {
        C2f c2f;
        C2Q c2q = C2Q.A01;
        c2q.A02(A05(193, 28, 72));
        this.A09.AAD(this.A0E);
        boolean zIsEmpty = this.A0F.isEmpty();
        String strA05 = A05(0, 13, 68);
        if (A0K[0].charAt(21) != 'h') {
            throw new RuntimeException();
        }
        A0K[6] = "BhrT0c14O8Thrmtg3HRzOfRcpCyh5HNl";
        if (zIsEmpty) {
            if (this.A0G.isEmpty()) {
                if (this.A0I.isEmpty()) {
                    c2q.A02(A05(68, 33, 7));
                    if (this.A0A.A00) {
                        this.A0B.A0C(this.A0F, this.A0G, this.A0I);
                    } else {
                        C05892e.A04(this.A0B, this.A0F, this.A0G, null, 4, null);
                    }
                    this.A0C.A58(j11, this.A0E, this.A0A.A00 ? this.A0I : C0X.A02());
                    if (!AnonymousClass14.A0C || !this.A0F.isEmpty()) {
                        boolean zA04 = c2q.A04();
                        String strA052 = A05(101, 24, 91);
                        if (zA04) {
                            c2q.A03(strA052, new String[]{A05(274, 1, 80), String.valueOf(this.A0F.size())});
                        } else {
                            c2q.A02(strA052);
                        }
                        for (C2K node : this.A0F) {
                            if (this.A0A.A01) {
                                this.A0B.A0B(node, new C0P(this, node));
                            } else {
                                A0B(node, this.A0B.A06(node));
                            }
                        }
                        c2q.A02(A05(42, 26, 4));
                        this.A0C.A6y(this.A0G);
                        c2f = this.A00;
                        if (c2f != null) {
                            c2f.AGx();
                        }
                        if (0 == 0) {
                            throw new NullPointerException(A05(300, 6, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
                        }
                        this.A0F.clear();
                        this.A0G.clear();
                        this.A0I.clear();
                        return;
                    }
                    c2q.A02(A05(42, 26, 4));
                    this.A0C.A6y(this.A0G);
                    c2f = this.A00;
                    if (c2f != null) {
                    }
                    if (0 == 0) {
                    }
                }
                throw new IllegalStateException(strA05);
            }
            throw new IllegalStateException(strA05);
        }
        throw new IllegalStateException(strA05);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void A0B(C2K c2k, C05912l<?, ?> c05912l) {
        Iterator<Rect> it = this.A0E.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            if (A0K[6].charAt(25) != 'C') {
                throw new RuntimeException();
            }
            A0K[6] = "DbpKBikhSzMhYYMJnUcuasdh4CzkqUOd";
            if (zHasNext) {
                Rect next = it.next();
                Rect containerRect = this.A04;
                if (c2k.AAC(containerRect, this.A03, next) && c05912l != C05912l.A0C) {
                    if (0 != 0) {
                        throw new NullPointerException(A05(264, 10, 21));
                    }
                    if (0 != 0) {
                        for (Rect rect : this.A0H) {
                            AnonymousClass12 anonymousClass12 = this.A0C;
                            Rect containerRect2 = this.A03;
                            anonymousClass12.A4W(c05912l, rect, containerRect2, this.A0A.A02);
                        }
                    } else {
                        AnonymousClass12 anonymousClass122 = this.A0C;
                        Rect rect2 = this.A04;
                        Rect containerRect3 = this.A03;
                        anonymousClass122.A4W(c05912l, rect2, containerRect3, this.A0A.A02);
                    }
                }
            } else {
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean A0C() {
        Context contextA85 = this.A09.A85();
        if (contextA85 == null) {
            return true;
        }
        C2c c2c = A0L;
        String[] strArr = A0K;
        if (strArr[1].charAt(9) == strArr[3].charAt(9)) {
            throw new RuntimeException();
        }
        A0K[7] = "gOrYAF6fC2zZGMEvJdSO0uir6tmGF8PP";
        Activity activityA00 = c2c.A00(contextA85);
        return activityA00 != null && activityA00.isDestroyed();
    }

    public final void A0F() {
        C2Q.A01.A02(A05(162, 31, 63));
        C2f localScanListener = this.A00;
        if (localScanListener != null) {
            localScanListener.AGx();
        }
        if (this.A01) {
            this.A05.removeCallbacks(this.A0D);
            A07(this.A06.ADW());
        }
        this.A01 = false;
    }

    public final void A0G() {
        C2Q.A01.A02(A05(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 31, 86));
        if (!this.A01) {
            this.A01 = true;
            this.A02 = false;
            this.A05.post(this.A0D);
            if (0 != 0) {
                throw new NullPointerException(A05(283, 5, 90));
            }
        }
    }

    public final void A0H(C2i c2i) {
        this.A0C.ALC(c2i);
    }

    public final void A0I(C2f c2f) {
        C1h.A09(c2f, A05(288, 12, 115));
        this.A00 = c2f;
    }

    public final boolean A0J() {
        return this.A01;
    }
}
