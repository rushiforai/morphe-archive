package kotlin.collections.builders;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.AbstractList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.markers.KMutableIterator;
import kotlin.jvm.internal.markers.KMutableMap;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\t\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00032\u00060\u0004j\u0002`\u0005:\u0006\b\t\n\u000b\f\rB\t\b\u0016¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\u000e"}, d2 = {"Lkotlin/collections/builders/MapBuilder;", "K", "V", b.f42142b, "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "<init>", "()V", k.O, "Itr", "KeysItr", "ValuesItr", "EntriesItr", "EntryRef", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class MapBuilder<K, V> implements Map<K, V>, Serializable, KMutableMap {
    public static final Companion n = new Companion(0);
    public static final MapBuilder o;

    /* renamed from: a, reason: collision with root package name */
    public Object[] f71761a;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f71762b;

    /* renamed from: c, reason: collision with root package name */
    public int[] f71763c;

    /* renamed from: d, reason: collision with root package name */
    public int[] f71764d;

    /* renamed from: e, reason: collision with root package name */
    public int f71765e;

    /* renamed from: f, reason: collision with root package name */
    public int f71766f;

    /* renamed from: g, reason: collision with root package name */
    public int f71767g;

    /* renamed from: h, reason: collision with root package name */
    public int f71768h;

    /* renamed from: i, reason: collision with root package name */
    public int f71769i;

    /* renamed from: j, reason: collision with root package name */
    public MapBuilderKeys f71770j;

    /* renamed from: k, reason: collision with root package name */
    public MapBuilderValues f71771k;

    /* renamed from: l, reason: collision with root package name */
    public MapBuilderEntries f71772l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f71773m;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\b\u0080\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0005\u0010\u0006R\u0014\u0010\u0007\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0007\u0010\u0006R\u0014\u0010\b\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\b\u0010\u0006R\u0014\u0010\t\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\t\u0010\u0006¨\u0006\n"}, d2 = {"Lkotlin/collections/builders/MapBuilder$Companion;", b.f42142b, "<init>", "()V", b.f42142b, "MAGIC", "I", "INITIAL_CAPACITY", "INITIAL_MAX_PROBE_DISTANCE", "TOMBSTONE", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010)\n\u0002\u0010'\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0002\u0010\u0001*\u0004\b\u0003\u0010\u00022\u000e\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00028\u00030\u00032\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00028\u00030\u00050\u0004¨\u0006\u0006"}, d2 = {"Lkotlin/collections/builders/MapBuilder$EntriesItr;", "K", "V", "Lkotlin/collections/builders/MapBuilder$Itr;", b.f42142b, b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class EntriesItr<K, V> extends Itr<K, V> implements Iterator<Map.Entry<K, V>>, KMutableIterator {
        @Override // java.util.Iterator
        public final Object next() {
            a();
            int i5 = this.f71778b;
            MapBuilder mapBuilder = this.f71777a;
            if (i5 >= mapBuilder.f71766f) {
                throw new NoSuchElementException();
            }
            this.f71778b = i5 + 1;
            this.f71779c = i5;
            EntryRef entryRef = new EntryRef(mapBuilder, i5);
            b();
            return entryRef;
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010'\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0002\u0010\u0001*\u0004\b\u0003\u0010\u00022\u000e\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00028\u00030\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/collections/builders/MapBuilder$EntryRef;", "K", "V", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class EntryRef<K, V> implements Map.Entry<K, V>, KMutableMap.Entry {

        /* renamed from: a, reason: collision with root package name */
        public final MapBuilder f71774a;

        /* renamed from: b, reason: collision with root package name */
        public final int f71775b;

        /* renamed from: c, reason: collision with root package name */
        public final int f71776c;

        public EntryRef(MapBuilder map, int i5) {
            Intrinsics.g(map, "map");
            this.f71774a = map;
            this.f71775b = i5;
            this.f71776c = map.f71768h;
        }

        public final void a() {
            if (this.f71774a.f71768h != this.f71776c) {
                throw new ConcurrentModificationException("The backing map has been modified after this entry was obtained.");
            }
        }

        @Override // java.util.Map.Entry
        public final boolean equals(Object obj) {
            if (!(obj instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) obj;
            return Intrinsics.b(entry.getKey(), getKey()) && Intrinsics.b(entry.getValue(), getValue());
        }

        @Override // java.util.Map.Entry
        public final Object getKey() {
            a();
            return this.f71774a.f71761a[this.f71775b];
        }

        @Override // java.util.Map.Entry
        public final Object getValue() {
            a();
            Object[] objArr = this.f71774a.f71762b;
            Intrinsics.d(objArr);
            return objArr[this.f71775b];
        }

        @Override // java.util.Map.Entry
        public final int hashCode() {
            Object key = getKey();
            int iHashCode = key != null ? key.hashCode() : 0;
            Object value = getValue();
            return iHashCode ^ (value != null ? value.hashCode() : 0);
        }

        @Override // java.util.Map.Entry
        public final Object setValue(Object obj) {
            a();
            MapBuilder mapBuilder = this.f71774a;
            mapBuilder.c();
            Object[] objArr = mapBuilder.f71762b;
            if (objArr == null) {
                int length = mapBuilder.f71761a.length;
                if (length < 0) {
                    throw new IllegalArgumentException("capacity must be non-negative.");
                }
                objArr = new Object[length];
                mapBuilder.f71762b = objArr;
            }
            int i5 = this.f71775b;
            Object obj2 = objArr[i5];
            objArr[i5] = obj;
            return obj2;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(getKey());
            sb2.append('=');
            sb2.append(getValue());
            return sb2.toString();
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\b\u0010\u0018\u0000*\u0004\b\u0002\u0010\u0001*\u0004\b\u0003\u0010\u00022\u00020\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/collections/builders/MapBuilder$Itr;", "K", "V", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static class Itr<K, V> {

        /* renamed from: a, reason: collision with root package name */
        public final MapBuilder f71777a;

        /* renamed from: b, reason: collision with root package name */
        public int f71778b;

        /* renamed from: c, reason: collision with root package name */
        public int f71779c;

        /* renamed from: d, reason: collision with root package name */
        public int f71780d;

        public Itr(MapBuilder map) {
            Intrinsics.g(map, "map");
            this.f71777a = map;
            this.f71779c = -1;
            this.f71780d = map.f71768h;
            b();
        }

        public final void a() {
            if (this.f71777a.f71768h != this.f71780d) {
                throw new ConcurrentModificationException();
            }
        }

        public final void b() {
            while (true) {
                int i5 = this.f71778b;
                MapBuilder mapBuilder = this.f71777a;
                if (i5 >= mapBuilder.f71766f || mapBuilder.f71763c[i5] >= 0) {
                    return;
                } else {
                    this.f71778b = i5 + 1;
                }
            }
        }

        public final boolean hasNext() {
            return this.f71778b < this.f71777a.f71766f;
        }

        public final void remove() {
            a();
            if (this.f71779c == -1) {
                throw new IllegalStateException("Call next() before removing element from the iterator.");
            }
            MapBuilder mapBuilder = this.f71777a;
            mapBuilder.c();
            mapBuilder.l(this.f71779c);
            this.f71779c = -1;
            this.f71780d = mapBuilder.f71768h;
        }
    }

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010)\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0002\u0010\u0001*\u0004\b\u0003\u0010\u00022\u000e\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00028\u00030\u00032\b\u0012\u0004\u0012\u00028\u00020\u0004¨\u0006\u0005"}, d2 = {"Lkotlin/collections/builders/MapBuilder$KeysItr;", "K", "V", "Lkotlin/collections/builders/MapBuilder$Itr;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes4.dex */
    public static final class KeysItr<K, V> extends Itr<K, V> implements Iterator<K>, KMutableIterator {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public KeysItr(MapBuilder map) {
            super(map);
            Intrinsics.g(map, "map");
        }

        @Override // java.util.Iterator
        public final Object next() {
            a();
            int i5 = this.f71778b;
            MapBuilder mapBuilder = this.f71777a;
            if (i5 >= mapBuilder.f71766f) {
                throw new NoSuchElementException();
            }
            this.f71778b = i5 + 1;
            this.f71779c = i5;
            Object obj = mapBuilder.f71761a[i5];
            b();
            return obj;
        }
    }

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010)\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0002\u0010\u0001*\u0004\b\u0003\u0010\u00022\u000e\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00028\u00030\u00032\b\u0012\u0004\u0012\u00028\u00030\u0004¨\u0006\u0005"}, d2 = {"Lkotlin/collections/builders/MapBuilder$ValuesItr;", "K", "V", "Lkotlin/collections/builders/MapBuilder$Itr;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ValuesItr<K, V> extends Itr<K, V> implements Iterator<V>, KMutableIterator {
        @Override // java.util.Iterator
        public final Object next() {
            a();
            int i5 = this.f71778b;
            MapBuilder mapBuilder = this.f71777a;
            if (i5 >= mapBuilder.f71766f) {
                throw new NoSuchElementException();
            }
            this.f71778b = i5 + 1;
            this.f71779c = i5;
            Object[] objArr = mapBuilder.f71762b;
            Intrinsics.d(objArr);
            Object obj = objArr[this.f71779c];
            b();
            return obj;
        }
    }

    static {
        MapBuilder mapBuilder = new MapBuilder(0);
        mapBuilder.f71773m = true;
        o = mapBuilder;
    }

    public MapBuilder() {
        this(8);
    }

    public final int a(Object obj) {
        c();
        while (true) {
            int iJ = j(obj);
            int i5 = this.f71765e * 2;
            int length = this.f71764d.length / 2;
            if (i5 > length) {
                i5 = length;
            }
            int i11 = 0;
            while (true) {
                int[] iArr = this.f71764d;
                int i12 = iArr[iJ];
                if (i12 <= 0) {
                    int i13 = this.f71766f;
                    Object[] objArr = this.f71761a;
                    if (i13 < objArr.length) {
                        int i14 = i13 + 1;
                        this.f71766f = i14;
                        objArr[i13] = obj;
                        this.f71763c[i13] = iJ;
                        iArr[iJ] = i14;
                        this.f71769i++;
                        this.f71768h++;
                        if (i11 > this.f71765e) {
                            this.f71765e = i11;
                        }
                        return i13;
                    }
                    g(1);
                } else {
                    if (Intrinsics.b(this.f71761a[i12 - 1], obj)) {
                        return -i12;
                    }
                    i11++;
                    if (i11 > i5) {
                        k(this.f71764d.length * 2);
                        break;
                    }
                    iJ = iJ == 0 ? this.f71764d.length - 1 : iJ - 1;
                }
            }
        }
    }

    public final MapBuilder b() {
        c();
        this.f71773m = true;
        if (this.f71769i > 0) {
            return this;
        }
        MapBuilder mapBuilder = o;
        Intrinsics.e(mapBuilder, "null cannot be cast to non-null type kotlin.collections.Map<K of kotlin.collections.builders.MapBuilder, V of kotlin.collections.builders.MapBuilder>");
        return mapBuilder;
    }

    public final void c() {
        if (this.f71773m) {
            throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.Map
    public final void clear() {
        c();
        int i5 = this.f71766f - 1;
        if (i5 >= 0) {
            int i11 = 0;
            while (true) {
                int[] iArr = this.f71763c;
                int i12 = iArr[i11];
                if (i12 >= 0) {
                    this.f71764d[i12] = 0;
                    iArr[i11] = -1;
                }
                if (i11 == i5) {
                    break;
                } else {
                    i11++;
                }
            }
        }
        ListBuilderKt.b(this.f71761a, 0, this.f71766f);
        Object[] objArr = this.f71762b;
        if (objArr != null) {
            ListBuilderKt.b(objArr, 0, this.f71766f);
        }
        this.f71769i = 0;
        this.f71766f = 0;
        this.f71768h++;
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return h(obj) >= 0;
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        return i(obj) >= 0;
    }

    public final void d(boolean z11) {
        int i5;
        Object[] objArr = this.f71762b;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            i5 = this.f71766f;
            if (i11 >= i5) {
                break;
            }
            int[] iArr = this.f71763c;
            int i13 = iArr[i11];
            if (i13 >= 0) {
                Object[] objArr2 = this.f71761a;
                objArr2[i12] = objArr2[i11];
                if (objArr != null) {
                    objArr[i12] = objArr[i11];
                }
                if (z11) {
                    iArr[i12] = i13;
                    this.f71764d[i13] = i12 + 1;
                }
                i12++;
            }
            i11++;
        }
        ListBuilderKt.b(this.f71761a, i12, i5);
        if (objArr != null) {
            ListBuilderKt.b(objArr, i12, this.f71766f);
        }
        this.f71766f = i12;
    }

    public final boolean e(Collection m11) {
        Intrinsics.g(m11, "m");
        for (Object obj : m11) {
            if (obj != null) {
                try {
                    if (!f((Map.Entry) obj)) {
                    }
                } catch (ClassCastException unused) {
                }
            }
            return false;
        }
        return true;
    }

    @Override // java.util.Map
    public final Set entrySet() {
        MapBuilderEntries mapBuilderEntries = this.f71772l;
        if (mapBuilderEntries != null) {
            return mapBuilderEntries;
        }
        MapBuilderEntries mapBuilderEntries2 = new MapBuilderEntries(this);
        this.f71772l = mapBuilderEntries2;
        return mapBuilderEntries2;
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
        return this.f71769i == map.size() && e(map.entrySet());
    }

    public final boolean f(Map.Entry entry) {
        Intrinsics.g(entry, "entry");
        int iH = h(entry.getKey());
        if (iH < 0) {
            return false;
        }
        Object[] objArr = this.f71762b;
        Intrinsics.d(objArr);
        return Intrinsics.b(objArr[iH], entry.getValue());
    }

    public final void g(int i5) {
        Object[] objArrCopyOf;
        Object[] objArr = this.f71761a;
        int length = objArr.length;
        int i11 = this.f71766f;
        int i12 = length - i11;
        int i13 = i11 - this.f71769i;
        if (i12 < i5 && i12 + i13 >= i5 && i13 >= objArr.length / 4) {
            d(true);
            return;
        }
        int i14 = i11 + i5;
        if (i14 < 0) {
            throw new OutOfMemoryError();
        }
        if (i14 > objArr.length) {
            AbstractList.Companion companion = AbstractList.f71712a;
            int length2 = objArr.length;
            companion.getClass();
            int iE = AbstractList.Companion.e(length2, i14);
            Object[] objArr2 = this.f71761a;
            Intrinsics.g(objArr2, "<this>");
            Object[] objArrCopyOf2 = Arrays.copyOf(objArr2, iE);
            Intrinsics.f(objArrCopyOf2, "copyOf(...)");
            this.f71761a = objArrCopyOf2;
            Object[] objArr3 = this.f71762b;
            if (objArr3 != null) {
                objArrCopyOf = Arrays.copyOf(objArr3, iE);
                Intrinsics.f(objArrCopyOf, "copyOf(...)");
            } else {
                objArrCopyOf = null;
            }
            this.f71762b = objArrCopyOf;
            int[] iArrCopyOf = Arrays.copyOf(this.f71763c, iE);
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f71763c = iArrCopyOf;
            n.getClass();
            int iHighestOneBit = Integer.highestOneBit((iE >= 1 ? iE : 1) * 3);
            if (iHighestOneBit > this.f71764d.length) {
                k(iHighestOneBit);
            }
        }
    }

    @Override // java.util.Map
    public final Object get(Object obj) {
        int iH = h(obj);
        if (iH < 0) {
            return null;
        }
        Object[] objArr = this.f71762b;
        Intrinsics.d(objArr);
        return objArr[iH];
    }

    public final int h(Object obj) {
        int iJ = j(obj);
        int i5 = this.f71765e;
        while (true) {
            int i11 = this.f71764d[iJ];
            if (i11 == 0) {
                return -1;
            }
            if (i11 > 0) {
                int i12 = i11 - 1;
                if (Intrinsics.b(this.f71761a[i12], obj)) {
                    return i12;
                }
            }
            i5--;
            if (i5 < 0) {
                return -1;
            }
            iJ = iJ == 0 ? this.f71764d.length - 1 : iJ - 1;
        }
    }

    @Override // java.util.Map
    public final int hashCode() {
        EntriesItr entriesItr = new EntriesItr(this);
        int i5 = 0;
        while (entriesItr.hasNext()) {
            int i11 = entriesItr.f71778b;
            MapBuilder mapBuilder = entriesItr.f71777a;
            if (i11 >= mapBuilder.f71766f) {
                throw new NoSuchElementException();
            }
            entriesItr.f71778b = i11 + 1;
            entriesItr.f71779c = i11;
            Object obj = mapBuilder.f71761a[i11];
            int iHashCode = obj != null ? obj.hashCode() : 0;
            Object[] objArr = mapBuilder.f71762b;
            Intrinsics.d(objArr);
            Object obj2 = objArr[entriesItr.f71779c];
            int iHashCode2 = obj2 != null ? obj2.hashCode() : 0;
            entriesItr.b();
            i5 += iHashCode ^ iHashCode2;
        }
        return i5;
    }

    public final int i(Object obj) {
        int i5 = this.f71766f;
        while (true) {
            i5--;
            if (i5 < 0) {
                return -1;
            }
            if (this.f71763c[i5] >= 0) {
                Object[] objArr = this.f71762b;
                Intrinsics.d(objArr);
                if (Intrinsics.b(objArr[i5], obj)) {
                    return i5;
                }
            }
        }
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return this.f71769i == 0;
    }

    public final int j(Object obj) {
        return ((obj != null ? obj.hashCode() : 0) * (-1640531527)) >>> this.f71767g;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0037, code lost:
    
        r3[r0] = r6;
        r5.f71763c[r2] = r0;
        r2 = r6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void k(int i5) {
        this.f71768h++;
        int i11 = 0;
        if (this.f71766f > this.f71769i) {
            d(false);
        }
        this.f71764d = new int[i5];
        n.getClass();
        this.f71767g = Integer.numberOfLeadingZeros(i5) + 1;
        while (i11 < this.f71766f) {
            int i12 = i11 + 1;
            int iJ = j(this.f71761a[i11]);
            int i13 = this.f71765e;
            while (true) {
                int[] iArr = this.f71764d;
                if (iArr[iJ] == 0) {
                    break;
                }
                i13--;
                if (i13 < 0) {
                    throw new IllegalStateException("This cannot happen with fixed magic multiplier and grow-only hash array. Have object hashCodes changed?");
                }
                iJ = iJ == 0 ? iArr.length - 1 : iJ - 1;
            }
        }
    }

    @Override // java.util.Map
    public final Set keySet() {
        MapBuilderKeys mapBuilderKeys = this.f71770j;
        if (mapBuilderKeys != null) {
            return mapBuilderKeys;
        }
        MapBuilderKeys mapBuilderKeys2 = new MapBuilderKeys(this);
        this.f71770j = mapBuilderKeys2;
        return mapBuilderKeys2;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0068 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:33:? A[LOOP:0: B:9:0x0024->B:33:?, LOOP_END, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l(int i5) {
        Object[] objArr = this.f71761a;
        Intrinsics.g(objArr, "<this>");
        objArr[i5] = null;
        Object[] objArr2 = this.f71762b;
        if (objArr2 != null) {
            objArr2[i5] = null;
        }
        int length = this.f71763c[i5];
        int i11 = this.f71765e * 2;
        int length2 = this.f71764d.length / 2;
        if (i11 > length2) {
            i11 = length2;
        }
        int i12 = i11;
        int i13 = 0;
        int i14 = length;
        while (true) {
            length = length == 0 ? this.f71764d.length - 1 : length - 1;
            i13++;
            if (i13 > this.f71765e) {
                this.f71764d[i14] = 0;
                break;
            }
            int[] iArr = this.f71764d;
            int i15 = iArr[length];
            if (i15 == 0) {
                iArr[i14] = 0;
                break;
            }
            if (i15 < 0) {
                iArr[i14] = -1;
            } else {
                int i16 = i15 - 1;
                int iJ = j(this.f71761a[i16]) - length;
                int[] iArr2 = this.f71764d;
                if ((iJ & (iArr2.length - 1)) >= i13) {
                    iArr2[i14] = i15;
                    this.f71763c[i16] = i14;
                }
                i12--;
                if (i12 >= 0) {
                    this.f71764d[i14] = -1;
                    break;
                }
            }
            i14 = length;
            i13 = 0;
            i12--;
            if (i12 >= 0) {
            }
        }
        this.f71763c[i5] = -1;
        this.f71769i--;
        this.f71768h++;
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        c();
        int iA = a(obj);
        Object[] objArr = this.f71762b;
        if (objArr == null) {
            int length = this.f71761a.length;
            if (length < 0) {
                throw new IllegalArgumentException("capacity must be non-negative.");
            }
            objArr = new Object[length];
            this.f71762b = objArr;
        }
        if (iA >= 0) {
            objArr[iA] = obj2;
            return null;
        }
        int i5 = (-iA) - 1;
        Object obj3 = objArr[i5];
        objArr[i5] = obj2;
        return obj3;
    }

    @Override // java.util.Map
    public final void putAll(Map from) {
        Intrinsics.g(from, "from");
        c();
        Set<Map.Entry<K, V>> setEntrySet = from.entrySet();
        if (setEntrySet.isEmpty()) {
            return;
        }
        g(setEntrySet.size());
        for (Map.Entry<K, V> entry : setEntrySet) {
            int iA = a(entry.getKey());
            Object[] objArr = this.f71762b;
            if (objArr == null) {
                int length = this.f71761a.length;
                if (length < 0) {
                    throw new IllegalArgumentException("capacity must be non-negative.");
                }
                objArr = new Object[length];
                this.f71762b = objArr;
            }
            if (iA >= 0) {
                objArr[iA] = entry.getValue();
            } else {
                int i5 = (-iA) - 1;
                if (!Intrinsics.b(entry.getValue(), objArr[i5])) {
                    objArr[i5] = entry.getValue();
                }
            }
        }
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        c();
        int iH = h(obj);
        if (iH < 0) {
            return null;
        }
        Object[] objArr = this.f71762b;
        Intrinsics.d(objArr);
        Object obj2 = objArr[iH];
        l(iH);
        return obj2;
    }

    @Override // java.util.Map
    public final int size() {
        return this.f71769i;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder((this.f71769i * 3) + 2);
        sb2.append("{");
        EntriesItr entriesItr = new EntriesItr(this);
        int i5 = 0;
        while (entriesItr.hasNext()) {
            if (i5 > 0) {
                sb2.append(", ");
            }
            int i11 = entriesItr.f71778b;
            MapBuilder mapBuilder = entriesItr.f71777a;
            if (i11 >= mapBuilder.f71766f) {
                throw new NoSuchElementException();
            }
            entriesItr.f71778b = i11 + 1;
            entriesItr.f71779c = i11;
            Object obj = mapBuilder.f71761a[i11];
            if (obj == mapBuilder) {
                sb2.append("(this Map)");
            } else {
                sb2.append(obj);
            }
            sb2.append('=');
            Object[] objArr = mapBuilder.f71762b;
            Intrinsics.d(objArr);
            Object obj2 = objArr[entriesItr.f71779c];
            if (obj2 == mapBuilder) {
                sb2.append("(this Map)");
            } else {
                sb2.append(obj2);
            }
            entriesItr.b();
            i5++;
        }
        sb2.append("}");
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    @Override // java.util.Map
    public final Collection values() {
        MapBuilderValues mapBuilderValues = this.f71771k;
        if (mapBuilderValues != null) {
            return mapBuilderValues;
        }
        MapBuilderValues mapBuilderValues2 = new MapBuilderValues(this);
        this.f71771k = mapBuilderValues2;
        return mapBuilderValues2;
    }

    public MapBuilder(int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException("capacity must be non-negative.");
        }
        Object[] objArr = new Object[i5];
        int[] iArr = new int[i5];
        n.getClass();
        int iHighestOneBit = Integer.highestOneBit((i5 < 1 ? 1 : i5) * 3);
        this.f71761a = objArr;
        this.f71762b = null;
        this.f71763c = iArr;
        this.f71764d = new int[iHighestOneBit];
        this.f71765e = 2;
        this.f71766f = 0;
        this.f71767g = Integer.numberOfLeadingZeros(iHighestOneBit) + 1;
    }
}
