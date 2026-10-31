package kotlin.collections;

import b.c0;
import b.u4;
import java.util.Arrays;
import java.util.Iterator;
import java.util.RandomAccess;
import kotlin.collections.AbstractList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d extends AbstractList implements RandomAccess {

    /* renamed from: b, reason: collision with root package name */
    public final Object[] f71791b;

    /* renamed from: c, reason: collision with root package name */
    public final int f71792c;

    /* renamed from: d, reason: collision with root package name */
    public int f71793d;

    /* renamed from: e, reason: collision with root package name */
    public int f71794e;

    public d(Object[] objArr, int i5) {
        this.f71791b = objArr;
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "ring buffer filled size should not be negative but it is ").toString());
        }
        if (i5 <= objArr.length) {
            this.f71792c = objArr.length;
            this.f71794e = i5;
        } else {
            StringBuilder sbJ = u4.j(i5, "ring buffer filled size: ", " cannot be larger than the buffer size: ");
            sbJ.append(objArr.length);
            throw new IllegalArgumentException(sbJ.toString().toString());
        }
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f71794e;
    }

    public final void d(int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "n shouldn't be negative but it is ").toString());
        }
        if (i5 > this.f71794e) {
            StringBuilder sbJ = u4.j(i5, "n shouldn't be greater than the buffer size: n = ", ", size = ");
            sbJ.append(this.f71794e);
            throw new IllegalArgumentException(sbJ.toString().toString());
        }
        if (i5 > 0) {
            int i11 = this.f71793d;
            int i12 = this.f71792c;
            int i13 = (i11 + i5) % i12;
            Object[] objArr = this.f71791b;
            if (i11 > i13) {
                u90.b.B(i11, i12, null, objArr);
                Arrays.fill(objArr, 0, i13, (Object) null);
            } else {
                u90.b.B(i11, i13, null, objArr);
            }
            this.f71793d = i13;
            this.f71794e -= i5;
        }
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final Object get(int i5) {
        int i11 = this.f71794e;
        AbstractList.f71712a.getClass();
        AbstractList.Companion.b(i5, i11);
        return this.f71791b[(this.f71793d + i5) % this.f71792c];
    }

    @Override // kotlin.collections.AbstractList, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return new AbstractIterator<Object>() { // from class: kotlin.collections.RingBuffer$iterator$1

            /* renamed from: a, reason: collision with root package name */
            public int f71744a;

            /* renamed from: b, reason: collision with root package name */
            public int f71745b;

            {
                this.f71744a = this.f71746c.f71794e;
                this.f71745b = this.f71746c.f71793d;
            }

            @Override // kotlin.collections.AbstractIterator
            public final void computeNext() {
                if (this.f71744a == 0) {
                    done();
                    return;
                }
                d dVar = this.f71746c;
                setNext(dVar.f71791b[this.f71745b]);
                this.f71745b = (this.f71745b + 1) % dVar.f71792c;
                this.f71744a--;
            }
        };
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection
    public final Object[] toArray() {
        return toArray(new Object[c()]);
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection
    public final Object[] toArray(Object[] array) {
        Object[] objArr;
        Intrinsics.g(array, "array");
        int length = array.length;
        int i5 = this.f71794e;
        if (length < i5) {
            array = Arrays.copyOf(array, i5);
            Intrinsics.f(array, "copyOf(...)");
        }
        int i11 = this.f71794e;
        int i12 = this.f71793d;
        int i13 = 0;
        int i14 = 0;
        while (true) {
            objArr = this.f71791b;
            if (i14 >= i11 || i12 >= this.f71792c) {
                break;
            }
            array[i14] = objArr[i12];
            i14++;
            i12++;
        }
        while (i14 < i11) {
            array[i14] = objArr[i13];
            i14++;
            i13++;
        }
        if (i11 < array.length) {
            array[i11] = null;
        }
        return array;
    }
}
