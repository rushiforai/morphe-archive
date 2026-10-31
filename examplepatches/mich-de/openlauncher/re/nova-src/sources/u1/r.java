package u1;

/* loaded from: classes.dex */
public final class r extends q {
    @Override // java.util.Iterator
    public final Object next() {
        int i5 = this.f90360c;
        this.f90360c = i5 + 2;
        Object[] objArr = this.f90358a;
        return new a(objArr[i5], objArr[i5 + 1]);
    }
}
