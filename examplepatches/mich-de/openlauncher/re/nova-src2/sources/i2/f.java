package i2;

import android.graphics.Bitmap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class f implements c0 {

    /* renamed from: a, reason: collision with root package name */
    public final Bitmap f61109a;

    public f(Bitmap bitmap) {
        this.f61109a = bitmap;
    }

    public final int a() {
        Bitmap.Config config = this.f61109a.getConfig();
        Intrinsics.d(config);
        if (config == Bitmap.Config.ALPHA_8) {
            return 1;
        }
        if (config == Bitmap.Config.RGB_565) {
            return 2;
        }
        if (config == Bitmap.Config.ARGB_4444) {
            return 0;
        }
        if (config == Bitmap.Config.RGBA_F16) {
            return 3;
        }
        return config == Bitmap.Config.HARDWARE ? 4 : 0;
    }

    public final int b() {
        return this.f61109a.getHeight();
    }

    public final int c() {
        return this.f61109a.getWidth();
    }

    public final void d() {
        this.f61109a.prepareToDraw();
    }
}
