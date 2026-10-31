package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.SparseArray;
import com.facebook.ads.androidx.media3.exoplayer.offline.DownloadRequest;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Arrays;
import java.util.concurrent.Executors;

/* renamed from: com.facebook.ads.redexgen.X.cP, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1562cP {
    public static ND A06;
    public static C1261Tr A07;
    public static InterfaceC1671eB A08;
    public static C1562cP A09;
    public static File A0A;
    public static byte[] A0B;
    public boolean A00;
    public final C0957Hh A04;
    public final Handler A01 = new Handler(Looper.getMainLooper());
    public final SparseArray<C1570cX> A02 = new SparseArray<>();
    public final Runnable A05 = new RunnableC1575cc(this);
    public final InterfaceC1260Tq A03 = new C0772Ad(this);

    static {
        A0D();
    }

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 103);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0D() {
        A0B = new byte[]{-103, -90, -103, -37, -14, -19, -34, -20, -40, -35, -24, -16, -25, -27, -24, -38, -35, -34, -35, -77, -69, -56, -69, 11, 0, 13, -2, 0, 9, 15, -4, 2, 0, -69, -1, 10, 18, 9, 7, 10, -4, -1, 0, -1, -43, -60, -47, -60, 23, 24, 5, 24, 9, -34, -10, 24, 79, 74, 59, 73, 16, -10, -96, -30, -7, -12, -27, -13, -96, -19, -19, -19, -19, -32, 50, 37, 49, 53, 37, 51, 52, 9, 36, -6, -69, -26, -18, -27, -29, -26, -40, -37, -36, -37, -91, -105, -54, -21, -40, -21, -36, -79, -105, 5, 50, 50, 47, 50, -18, -32, 19, 52, 33, 52, 37, -6, -32, -55, -42, -24, -32, 21, 24, 34, 43, -31, 24, 35, 43, 34, 32, 35, 21, 24, 39, 20, 23, 38, -43, -45, -43, -38, -41};
    }

    public C1562cP(C0957Hh c0957Hh, C1261Tr c1261Tr) {
        this.A04 = c0957Hh;
        if (c1261Tr != null) {
            A07 = c1261Tr;
            c1261Tr.A0F(this.A03);
        }
        A03().A0E();
    }

    public static synchronized ND A01(Context context) {
        if (A06 == null) {
            A06 = new TR(context);
        }
        return A06;
    }

    private C9H A02() {
        return new C9H().A01(A08(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 3, 76)).A00(null);
    }

    private synchronized C1261Tr A03() {
        A0E();
        return A07;
    }

    public static synchronized InterfaceC1671eB A04(Context context) {
        if (A08 == null) {
            A08 = new MT(new File(A07(context), A08(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 14, 77)), new C07317x(C2203mv.A0R(context)));
        }
        return A08;
    }

    public static C1086Mm A05(TD td2, InterfaceC1671eB interfaceC1671eB) {
        return new C1086Mm().A06(interfaceC1671eB).A05(td2).A04(new T8()).A03(2);
    }

    public static synchronized C1562cP A06(C0957Hh c0957Hh) {
        if (A09 == null) {
            A09 = new C1562cP(c0957Hh, null);
        }
        return A09;
    }

    public static synchronized File A07(Context context) {
        if (A0A == null) {
            A0A = context.getCacheDir();
            if (A0A == null) {
                A0A = context.getFilesDir();
            }
        }
        return A0A;
    }

    public static String A09(C0957Hh c0957Hh, Uri uri) {
        try {
            if (!C2203mv.A1w(c0957Hh)) {
                return null;
            }
            return new URI(uri.getScheme(), uri.getAuthority(), uri.getPath(), null, uri.getFragment()).toString();
        } catch (URISyntaxException e3) {
            c0957Hh.A08().ABz(A08(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 5, 11), AbstractC2126lf.A0u, new C2127lg(e3));
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0A() {
        for (TW tw2 : A03().A0D()) {
            int iHashCode = tw2.A07.A02.hashCode();
            C1570cX c1570cX = this.A02.get(iHashCode);
            boolean z11 = tw2.A02 == 2 && tw2.A01() > 0;
            String str = A08(69, 15, 89) + iHashCode + A08(20, 25, 52) + tw2.A00() + A08(0, 20, 18) + tw2.A01() + A08(45, 9, 61) + tw2.A02;
            if (c1570cX != null) {
                int i5 = tw2.A02;
                if (i5 == 3 || z11 || tw2.A00() >= 100.0f || tw2.A01() > c1570cX.A00) {
                    String str2 = A08(84, 19, 16) + i5 + A08(54, 8, 111) + tw2.A01();
                    c1570cX.A01.AEl(c1570cX.A02);
                    this.A02.remove(iHashCode);
                } else if (i5 == 4 || i5 == 1) {
                    String str3 = A08(103, 14, 89) + i5;
                    c1570cX.A01.AEt(new Throwable(String.valueOf(tw2.A01)));
                    this.A02.remove(iHashCode);
                }
            }
            String str4 = A08(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 4, 14) + iHashCode + A08(62, 7, 25) + tw2.A01();
        }
    }

    private void A0B() {
        if (!this.A00) {
            this.A00 = true;
            this.A01.post(this.A05);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0C() {
        this.A01.removeCallbacks(this.A05);
        this.A00 = false;
    }

    private synchronized void A0E() {
        if (A07 == null) {
            A07 = new C1261Tr(this.A04, A01(this.A04), A04(this.A04), A0H(this.A04), Executors.newFixedThreadPool(6));
            A07.A0F(this.A03);
        }
    }

    public final NN A0H(Context context) {
        return A05(new TD(context, (InterfaceC1108Ni) null, A02()), A04(context));
    }

    public final void A0I(Uri uri, InterfaceC1563cQ interfaceC1563cQ, long j11) {
        String cacheKey = A09(this.A04, uri);
        if (cacheKey == null) {
            cacheKey = uri.toString();
        }
        boolean zA0J = A0J(cacheKey);
        DownloadRequest downloadRequestA05 = new C1264Tu(uri.toString(), uri).A00(cacheKey).A05();
        A03().A0G(downloadRequestA05);
        this.A02.put(downloadRequestA05.A02.hashCode(), new C1570cX(interfaceC1563cQ, j11, zA0J, null));
        A0B();
    }

    public final boolean A0J(String str) {
        return A04(this.A04).A7m(str, 0L, 1L) > 0;
    }
}
