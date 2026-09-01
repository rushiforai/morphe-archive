package defpackage;

import java.util.concurrent.Callable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ak4 {
    public final nc2 a;

    public ak4(nc2 nc2Var) {
        this.a = nc2Var;
    }

    public static ak4 a() {
        ak4 ak4Var = (ak4) xj4.d().b(ak4.class);
        if (ak4Var != null) {
            return ak4Var;
        }
        z72.c("FirebaseCrashlytics component is not present.");
        return null;
    }

    public final void b(final String str) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        final nc2 nc2Var = this.a;
        final long j = jCurrentTimeMillis - nc2Var.d;
        ((ud2) nc2Var.o.b).b(new Callable() { // from class: mc2
            @Override // java.util.concurrent.Callable
            public final Object call() {
                nc2 nc2Var2 = nc2Var;
                return ((ud2) nc2Var2.o.c).a(new r6(nc2Var2, j, str));
            }
        });
    }

    public final void c(String str, String str2) {
        nc2 nc2Var = this.a;
        ((ud2) nc2Var.o.b).a(new ss(nc2Var, str, str2, 2));
    }
}
