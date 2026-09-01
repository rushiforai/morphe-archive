package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nn3 extends gsa {
    public final /* synthetic */ int n;

    public /* synthetic */ nn3(int i) {
        this.n = i;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.gsa
    public final float k0(dk7 dk7Var) {
        switch (this.n) {
            case 0:
                return ((View) dk7Var).getAlpha();
            case 1:
                return ((View) dk7Var).getScaleX();
            case 2:
                return ((View) dk7Var).getScaleY();
            case 3:
                return ((View) dk7Var).getRotation();
            case 4:
                return ((View) dk7Var).getRotationX();
            default:
                return ((View) dk7Var).getRotationY();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.gsa
    public final void o0(dk7 dk7Var, float f) {
        switch (this.n) {
            case 0:
                ((View) dk7Var).setAlpha(f);
                break;
            case 1:
                ((View) dk7Var).setScaleX(f);
                break;
            case 2:
                ((View) dk7Var).setScaleY(f);
                break;
            case 3:
                ((View) dk7Var).setRotation(f);
                break;
            case 4:
                ((View) dk7Var).setRotationX(f);
                break;
            default:
                ((View) dk7Var).setRotationY(f);
                break;
        }
    }
}
