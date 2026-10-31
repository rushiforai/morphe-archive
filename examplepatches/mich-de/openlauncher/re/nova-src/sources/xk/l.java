package xk;

import java.util.Comparator;
import java.util.SortedMap;
import java.util.SortedSet;

/* loaded from: classes3.dex */
public class l extends g implements SortedSet {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ d2 f95960c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(d2 d2Var, SortedMap sortedMap) {
        super(d2Var, sortedMap);
        this.f95960c = d2Var;
    }

    public SortedMap c() {
        return (SortedMap) this.f95914a;
    }

    @Override // java.util.SortedSet
    public final Comparator comparator() {
        return c().comparator();
    }

    @Override // java.util.SortedSet
    public final Object first() {
        return c().firstKey();
    }

    public SortedSet headSet(Object obj) {
        return new l(this.f95960c, c().headMap(obj));
    }

    @Override // java.util.SortedSet
    public final Object last() {
        return c().lastKey();
    }

    public SortedSet subSet(Object obj, Object obj2) {
        return new l(this.f95960c, c().subMap(obj, obj2));
    }

    public SortedSet tailSet(Object obj) {
        return new l(this.f95960c, c().tailMap(obj));
    }
}
