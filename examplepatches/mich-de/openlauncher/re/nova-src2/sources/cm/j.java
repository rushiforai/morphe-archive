package cm;

/* loaded from: classes.dex */
public final class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20120a;

    /* renamed from: b, reason: collision with root package name */
    public final Runnable f20121b;

    public /* synthetic */ j(Runnable runnable, int i5) {
        this.f20120a = i5;
        this.f20121b = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f20120a) {
            case 0:
                this.f20121b.run();
                break;
            default:
                try {
                    this.f20121b.run();
                    break;
                } catch (Exception e3) {
                    w.b.g("Executor", "Background execution failure.", e3);
                    return;
                }
        }
    }

    public String toString() {
        switch (this.f20120a) {
            case 0:
                return this.f20121b.toString();
            default:
                return super.toString();
        }
    }
}
