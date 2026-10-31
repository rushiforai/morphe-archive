package cm;

import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final /* synthetic */ class c implements g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20103a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f20104b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Runnable f20105c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f20106d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ long f20107e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ TimeUnit f20108f;

    public /* synthetic */ c(e eVar, Runnable runnable, long j11, long j12, TimeUnit timeUnit, int i5) {
        this.f20103a = i5;
        this.f20104b = eVar;
        this.f20105c = runnable;
        this.f20106d = j11;
        this.f20107e = j12;
        this.f20108f = timeUnit;
    }

    @Override // cm.g
    public final ScheduledFuture a(f fVar) {
        switch (this.f20103a) {
            case 0:
                e eVar = this.f20104b;
                return eVar.f20114b.scheduleAtFixedRate(new d(eVar, this.f20105c, fVar, 0), this.f20106d, this.f20107e, this.f20108f);
            default:
                e eVar2 = this.f20104b;
                return eVar2.f20114b.scheduleWithFixedDelay(new d(eVar2, this.f20105c, fVar, 2), this.f20106d, this.f20107e, this.f20108f);
        }
    }
}
