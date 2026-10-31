package xf;

import android.view.Surface;

/* loaded from: classes3.dex */
public abstract class j {
    public static void a(Surface surface, float f11) {
        try {
            surface.setFrameRate(f11, f11 == 0.0f ? 0 : 1);
        } catch (IllegalStateException e3) {
            wf.a.p("VideoFrameReleaseHelper", "Failed to call Surface.setFrameRate", e3);
        }
    }
}
