package kotlin.collections.builders;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010'\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022 \u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0003¨\u0006\u0005"}, d2 = {"Lkotlin/collections/builders/MapBuilderEntries;", "K", "V", "Lkotlin/collections/builders/AbstractMapBuilderEntrySet;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class MapBuilderEntries<K, V> extends AbstractMapBuilderEntrySet<Map.Entry<K, V>, K, V> {

    /* renamed from: a, reason: collision with root package name */
    public final MapBuilder f71781a;

    public MapBuilderEntries(MapBuilder mapBuilder) {
        this.f71781a = mapBuilder;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean add(Object obj) {
        Map.Entry element = (Map.Entry) obj;
        Intrinsics.g(element, "element");
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean addAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.collections.AbstractMutableSet
    public final int c() {
        return this.f71781a.f71769i;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        this.f71781a.clear();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean containsAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        return this.f71781a.e(elements);
    }

    @Override // kotlin.collections.builders.AbstractMapBuilderEntrySet
    public final boolean d(Map.Entry element) {
        Intrinsics.g(element, "element");
        return this.f71781a.f(element);
    }

    @Override // kotlin.collections.builders.AbstractMapBuilderEntrySet
    public final boolean e(Map.Entry element) {
        Intrinsics.g(element, "element");
        MapBuilder mapBuilder = this.f71781a;
        mapBuilder.getClass();
        mapBuilder.c();
        int iH = mapBuilder.h(element.getKey());
        if (iH < 0) {
            return false;
        }
        Object[] objArr = mapBuilder.f71762b;
        Intrinsics.d(objArr);
        if (!Intrinsics.b(objArr[iH], element.getValue())) {
            return false;
        }
        mapBuilder.l(iH);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        return this.f71781a.isEmpty();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        MapBuilder mapBuilder = this.f71781a;
        mapBuilder.getClass();
        return new MapBuilder.EntriesItr(mapBuilder);
    }

    @Override // java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean removeAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        this.f71781a.c();
        return super.removeAll(elements);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean retainAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        this.f71781a.c();
        return super.retainAll(elements);
    }
}
