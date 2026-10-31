package t1;

import java.util.NoSuchElementException;

/* loaded from: classes2.dex */
public final class d extends a {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f88435c = 1;

    /* renamed from: d, reason: collision with root package name */
    public final Object f88436d;

    public d(Object[] objArr, int i5, int i11) {
        super(i5, i11);
        this.f88436d = objArr;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        switch (this.f88435c) {
            case 0:
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                Object[] objArr = (Object[]) this.f88436d;
                int i5 = this.f88431a;
                this.f88431a = i5 + 1;
                return objArr[i5];
            default:
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                this.f88431a++;
                return this.f88436d;
        }
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        switch (this.f88435c) {
            case 0:
                if (!hasPrevious()) {
                    throw new NoSuchElementException();
                }
                Object[] objArr = (Object[]) this.f88436d;
                int i5 = this.f88431a - 1;
                this.f88431a = i5;
                return objArr[i5];
            default:
                if (!hasPrevious()) {
                    throw new NoSuchElementException();
                }
                this.f88431a--;
                return this.f88436d;
        }
    }

    public d(Object obj, int i5) {
        super(i5, 1);
        this.f88436d = obj;
    }
}
