package ma0;

import hn.m;
import java.util.Iterator;
import java.util.NoSuchElementException;
import ya.s;

/* loaded from: classes.dex */
public final class i implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76194a;

    /* renamed from: b, reason: collision with root package name */
    public int f76195b = 0;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Iterable f76196c;

    public /* synthetic */ i(Iterable iterable, int i5) {
        this.f76194a = i5;
        this.f76196c = iterable;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f76194a) {
            case 0:
                if (this.f76195b < ((m) this.f76196c).size()) {
                }
                break;
            default:
                if (this.f76195b < ((s) this.f76196c).size()) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f76194a) {
            case 0:
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                m mVar = (m) this.f76196c;
                int i5 = this.f76195b;
                this.f76195b = i5 + 1;
                return (ja0.h) ((ja0.m) mVar.f59922b).f69361v.get(i5);
            default:
                s sVar = (s) this.f76196c;
                int i11 = this.f76195b;
                this.f76195b = i11 + 1;
                return sVar.valueAt(i11);
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f76194a) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }
}
