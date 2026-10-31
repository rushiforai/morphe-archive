package com.facebook.ads.redexgen.X;

import android.os.Handler;
import com.facebook.ads.androidx.media3.exoplayer.offline.DownloadRequest;
import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public class S0 extends Thread implements U2 {
    public long A00;
    public Exception A01;
    public final int A02;
    public final C1262Ts A03;
    public final DownloadRequest A04;
    public final U3 A05;
    public final boolean A06;
    public volatile HandlerC1258To A07;
    public volatile boolean A08;

    public S0(DownloadRequest downloadRequest, U3 u32, C1262Ts c1262Ts, boolean z11, int i5, HandlerC1258To handlerC1258To) {
        this.A04 = downloadRequest;
        this.A05 = u32;
        this.A03 = c1262Ts;
        this.A06 = z11;
        this.A02 = i5;
        this.A07 = handlerC1258To;
        this.A00 = -1L;
    }

    public static int A00(int i5) {
        return Math.min((i5 - 1) * 1000, 5000);
    }

    public final void A05(boolean z11) {
        if (z11) {
            this.A07 = null;
        }
        if (!this.A08) {
            this.A08 = true;
            this.A05.cancel();
            interrupt();
        }
    }

    @Override // com.facebook.ads.redexgen.X.U2
    public final void AGd(long j11, long j12, float f11) {
        this.A03.A01 = j12;
        this.A03.A00 = f11;
        if (j11 != this.A00) {
            this.A00 = j11;
            HandlerC1258To handlerC1258To = this.A07;
            if (handlerC1258To != null) {
                handlerC1258To.obtainMessage(10, (int) (j11 >> 32), (int) j11, this).sendToTarget();
            }
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            try {
                if (this.A06) {
                    this.A05.remove();
                } else {
                    int i5 = 0;
                    long bytesDownloaded = -1;
                    while (!this.A08) {
                        try {
                            this.A05.A6c(this);
                            break;
                        } catch (IOException e3) {
                            if (!this.A08) {
                                long j11 = this.A03.A01;
                                if (j11 != bytesDownloaded) {
                                    bytesDownloaded = j11;
                                    i5 = 0;
                                }
                                i5++;
                                if (i5 <= this.A02) {
                                    Thread.sleep(A00(i5));
                                } else {
                                    throw e3;
                                }
                            }
                        }
                    }
                }
            } catch (Throwable th2) {
                AbstractC2311oi.A00(th2, this);
                return;
            }
        } catch (InterruptedException unused) {
            Thread.currentThread().interrupt();
        } catch (Exception e11) {
            this.A01 = e11;
        }
        Handler internalHandler = this.A07;
        if (internalHandler != null) {
            internalHandler.obtainMessage(9, this).sendToTarget();
        }
    }
}
