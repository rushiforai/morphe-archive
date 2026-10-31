package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.Spatializer;
import android.media.Spatializer$OnSpatializerStateChangedListener;
import android.os.Handler;
import android.os.Looper;
import java.util.Arrays;
import java.util.Objects;

/* loaded from: assets/audience_network/classes.dex */
public class WR {
    public static byte[] A04;
    public static String[] A05 = {"K4AibweUZcmoa1RuTCd47OwO", "lrtiCNbH5hEEA1cgkn3wiVRDEg2sqwAs", "KCfPrS5AQSHXhkQokrfILevT0l51BuXt", "luLNUHAeJBkDCdTnzzs9i1TVQprxZa4t", "ED3AHXMKIRPUnUwAr7krVdbDOCldCiws", "TG5eb4ODYt6kQCIDABjnBR0vDLjxb8Dy", "o3g8VDQsBqPdhPwWUMSj13O5NZECq2aP", "dXSP7QudmdAuCybgZlvL7H0tTvt9OSmr"};
    public Spatializer$OnSpatializerStateChangedListener A00;
    public Handler A01;
    public final Spatializer A02;
    public final boolean A03;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 88);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{-68, -48, -65, -60, -54, -59, -39, -56, -51, -45, -109, -55, -59, -57, -105, -111, -50, -45, -57};
        String[] strArr = A05;
        if (strArr[1].charAt(15) != strArr[7].charAt(15)) {
            throw new RuntimeException();
        }
        A05[5] = "RMIsbZWsIDT3fmhQ4JN06IeQLRjp0ax4";
    }

    static {
        A02();
    }

    public WR(Spatializer spatializer) {
        this.A02 = spatializer;
        this.A03 = spatializer.getImmersiveAudioLevel() != 0;
    }

    public static WR A00(Context context) {
        AudioManager audioManager = (AudioManager) context.getSystemService(A01(0, 5, 3));
        if (audioManager == null) {
            return null;
        }
        return new WR(audioManager.getSpatializer());
    }

    public final void A03(C07398h c07398h, Looper looper) {
        if (this.A00 != null || this.A01 != null) {
            return;
        }
        this.A00 = new WQ(this, c07398h);
        this.A01 = new Handler(looper);
        Spatializer spatializer = this.A02;
        Handler handler = this.A01;
        Objects.requireNonNull(handler);
        spatializer.addOnSpatializerStateChangedListener(new ExecutorC0977Ib(handler), this.A00);
    }

    public final boolean A04() {
        return this.A02.isAvailable();
    }

    public final boolean A05() {
        return this.A02.isEnabled();
    }

    public final boolean A06() {
        return this.A03;
    }

    public final boolean A07(VL vl2, VC vc) throws IllegalArgumentException {
        int i5;
        if (A01(5, 14, 12).equals(vc.A0W) && vc.A06 == 16) {
            i5 = 12;
        } else {
            i5 = vc.A06;
        }
        AudioFormat.Builder encoding = new AudioFormat.Builder().setEncoding(2);
        int linearChannelCount = N1.A01(i5);
        AudioFormat.Builder channelMask = encoding.setChannelMask(linearChannelCount);
        if (vc.A0G != -1) {
            int linearChannelCount2 = vc.A0G;
            channelMask.setSampleRate(linearChannelCount2);
        }
        return this.A02.canBeSpatialized(vl2.A01().A00, channelMask.build());
    }
}
