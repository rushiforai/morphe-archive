package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import com.facebook.ads.androidx.media3.exoplayer.offline.Download;
import com.facebook.ads.androidx.media3.exoplayer.offline.DownloadRequest;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.To, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class HandlerC1258To extends Handler {
    public static byte[] A0D;
    public static String[] A0E = {"UwA8Qp2yDDuckZJOVe4irll7ZQPoGZoD", "hKBSfgRiZ2j0dJAFWpeEPTE8ASbuF2Yc", "7kHSZWcHK5TSpAUU1NAIxvfOb882Ngvs", "W97hdg2gujpUnTGsEW13ENYNotehvrwT", "gKT9t4MlatwEywdhUCsuZIADJ9Vp3nvA", "0SX4RX0bHUmJxVYLlaCFXcxKrDCt1AVH", "97Mtv7xLtHyCqp2lt2i222tn2GcShKKT", "2h5YOXpUBVVqRgG1rLc2q2DLhGpYe7nL"};
    public boolean A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public boolean A05;
    public boolean A06;
    public final Handler A07;
    public final HandlerThread A08;
    public final U5 A09;
    public final InterfaceC1214Rw A0A;
    public final ArrayList<TW> A0B;
    public final HashMap<String, S0> A0C;

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 42);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0D() {
        A0D = new byte[]{-114, -126, -39, 4, 12, 3, 1, 4, -10, -7, -30, -10, 3, -10, -4, -6, 7, -44, -17, -9, -6, -13, -14, -82, 2, -3, -82, -6, -3, -17, -14, -82, -14, -3, 5, -4, -6, -3, -17, -14, -56, -82, -91, -64, -56, -53, -60, -61, AbstractJsonLexerKt.TC_INVALID, -45, -50, AbstractJsonLexerKt.TC_INVALID, -53, -50, -64, -61, AbstractJsonLexerKt.TC_INVALID, -61, -50, -42, -51, -53, -50, -64, -61, -46, -115, -42, -15, -7, -4, -11, -12, -80, 4, -1, -80, -4, -1, -15, -12, -80, -7, -2, -12, -11, 8, -66, -71, -44, -36, -33, -40, -41, -109, -25, -30, -109, -27, -40, -32, -30, -23, -40, -109, -39, -27, -30, -32, -109, -41, -44, -25, -44, -43, -44, -26, -40, -118, -91, -83, -80, -87, -88, 100, -72, -77, 100, -74, -87, -79, -77, -70, -87, 100, -78, -77, -78, -87, -68, -83, -73, -72, -87, -78, -72, 100, -88, -77, -69, -78, -80, -77, -91, -88, 126, 100, -117, -90, -82, -79, -86, -87, 101, -71, -76, 101, -72, -86, -71, 101, -78, -90, -77, -70, -90, -79, 101, -72, -71, -76, -75, 101, -73, -86, -90, -72, -76, -77, -52, -25, -17, -14, -21, -22, -90, -6, -11, -90, -7, -21, -6, -90, -13, -25, -12, -5, -25, -14, -90, -7, -6, -11, -10, -90, -8, -21, -25, -7, -11, -12, -64, -90, -89, -62, -54, -51, -58, -59, -127, -43, -48, -127, -42, -47, -59, -62, -43, -58, -127, -54, -49, -59, -58, -39, -113, -69, -56, -38, -46, -121, -51, -56, -48, -45, -52, -53, -95, -121};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 17 out of bounds for length 17
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private void A0Q(DownloadRequest downloadRequest, int i5) {
        TW twA06 = A06(downloadRequest.A02, true);
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (twA06 != null) {
            A03(C1261Tr.A00(twA06, downloadRequest, i5, jCurrentTimeMillis));
        } else {
            A03(new TW(downloadRequest, i5 != 0 ? 1 : 0, jCurrentTimeMillis, jCurrentTimeMillis, -1L, i5, 0));
        }
        A0B();
    }

    static {
        A0D();
    }

    public HandlerC1258To(HandlerThread handlerThread, InterfaceC1214Rw interfaceC1214Rw, U5 u5, Handler handler, int i5, int i11, boolean z11) {
        super(handlerThread.getLooper());
        this.A08 = handlerThread;
        this.A0A = interfaceC1214Rw;
        this.A09 = u5;
        this.A07 = handler;
        this.A02 = i5;
        this.A03 = i11;
        this.A05 = z11;
        this.A0B = new ArrayList<>();
        this.A0C = new HashMap<>();
    }

    public static int A00(TW tw2, TW tw3) {
        return N1.A08(tw2.A05, tw3.A05);
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int A02(String str) {
        for (int i5 = 0; i5 < i; i5++) {
            if (this.A0B.get(i5).A07.A02.equals(str)) {
                return i5;
            }
        }
        return -1;
    }

    private TW A03(TW tw2) {
        AbstractC1062Ln.A08((tw2.A02 == 3 || tw2.A02 == 4) ? false : true);
        int iA02 = A02(tw2.A07.A02);
        if (iA02 == -1) {
            this.A0B.add(tw2);
            Collections.sort(this.A0B, new C1257Tn());
        } else {
            long j11 = tw2.A05;
            long j12 = this.A0B.get(iA02).A05;
            String[] strArr = A0E;
            String str = strArr[6];
            String str2 = strArr[7];
            int iCharAt = str.charAt(19);
            int changedIndex = str2.charAt(19);
            if (iCharAt != changedIndex) {
                throw new RuntimeException();
            }
            A0E[3] = "JdyDgc7FctZRVTtSFXQ7pi3holafYb2e";
            boolean z11 = j11 != j12;
            this.A0B.set(iA02, tw2);
            if (z11) {
                Collections.sort(this.A0B, new C1257Tn());
            }
        }
        try {
            this.A0A.AIS(tw2);
        } catch (IOException e3) {
            MV.A08(A08(2, 15, 107), A08(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 23, 55), e3);
        }
        this.A07.obtainMessage(2, new C1256Tm(tw2, false, new ArrayList(this.A0B), null)).sendToTarget();
        return tw2;
    }

    private TW A04(TW tw2, int i5, int i11) {
        AbstractC1062Ln.A08((i5 == 3 || i5 == 4) ? false : true);
        return A03(A05(tw2, i5, i11));
    }

    public static TW A05(TW tw2, int i5, int i11) {
        return new TW(tw2.A07, i5, tw2.A05, System.currentTimeMillis(), tw2.A04, i11, 0, tw2.A00);
    }

    private TW A06(String str, boolean z11) {
        int iA02 = A02(str);
        if (iA02 != -1) {
            return this.A0B.get(iA02);
        }
        if (z11) {
            try {
                return this.A0A.A8R(str);
            } catch (IOException e3) {
                MV.A08(A08(2, 15, 107), A08(17, 25, 100) + str, e3);
                return null;
            }
        }
        return null;
    }

    private S0 A07(S0 s02, TW tw2) {
        if (s02 != null) {
            AbstractC1062Ln.A08(!s02.A06);
            s02.A05(false);
            return s02;
        }
        if (!A0U() || this.A01 >= this.A02) {
            if (A0E[3].charAt(13) != 'T') {
                throw new RuntimeException();
            }
            String[] strArr = A0E;
            strArr[0] = "1BYwewq2j3ndp7UqWSZ9zjcNsKc3D7Wk";
            strArr[5] = "kGROXNJGPy0lCs3jBblxgu9ckPsqthLV";
            return null;
        }
        TW twA04 = A04(tw2, 2, 0);
        S0 s03 = new S0(twA04.A07, this.A09.A5v(twA04.A07), twA04.A00, false, this.A03, this);
        this.A0C.put(twA04.A07.A02, s03);
        int i5 = this.A01;
        this.A01 = i5 + 1;
        if (i5 == 0) {
            sendEmptyMessageDelayed(11, 5000L);
        }
        s03.start();
        return s03;
    }

    private void A09() {
        Iterator<S0> it = this.A0C.values().iterator();
        while (it.hasNext()) {
            it.next().A05(true);
        }
        try {
            this.A0A.AKg();
        } catch (IOException e3) {
            MV.A08(A08(2, 15, 107), A08(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 23, 55), e3);
        }
        this.A0B.clear();
        this.A08.quit();
        synchronized (this) {
            this.A00 = true;
            notifyAll();
        }
    }

    private void A0A() {
        String strA08 = A08(2, 15, 107);
        ArrayList arrayList = new ArrayList();
        try {
            S3 s3A8S = this.A0A.A8S(3, 4);
            while (s3A8S.A01()) {
                try {
                    arrayList.add(s3A8S.A00());
                } finally {
                }
            }
            if (s3A8S != null) {
                s3A8S.close();
            }
        } catch (IOException unused) {
            MV.A05(strA08, A08(42, 25, 53));
        }
        for (int i5 = 0; i5 < this.A0B.size(); i5++) {
            this.A0B.set(i5, A05(this.A0B.get(i5), 5, 0));
        }
        for (int i11 = 0; i11 < arrayList.size(); i11++) {
            this.A0B.add(A05((TW) arrayList.get(i11), 5, 0));
        }
        List<Download> terminalDownloads = this.A0B;
        Collections.sort(terminalDownloads, new C1257Tn());
        try {
            this.A0A.AL7();
        } catch (IOException e3) {
            MV.A08(strA08, A08(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 23, 55), e3);
        }
        ArrayList arrayList2 = new ArrayList(this.A0B);
        for (int i12 = 0; i12 < this.A0B.size(); i12++) {
            this.A07.obtainMessage(2, new C1256Tm(this.A0B.get(i12), false, arrayList2, null)).sendToTarget();
        }
        A0B();
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0008 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0B() {
        int i5 = 0;
        for (int i11 = 0; i11 < accumulatingDownloadTaskCount; i11++) {
            TW download = this.A0B.get(i11);
            S0 s0A07 = this.A0C.get(download.A07.A02);
            int accumulatingDownloadTaskCount = download.A02;
            switch (accumulatingDownloadTaskCount) {
                case 0:
                    s0A07 = A07(s0A07, download);
                    break;
                case 1:
                    A0M(s0A07);
                    break;
                case 2:
                    AbstractC1062Ln.A01(s0A07);
                    A0P(s0A07, download, i5);
                    break;
                case 3:
                case 4:
                case 6:
                default:
                    throw new IllegalStateException();
                case 5:
                case 7:
                    A0O(s0A07, download);
                    break;
            }
            if (s0A07 != null && !s0A07.A06) {
                i5++;
            }
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0C() {
        for (int i5 = 0; i5 < i; i5++) {
            TW tw2 = this.A0B.get(i5);
            if (tw2.A02 == 2) {
                try {
                    this.A0A.AIS(tw2);
                } catch (IOException e3) {
                    MV.A08(A08(2, 15, 107), A08(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 23, 55), e3);
                }
            }
        }
        sendEmptyMessageDelayed(11, 5000L);
    }

    private void A0E(int i5) throws IOException {
        this.A04 = i5;
        S3 s3A8S = null;
        try {
            try {
                this.A0A.AKg();
                s3A8S = this.A0A.A8S(0, 1, 2, 5, 7);
                while (s3A8S.A01()) {
                    this.A0B.add(s3A8S.A00());
                }
            } catch (IOException e3) {
                MV.A08(A08(2, 15, 107), A08(67, 21, 102), e3);
                this.A0B.clear();
            }
            N1.A10(s3A8S);
            this.A07.obtainMessage(0, new ArrayList(this.A0B)).sendToTarget();
            A0B();
        } catch (Throwable th2) {
            N1.A10(s3A8S);
            throw th2;
        }
    }

    private void A0F(int i5) {
        this.A02 = i5;
        A0B();
    }

    private void A0G(int i5) {
        this.A03 = i5;
    }

    private void A0H(int i5) {
        this.A04 = i5;
        A0B();
    }

    private void A0I(TW tw2) {
        if (tw2.A02 == 7) {
            int i5 = tw2.A03 == 0 ? 0 : 1;
            int state = tw2.A03;
            A04(tw2, i5, state);
            A0B();
            return;
        }
        this.A0B.remove(A02(tw2.A07.A02));
        try {
            this.A0A.AJi(tw2.A07.A02);
        } catch (IOException unused) {
            MV.A05(A08(2, 15, 107), A08(88, 30, 73));
        }
        this.A07.obtainMessage(2, new C1256Tm(tw2, true, new ArrayList(this.A0B), null)).sendToTarget();
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0043  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0J(TW tw2, int i5) {
        if (i5 == 0) {
            if (tw2.A02 == 1) {
                A04(tw2, 0, 0);
                return;
            }
            return;
        }
        if (i5 == tw2.A03) {
            return;
        }
        int i11 = tw2.A02;
        if (i11 != 0) {
            String[] strArr = A0E;
            if (strArr[6].charAt(19) != strArr[7].charAt(19)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0E;
            strArr2[0] = "8l9SG5h20tqJLjwb5v3spVftx6HT2RLS";
            strArr2[5] = "I7esPqKadVVgUdzdcSRhsNbo28gghaVs";
            if (i11 == 2) {
                i11 = 1;
            }
        }
        A03(new TW(tw2.A07, i11, tw2.A05, System.currentTimeMillis(), tw2.A04, i5, 0, tw2.A00));
    }

    private void A0K(TW tw2, Exception exc) {
        int i5;
        DownloadRequest downloadRequest = tw2.A07;
        int i11 = exc == null ? 3 : 4;
        long j11 = tw2.A05;
        long jCurrentTimeMillis = System.currentTimeMillis();
        long j12 = tw2.A04;
        int i12 = tw2.A03;
        if (exc == null) {
            i5 = 0;
        } else {
            i5 = 1;
        }
        TW tw3 = new TW(downloadRequest, i11, j11, jCurrentTimeMillis, j12, i12, i5, tw2.A00);
        this.A0B.remove(A02(tw3.A07.A02));
        try {
            this.A0A.AIS(tw3);
        } catch (IOException e3) {
            MV.A08(A08(2, 15, 107), A08(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 23, 55), e3);
        }
        this.A07.obtainMessage(2, new C1256Tm(tw3, false, new ArrayList(this.A0B), exc)).sendToTarget();
    }

    private void A0L(S0 s02) {
        String str = s02.A04.A02;
        this.A0C.remove(str);
        boolean z11 = s02.A06;
        if (z11) {
            this.A06 = false;
        } else {
            int i5 = this.A01 - 1;
            this.A01 = i5;
            if (i5 == 0) {
                removeMessages(11);
            }
        }
        if (!s02.A08) {
            Exception exc = s02.A01;
            if (exc != null) {
                StringBuilder sb2 = new StringBuilder();
                String downloadId = A08(246, 13, 61);
                StringBuilder sbAppend = sb2.append(downloadId).append(s02.A04);
                String downloadId2 = A08(0, 2, 56);
                String string = sbAppend.append(downloadId2).append(z11).toString();
                String downloadId3 = A08(2, 15, 107);
                MV.A08(downloadId3, string, exc);
            }
            TW tw2 = (TW) AbstractC1062Ln.A01(A06(str, false));
            switch (tw2.A02) {
                case 2:
                    AbstractC1062Ln.A08(!z11);
                    A0K(tw2, exc);
                    break;
                case 3:
                case 4:
                case 6:
                default:
                    throw new IllegalStateException();
                case 5:
                case 7:
                    AbstractC1062Ln.A08(z11);
                    A0I(tw2);
                    break;
            }
            A0B();
            return;
        }
        A0B();
    }

    private void A0M(S0 s02) {
        if (s02 != null) {
            AbstractC1062Ln.A08(!s02.A06);
            s02.A05(false);
        }
    }

    private void A0N(S0 s02, long j11) {
        TW tw2 = (TW) AbstractC1062Ln.A01(A06(s02.A04.A02, false));
        if (j11 == tw2.A04 || j11 == -1) {
            return;
        }
        A03(new TW(tw2.A07, tw2.A02, tw2.A05, System.currentTimeMillis(), j11, tw2.A03, tw2.A01, tw2.A00));
    }

    private void A0O(S0 s02, TW tw2) {
        if (s02 != null) {
            if (!s02.A06) {
                s02.A05(false);
            }
        } else {
            if (this.A06) {
                return;
            }
            S0 s03 = new S0(tw2.A07, this.A09.A5v(tw2.A07), tw2.A00, true, this.A03, this);
            this.A0C.put(tw2.A07.A02, s03);
            this.A06 = true;
            s03.start();
        }
    }

    private void A0P(S0 s02, TW tw2, int i5) {
        AbstractC1062Ln.A08(!s02.A06);
        if (!A0U() || i5 >= this.A02) {
            A04(tw2, 0, 0);
            s02.A05(false);
        }
    }

    private void A0R(String str) {
        TW twA06 = A06(str, true);
        if (twA06 == null) {
            MV.A05(A08(2, 15, 107), A08(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 39, 26) + str);
        } else {
            A04(twA06, 5, 0);
            A0B();
        }
    }

    private void A0S(String str, int i5) {
        String strA08 = A08(2, 15, 107);
        if (str == null) {
            for (int i11 = 0; i11 < this.A0B.size(); i11++) {
                A0J(this.A0B.get(i11), i5);
            }
            try {
                this.A0A.AL8(i5);
            } catch (IOException e3) {
                MV.A08(strA08, A08(157, 32, 27), e3);
            }
        } else {
            TW twA06 = A06(str, false);
            if (twA06 != null) {
                A0J(twA06, i5);
            } else {
                try {
                    this.A0A.AL9(str, i5);
                } catch (IOException e11) {
                    MV.A08(strA08, A08(189, 34, 92) + str, e11);
                }
            }
        }
        A0B();
    }

    private void A0T(boolean z11) {
        this.A05 = z11;
        A0B();
    }

    private boolean A0U() {
        return !this.A05 && this.A04 == 0;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        boolean z11 = true;
        try {
            switch (message.what) {
                case 0:
                    A0E(message.arg1);
                    break;
                case 1:
                    A0T(message.arg1 != 0);
                    break;
                case 2:
                    A0H(message.arg1);
                    break;
                case 3:
                    A0S((String) message.obj, message.arg1);
                    break;
                case 4:
                    A0F(message.arg1);
                    break;
                case 5:
                    A0G(message.arg1);
                    break;
                case 6:
                    A0Q((DownloadRequest) message.obj, message.arg1);
                    break;
                case 7:
                    A0R((String) message.obj);
                    break;
                case 8:
                    A0A();
                    break;
                case 9:
                    A0L((S0) message.obj);
                    z11 = false;
                    break;
                case 10:
                    A0N((S0) message.obj, N1.A0N(message.arg1, message.arg2));
                    return;
                case 11:
                    A0C();
                    return;
                case 12:
                    A09();
                    return;
                default:
                    throw new IllegalStateException();
            }
            this.A07.obtainMessage(1, z11 ? 1 : 0, this.A0C.size()).sendToTarget();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
