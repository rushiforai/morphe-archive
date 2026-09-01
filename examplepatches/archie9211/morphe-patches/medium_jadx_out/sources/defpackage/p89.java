package defpackage;

import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p89 implements Iterator, th6 {
    public final /* synthetic */ int a = 2;
    public final Iterator b;

    public p89(m89 m89Var) {
        atd[] atdVarArr = new atd[8];
        for (int i = 0; i < 8; i++) {
            atdVarArr[i] = new ctd(this);
        }
        this.b = new n89(m89Var, atdVarArr);
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i = this.a;
        Iterator it2 = this.b;
        switch (i) {
            case 0:
                return ((n89) it2).c;
            case 1:
                return ((h1) it2).hasNext();
            default:
                return it2.hasNext();
        }
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        Iterator it2 = this.b;
        switch (i) {
            case 0:
                return (Map.Entry) ((n89) it2).next();
            case 1:
                return ((h1) it2).next();
            default:
                return (gre) it2.next();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                ((n89) this.b).remove();
                return;
            case 1:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public p89(Object[] objArr) {
        objArr.getClass();
        this.b = new h1(objArr);
    }

    public p89(ere ereVar) {
        this.b = ereVar.j.iterator();
    }
}
