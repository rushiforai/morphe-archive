package xk;

import java.util.Comparator;
import java.util.SortedMap;
import java.util.SortedSet;

/* loaded from: classes3.dex */
public class k extends f implements SortedMap {

    /* renamed from: e, reason: collision with root package name */
    public SortedSet f95946e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ d2 f95947f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(d2 d2Var, SortedMap sortedMap) {
        super(d2Var, sortedMap);
        this.f95947f = d2Var;
    }

    public SortedSet b() {
        return new l(this.f95947f, d());
    }

    @Override // xk.f, java.util.AbstractMap, java.util.Map
    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public SortedSet keySet() {
        SortedSet sortedSet = this.f95946e;
        if (sortedSet != null) {
            return sortedSet;
        }
        SortedSet sortedSetB = b();
        this.f95946e = sortedSetB;
        return sortedSetB;
    }

    @Override // java.util.SortedMap
    public final Comparator comparator() {
        return d().comparator();
    }

    public SortedMap d() {
        return (SortedMap) this.f95908c;
    }

    @Override // java.util.SortedMap
    public final Object firstKey() {
        return d().firstKey();
    }

    public SortedMap headMap(Object obj) {
        return new k(this.f95947f, d().headMap(obj));
    }

    @Override // java.util.SortedMap
    public final Object lastKey() {
        return d().lastKey();
    }

    public SortedMap subMap(Object obj, Object obj2) {
        return new k(this.f95947f, d().subMap(obj, obj2));
    }

    public SortedMap tailMap(Object obj) {
        return new k(this.f95947f, d().tailMap(obj));
    }
}
