package com.facebook.ads.redexgen.X;

import android.media.MediaCodecInfo;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.So, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1232So {
    public static int A00(MediaCodecInfo.VideoCapabilities videoCapabilities, int i5, int i11, double d5) {
        List<MediaCodecInfo.VideoCapabilities.PerformancePoint> supportedPerformancePoints = videoCapabilities.getSupportedPerformancePoints();
        if (supportedPerformancePoints == null || supportedPerformancePoints.isEmpty() || C1234Sq.A07()) {
            return 0;
        }
        MediaCodecInfo.VideoCapabilities.PerformancePoint performancePoint = new MediaCodecInfo.VideoCapabilities.PerformancePoint(i5, i11, (int) d5);
        for (int i12 = 0; i12 < supportedPerformancePoints.size(); i12++) {
            if (supportedPerformancePoints.get(i12).covers(performancePoint)) {
                return 2;
            }
        }
        return 1;
    }
}
