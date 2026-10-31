package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import com.facebook.ads.androidx.media3.exoplayer.offline.DownloadRequest;
import com.facebook.ads.androidx.media3.exoplayer.scheduler.Requirements;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.Executor;

/* renamed from: com.facebook.ads.redexgen.X.Tr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1261Tr {
    public static byte[] A0G;
    public static String[] A0H = {"Oa0AxzF3H", "BtRyrqu6RTm", "N", "OPQ0Y4w6r0z03hYE8U3KqqomxIJZ2", "xfRLkNoVSAgn242Wp", "U6Rvuvos0L1tDIEEvYa", "x03fLqe", "BZ5pywAUPVBgV9E1L9uBrs1xPQCkFzfu"};
    public static final Requirements A0I;
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public UJ A05;
    public List<TW> A06;
    public boolean A07;
    public boolean A08;
    public boolean A09;
    public final Context A0A;
    public final Handler A0B;
    public final HandlerC1258To A0C;
    public final InterfaceC1214Rw A0D;
    public final UF A0E;
    public final CopyOnWriteArraySet<InterfaceC1260Tq> A0F;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0G, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A0H[1].length() != 11) {
                throw new RuntimeException();
            }
            A0H[2] = "IT7qXUHk";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 16);
            i13++;
        }
    }

    public static void A03() {
        byte[] bArr = {-81, -30, -39, -70, -42, -53, -29, -49, -36, -92, -82, -39, -31, -40, -42, -39, -53, -50, -73, -53, -40, -53, -47, -49, -36};
        String[] strArr = A0H;
        if (strArr[3].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        A0H[4] = "FwviogkCPu2cZmsnt";
        A0G = bArr;
    }

    static {
        A03();
        A0I = new Requirements(1);
    }

    public C1261Tr(Context context, ND nd2, InterfaceC1671eB interfaceC1671eB, NN nn2, Executor executor) {
        this(context, new C8u(nd2), new S2(new C1086Mm().A06(interfaceC1671eB).A05(nn2), executor));
    }

    public C1261Tr(Context context, InterfaceC1214Rw interfaceC1214Rw, U5 u5) {
        this.A0A = context.getApplicationContext();
        this.A0D = interfaceC1214Rw;
        this.A01 = 3;
        this.A02 = 5;
        this.A07 = true;
        this.A06 = Collections.emptyList();
        this.A0F = new CopyOnWriteArraySet<>();
        Handler handlerA0b = N1.A0b(new Handler.Callback() { // from class: com.facebook.ads.redexgen.X.Tk
            @Override // android.os.Handler.Callback
            public final boolean handleMessage(Message message) {
                return this.A00.A0B(message);
            }
        });
        this.A0B = handlerA0b;
        HandlerThread handlerThread = new HandlerThread(A01(0, 25, 90));
        handlerThread.start();
        this.A0C = new HandlerC1258To(handlerThread, interfaceC1214Rw, u5, handlerA0b, this.A01, this.A02, this.A07);
        UF requirementsListener = new UF() { // from class: com.facebook.ads.redexgen.X.S1
            @Override // com.facebook.ads.redexgen.X.UF
            public final void AGo(UJ uj, int i5) {
                this.A00.A07(uj, i5);
            }
        };
        this.A0E = requirementsListener;
        this.A05 = new UJ(context, requirementsListener, A0I);
        this.A03 = this.A05.A09();
        this.A04 = 1;
        this.A0C.obtainMessage(0, this.A03, 0).sendToTarget();
    }

    public static TW A00(TW tw2, DownloadRequest downloadRequest, int i5, long j11) {
        long j12;
        int i11;
        int i12 = tw2.A02;
        if (i12 == 5 || tw2.A02()) {
            j12 = j11;
        } else {
            j12 = tw2.A05;
        }
        if (i12 == 5 || i12 == 7) {
            i11 = 7;
        } else if (i5 != 0) {
            i11 = 1;
        } else {
            i11 = 0;
        }
        return new TW(tw2.A07.A02(downloadRequest), i11, j12, j11, -1L, i5, 0);
    }

    private void A02() {
        Iterator<InterfaceC1260Tq> it = this.A0F.iterator();
        while (it.hasNext()) {
            InterfaceC1260Tq listener = it.next();
            listener.AHp(this, this.A09);
        }
    }

    private void A04(int i5, int i11) {
        this.A04 -= i5;
        this.A00 = i11;
        if (A0I()) {
            Iterator<InterfaceC1260Tq> it = this.A0F.iterator();
            while (it.hasNext()) {
                it.next().AF9(this);
            }
        }
    }

    private void A05(C1256Tm c1256Tm) {
        this.A06 = Collections.unmodifiableList(c1256Tm.A02);
        TW tw2 = c1256Tm.A00;
        boolean zA0A = A0A();
        if (c1256Tm.A03) {
            Iterator<InterfaceC1260Tq> it = this.A0F.iterator();
            while (it.hasNext()) {
                it.next().AEk(this, tw2);
            }
        } else {
            Iterator<InterfaceC1260Tq> it2 = this.A0F.iterator();
            while (it2.hasNext()) {
                it2.next().AEj(this, tw2, c1256Tm.A01);
            }
        }
        if (zA0A) {
            A02();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07(UJ uj, int i5) {
        Requirements requirementsA0A = uj.A0A();
        if (this.A03 != i5) {
            this.A03 = i5;
            this.A04++;
            this.A0C.obtainMessage(2, i5, 0).sendToTarget();
        }
        boolean zA0A = A0A();
        Iterator<InterfaceC1260Tq> it = this.A0F.iterator();
        while (it.hasNext()) {
            it.next().AGn(this, requirementsA0A, i5);
        }
        if (zA0A) {
            A02();
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0017 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A08(List<TW> list) {
        this.A08 = true;
        this.A06 = Collections.unmodifiableList(list);
        boolean zA0A = A0A();
        Iterator<InterfaceC1260Tq> it = this.A0F.iterator();
        while (waitingForRequirementsChanged) {
            it.next().AFE(this);
        }
        if (zA0A) {
            A02();
        }
    }

    private void A09(boolean z11) {
        if (this.A07 == z11) {
            return;
        }
        this.A07 = z11;
        this.A04++;
        this.A0C.obtainMessage(1, z11 ? 1 : 0, 0).sendToTarget();
        boolean zA0A = A0A();
        Iterator<InterfaceC1260Tq> it = this.A0F.iterator();
        while (it.hasNext()) {
            it.next();
        }
        if (zA0A) {
            A02();
        }
    }

    private boolean A0A() {
        boolean z11 = false;
        boolean waitingForRequirements = this.A07;
        if (!waitingForRequirements && this.A03 != 0) {
            int i5 = 0;
            while (true) {
                if (i5 >= this.A06.size()) {
                    break;
                }
                if (this.A06.get(i5).A02 == 0) {
                    z11 = true;
                    break;
                }
                i5++;
            }
        }
        boolean z12 = this.A09;
        String[] strArr = A0H;
        if (strArr[3].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        A0H[2] = "De";
        boolean waitingForRequirements2 = z12 != z11;
        this.A09 = z11;
        return waitingForRequirements2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0B(Message message) {
        switch (message.what) {
            case 0:
                A08((List) message.obj);
                return true;
            case 1:
                int activeTaskCount = message.arg1;
                int processedMessageCount = message.arg2;
                A04(activeTaskCount, processedMessageCount);
                return true;
            case 2:
                C1256Tm update = (C1256Tm) message.obj;
                A05(update);
                return true;
            default:
                throw new IllegalStateException();
        }
    }

    public final List<TW> A0D() {
        return this.A06;
    }

    public final void A0E() {
        A09(false);
    }

    public final void A0F(InterfaceC1260Tq interfaceC1260Tq) {
        AbstractC1062Ln.A01(interfaceC1260Tq);
        this.A0F.add(interfaceC1260Tq);
    }

    public final void A0G(DownloadRequest downloadRequest) {
        A0H(downloadRequest, 0);
    }

    public final void A0H(DownloadRequest downloadRequest, int i5) {
        this.A04++;
        this.A0C.obtainMessage(6, i5, 0, downloadRequest).sendToTarget();
    }

    public final boolean A0I() {
        return this.A00 == 0 && this.A04 == 0;
    }
}
