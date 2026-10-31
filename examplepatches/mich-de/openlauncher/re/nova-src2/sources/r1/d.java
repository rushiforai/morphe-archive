package r1;

import java.util.List;
import java.util.ListIterator;
import kotlin.jvm.internal.markers.KMutableListIterator;

/* loaded from: classes2.dex */
public final class d implements ListIterator, KMutableListIterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85074a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f85075b;

    /* renamed from: c, reason: collision with root package name */
    public int f85076c;

    public d(int i5, int i11, List list) {
        this.f85074a = i11;
        switch (i11) {
            case 1:
                this.f85075b = list;
                this.f85076c = i5 - 1;
                break;
            default:
                this.f85075b = list;
                this.f85076c = i5;
                break;
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Object, java.util.List] */
    @Override // java.util.ListIterator
    public final void add(Object obj) {
        switch (this.f85074a) {
            case 0:
                this.f85075b.add(this.f85076c, obj);
                this.f85076c++;
                break;
            default:
                int i5 = this.f85076c + 1;
                this.f85076c = i5;
                this.f85075b.add(i5, obj);
                break;
        }
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.lang.Object, java.util.List] */
    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        switch (this.f85074a) {
            case 0:
                return this.f85076c < this.f85075b.size();
            default:
                return this.f85076c < this.f85075b.size() - 1;
        }
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        switch (this.f85074a) {
            case 0:
                if (this.f85076c > 0) {
                }
                break;
            default:
                if (this.f85076c >= 0) {
                }
                break;
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.lang.Object, java.util.List] */
    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        switch (this.f85074a) {
            case 0:
                int i5 = this.f85076c;
                this.f85076c = i5 + 1;
                return this.f85075b.get(i5);
            default:
                int i11 = this.f85076c + 1;
                this.f85076c = i11;
                return this.f85075b.get(i11);
        }
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        switch (this.f85074a) {
            case 0:
                return this.f85076c;
            default:
                return this.f85076c + 1;
        }
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.lang.Object, java.util.List] */
    @Override // java.util.ListIterator
    public final Object previous() {
        switch (this.f85074a) {
            case 0:
                int i5 = this.f85076c - 1;
                this.f85076c = i5;
                return this.f85075b.get(i5);
            default:
                int i11 = this.f85076c;
                this.f85076c = i11 - 1;
                return this.f85075b.get(i11);
        }
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        switch (this.f85074a) {
            case 0:
                return this.f85076c - 1;
            default:
                return this.f85076c;
        }
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object, java.util.List] */
    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        switch (this.f85074a) {
            case 0:
                int i5 = this.f85076c - 1;
                this.f85076c = i5;
                this.f85075b.remove(i5);
                break;
            default:
                this.f85075b.remove(this.f85076c);
                this.f85076c--;
                break;
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.util.List] */
    @Override // java.util.ListIterator
    public final void set(Object obj) {
        switch (this.f85074a) {
            case 0:
                this.f85075b.set(this.f85076c, obj);
                break;
            default:
                this.f85075b.set(this.f85076c, obj);
                break;
        }
    }
}
