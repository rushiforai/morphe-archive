package r1;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableList;
import z.v0;

/* loaded from: classes2.dex */
public final class c implements List, KMutableList {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85070a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f85071b;

    /* renamed from: c, reason: collision with root package name */
    public final int f85072c;

    /* renamed from: d, reason: collision with root package name */
    public int f85073d;

    public /* synthetic */ c(int i5, int i11, int i12, List list) {
        this.f85070a = i12;
        this.f85071b = list;
        this.f85072c = i5;
        this.f85073d = i11;
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r1v3, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List, java.util.Collection
    public final boolean add(Object obj) {
        switch (this.f85070a) {
            case 0:
                int i5 = this.f85073d;
                this.f85073d = i5 + 1;
                this.f85071b.add(i5, obj);
                break;
            default:
                int i11 = this.f85073d;
                this.f85073d = i11 + 1;
                this.f85071b.add(i11, obj);
                break;
        }
        return true;
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r0v5, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List
    public final boolean addAll(int i5, Collection elements) {
        switch (this.f85070a) {
            case 0:
                this.f85071b.addAll(i5 + this.f85072c, elements);
                int size = elements.size();
                this.f85073d += size;
                if (size > 0) {
                }
                break;
            default:
                Intrinsics.g(elements, "elements");
                this.f85071b.addAll(i5 + this.f85072c, elements);
                this.f85073d = elements.size() + this.f85073d;
                if (elements.size() > 0) {
                }
                break;
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List, java.util.Collection
    public final void clear() {
        switch (this.f85070a) {
            case 0:
                int i5 = this.f85073d - 1;
                int i11 = this.f85072c;
                if (i11 <= i5) {
                    while (true) {
                        this.f85071b.remove(i5);
                        if (i5 != i11) {
                            i5--;
                        }
                    }
                }
                this.f85073d = i11;
                break;
            default:
                int i12 = this.f85073d - 1;
                int i13 = this.f85072c;
                if (i13 <= i12) {
                    while (true) {
                        this.f85071b.remove(i12);
                        if (i12 != i13) {
                            i12--;
                        }
                    }
                }
                this.f85073d = i13;
                break;
        }
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r2v3, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        switch (this.f85070a) {
            case 0:
                int i5 = this.f85073d;
                for (int i11 = this.f85072c; i11 < i5; i11++) {
                    if (Intrinsics.b(this.f85071b.get(i11), obj)) {
                        break;
                    }
                }
                break;
            default:
                int i12 = this.f85073d;
                for (int i13 = this.f85072c; i13 < i12; i13++) {
                    if (Intrinsics.b(this.f85071b.get(i13), obj)) {
                        break;
                    }
                }
                break;
        }
        return false;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection elements) {
        switch (this.f85070a) {
            case 0:
                Iterator it = elements.iterator();
                while (it.hasNext()) {
                    if (!contains(it.next())) {
                        break;
                    }
                }
                break;
            default:
                Intrinsics.g(elements, "elements");
                Iterator it2 = elements.iterator();
                while (it2.hasNext()) {
                    if (!contains(it2.next())) {
                        break;
                    }
                }
                break;
        }
        return true;
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List
    public final Object get(int i5) {
        switch (this.f85070a) {
            case 0:
                f.a(i5, this);
                return this.f85071b.get(i5 + this.f85072c);
            default:
                v0.a(i5, this);
                return this.f85071b.get(i5 + this.f85072c);
        }
    }

    /* JADX WARN: Type inference failed for: r3v0, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r3v3, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List
    public final int indexOf(Object obj) {
        switch (this.f85070a) {
            case 0:
                int i5 = this.f85073d;
                int i11 = this.f85072c;
                for (int i12 = i11; i12 < i5; i12++) {
                    if (Intrinsics.b(this.f85071b.get(i12), obj)) {
                        return i12 - i11;
                    }
                }
                return -1;
            default:
                int i13 = this.f85073d;
                int i14 = this.f85072c;
                for (int i15 = i14; i15 < i13; i15++) {
                    if (Intrinsics.b(this.f85071b.get(i15), obj)) {
                        return i15 - i14;
                    }
                }
                return -1;
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        switch (this.f85070a) {
            case 0:
                if (this.f85073d == this.f85072c) {
                }
                break;
            default:
                if (this.f85073d == this.f85072c) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        switch (this.f85070a) {
            case 0:
                return new d(0, 0, this);
            default:
                return new d(0, 1, this);
        }
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r2v3, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        switch (this.f85070a) {
            case 0:
                int i5 = this.f85073d - 1;
                int i11 = this.f85072c;
                if (i11 <= i5) {
                    while (!Intrinsics.b(this.f85071b.get(i5), obj)) {
                        if (i5 != i11) {
                            i5--;
                        }
                    }
                    return i5 - i11;
                }
                return -1;
            default:
                int i12 = this.f85073d - 1;
                int i13 = this.f85072c;
                if (i13 <= i12) {
                    while (!Intrinsics.b(this.f85071b.get(i12), obj)) {
                        if (i12 != i13) {
                            i12--;
                        }
                    }
                    return i12 - i13;
                }
                return -1;
        }
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        switch (this.f85070a) {
            case 0:
                return new d(0, 0, this);
            default:
                return new d(0, 1, this);
        }
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        switch (this.f85070a) {
            case 0:
                int i5 = this.f85073d;
                for (int i11 = this.f85072c; i11 < i5; i11++) {
                    ?? r22 = this.f85071b;
                    if (Intrinsics.b(r22.get(i11), obj)) {
                        r22.remove(i11);
                        this.f85073d--;
                        break;
                    }
                }
                break;
            default:
                int i12 = this.f85073d;
                for (int i13 = this.f85072c; i13 < i12; i13++) {
                    ?? r23 = this.f85071b;
                    if (Intrinsics.b(r23.get(i13), obj)) {
                        r23.remove(i13);
                        this.f85073d--;
                        break;
                    }
                }
                break;
        }
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection elements) {
        switch (this.f85070a) {
            case 0:
                int i5 = this.f85073d;
                Iterator it = elements.iterator();
                while (it.hasNext()) {
                    remove(it.next());
                }
                if (i5 != this.f85073d) {
                }
                break;
            default:
                Intrinsics.g(elements, "elements");
                int i11 = this.f85073d;
                Iterator it2 = elements.iterator();
                while (it2.hasNext()) {
                    remove(it2.next());
                }
                if (i11 != this.f85073d) {
                }
                break;
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r3v0, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r3v3, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection elements) {
        switch (this.f85070a) {
            case 0:
                int i5 = this.f85073d;
                int i11 = i5 - 1;
                int i12 = this.f85072c;
                if (i12 <= i11) {
                    while (true) {
                        ?? r32 = this.f85071b;
                        if (!elements.contains(r32.get(i11))) {
                            r32.remove(i11);
                            this.f85073d--;
                        }
                        if (i11 != i12) {
                            i11--;
                        }
                    }
                }
                if (i5 != this.f85073d) {
                }
                break;
            default:
                Intrinsics.g(elements, "elements");
                int i13 = this.f85073d;
                int i14 = i13 - 1;
                int i15 = this.f85072c;
                if (i15 <= i14) {
                    while (true) {
                        ?? r33 = this.f85071b;
                        if (!elements.contains(r33.get(i14))) {
                            r33.remove(i14);
                            this.f85073d--;
                        }
                        if (i14 != i15) {
                            i14--;
                        }
                    }
                }
                if (i13 != this.f85073d) {
                }
                break;
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List
    public final Object set(int i5, Object obj) {
        switch (this.f85070a) {
            case 0:
                f.a(i5, this);
                return this.f85071b.set(i5 + this.f85072c, obj);
            default:
                v0.a(i5, this);
                return this.f85071b.set(i5 + this.f85072c, obj);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        int i5;
        int i11;
        switch (this.f85070a) {
            case 0:
                i5 = this.f85073d;
                i11 = this.f85072c;
                break;
            default:
                i5 = this.f85073d;
                i11 = this.f85072c;
                break;
        }
        return i5 - i11;
    }

    @Override // java.util.List
    public final List subList(int i5, int i11) {
        switch (this.f85070a) {
            case 0:
                f.b(i5, i11, this);
                return new c(i5, i11, 0, this);
            default:
                v0.b(i5, i11, this);
                return new c(i5, i11, 1, this);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        switch (this.f85070a) {
        }
        return CollectionToArray.a(this);
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List
    public final void add(int i5, Object obj) {
        switch (this.f85070a) {
            case 0:
                this.f85071b.add(i5 + this.f85072c, obj);
                this.f85073d++;
                break;
            default:
                this.f85071b.add(i5 + this.f85072c, obj);
                this.f85073d++;
                break;
        }
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i5) {
        switch (this.f85070a) {
            case 0:
                return new d(i5, 0, this);
            default:
                return new d(i5, 1, this);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] array) {
        switch (this.f85070a) {
            case 0:
                break;
            default:
                Intrinsics.g(array, "array");
                break;
        }
        return CollectionToArray.b(this, array);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r0v5, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection elements) {
        switch (this.f85070a) {
            case 0:
                this.f85071b.addAll(this.f85073d, elements);
                int size = elements.size();
                this.f85073d += size;
                if (size > 0) {
                }
                break;
            default:
                Intrinsics.g(elements, "elements");
                this.f85071b.addAll(this.f85073d, elements);
                this.f85073d = elements.size() + this.f85073d;
                if (elements.size() > 0) {
                }
                break;
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.lang.Object, java.util.List] */
    @Override // java.util.List
    public final Object remove(int i5) {
        switch (this.f85070a) {
            case 0:
                f.a(i5, this);
                this.f85073d--;
                return this.f85071b.remove(i5 + this.f85072c);
            default:
                v0.a(i5, this);
                this.f85073d--;
                return this.f85071b.remove(i5 + this.f85072c);
        }
    }
}
