package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.po, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2376po {
    public static byte[] A09;
    public static final C2371pj A0A;
    public long A00;
    public long A01;
    public InterfaceC2373pl A02;
    public boolean A03;
    public final long A04;
    public final Handler A05;
    public final InterfaceC2372pk A06;
    public final RunnableC2375pn A07;
    public final Runnable A08;

    static {
        A08();
        A0A = new C2371pj(null);
    }

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 51);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A09 = new byte[]{68, 65, 91, 92, 77, 70, 77, 90};
    }

    public C2376po(long j11, InterfaceC2372pk interfaceC2372pk) {
        C1h.A09(interfaceC2372pk, A07(0, 8, 27));
        this.A04 = j11;
        this.A06 = interfaceC2372pk;
        this.A05 = new Handler(Looper.getMainLooper());
        this.A08 = new RunnableC2374pm(this);
        this.A07 = new RunnableC2375pn(this);
        this.A00 = this.A04;
    }

    public final long A0B() {
        long jElapsedRealtime;
        if (this.A03) {
            jElapsedRealtime = (this.A04 - this.A00) + (SystemClock.elapsedRealtime() - this.A01);
        } else {
            jElapsedRealtime = this.A04 - this.A00;
        }
        return AbstractC05570i.A00(jElapsedRealtime, 0L, this.A04);
    }

    public final long A0C() {
        return this.A04;
    }

    public final void A0D() {
        this.A05.removeCallbacks(this.A08);
        this.A05.removeCallbacks(this.A07);
        this.A03 = false;
    }

    public final void A0E() {
        if (!this.A03) {
            return;
        }
        this.A05.removeCallbacks(this.A08);
        this.A05.removeCallbacks(this.A07);
        long elapsed = Math.max(0L, this.A00 - (SystemClock.elapsedRealtime() - this.A01));
        this.A00 = elapsed;
        this.A03 = false;
    }

    public final void A0F() {
        if (this.A03 || this.A00 <= 0) {
            return;
        }
        this.A01 = SystemClock.elapsedRealtime();
        this.A03 = true;
        this.A05.postDelayed(this.A08, this.A00);
        if (this.A02 != null) {
            this.A05.post(this.A07);
        }
    }

    public final void A0G() {
        if (this.A03) {
            return;
        }
        this.A01 = SystemClock.elapsedRealtime();
        this.A03 = true;
        this.A05.postDelayed(this.A08, this.A00);
        if (this.A02 != null) {
            this.A05.post(this.A07);
        }
    }

    public final void A0H(InterfaceC2373pl interfaceC2373pl) {
        this.A02 = interfaceC2373pl;
    }

    public final boolean A0I() {
        return this.A03;
    }
}
