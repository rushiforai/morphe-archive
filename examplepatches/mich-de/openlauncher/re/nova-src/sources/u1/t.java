package u1;

/* loaded from: classes2.dex */
public final class t extends q {

    /* renamed from: d, reason: collision with root package name */
    public final h f90362d;

    public t(h hVar) {
        this.f90362d = hVar;
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i5 = this.f90360c;
        this.f90360c = i5 + 2;
        Object[] objArr = this.f90358a;
        return new b(this.f90362d, objArr[i5], objArr[i5 + 1]);
    }
}
