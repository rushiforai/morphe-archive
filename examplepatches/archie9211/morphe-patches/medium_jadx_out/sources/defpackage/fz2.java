package defpackage;

import android.content.Context;
import java.util.Set;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fz2 implements aj5, cj5 {
    public final wq6 a;
    public final Context b;
    public final h8a c;
    public final Set d;
    public final Executor e;

    public fz2(Context context, String str, Set set, h8a h8aVar, Executor executor) {
        this.a = new wq6(new iz1(context, 1, str));
        this.d = set;
        this.e = executor;
        this.c = h8aVar;
        this.b = context;
    }

    public final synchronized bj5 a() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        dj5 dj5Var = (dj5) this.a.get();
        if (!dj5Var.i(jCurrentTimeMillis)) {
            return bj5.NONE;
        }
        dj5Var.g();
        return bj5.GLOBAL;
    }

    public final void b() {
        if (this.d.size() <= 0) {
            vp7.x(null);
        } else if (!hk7.A(this.b)) {
            vp7.x(null);
        } else {
            vp7.j(this.e, new ez2(this, 1));
        }
    }
}
