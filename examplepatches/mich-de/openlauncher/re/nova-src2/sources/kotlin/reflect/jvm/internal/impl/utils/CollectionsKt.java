package kotlin.reflect.jvm.internal.impl.utils;

import b70.g;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import ul.b;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class CollectionsKt {
    public static final <T> void addIfNotNull(@NotNull Collection<T> collection, @Nullable T t6) {
        Intrinsics.g(collection, "<this>");
        if (t6 != null) {
            collection.add(t6);
        }
    }

    private static final int capacity(int i5) {
        if (i5 < 3) {
            return 3;
        }
        return (i5 / 3) + i5 + 1;
    }

    @NotNull
    public static final <T> List<T> compact(@NotNull ArrayList<T> arrayList) {
        Intrinsics.g(arrayList, "<this>");
        int size = arrayList.size();
        if (size == 0) {
            return EmptyList.f71733a;
        }
        if (size == 1) {
            return b.P(g.W0(arrayList));
        }
        arrayList.trimToSize();
        return arrayList;
    }

    @NotNull
    public static final <K> Map<K, Integer> mapToIndex(@NotNull Iterable<? extends K> iterable) {
        Intrinsics.g(iterable, "<this>");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator<? extends K> it = iterable.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            linkedHashMap.put(it.next(), Integer.valueOf(i5));
            i5++;
        }
        return linkedHashMap;
    }

    @NotNull
    public static final <K, V> HashMap<K, V> newHashMapWithExpectedSize(int i5) {
        return new HashMap<>(capacity(i5));
    }

    @NotNull
    public static final <E> HashSet<E> newHashSetWithExpectedSize(int i5) {
        return new HashSet<>(capacity(i5));
    }

    @NotNull
    public static final <E> LinkedHashSet<E> newLinkedHashSetWithExpectedSize(int i5) {
        return new LinkedHashSet<>(capacity(i5));
    }
}
