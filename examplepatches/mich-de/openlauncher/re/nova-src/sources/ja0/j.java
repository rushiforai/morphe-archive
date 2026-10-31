package ja0;

/* loaded from: classes.dex */
public final class j extends l {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69338a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f69339b;

    public j(m mVar, int i5) {
        this.f69339b = mVar;
        this.f69338a = i5;
    }

    @Override // ja0.l
    public final Object c(int i5) {
        m mVar = this.f69339b;
        return new ka0.b(mVar, (i5 * 12) + mVar.o + 4);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f69338a;
    }
}
