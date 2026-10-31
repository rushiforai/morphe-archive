package ai;

/* loaded from: classes3.dex */
public abstract class d4 extends c4 {

    /* renamed from: c, reason: collision with root package name */
    public boolean f12895c;

    public d4(j4 j4Var) {
        super(j4Var);
        this.f12889b.f13054r++;
    }

    public final void E() {
        if (!this.f12895c) {
            throw new IllegalStateException("Not initialized");
        }
    }

    public final void F() {
        if (this.f12895c) {
            throw new IllegalStateException("Can't initialize twice");
        }
        G();
        this.f12889b.f13055s++;
        this.f12895c = true;
    }

    public abstract void G();
}
