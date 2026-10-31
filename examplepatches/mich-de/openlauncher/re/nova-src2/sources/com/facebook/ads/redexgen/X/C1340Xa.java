package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Pair;
import android.view.Surface;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Xa, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1340Xa {
    public static byte[] A0H;
    public static String[] A0I = {"QI6p3QcyfWHz7WQ2OWXChIAMfMyUwg4N", "niUiJYIIyU3YFNt", "rjV2Hsf4FoNPDRZo7goAYx6xP", "BOVi8Jtsu5tshcZbMC7bXntr5TWmQc76", "vM8kl80mXW07YqwtrA", "wOULJnlyI9LCGWOkCbRLzEuUAVfy9Llw", "KKULc3fI", "QTaS50YFF7rWFxTeClY4eGOkCA39IIpI"};
    public Handler A04;
    public Pair<Long, VC> A05;
    public Pair<Surface, C1088Mo> A06;
    public CopyOnWriteArrayList<M6> A08;
    public boolean A0A;
    public boolean A0B;
    public final C3X A0C;
    public final C1357Xt A0D;
    public final boolean A0G;
    public final ArrayDeque<Long> A0F = new ArrayDeque<>();
    public final ArrayDeque<Pair<Long, VC>> A0E = new ArrayDeque<>();
    public int A00 = -1;
    public boolean A09 = true;
    public long A02 = -9223372036854775807L;
    public C1259Tp A07 = C1259Tp.A05;
    public long A03 = -9223372036854775807L;
    public long A01 = -9223372036854775807L;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0H, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A0I[6].length() != 8) {
                throw new RuntimeException();
            }
            String[] strArr = A0I;
            strArr[0] = "7fvYPH4yX2zv1fcX80FI7og9FJDVS5aN";
            strArr[5] = "XZlzBV6y1QLK5uh2qFcPGm8A2t79bkF1";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 115);
            i13++;
        }
    }

    public static void A02() {
        A0H = new byte[]{31, 18, 18, 17, 9, 83, 24, 12, 31, 19, 27, 83, 26, 12, 17, 14, 21, 4, 19, 23, 2, 19, AbstractJsonLexerKt.TC_INVALID, 117, 108, 106, 113, 84, 86, 71, 122, 93, 67, 70, 71, 96, 70, 65, 85, 82, 80, 86, 124, 126, 111, 75, 126, 117, AbstractJsonLexerKt.TC_INVALID, 114, 117, 124, 82, 117, 107, 110, 111, 93, 105, 122, 118, 126, 88, 116, 110, 117, 111, 52, 35, 42, 35, 39, 53, 35, 48, 39, 44, 38, 39, 48, 13, 55, 54, 50, 55, 54, 4, 48, 35, 47, 39, 23, 1, 16, 45, 10, 20, 17, 16, 34, 22, 5, 9, 1, 45, 10, 2, 11, 31, 9, 24, 35, 25, 24, 28, 25, 24, 63, 25, 30, 10, 13, 15, 9, 37, 2, 10, 3};
    }

    static {
        A02();
    }

    public C1340Xa(C1357Xt c1357Xt, C3X c3x, boolean z11) {
        this.A0D = c1357Xt;
        this.A0C = c3x;
        this.A0G = z11;
    }

    private void A03(long j11, boolean z11) {
        AbstractC1062Ln.A02(null);
        throw new NullPointerException(A01(74, 17, 49));
    }

    @MetaExoPlayerCustomization
    public static boolean A04(long j11) {
        if (XL.A03(XQ.A2a)) {
            return j11 > 50000;
        }
        int releaseLowerThresholdUs = XL.A00(XP.A0A);
        int releaseUpperThresholdUs = XL.A00(XP.A09);
        return releaseLowerThresholdUs > 0 && releaseUpperThresholdUs > 0 && j11 > ((long) releaseUpperThresholdUs) && j11 < ((long) releaseLowerThresholdUs);
    }

    public final MediaFormat A06(MediaFormat mediaFormat) {
        if (N1.A02 >= 29 && this.A0C.A0p.getApplicationContext().getApplicationInfo().targetSdkVersion >= 29) {
            mediaFormat.setInteger(A01(0, 16, 13), 0);
        }
        return mediaFormat;
    }

    public final Surface A07() {
        AbstractC1062Ln.A01(null);
        throw new NullPointerException(A01(27, 15, 64));
    }

    public final void A08() {
        AbstractC1062Ln.A01(null);
        throw new NullPointerException(A01(108, 20, 31));
    }

    public final void A09() {
        AbstractC1062Ln.A02(null);
        throw new NullPointerException(A01(22, 5, 106));
    }

    public final void A0A() {
        AbstractC1062Ln.A01(null);
        throw new NullPointerException(A01(67, 7, 53));
    }

    public final void A0B(long j11, long framePresentationTimeUs) {
        AbstractC1062Ln.A02(null);
        if (!this.A0F.isEmpty()) {
            boolean z11 = false;
            boolean z12 = this.A0C.A9n() == 2;
            long jLongValue = ((Long) AbstractC1062Ln.A01(this.A0F.peek())).longValue();
            long bufferPresentationTimeUs = jLongValue + this.A01;
            long jA03 = this.A0C.A03(j11, framePresentationTimeUs, SystemClock.elapsedRealtime() * 1000, bufferPresentationTimeUs, z12);
            if (this.A0A && this.A0F.size() == 1) {
                z11 = true;
            }
            if (this.A0C.A0m(j11, jA03)) {
                A03(-1L, z11);
                throw null;
            }
            if (!z12 || j11 == this.A0C.A0L || A04(jA03)) {
                return;
            }
            this.A0D.A0G(bufferPresentationTimeUs);
            long jA0B = this.A0D.A0B(System.nanoTime() + (jA03 * 1000));
            if (this.A0C.A28((jA0B - System.nanoTime()) / 1000, framePresentationTimeUs, z11)) {
                A03(-2L, z11);
                throw null;
            }
            if (!this.A0E.isEmpty() && bufferPresentationTimeUs > ((Long) this.A0E.peek().first).longValue()) {
                this.A05 = this.A0E.remove();
            }
            this.A0C.A0S(jLongValue, jA0B, (VC) this.A05.second, null);
            if (this.A03 >= bufferPresentationTimeUs) {
                this.A03 = -9223372036854775807L;
            }
            A03(jA0B, z11);
            throw null;
        }
    }

    public final void A0C(Surface surface, C1088Mo c1088Mo) {
        if (this.A06 != null) {
            Object obj = this.A06.first;
            String[] strArr = A0I;
            if (strArr[2].length() == strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0I;
            strArr2[0] = "weZPnhnySgxnP6Qt1MCLx3NPY7FBtlfF";
            strArr2[5] = "uRJSlQTye4wEepPBnCSWGuRtoYUEdPzW";
            if (((Surface) obj).equals(surface) && ((C1088Mo) this.A06.second).equals(c1088Mo)) {
                return;
            }
        }
        this.A06 = Pair.create(surface, c1088Mo);
        if (A0G()) {
            AbstractC1062Ln.A01(null);
            new C1089Mp(surface, c1088Mo.A03(), c1088Mo.A02());
            throw new NullPointerException(A01(108, 20, 31));
        }
    }

    public final void A0D(VC vc) {
        AbstractC1062Ln.A01(null);
        new M7(vc.A0L, vc.A0A).A00(vc.A02).A01();
        throw new NullPointerException(A01(91, 17, 23));
    }

    public final void A0E(String str) {
        this.A00 = N1.A09(this.A0C.A0p, str, false);
    }

    public final void A0F(List<M6> list) {
        if (this.A08 == null) {
            this.A08 = new CopyOnWriteArrayList<>(list);
        } else {
            this.A08.clear();
            this.A08.addAll(list);
        }
    }

    @MetaExoPlayerCustomization
    public final boolean A0G() {
        return (!this.A0G || 0 == 0 || this.A0C.A21()) ? false : true;
    }

    public final boolean A0H() {
        return this.A06 == null || !((C1088Mo) this.A06.second).equals(C1088Mo.A04);
    }

    public final boolean A0I() {
        return this.A0B;
    }

    public final boolean A0J(VC vc, long j11) throws AnonymousClass96 {
        AbstractC1062Ln.A08(!A0G());
        if (!this.A09) {
            return false;
        }
        CopyOnWriteArrayList<M6> copyOnWriteArrayList = this.A08;
        if (A0I[6].length() != 8) {
            throw new RuntimeException();
        }
        A0I[4] = "WrCX8mf8mqG6Y2I";
        if (copyOnWriteArrayList == null) {
            this.A09 = false;
            return false;
        }
        this.A04 = N1.A0Y();
        this.A0C.A26(vc.A0N);
        try {
            if (!C3X.A0h() && vc.A0F != 0) {
                CopyOnWriteArrayList<M6> copyOnWriteArrayList2 = this.A08;
                XZ.A00(vc.A0F);
                copyOnWriteArrayList2.add(0, null);
            }
            XZ.A01();
            Context unused = this.A0C.A0p;
            AbstractC1062Ln.A01(this.A08);
            Handler handler = this.A04;
            Objects.requireNonNull(handler);
            new ExecutorC0977Ib(handler);
            new Qb(this);
            throw new NullPointerException(A01(16, 6, 5));
        } catch (Exception e3) {
            throw this.A0C.A1S(e3, vc, 7000);
        }
    }

    public final boolean A0K(VC vc, long j11, boolean z11) {
        AbstractC1062Ln.A02(null);
        AbstractC1062Ln.A08(this.A00 != -1);
        throw new NullPointerException(A01(42, 25, 104));
    }
}
