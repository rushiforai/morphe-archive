package t70;

import kotlin.Unit;

/* loaded from: classes.dex */
public final class d1 extends f1 {

    /* renamed from: c, reason: collision with root package name */
    public final m f88782c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ h1 f88783d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d1(h1 h1Var, long j11, m mVar) {
        super(j11);
        this.f88783d = h1Var;
        this.f88782c = mVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f88782c.E(this.f88783d, Unit.f71706a);
    }

    @Override // t70.f1
    public final String toString() {
        return super.toString() + this.f88782c;
    }
}
