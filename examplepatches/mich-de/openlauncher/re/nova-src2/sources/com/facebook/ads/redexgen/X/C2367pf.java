package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.pf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2367pf {
    public static byte[] A09;
    public static String[] A0A = {"NRVR2d2LpeLOjToDY8AG0kCdNPb702R7", "oh3wA", "YqPYnbdEh3atSqwU7ODRKKUPmaTaTJsD", "d8RqErmGZDv7VJFifyr1VYP7qbK0F3lx", "XkJFKlRx79uCzVVrdAVcVV", "LavleMUU4tpkIvvCWKTKoPePAIZA", "bbWxac6OK6uiLLkd6i3O4a", "gfVmq9ilWyWWTvGXGsHd2uTlAM"};
    public static final C2365pd A0B;
    public int A00;
    public long A01;
    public long A02;
    public TextView A03;
    public Runnable A04;
    public boolean A05;
    public final int A06;
    public final long A07;
    public final Handler A08;

    public C2367pf() {
        this(0L, 0, 3, null);
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A09 = new byte[]{-25, -6, -7, -7, -12, -13};
    }

    static {
        A01();
        A0B = new C2365pd(null);
    }

    public C2367pf(long j11, int i5) {
        this.A07 = j11;
        this.A06 = i5;
        this.A08 = new Handler(Looper.getMainLooper());
    }

    public /* synthetic */ C2367pf(long j11, int i5, int i11, AbstractC05811i abstractC05811i) {
        this((i11 & 1) != 0 ? 2000L : j11, (i11 & 2) != 0 ? 30 : i5);
    }

    private final void A02(TextView textView, int i5, long j11) {
        RunnableC2366pe runnableC2366pe = new RunnableC2366pe(this, textView, i5);
        this.A04 = runnableC2366pe;
        this.A01 = j11;
        this.A02 = SystemClock.elapsedRealtime();
        this.A08.postDelayed(runnableC2366pe, j11);
    }

    public final void A05() {
        Runnable runnable = this.A04;
        if (runnable != null) {
            Handler handler = this.A08;
            if (A0A[5].length() != 28) {
                throw new RuntimeException();
            }
            String[] strArr = A0A;
            strArr[2] = "0aW3BGjQ3u8dOAEdcToTU9WZUGElaOKN";
            strArr[0] = "phw3harMUliwvMVrDSHXeH32S5kwsdBA";
            handler.removeCallbacks(runnable);
        }
        this.A04 = null;
        this.A03 = null;
        this.A05 = false;
        this.A01 = 0L;
    }

    public final void A06() {
        if (this.A05) {
            return;
        }
        Runnable runnable = this.A04;
        if (A0A[3].charAt(11) == '8') {
            throw new RuntimeException();
        }
        A0A[5] = "1o9zzaOpPUDS4bfEE2UTbZMIeOgL";
        if (runnable == null) {
            return;
        }
        long elapsed = Math.max(0L, this.A01 - (SystemClock.elapsedRealtime() - this.A02));
        this.A01 = elapsed;
        Runnable runnable2 = this.A04;
        if (runnable2 != null) {
            this.A08.removeCallbacks(runnable2);
        }
        this.A04 = null;
        this.A05 = true;
    }

    public final void A07() {
        if (!this.A05) {
            return;
        }
        this.A05 = false;
        TextView textView = this.A03;
        if (textView == null) {
            return;
        }
        A02(textView, this.A00, this.A01);
    }

    public final void A08(TextView textView, int i5) {
        C1h.A09(textView, A00(0, 6, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        textView.setTextColor(A0B.A00(i5));
        AbstractC2426qc.A0W(textView, AbstractC2426qc.A06(i5, this.A06));
    }

    public final void A09(TextView textView, int i5) {
        C1h.A09(textView, A00(0, 6, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        A05();
        this.A03 = textView;
        this.A00 = i5;
        this.A05 = false;
        A02(textView, i5, this.A07);
    }
}
