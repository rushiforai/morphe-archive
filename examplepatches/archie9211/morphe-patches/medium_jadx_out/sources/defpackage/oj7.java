package defpackage;

import android.window.BackEvent;
import android.window.OnBackAnimationCallback;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oj7 implements OnBackAnimationCallback {
    public final /* synthetic */ mj7 a;
    public final /* synthetic */ pj7 b;

    public oj7(pj7 pj7Var, mj7 mj7Var) {
        this.b = pj7Var;
        this.a = mj7Var;
    }

    public final void onBackCancelled() {
        if (this.b.a != null) {
            this.a.d();
        }
    }

    public final void onBackInvoked() {
        this.a.a();
    }

    public final void onBackProgressed(BackEvent backEvent) {
        if (this.b.a != null) {
            this.a.b(new sl0(backEvent));
        }
    }

    public final void onBackStarted(BackEvent backEvent) {
        if (this.b.a != null) {
            this.a.c(new sl0(backEvent));
        }
    }
}
