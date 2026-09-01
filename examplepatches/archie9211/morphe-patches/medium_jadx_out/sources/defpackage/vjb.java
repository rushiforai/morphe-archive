package defpackage;

import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vjb implements ListIterator, th6 {
    public final /* synthetic */ int a = 1;
    public final Object b;
    public final /* synthetic */ Object c;

    public vjb(gj7 gj7Var, int i) {
        this.c = gj7Var;
        this.b = ((List) gj7Var.b).listIterator(bu1.X0(i, gj7Var));
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        switch (this.a) {
            case 0:
                ListIterator listIterator = (ListIterator) this.b;
                listIterator.add(obj);
                listIterator.previous();
                return;
            case 1:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new IllegalStateException("Cannot modify a state list through an iterator");
        }
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                break;
            case 1:
                break;
            default:
                if (((pya) obj).a < ((cvc) this.c).d - 1) {
                }
                break;
        }
        return ((ListIterator) obj).hasPrevious();
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                break;
            case 1:
                break;
            default:
                if (((pya) obj).a >= 0) {
                }
                break;
        }
        return ((ListIterator) obj).hasNext();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((ListIterator) obj).previous();
            case 1:
                return ((ListIterator) obj).previous();
            default:
                pya pyaVar = (pya) obj;
                int i2 = pyaVar.a + 1;
                cvc cvcVar = (cvc) this.c;
                g01.V(i2, cvcVar.d);
                pyaVar.a = i2;
                return cvcVar.get(i2);
        }
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        int iPreviousIndex;
        int size;
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                iPreviousIndex = ((ListIterator) obj2).previousIndex();
                size = ((wjb) obj).size();
                break;
            case 1:
                iPreviousIndex = ((ListIterator) obj2).previousIndex();
                size = ((gj7) obj).size();
                break;
            default:
                return ((pya) obj2).a + 1;
        }
        return (size - 1) - iPreviousIndex;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((ListIterator) obj).next();
            case 1:
                return ((ListIterator) obj).next();
            default:
                pya pyaVar = (pya) obj;
                int i2 = pyaVar.a;
                cvc cvcVar = (cvc) this.c;
                g01.V(i2, cvcVar.d);
                pyaVar.a = i2 - 1;
                return cvcVar.get(i2);
        }
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        int iNextIndex;
        int size;
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                iNextIndex = ((ListIterator) obj2).nextIndex();
                size = ((wjb) obj).size();
                break;
            case 1:
                iNextIndex = ((ListIterator) obj2).nextIndex();
                size = ((gj7) obj).size();
                break;
            default:
                return ((pya) obj2).a;
        }
        return (size - 1) - iNextIndex;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                ((ListIterator) this.b).remove();
                return;
            case 1:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new IllegalStateException("Cannot modify a state list through an iterator");
        }
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        switch (this.a) {
            case 0:
                ((ListIterator) this.b).set(obj);
                return;
            case 1:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new IllegalStateException("Cannot modify a state list through an iterator");
        }
    }

    public vjb(wjb wjbVar, int i) {
        this.c = wjbVar;
        this.b = wjbVar.a.listIterator(bu1.X0(i, wjbVar));
    }

    public vjb(pya pyaVar, cvc cvcVar) {
        this.b = pyaVar;
        this.c = cvcVar;
    }
}
