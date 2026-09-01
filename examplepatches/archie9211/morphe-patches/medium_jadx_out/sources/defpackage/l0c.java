package defpackage;

import android.view.View;
import com.google.android.material.behavior.SwipeDismissBehavior;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l0c implements Runnable {
    public final /* synthetic */ int a = 1;
    public boolean b;
    public final Object c;
    public final Object d;

    public l0c(ky6 ky6Var, ux6 ux6Var) {
        ux6Var.getClass();
        this.c = ky6Var;
        this.d = ux6Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        md5 md5Var;
        int i = this.a;
        Object obj = this.d;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                if (!this.b) {
                    ((ky6) obj2).e((ux6) obj);
                    this.b = true;
                }
                break;
            default:
                View view = (View) obj2;
                SwipeDismissBehavior swipeDismissBehavior = (SwipeDismissBehavior) obj;
                cue cueVar = swipeDismissBehavior.a;
                if (cueVar != null && cueVar.f()) {
                    view.postOnAnimation(this);
                    break;
                } else if (this.b && (md5Var = swipeDismissBehavior.b) != null) {
                    md5Var.t(view);
                    break;
                }
                break;
        }
    }

    public l0c(SwipeDismissBehavior swipeDismissBehavior, View view, boolean z) {
        this.d = swipeDismissBehavior;
        this.c = view;
        this.b = z;
    }
}
