package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zm3 implements Iterator, th6 {
    public final /* synthetic */ int a;
    public final Iterator b;
    public int c;

    public zm3(gfd gfdVar) {
        this.a = 2;
        this.c = 10;
        this.b = gfdVar.a.iterator();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i = this.a;
        Iterator it2 = this.b;
        switch (i) {
            case 0:
                break;
            case 1:
                return it2.hasNext();
            default:
                return this.c > 0 && it2.hasNext();
        }
        while (this.c > 0 && it2.hasNext()) {
            it2.next();
            this.c--;
        }
        return it2.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        Iterator it2 = this.b;
        switch (i) {
            case 0:
                break;
            case 1:
                int i2 = this.c;
                this.c = i2 + 1;
                if (i2 >= 0) {
                    return new r06(i2, it2.next());
                }
                d46.i0();
                throw null;
            default:
                int i3 = this.c;
                if (i3 != 0) {
                    this.c = i3 - 1;
                    return it2.next();
                }
                ywb.n();
                return null;
        }
        while (this.c > 0 && it2.hasNext()) {
            it2.next();
            this.c--;
        }
        return it2.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 1:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public zm3(Iterator it2) {
        this.a = 1;
        it2.getClass();
        this.b = it2;
    }

    public zm3(an3 an3Var) {
        this.a = 0;
        this.b = an3Var.a.iterator();
        this.c = an3Var.b;
    }
}
