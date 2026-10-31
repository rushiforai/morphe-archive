package t1;

import java.util.NoSuchElementException;

/* loaded from: classes2.dex */
public final class g extends a {

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f88449c;

    /* renamed from: d, reason: collision with root package name */
    public final j f88450d;

    public g(Object[] objArr, int i5, Object[] objArr2, int i11, int i12) {
        super(i5, i11);
        this.f88449c = objArr2;
        int i13 = (i11 - 1) & (-32);
        this.f88450d = new j(objArr, i5 > i13 ? i13 : i5, i13, i12);
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        j jVar = this.f88450d;
        if (jVar.hasNext()) {
            this.f88431a++;
            return jVar.next();
        }
        int i5 = this.f88431a;
        this.f88431a = i5 + 1;
        return this.f88449c[i5 - jVar.f88432b];
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f88431a;
        j jVar = this.f88450d;
        int i11 = jVar.f88432b;
        if (i5 <= i11) {
            this.f88431a = i5 - 1;
            return jVar.previous();
        }
        int i12 = i5 - 1;
        this.f88431a = i12;
        return this.f88449c[i12 - i11];
    }
}
