package defpackage;

import android.graphics.drawable.Animatable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wv extends d46 {
    public final /* synthetic */ int t;
    public final Animatable u;

    public /* synthetic */ wv(Animatable animatable, int i) {
        this.t = i;
        this.u = animatable;
    }

    @Override // defpackage.d46
    public final void e0() {
        switch (this.t) {
            case 0:
                this.u.start();
                break;
            default:
                ((fw) this.u).start();
                break;
        }
    }

    @Override // defpackage.d46
    public final void f0() {
        switch (this.t) {
            case 0:
                this.u.stop();
                break;
            default:
                ((fw) this.u).stop();
                break;
        }
    }
}
