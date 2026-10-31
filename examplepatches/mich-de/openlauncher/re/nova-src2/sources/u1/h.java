package u1;

import java.util.Iterator;
import java.util.Map;
import kotlin.jvm.internal.markers.KMutableIterator;

/* loaded from: classes2.dex */
public final class h implements Iterator, KMutableIterator {

    /* renamed from: a, reason: collision with root package name */
    public final f f90348a;

    public h(e eVar) {
        q[] qVarArr = new q[8];
        for (int i5 = 0; i5 < 8; i5++) {
            qVarArr[i5] = new t(this);
        }
        this.f90348a = new f(eVar, qVarArr);
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f90348a.f90335c;
    }

    @Override // java.util.Iterator
    public final Object next() {
        return (Map.Entry) this.f90348a.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        this.f90348a.remove();
    }
}
