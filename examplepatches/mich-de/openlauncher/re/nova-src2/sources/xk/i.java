package xk;

import java.util.Iterator;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.SortedMap;
import java.util.SortedSet;

/* loaded from: classes3.dex */
public final class i extends l implements NavigableSet {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ d2 f95932d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(d2 d2Var, NavigableMap navigableMap) {
        super(d2Var, navigableMap);
        this.f95932d = d2Var;
    }

    @Override // java.util.NavigableSet
    public final Object ceiling(Object obj) {
        return c().ceilingKey(obj);
    }

    @Override // xk.l
    /* renamed from: d, reason: merged with bridge method [inline-methods] */
    public final NavigableMap c() {
        return (NavigableMap) ((SortedMap) this.f95914a);
    }

    @Override // java.util.NavigableSet
    public final Iterator descendingIterator() {
        return ((g) descendingSet()).iterator();
    }

    @Override // java.util.NavigableSet
    public final NavigableSet descendingSet() {
        return new i(this.f95932d, c().descendingMap());
    }

    @Override // java.util.NavigableSet
    public final Object floor(Object obj) {
        return c().floorKey(obj);
    }

    @Override // xk.l, java.util.SortedSet, java.util.NavigableSet
    public final SortedSet headSet(Object obj) {
        return headSet(obj, false);
    }

    @Override // java.util.NavigableSet
    public final Object higher(Object obj) {
        return c().higherKey(obj);
    }

    @Override // java.util.NavigableSet
    public final Object lower(Object obj) {
        return c().lowerKey(obj);
    }

    @Override // java.util.NavigableSet
    public final Object pollFirst() {
        e eVar = (e) iterator();
        if (!eVar.hasNext()) {
            return null;
        }
        Object next = eVar.next();
        eVar.remove();
        return next;
    }

    @Override // java.util.NavigableSet
    public final Object pollLast() {
        Iterator itDescendingIterator = descendingIterator();
        if (!itDescendingIterator.hasNext()) {
            return null;
        }
        Object next = itDescendingIterator.next();
        itDescendingIterator.remove();
        return next;
    }

    @Override // xk.l, java.util.SortedSet, java.util.NavigableSet
    public final SortedSet subSet(Object obj, Object obj2) {
        return subSet(obj, true, obj2, false);
    }

    @Override // xk.l, java.util.SortedSet, java.util.NavigableSet
    public final SortedSet tailSet(Object obj) {
        return tailSet(obj, true);
    }

    @Override // java.util.NavigableSet
    public final NavigableSet headSet(Object obj, boolean z11) {
        return new i(this.f95932d, c().headMap(obj, z11));
    }

    @Override // java.util.NavigableSet
    public final NavigableSet subSet(Object obj, boolean z11, Object obj2, boolean z12) {
        return new i(this.f95932d, c().subMap(obj, z11, obj2, z12));
    }

    @Override // java.util.NavigableSet
    public final NavigableSet tailSet(Object obj, boolean z11) {
        return new i(this.f95932d, c().tailMap(obj, z11));
    }
}
