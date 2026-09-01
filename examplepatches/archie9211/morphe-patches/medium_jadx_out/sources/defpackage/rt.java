package defpackage;

import android.os.Build;
import android.view.ViewConfiguration;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rt implements zte {
    public final ViewConfiguration a;

    public rt(ViewConfiguration viewConfiguration) {
        this.a = viewConfiguration;
    }

    @Override // defpackage.zte
    public final long a() {
        return ViewConfiguration.getDoubleTapTimeout();
    }

    @Override // defpackage.zte
    public final long b() {
        return ViewConfiguration.getLongPressTimeout();
    }

    @Override // defpackage.zte
    public final float c() {
        return this.a.getScaledMinimumFlingVelocity();
    }

    @Override // defpackage.zte
    public final float d() {
        if (Build.VERSION.SDK_INT >= 34) {
            return m4.q(this.a);
        }
        return 2.0f;
    }

    @Override // defpackage.zte
    public final long e() {
        return pwd.i(48.0f, 48.0f);
    }

    @Override // defpackage.zte
    public final float f() {
        return this.a.getScaledMaximumFlingVelocity();
    }

    @Override // defpackage.zte
    public final float g() {
        return this.a.getScaledTouchSlop();
    }

    @Override // defpackage.zte
    public final float h() {
        if (Build.VERSION.SDK_INT >= 34) {
            return m4.p(this.a);
        }
        return 16.0f;
    }
}
