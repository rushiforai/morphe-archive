package defpackage;

import java.util.AbstractCollection;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.Stack;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rlb implements Iterator {
    public final /* synthetic */ int a;
    public final AbstractCollection b;
    public Iterable c;

    public rlb(pmf pmfVar) {
        this.a = 1;
        if (!(pmfVar instanceof uof)) {
            this.b = null;
            this.c = (nmf) pmfVar;
            return;
        }
        uof uofVar = (uof) pmfVar;
        ArrayDeque arrayDeque = new ArrayDeque(uofVar.g);
        this.b = arrayDeque;
        arrayDeque.push(uofVar);
        pmf pmfVar2 = uofVar.d;
        while (pmfVar2 instanceof uof) {
            uof uofVar2 = (uof) pmfVar2;
            ((ArrayDeque) this.b).push(uofVar2);
            pmfVar2 = uofVar2.d;
        }
        this.c = (nmf) pmfVar2;
    }

    public c57 a() {
        Stack stack = (Stack) this.b;
        c57 c57Var = (c57) this.c;
        c57 c57Var2 = null;
        if (c57Var == null) {
            ywb.n();
            return null;
        }
        while (true) {
            if (!stack.isEmpty()) {
                g21 g21Var = ((tlb) stack.pop()).d;
                while (g21Var instanceof tlb) {
                    tlb tlbVar = (tlb) g21Var;
                    stack.push(tlbVar);
                    g21Var = tlbVar.c;
                }
                c57 c57Var3 = (c57) g21Var;
                if (c57Var3.b.length != 0) {
                    c57Var2 = c57Var3;
                    break;
                }
            } else {
                break;
            }
        }
        this.c = c57Var2;
        return c57Var;
    }

    public nmf b() {
        ArrayDeque arrayDeque = (ArrayDeque) this.b;
        nmf nmfVar = (nmf) this.c;
        nmf nmfVar2 = null;
        if (nmfVar == null) {
            ywb.n();
            return null;
        }
        while (true) {
            if (arrayDeque != null && !arrayDeque.isEmpty()) {
                pmf pmfVar = ((uof) arrayDeque.pop()).e;
                while (pmfVar instanceof uof) {
                    uof uofVar = (uof) pmfVar;
                    arrayDeque.push(uofVar);
                    pmfVar = uofVar.d;
                }
                nmf nmfVar3 = (nmf) pmfVar;
                if (nmfVar3.m() != 0) {
                    nmfVar2 = nmfVar3;
                    break;
                }
            } else {
                break;
            }
        }
        this.c = nmfVar2;
        return nmfVar;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.a) {
            case 0:
                if (((c57) this.c) != null) {
                }
                break;
            default:
                if (((nmf) this.c) != null) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final /* bridge */ /* synthetic */ Object next() {
        switch (this.a) {
            case 0:
                return a();
            default:
                return b();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    public rlb(g21 g21Var) {
        this.a = 0;
        this.b = new Stack();
        while (g21Var instanceof tlb) {
            tlb tlbVar = (tlb) g21Var;
            ((Stack) this.b).push(tlbVar);
            g21Var = tlbVar.c;
        }
        this.c = (c57) g21Var;
    }
}
