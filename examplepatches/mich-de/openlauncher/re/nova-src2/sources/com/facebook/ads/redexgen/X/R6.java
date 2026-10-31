package com.facebook.ads.redexgen.X;

import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioTrack;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class R6 {
    public static byte[] A0A;
    public static String[] A0B = {"tiwikVqfL0z2fxSY6lOHkavUIqgy6tr2", "jqVt0", "1kYEt4o2Oc1Nc6c6DCqgZxHprNvHkKTt", "jpl9i6nlC86a", "O0ZNuMyLZcymryzXd", "W", "khiSwei7gt24FAHpJuLbkwyNpdF4wcwM", "v5WZVl0qjHdbu6cFsaLpnhMzrLxS1FQK"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final VC A07;
    public final boolean A08;
    public final LZ[] A09;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 96);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A0A = new byte[]{-19, 14, 15, 10, 30, 21, 29, -22, 30, 13, 18, 24, -4, 18, 23, 20, -61, -42, -54, -51, -59, -94, -42, -59, -54, -48, -75, -45, -62, -60, -52, -101, -127, -44, -43, -62, -43, -58, -98, -122, -59, -115, -127, -62, -42, -59, -54, -48, -75, -45, -62, -60, -52, -94, -51, -51, -48, -60, -62, -43, -58, -59, -113, -56, -58, -43, -119, -118, -98, -122, -59};
    }

    static {
        A07();
    }

    public R6(VC vc, int i5, int i11, int i12, int i13, int i14, int i15, int i16, LZ[] lzArr, boolean z11) {
        this.A07 = vc;
        this.A01 = i5;
        this.A04 = i11;
        this.A05 = i12;
        this.A06 = i13;
        this.A02 = i14;
        this.A03 = i15;
        this.A00 = i16;
        this.A09 = lzArr;
        this.A08 = z11;
    }

    public static AudioAttributes A00() {
        return new AudioAttributes.Builder().setContentType(3).setFlags(16).setUsage(1).build();
    }

    public static AudioAttributes A01(VL vl2, boolean z11) {
        if (z11) {
            return A00();
        }
        return vl2.A01().A00;
    }

    private AudioTrack A02(VL vl2, int i5) {
        int iA04 = N1.A04(vl2.A05);
        if (i5 != 0) {
            return new AudioTrack(iA04, this.A06, this.A02, this.A03, this.A00, 1, i5);
        }
        return new AudioTrack(iA04, this.A06, this.A02, this.A03, this.A00, 1);
    }

    private AudioTrack A03(boolean z11, VL vl2, int i5) {
        if (N1.A02 >= 29) {
            return A05(z11, vl2, i5);
        }
        if (N1.A02 >= 21) {
            return A04(z11, vl2, i5);
        }
        return A02(vl2, i5);
    }

    private AudioTrack A04(boolean z11, VL vl2, int i5) {
        return new AudioTrack(A01(vl2, z11), SI.A0D(this.A06, this.A02, this.A03), this.A00, 1, i5);
    }

    private AudioTrack A05(boolean z11, VL vl2, int i5) throws IllegalArgumentException {
        AudioFormat audioFormatA0D = SI.A0D(this.A06, this.A02, this.A03);
        AudioAttributes audioTrackAttributes = A01(vl2, z11);
        AudioTrack.Builder audioFormat = new AudioTrack.Builder().setAudioAttributes(audioTrackAttributes).setAudioFormat(audioFormatA0D);
        boolean z12 = true;
        AudioTrack.Builder sessionId = audioFormat.setTransferMode(1).setBufferSizeInBytes(this.A00).setSessionId(i5);
        if (this.A04 != 1) {
            z12 = false;
        }
        return sessionId.setOffloadedPlayback(z12).build();
    }

    public final long A08(long j11) {
        return (1000000 * j11) / this.A06;
    }

    public final long A09(long j11) {
        return (1000000 * j11) / this.A07.A0G;
    }

    @MetaExoPlayerCustomization
    public final AudioTrack A0A(boolean z11, VL vl2, int i5) throws C1174Qi {
        try {
            AudioTrack audioTrackA03 = A03(z11, vl2, i5);
            SI.A11.incrementAndGet();
            int state = audioTrackA03.getState();
            if (state == 1) {
                return audioTrackA03;
            }
            try {
                audioTrackA03.release();
                SI.A11.decrementAndGet();
            } catch (Exception e3) {
                Object[] objArr = {Integer.valueOf(state), Integer.valueOf(SI.A11.get())};
                int state2 = A0B[4].length();
                if (state2 != 17) {
                    throw new RuntimeException();
                }
                A0B[4] = "7DxG5Namxux9JNrAx";
                MV.A08(A06(0, 16, 73), String.format(A06(16, 55, 1), objArr), e3);
            }
            throw new C1174Qi(state, this.A06, this.A02, this.A00, this.A07, A0D(), null, SI.A11.get());
        } catch (IllegalArgumentException | UnsupportedOperationException e11) {
            throw new C1174Qi(0, this.A06, this.A02, this.A00, this.A07, A0D(), e11, SI.A11.get());
        }
    }

    public final C1172Qg A0B() {
        int i5 = this.A03;
        int i11 = this.A06;
        int i12 = this.A02;
        boolean z11 = this.A08;
        boolean z12 = this.A04 == 1;
        int i13 = this.A00;
        if (A0B[1].length() == 22) {
            throw new RuntimeException();
        }
        A0B[3] = "HV6cXx8EkhgZ";
        return new C1172Qg(i5, i11, i12, z11, z12, i13);
    }

    public final R6 A0C(int i5) {
        return new R6(this.A07, this.A01, this.A04, this.A05, this.A06, this.A02, this.A03, i5, this.A09, this.A08);
    }

    public final boolean A0D() {
        return this.A04 == 1;
    }

    public final boolean A0E(R6 r62) {
        if (r62.A04 == this.A04 && r62.A03 == this.A03 && r62.A06 == this.A06 && r62.A02 == this.A02) {
            int i5 = r62.A05;
            int i11 = this.A05;
            String[] strArr = A0B;
            if (strArr[0].charAt(1) == strArr[7].charAt(1)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0B;
            strArr2[0] = "SCqqHgq5nN0fL9Hcn1G9LJOP1fhFFGJA";
            strArr2[7] = "8raCMraBdNcHQARtABH2r6eJGP4SAUz0";
            if (i5 == i11) {
                return true;
            }
        }
        return false;
    }
}
