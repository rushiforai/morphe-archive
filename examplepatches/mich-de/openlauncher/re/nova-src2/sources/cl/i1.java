package cl;

/* loaded from: classes3.dex */
public final class i1 extends l implements Runnable {

    /* renamed from: h, reason: collision with root package name */
    public final Runnable f20022h;

    public i1(Runnable runnable) {
        runnable.getClass();
        this.f20022h = runnable;
    }

    @Override // cl.s
    public final String l() {
        return "task=[" + this.f20022h + "]";
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            this.f20022h.run();
        } catch (Error | RuntimeException e3) {
            o(e3);
            throw e3;
        }
    }
}
