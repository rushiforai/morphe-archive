package kotlin.reflect.jvm.internal.impl.utils;

import b70.k;
import java.util.AbstractSet;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.NoSuchElementException;
import java.util.Set;
import kotlin.collections.c;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.jvm.internal.markers.KMutableIterator;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class SmartSet<T> extends AbstractSet<T> {

    @NotNull
    public static final Companion Companion = new Companion(null);

    @Nullable
    private Object data;
    private int size;

    public static final class ArrayIterator<T> implements Iterator<T>, KMutableIterator {

        @NotNull
        private final Iterator<T> arrayIterator;

        public ArrayIterator(@NotNull T[] array) {
            Intrinsics.g(array, "array");
            this.arrayIterator = ArrayIteratorKt.a(array);
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.arrayIterator.hasNext();
        }

        @Override // java.util.Iterator
        public T next() {
            return this.arrayIterator.next();
        }

        @Override // java.util.Iterator
        @NotNull
        public Void remove() {
            throw new UnsupportedOperationException();
        }
    }

    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @JvmStatic
        @NotNull
        public final <T> SmartSet<T> create() {
            return new SmartSet<>(null);
        }

        private Companion() {
        }

        @JvmStatic
        @NotNull
        public final <T> SmartSet<T> create(@NotNull Collection<? extends T> set) {
            Intrinsics.g(set, "set");
            SmartSet<T> smartSet = new SmartSet<>(null);
            smartSet.addAll(set);
            return smartSet;
        }
    }

    public static final class SingletonIterator<T> implements Iterator<T>, KMutableIterator {
        private final T element;
        private boolean hasNext = true;

        public SingletonIterator(T t6) {
            this.element = t6;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.hasNext;
        }

        @Override // java.util.Iterator
        public T next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            }
            this.hasNext = false;
            return this.element;
        }

        @Override // java.util.Iterator
        @NotNull
        public Void remove() {
            throw new UnsupportedOperationException();
        }
    }

    public /* synthetic */ SmartSet(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    @JvmStatic
    @NotNull
    public static final <T> SmartSet<T> create() {
        return Companion.create();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v11, types: [java.util.AbstractCollection, java.util.HashSet, java.util.LinkedHashSet] */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean add(T t6) {
        Object[] objArr;
        if (size() == 0) {
            this.data = t6;
        } else if (size() == 1) {
            if (Intrinsics.b(this.data, t6)) {
                return false;
            }
            this.data = new Object[]{this.data, t6};
        } else if (size() < 5) {
            Object obj = this.data;
            Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<T of org.jetbrains.kotlin.utils.SmartSet>");
            Object[] objArr2 = (Object[]) obj;
            if (c.o0(t6, objArr2)) {
                return false;
            }
            if (size() == 4) {
                Object[] elements = Arrays.copyOf(objArr2, objArr2.length);
                Intrinsics.g(elements, "elements");
                ?? linkedHashSet = new LinkedHashSet(k.d0(elements.length));
                c.Z0(elements, linkedHashSet);
                linkedHashSet.add(t6);
                objArr = linkedHashSet;
            } else {
                Object[] objArrCopyOf = Arrays.copyOf(objArr2, size() + 1);
                Intrinsics.f(objArrCopyOf, "copyOf(...)");
                objArrCopyOf[objArrCopyOf.length - 1] = t6;
                objArr = objArrCopyOf;
            }
            this.data = objArr;
        } else {
            Object obj2 = this.data;
            Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.collections.MutableSet<T of org.jetbrains.kotlin.utils.SmartSet>");
            if (!TypeIntrinsics.d(obj2).add(t6)) {
                return false;
            }
        }
        setSize(size() + 1);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public void clear() {
        this.data = null;
        setSize(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean contains(Object obj) {
        if (size() == 0) {
            return false;
        }
        if (size() == 1) {
            return Intrinsics.b(this.data, obj);
        }
        if (size() < 5) {
            Object obj2 = this.data;
            Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.Array<T of org.jetbrains.kotlin.utils.SmartSet>");
            return c.o0(obj, (Object[]) obj2);
        }
        Object obj3 = this.data;
        Intrinsics.e(obj3, "null cannot be cast to non-null type kotlin.collections.Set<T of org.jetbrains.kotlin.utils.SmartSet>");
        return ((Set) obj3).contains(obj);
    }

    public int getSize() {
        return this.size;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    @NotNull
    public Iterator<T> iterator() {
        if (size() == 0) {
            return Collections.EMPTY_SET.iterator();
        }
        if (size() == 1) {
            return new SingletonIterator(this.data);
        }
        if (size() < 5) {
            Object obj = this.data;
            Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<T of org.jetbrains.kotlin.utils.SmartSet>");
            return new ArrayIterator((Object[]) obj);
        }
        Object obj2 = this.data;
        Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.collections.MutableSet<T of org.jetbrains.kotlin.utils.SmartSet>");
        return TypeIntrinsics.d(obj2).iterator();
    }

    public void setSize(int i5) {
        this.size = i5;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final /* bridge */ int size() {
        return getSize();
    }

    private SmartSet() {
    }
}
