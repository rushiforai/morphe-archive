package kotlin.collections.builders;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import kotlin.Metadata;
import kotlin.collections.AbstractList;
import kotlin.collections.AbstractMutableList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.markers.KMutableList;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u00028\u00000\u00022\u00060\u0003j\u0002`\u00042\b\u0012\u0004\u0012\u00028\u00000\u00052\u00060\u0006j\u0002`\u0007:\u0002\b\t¨\u0006\n"}, d2 = {"Lkotlin/collections/builders/ListBuilder;", "E", b.f42142b, "Ljava/util/RandomAccess;", "Lkotlin/collections/RandomAccess;", "Lkotlin/collections/AbstractMutableList;", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "c70/a", "BuilderSubList", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ListBuilder<E> extends AbstractMutableList<E> implements List<E>, RandomAccess, Serializable, KMutableList {

    /* renamed from: d, reason: collision with root package name */
    public static final ListBuilder f71752d;

    /* renamed from: a, reason: collision with root package name */
    public Object[] f71753a;

    /* renamed from: b, reason: collision with root package name */
    public int f71754b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f71755c;

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u0000*\u0004\b\u0001\u0010\u00012\b\u0012\u0004\u0012\u00028\u00010\u00022\u00060\u0003j\u0002`\u00042\b\u0012\u0004\u0012\u00028\u00010\u00052\u00060\u0006j\u0002`\u0007:\u0001\b¨\u0006\t"}, d2 = {"Lkotlin/collections/builders/ListBuilder$BuilderSubList;", "E", b.f42142b, "Ljava/util/RandomAccess;", "Lkotlin/collections/RandomAccess;", "Lkotlin/collections/AbstractMutableList;", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "kotlin/collections/builders/a", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes4.dex */
    public static final class BuilderSubList<E> extends AbstractMutableList<E> implements List<E>, RandomAccess, Serializable, KMutableList {

        /* renamed from: a, reason: collision with root package name */
        public Object[] f71756a;

        /* renamed from: b, reason: collision with root package name */
        public final int f71757b;

        /* renamed from: c, reason: collision with root package name */
        public int f71758c;

        /* renamed from: d, reason: collision with root package name */
        public final BuilderSubList f71759d;

        /* renamed from: e, reason: collision with root package name */
        public final ListBuilder f71760e;

        public BuilderSubList(Object[] backing, int i5, int i11, BuilderSubList builderSubList, ListBuilder root) {
            Intrinsics.g(backing, "backing");
            Intrinsics.g(root, "root");
            this.f71756a = backing;
            this.f71757b = i5;
            this.f71758c = i11;
            this.f71759d = builderSubList;
            this.f71760e = root;
            ((AbstractList) this).modCount = ((AbstractList) root).modCount;
        }

        @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
        public final boolean add(Object obj) {
            j();
            h();
            g(this.f71757b + this.f71758c, obj);
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final boolean addAll(Collection elements) {
            Intrinsics.g(elements, "elements");
            j();
            h();
            int size = elements.size();
            f(this.f71757b + this.f71758c, elements, size);
            return size > 0;
        }

        @Override // kotlin.collections.AbstractMutableList
        /* renamed from: c */
        public final int getF71754b() {
            h();
            return this.f71758c;
        }

        @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
        public final void clear() {
            j();
            h();
            l(this.f71757b, this.f71758c);
        }

        @Override // kotlin.collections.AbstractMutableList
        public final Object d(int i5) {
            j();
            h();
            AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
            int i11 = this.f71758c;
            companion.getClass();
            AbstractList.Companion.b(i5, i11);
            return k(this.f71757b + i5);
        }

        @Override // java.util.AbstractList, java.util.Collection, java.util.List
        public final boolean equals(Object obj) {
            h();
            if (obj == this) {
                return true;
            }
            if (obj instanceof List) {
                List list = (List) obj;
                Object[] objArr = this.f71756a;
                int i5 = this.f71758c;
                if (i5 == list.size()) {
                    for (int i11 = 0; i11 < i5; i11++) {
                        if (Intrinsics.b(objArr[this.f71757b + i11], list.get(i11))) {
                        }
                    }
                    return true;
                }
            }
            return false;
        }

        public final void f(int i5, Collection collection, int i11) {
            ((java.util.AbstractList) this).modCount++;
            ListBuilder listBuilder = this.f71760e;
            BuilderSubList builderSubList = this.f71759d;
            if (builderSubList != null) {
                builderSubList.f(i5, collection, i11);
            } else {
                ListBuilder listBuilder2 = ListBuilder.f71752d;
                listBuilder.f(i5, collection, i11);
            }
            this.f71756a = listBuilder.f71753a;
            this.f71758c += i11;
        }

        public final void g(int i5, Object obj) {
            ((java.util.AbstractList) this).modCount++;
            ListBuilder listBuilder = this.f71760e;
            BuilderSubList builderSubList = this.f71759d;
            if (builderSubList != null) {
                builderSubList.g(i5, obj);
            } else {
                ListBuilder listBuilder2 = ListBuilder.f71752d;
                listBuilder.g(i5, obj);
            }
            this.f71756a = listBuilder.f71753a;
            this.f71758c++;
        }

        @Override // java.util.AbstractList, java.util.List
        public final Object get(int i5) {
            h();
            AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
            int i11 = this.f71758c;
            companion.getClass();
            AbstractList.Companion.b(i5, i11);
            return this.f71756a[this.f71757b + i5];
        }

        public final void h() {
            if (((java.util.AbstractList) this.f71760e).modCount != ((java.util.AbstractList) this).modCount) {
                throw new ConcurrentModificationException();
            }
        }

        @Override // java.util.AbstractList, java.util.Collection, java.util.List
        public final int hashCode() {
            h();
            Object[] objArr = this.f71756a;
            int i5 = this.f71758c;
            int iHashCode = 1;
            for (int i11 = 0; i11 < i5; i11++) {
                Object obj = objArr[this.f71757b + i11];
                iHashCode = (iHashCode * 31) + (obj != null ? obj.hashCode() : 0);
            }
            return iHashCode;
        }

        @Override // java.util.AbstractList, java.util.List
        public final int indexOf(Object obj) {
            h();
            for (int i5 = 0; i5 < this.f71758c; i5++) {
                if (Intrinsics.b(this.f71756a[this.f71757b + i5], obj)) {
                    return i5;
                }
            }
            return -1;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final boolean isEmpty() {
            h();
            return this.f71758c == 0;
        }

        @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
        public final Iterator iterator() {
            return listIterator(0);
        }

        public final void j() {
            if (this.f71760e.f71755c) {
                throw new UnsupportedOperationException();
            }
        }

        public final Object k(int i5) {
            Object objK;
            ((java.util.AbstractList) this).modCount++;
            BuilderSubList builderSubList = this.f71759d;
            if (builderSubList != null) {
                objK = builderSubList.k(i5);
            } else {
                ListBuilder listBuilder = ListBuilder.f71752d;
                objK = this.f71760e.k(i5);
            }
            this.f71758c--;
            return objK;
        }

        public final void l(int i5, int i11) {
            if (i11 > 0) {
                ((java.util.AbstractList) this).modCount++;
            }
            BuilderSubList builderSubList = this.f71759d;
            if (builderSubList != null) {
                builderSubList.l(i5, i11);
            } else {
                ListBuilder listBuilder = ListBuilder.f71752d;
                this.f71760e.l(i5, i11);
            }
            this.f71758c -= i11;
        }

        @Override // java.util.AbstractList, java.util.List
        public final int lastIndexOf(Object obj) {
            h();
            for (int i5 = this.f71758c - 1; i5 >= 0; i5--) {
                if (Intrinsics.b(this.f71756a[this.f71757b + i5], obj)) {
                    return i5;
                }
            }
            return -1;
        }

        @Override // java.util.AbstractList, java.util.List
        public final ListIterator listIterator() {
            return listIterator(0);
        }

        public final int n(int i5, int i11, Collection collection, boolean z11) {
            int iN;
            BuilderSubList builderSubList = this.f71759d;
            if (builderSubList != null) {
                iN = builderSubList.n(i5, i11, collection, z11);
            } else {
                ListBuilder listBuilder = ListBuilder.f71752d;
                iN = this.f71760e.n(i5, i11, collection, z11);
            }
            if (iN > 0) {
                ((java.util.AbstractList) this).modCount++;
            }
            this.f71758c -= iN;
            return iN;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final boolean remove(Object obj) {
            j();
            h();
            int iIndexOf = indexOf(obj);
            if (iIndexOf >= 0) {
                d(iIndexOf);
            }
            return iIndexOf >= 0;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final boolean removeAll(Collection elements) {
            Intrinsics.g(elements, "elements");
            j();
            h();
            return n(this.f71757b, this.f71758c, elements, false) > 0;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final boolean retainAll(Collection elements) {
            Intrinsics.g(elements, "elements");
            j();
            h();
            return n(this.f71757b, this.f71758c, elements, true) > 0;
        }

        @Override // java.util.AbstractList, java.util.List
        public final Object set(int i5, Object obj) {
            j();
            h();
            AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
            int i11 = this.f71758c;
            companion.getClass();
            AbstractList.Companion.b(i5, i11);
            Object[] objArr = this.f71756a;
            int i12 = this.f71757b + i5;
            Object obj2 = objArr[i12];
            objArr[i12] = obj;
            return obj2;
        }

        @Override // java.util.AbstractList, java.util.List
        public final List subList(int i5, int i11) {
            AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
            int i12 = this.f71758c;
            companion.getClass();
            AbstractList.Companion.d(i5, i11, i12);
            return new BuilderSubList(this.f71756a, this.f71757b + i5, i11 - i5, this, this.f71760e);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final Object[] toArray(Object[] array) {
            Intrinsics.g(array, "array");
            h();
            int length = array.length;
            int i5 = this.f71758c;
            int i11 = this.f71757b;
            if (length < i5) {
                Object[] objArrCopyOfRange = Arrays.copyOfRange(this.f71756a, i11, i5 + i11, array.getClass());
                Intrinsics.f(objArrCopyOfRange, "copyOfRange(...)");
                return objArrCopyOfRange;
            }
            u90.b.t(this.f71756a, 0, array, i11, i5 + i11);
            int i12 = this.f71758c;
            if (i12 < array.length) {
                array[i12] = null;
            }
            return array;
        }

        @Override // java.util.AbstractCollection
        public final String toString() {
            h();
            return ListBuilderKt.a(this.f71756a, this.f71757b, this.f71758c, this);
        }

        @Override // java.util.AbstractList, java.util.List
        public final ListIterator listIterator(int i5) {
            h();
            AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
            int i11 = this.f71758c;
            companion.getClass();
            AbstractList.Companion.c(i5, i11);
            return new a(this, i5);
        }

        @Override // java.util.AbstractList, java.util.List
        public final void add(int i5, Object obj) {
            j();
            h();
            AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
            int i11 = this.f71758c;
            companion.getClass();
            AbstractList.Companion.c(i5, i11);
            g(this.f71757b + i5, obj);
        }

        @Override // java.util.AbstractList, java.util.List
        public final boolean addAll(int i5, Collection elements) {
            Intrinsics.g(elements, "elements");
            j();
            h();
            AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
            int i11 = this.f71758c;
            companion.getClass();
            AbstractList.Companion.c(i5, i11);
            int size = elements.size();
            f(this.f71757b + i5, elements, size);
            return size > 0;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final Object[] toArray() {
            h();
            Object[] objArr = this.f71756a;
            int i5 = this.f71758c;
            int i11 = this.f71757b;
            return u90.b.y(objArr, i11, i5 + i11);
        }
    }

    static {
        ListBuilder listBuilder = new ListBuilder(0);
        listBuilder.f71755c = true;
        f71752d = listBuilder;
    }

    public ListBuilder() {
        this((Object) null);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        h();
        int i5 = this.f71754b;
        ((java.util.AbstractList) this).modCount++;
        j(i5, 1);
        this.f71753a[i5] = obj;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        h();
        int size = elements.size();
        f(this.f71754b, elements, size);
        return size > 0;
    }

    @Override // kotlin.collections.AbstractMutableList
    /* renamed from: c, reason: from getter */
    public final int getF71754b() {
        return this.f71754b;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        h();
        l(0, this.f71754b);
    }

    @Override // kotlin.collections.AbstractMutableList
    public final Object d(int i5) {
        h();
        AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
        int i11 = this.f71754b;
        companion.getClass();
        AbstractList.Companion.b(i5, i11);
        return k(i5);
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof List) {
            List list = (List) obj;
            Object[] objArr = this.f71753a;
            int i5 = this.f71754b;
            if (i5 == list.size()) {
                for (int i11 = 0; i11 < i5; i11++) {
                    if (Intrinsics.b(objArr[i11], list.get(i11))) {
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final void f(int i5, Collection collection, int i11) {
        ((java.util.AbstractList) this).modCount++;
        j(i5, i11);
        Iterator<E> it = collection.iterator();
        for (int i12 = 0; i12 < i11; i12++) {
            this.f71753a[i5 + i12] = it.next();
        }
    }

    public final void g(int i5, Object obj) {
        ((java.util.AbstractList) this).modCount++;
        j(i5, 1);
        this.f71753a[i5] = obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
        int i11 = this.f71754b;
        companion.getClass();
        AbstractList.Companion.b(i5, i11);
        return this.f71753a[i5];
    }

    public final void h() {
        if (this.f71755c) {
            throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        Object[] objArr = this.f71753a;
        int i5 = this.f71754b;
        int iHashCode = 1;
        for (int i11 = 0; i11 < i5; i11++) {
            Object obj = objArr[i11];
            iHashCode = (iHashCode * 31) + (obj != null ? obj.hashCode() : 0);
        }
        return iHashCode;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        for (int i5 = 0; i5 < this.f71754b; i5++) {
            if (Intrinsics.b(this.f71753a[i5], obj)) {
                return i5;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        return this.f71754b == 0;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return listIterator(0);
    }

    public final void j(int i5, int i11) {
        int i12 = this.f71754b + i11;
        if (i12 < 0) {
            throw new OutOfMemoryError();
        }
        Object[] objArr = this.f71753a;
        if (i12 > objArr.length) {
            AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
            int length = objArr.length;
            companion.getClass();
            int iE = AbstractList.Companion.e(length, i12);
            Object[] objArr2 = this.f71753a;
            Intrinsics.g(objArr2, "<this>");
            Object[] objArrCopyOf = Arrays.copyOf(objArr2, iE);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            this.f71753a = objArrCopyOf;
        }
        Object[] objArr3 = this.f71753a;
        u90.b.t(objArr3, i5 + i11, objArr3, i5, this.f71754b);
        this.f71754b += i11;
    }

    public final Object k(int i5) {
        ((java.util.AbstractList) this).modCount++;
        Object[] objArr = this.f71753a;
        Object obj = objArr[i5];
        u90.b.t(objArr, i5, objArr, i5 + 1, this.f71754b);
        Object[] objArr2 = this.f71753a;
        int i11 = this.f71754b - 1;
        Intrinsics.g(objArr2, "<this>");
        objArr2[i11] = null;
        this.f71754b--;
        return obj;
    }

    public final void l(int i5, int i11) {
        if (i11 > 0) {
            ((java.util.AbstractList) this).modCount++;
        }
        Object[] objArr = this.f71753a;
        u90.b.t(objArr, i5, objArr, i5 + i11, this.f71754b);
        Object[] objArr2 = this.f71753a;
        int i12 = this.f71754b;
        ListBuilderKt.b(objArr2, i12 - i11, i12);
        this.f71754b -= i11;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int lastIndexOf(Object obj) {
        for (int i5 = this.f71754b - 1; i5 >= 0; i5--) {
            if (Intrinsics.b(this.f71753a[i5], obj)) {
                return i5;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    public final int n(int i5, int i11, Collection collection, boolean z11) {
        int i12 = 0;
        int i13 = 0;
        while (i12 < i11) {
            int i14 = i5 + i12;
            if (collection.contains(this.f71753a[i14]) == z11) {
                Object[] objArr = this.f71753a;
                i12++;
                objArr[i13 + i5] = objArr[i14];
                i13++;
            } else {
                i12++;
            }
        }
        int i15 = i11 - i13;
        Object[] objArr2 = this.f71753a;
        u90.b.t(objArr2, i5 + i13, objArr2, i11 + i5, this.f71754b);
        Object[] objArr3 = this.f71753a;
        int i16 = this.f71754b;
        ListBuilderKt.b(objArr3, i16 - i15, i16);
        if (i15 > 0) {
            ((java.util.AbstractList) this).modCount++;
        }
        this.f71754b -= i15;
        return i15;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean remove(Object obj) {
        h();
        int iIndexOf = indexOf(obj);
        if (iIndexOf >= 0) {
            d(iIndexOf);
        }
        return iIndexOf >= 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean removeAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        h();
        return n(0, this.f71754b, elements, false) > 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean retainAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        h();
        return n(0, this.f71754b, elements, true) > 0;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        h();
        AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
        int i11 = this.f71754b;
        companion.getClass();
        AbstractList.Companion.b(i5, i11);
        Object[] objArr = this.f71753a;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        return obj2;
    }

    @Override // java.util.AbstractList, java.util.List
    public final List subList(int i5, int i11) {
        AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
        int i12 = this.f71754b;
        companion.getClass();
        AbstractList.Companion.d(i5, i11, i12);
        return new BuilderSubList(this.f71753a, i5, i11 - i5, null, this);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray(Object[] array) {
        Intrinsics.g(array, "array");
        int length = array.length;
        int i5 = this.f71754b;
        if (length < i5) {
            Object[] objArrCopyOfRange = Arrays.copyOfRange(this.f71753a, 0, i5, array.getClass());
            Intrinsics.f(objArrCopyOfRange, "copyOfRange(...)");
            return objArrCopyOfRange;
        }
        u90.b.t(this.f71753a, 0, array, 0, i5);
        int i11 = this.f71754b;
        if (i11 < array.length) {
            array[i11] = null;
        }
        return array;
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        return ListBuilderKt.a(this.f71753a, 0, this.f71754b, this);
    }

    public ListBuilder(int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException("capacity must be non-negative.");
        }
        this.f71753a = new Object[i5];
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
        int i11 = this.f71754b;
        companion.getClass();
        AbstractList.Companion.c(i5, i11);
        return new c70.a(this, i5);
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i5, Collection elements) {
        Intrinsics.g(elements, "elements");
        h();
        AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
        int i11 = this.f71754b;
        companion.getClass();
        AbstractList.Companion.c(i5, i11);
        int size = elements.size();
        f(i5, elements, size);
        return size > 0;
    }

    public /* synthetic */ ListBuilder(Object obj) {
        this(10);
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        h();
        AbstractList.Companion companion = kotlin.collections.AbstractList.f71712a;
        int i11 = this.f71754b;
        companion.getClass();
        AbstractList.Companion.c(i5, i11);
        ((java.util.AbstractList) this).modCount++;
        j(i5, 1);
        this.f71753a[i5] = obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray() {
        return u90.b.y(this.f71753a, 0, this.f71754b);
    }
}
