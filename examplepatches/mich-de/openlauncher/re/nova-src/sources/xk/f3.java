package xk;

import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.SortedSet;

/* loaded from: classes3.dex */
public final class f3 extends e3 implements SortedSet {
    @Override // java.util.SortedSet
    public final Comparator comparator() {
        return ((SortedSet) this.f95904a).comparator();
    }

    @Override // java.util.SortedSet
    public final Object first() {
        Iterator it = this.f95904a.iterator();
        it.getClass();
        vk.m mVar = this.f95905b;
        mVar.getClass();
        while (it.hasNext()) {
            Object next = it.next();
            if (mVar.apply(next)) {
                return next;
            }
        }
        throw new NoSuchElementException();
    }

    @Override // java.util.SortedSet
    public final SortedSet headSet(Object obj) {
        return new f3(((SortedSet) this.f95904a).headSet(obj), this.f95905b);
    }

    @Override // java.util.SortedSet
    public final Object last() {
        SortedSet sortedSetHeadSet = (SortedSet) this.f95904a;
        while (true) {
            Object objLast = sortedSetHeadSet.last();
            if (this.f95905b.apply(objLast)) {
                return objLast;
            }
            sortedSetHeadSet = sortedSetHeadSet.headSet(objLast);
        }
    }

    @Override // java.util.SortedSet
    public final SortedSet subSet(Object obj, Object obj2) {
        return new f3(((SortedSet) this.f95904a).subSet(obj, obj2), this.f95905b);
    }

    @Override // java.util.SortedSet
    public final SortedSet tailSet(Object obj) {
        return new f3(((SortedSet) this.f95904a).tailSet(obj), this.f95905b);
    }
}
