package s9;

/* loaded from: classes2.dex */
public final class c extends b {

    /* renamed from: b, reason: collision with root package name */
    public final Runnable f86770b;

    public c(Runnable runnable) {
        this.f86770b = runnable;
    }

    @Override // s9.b
    public final void a() {
        this.f86770b.run();
    }
}
