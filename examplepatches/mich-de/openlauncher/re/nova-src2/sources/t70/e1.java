package t70;

/* loaded from: classes.dex */
public final class e1 extends f1 {

    /* renamed from: c, reason: collision with root package name */
    public final Runnable f88788c;

    public e1(Runnable runnable, long j11) {
        super(j11);
        this.f88788c = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f88788c.run();
    }

    @Override // t70.f1
    public final String toString() {
        return super.toString() + this.f88788c;
    }
}
