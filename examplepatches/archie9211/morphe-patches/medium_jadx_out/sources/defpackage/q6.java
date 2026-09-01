package defpackage;

import android.app.Activity;
import android.app.Application;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q6 implements a75 {
    public volatile xm2 a;
    public final Object b = new Object();
    public final Activity c;
    public final a8 d;
    public sv0 e;

    public q6(Activity activity) {
        this.c = activity;
        this.d = new a8((xy1) activity);
    }

    public final void a() {
        sv0 sv0Var = this.e;
        if (sv0Var != null) {
            sv0Var.c = null;
        }
    }

    public final xm2 b() {
        String str;
        Activity activity = this.c;
        if (activity.getApplication() instanceof a75) {
            zm2 zm2Var = (zm2) ((p6) op8.V(p6.class, this.d));
            return new xm2(zm2Var.a, zm2Var.b, activity);
        }
        if (Application.class.equals(activity.getApplication().getClass())) {
            str = "Did you forget to specify your Application's class name in your manifest's <application />'s android:name attribute?";
        } else {
            str = "Found: " + activity.getApplication().getClass();
        }
        throw new IllegalStateException("Hilt Activity must be attached to an @HiltAndroidApp Application. ".concat(str));
    }

    @Override // defpackage.a75
    public final Object c() {
        if (this.a == null) {
            synchronized (this.b) {
                try {
                    if (this.a == null) {
                        this.a = b();
                    }
                } finally {
                }
            }
        }
        return this.a;
    }

    public final void d() {
        a8 a8Var = this.d;
        sv0 sv0Var = ((y7) a8.a(a8Var.a, a8Var.b).n0(n1b.a.b(y7.class))).c;
        this.e = sv0Var;
        if (((qg2) sv0Var.c) == null) {
            qg2 defaultViewModelCreationExtras = ((xy1) this.c).getDefaultViewModelCreationExtras();
            gq7.l(sv0Var.b, "setExtras should only be called for an Activity that extends ComponentActivity", new Object[0]);
            sv0Var.c = defaultViewModelCreationExtras;
        }
    }
}
