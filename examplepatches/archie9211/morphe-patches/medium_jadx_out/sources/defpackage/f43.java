package defpackage;

import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class f43 implements j43 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i43 b;
    public final /* synthetic */ Runnable c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;
    public final /* synthetic */ TimeUnit f;

    public /* synthetic */ f43(i43 i43Var, Runnable runnable, long j, long j2, TimeUnit timeUnit, int i) {
        this.a = i;
        this.b = i43Var;
        this.c = runnable;
        this.d = j;
        this.e = j2;
        this.f = timeUnit;
    }

    @Override // defpackage.j43
    public final ScheduledFuture a(zm7 zm7Var) {
        int i = this.a;
        Runnable runnable = this.c;
        i43 i43Var = this.b;
        switch (i) {
            case 0:
                return i43Var.b.scheduleAtFixedRate(new g43(i43Var, runnable, zm7Var, 0), this.d, this.e, this.f);
            default:
                return i43Var.b.scheduleWithFixedDelay(new g43(i43Var, runnable, zm7Var, 2), this.d, this.e, this.f);
        }
    }
}
