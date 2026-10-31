package we;

import android.media.MediaCodecInfo;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class k {
    public static int a(MediaCodecInfo.VideoCapabilities videoCapabilities, int i5, int i11, double d5) {
        List supportedPerformancePoints = videoCapabilities.getSupportedPerformancePoints();
        if (supportedPerformancePoints == null || supportedPerformancePoints.isEmpty()) {
            return 0;
        }
        uf.c.j();
        MediaCodecInfo.VideoCapabilities.PerformancePoint performancePointE = uf.c.e(i5, i11, (int) d5);
        for (int i12 = 0; i12 < supportedPerformancePoints.size(); i12++) {
            if (uf.c.f(supportedPerformancePoints.get(i12)).covers(performancePointE)) {
                return 2;
            }
        }
        return 1;
    }
}
