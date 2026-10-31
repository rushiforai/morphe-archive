package ba0;

/* loaded from: classes5.dex */
public abstract class a extends r {
    @Override // ba0.r
    public final r c() {
        return (a) this.f17781a;
    }

    @Override // ba0.r
    public final void d(r rVar) {
        if (!(rVar instanceof a)) {
            throw new IllegalArgumentException("Parent of block must also be block (can not be inline)");
        }
        this.f17781a = rVar;
    }
}
