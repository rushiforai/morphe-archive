package ai;

/* loaded from: classes3.dex */
public abstract class z extends v {

    /* renamed from: b, reason: collision with root package name */
    public boolean f13484b;

    public z(m1 m1Var) {
        super(m1Var);
        ((m1) this.f13368a).A++;
    }

    public final void E() {
        if (!this.f13484b) {
            throw new IllegalStateException("Not initialized");
        }
    }

    public final void F() {
        if (this.f13484b) {
            throw new IllegalStateException("Can't initialize twice");
        }
        if (G()) {
            return;
        }
        ((m1) this.f13368a).C.incrementAndGet();
        this.f13484b = true;
    }

    public abstract boolean G();
}
