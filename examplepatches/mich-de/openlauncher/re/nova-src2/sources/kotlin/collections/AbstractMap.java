package kotlin.collections;

import a1.e;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.markers.KMappedMarker;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0004\b'\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0006\b\u0001\u0010\u0002 \u00012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0003:\u0001\u0006B\t\b\u0004¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lkotlin/collections/AbstractMap;", "K", "V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class AbstractMap<K, V> implements Map<K, V>, KMappedMarker {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f71713c = 0;

    /* renamed from: a, reason: collision with root package name */
    public volatile AbstractMap$keys$1 f71714a;

    /* renamed from: b, reason: collision with root package name */
    public volatile AnonymousClass1 f71715b;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0080\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/collections/AbstractMap$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    static {
        new Companion(0);
    }

    public abstract Set a();

    /* JADX WARN: Type inference failed for: r0v2, types: [kotlin.collections.AbstractMap$keys$1] */
    public Set b() {
        if (this.f71714a == null) {
            this.f71714a = new AbstractSet<Object>() { // from class: kotlin.collections.AbstractMap$keys$1
                @Override // kotlin.collections.AbstractCollection
                public final int c() {
                    return this.f71716b.c();
                }

                @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
                public final boolean contains(Object obj) {
                    return this.f71716b.containsKey(obj);
                }

                @Override // kotlin.collections.AbstractSet, java.util.Collection, java.lang.Iterable, java.util.Set
                public final Iterator iterator() {
                    return new AbstractMap$keys$1$iterator$1(((u1.k) this.f71716b.a()).iterator());
                }
            };
        }
        AbstractMap$keys$1 abstractMap$keys$1 = this.f71714a;
        Intrinsics.d(abstractMap$keys$1);
        return abstractMap$keys$1;
    }

    public int c() {
        return ((AbstractCollection) a()).c();
    }

    @Override // java.util.Map
    public final void clear() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public boolean containsKey(Object obj) {
        return e(obj) != null;
    }

    @Override // java.util.Map
    public boolean containsValue(Object obj) {
        Set setA = a();
        if (setA.isEmpty()) {
            return false;
        }
        Iterator it = setA.iterator();
        while (it.hasNext()) {
            if (Intrinsics.b(((Map.Entry) it.next()).getValue(), obj)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [kotlin.collections.AbstractMap$values$1] */
    public Collection d() {
        if (this.f71715b == null) {
            this.f71715b = new AbstractCollection<Object>() { // from class: kotlin.collections.AbstractMap.values.1
                @Override // kotlin.collections.AbstractCollection
                public final int c() {
                    return AbstractMap.this.c();
                }

                @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
                public final boolean contains(Object obj) {
                    return AbstractMap.this.containsValue(obj);
                }

                @Override // java.util.Collection, java.lang.Iterable
                public final Iterator iterator() {
                    return new AbstractMap$values$1$iterator$1(((u1.k) AbstractMap.this.a()).iterator());
                }
            };
        }
        AnonymousClass1 anonymousClass1 = this.f71715b;
        Intrinsics.d(anonymousClass1);
        return anonymousClass1;
    }

    public final Map.Entry e(Object obj) {
        Object next;
        Iterator it = a().iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((Map.Entry) next).getKey(), obj)) {
                break;
            }
        }
        return (Map.Entry) next;
    }

    @Override // java.util.Map
    public final /* bridge */ Set entrySet() {
        return a();
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Map)) {
            return false;
        }
        Map map = (Map) obj;
        if (c() != map.size()) {
            return false;
        }
        Set<Map.Entry<K, V>> setEntrySet = map.entrySet();
        if ((setEntrySet instanceof Collection) && setEntrySet.isEmpty()) {
            return true;
        }
        Iterator<T> it = setEntrySet.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            if (entry != null) {
                Object key = entry.getKey();
                Object value = entry.getValue();
                V v11 = get(key);
                if (Intrinsics.b(value, v11) && (v11 != null || containsKey(key))) {
                }
            }
            return false;
        }
        return true;
    }

    @Override // java.util.Map
    public Object get(Object obj) {
        Map.Entry entryE = e(obj);
        if (entryE != null) {
            return entryE.getValue();
        }
        return null;
    }

    @Override // java.util.Map
    public final int hashCode() {
        return a().hashCode();
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return c() == 0;
    }

    @Override // java.util.Map
    public final /* bridge */ Set keySet() {
        return b();
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final void putAll(Map map) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final /* bridge */ int size() {
        return c();
    }

    public final String toString() {
        return g.f1(a(), ", ", "{", "}", 0, new e(this, 7), 24);
    }

    @Override // java.util.Map
    public final /* bridge */ Collection values() {
        return d();
    }
}
