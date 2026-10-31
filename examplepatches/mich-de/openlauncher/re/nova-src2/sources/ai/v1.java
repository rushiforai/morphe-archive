package ai;

/* loaded from: classes3.dex */
public abstract class v1 extends u1 {

    /* renamed from: b, reason: collision with root package name */
    public boolean f13377b;

    public v1(m1 m1Var) {
        super(m1Var);
        ((m1) this.f13368a).A++;
    }

    public abstract boolean E();

    public final void F() {
        if (!this.f13377b) {
            throw new IllegalStateException("Not initialized");
        }
    }

    public final void G() {
        if (this.f13377b) {
            throw new IllegalStateException("Can't initialize twice");
        }
        if (E()) {
            return;
        }
        ((m1) this.f13368a).C.incrementAndGet();
        this.f13377b = true;
    }
}
