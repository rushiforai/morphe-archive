package ads_mobile_sdk;

import b.t8;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes2.dex */
public final class oz2 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayDeque f8035a;

    /* renamed from: b, reason: collision with root package name */
    public t8 f8036b;

    public oz2(sq sqVar) {
        if (!(sqVar instanceof pz2)) {
            this.f8035a = null;
            this.f8036b = (t8) sqVar;
            return;
        }
        pz2 pz2Var = (pz2) sqVar;
        ArrayDeque arrayDeque = new ArrayDeque(pz2Var.f8432h);
        this.f8035a = arrayDeque;
        arrayDeque.push(pz2Var);
        sq sqVar2 = pz2Var.f8429e;
        while (sqVar2 instanceof pz2) {
            pz2 pz2Var2 = (pz2) sqVar2;
            this.f8035a.push(pz2Var2);
            sqVar2 = pz2Var2.f8429e;
        }
        this.f8036b = (t8) sqVar2;
    }

    @Override // java.util.Iterator
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final t8 next() {
        t8 t8Var;
        t8 t8Var2 = this.f8036b;
        if (t8Var2 == null) {
            throw new NoSuchElementException();
        }
        do {
            ArrayDeque arrayDeque = this.f8035a;
            if (arrayDeque == null || arrayDeque.isEmpty()) {
                t8Var = null;
                break;
            }
            sq sqVar = ((pz2) arrayDeque.pop()).f8430f;
            while (sqVar instanceof pz2) {
                pz2 pz2Var = (pz2) sqVar;
                arrayDeque.push(pz2Var);
                sqVar = pz2Var.f8429e;
            }
            t8Var = (t8) sqVar;
        } while (t8Var.size() == 0);
        this.f8036b = t8Var;
        return t8Var2;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f8036b != null;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
