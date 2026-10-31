package c70;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import java.util.AbstractList;
import java.util.ConcurrentModificationException;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.internal.markers.KMutableListIterator;
import z1.q;

/* loaded from: classes4.dex */
public final class a implements ListIterator, KMutableListIterator {

    /* renamed from: b, reason: collision with root package name */
    public int f19826b;

    /* renamed from: d, reason: collision with root package name */
    public int f19828d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f19829e;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19825a = 1;

    /* renamed from: c, reason: collision with root package name */
    public int f19827c = -1;

    public a(ListBuilder listBuilder, int i5) {
        this.f19829e = listBuilder;
        this.f19826b = i5;
        this.f19828d = ((AbstractList) listBuilder).modCount;
    }

    public void a() {
        if (((AbstractList) ((ListBuilder) this.f19829e)).modCount != this.f19828d) {
            throw new ConcurrentModificationException();
        }
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        switch (this.f19825a) {
            case 0:
                a();
                ListBuilder listBuilder = (ListBuilder) this.f19829e;
                int i5 = this.f19826b;
                this.f19826b = i5 + 1;
                listBuilder.add(i5, obj);
                this.f19827c = -1;
                this.f19828d = ((AbstractList) listBuilder).modCount;
                break;
            default:
                b();
                SnapshotStateList snapshotStateList = (SnapshotStateList) this.f19829e;
                snapshotStateList.add(this.f19826b + 1, obj);
                this.f19827c = -1;
                this.f19826b++;
                this.f19828d = q.d(snapshotStateList);
                break;
        }
    }

    public void b() {
        if (q.d((SnapshotStateList) this.f19829e) != this.f19828d) {
            throw new ConcurrentModificationException();
        }
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        switch (this.f19825a) {
            case 0:
                return this.f19826b < ((ListBuilder) this.f19829e).f71754b;
            default:
                return this.f19826b < ((SnapshotStateList) this.f19829e).size() - 1;
        }
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        switch (this.f19825a) {
            case 0:
                if (this.f19826b > 0) {
                }
                break;
            default:
                if (this.f19826b >= 0) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        switch (this.f19825a) {
            case 0:
                a();
                int i5 = this.f19826b;
                ListBuilder listBuilder = (ListBuilder) this.f19829e;
                if (i5 >= listBuilder.f71754b) {
                    throw new NoSuchElementException();
                }
                this.f19826b = i5 + 1;
                this.f19827c = i5;
                return listBuilder.f71753a[i5];
            default:
                b();
                int i11 = this.f19826b + 1;
                this.f19827c = i11;
                SnapshotStateList snapshotStateList = (SnapshotStateList) this.f19829e;
                q.a(i11, snapshotStateList.size());
                Object obj = snapshotStateList.get(i11);
                this.f19826b = i11;
                return obj;
        }
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        switch (this.f19825a) {
            case 0:
                return this.f19826b;
            default:
                return this.f19826b + 1;
        }
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        switch (this.f19825a) {
            case 0:
                a();
                int i5 = this.f19826b;
                if (i5 <= 0) {
                    throw new NoSuchElementException();
                }
                int i11 = i5 - 1;
                this.f19826b = i11;
                this.f19827c = i11;
                return ((ListBuilder) this.f19829e).f71753a[i11];
            default:
                b();
                int i12 = this.f19826b;
                SnapshotStateList snapshotStateList = (SnapshotStateList) this.f19829e;
                q.a(i12, snapshotStateList.size());
                int i13 = this.f19826b;
                this.f19827c = i13;
                this.f19826b--;
                return snapshotStateList.get(i13);
        }
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        switch (this.f19825a) {
            case 0:
                return this.f19826b - 1;
            default:
                return this.f19826b;
        }
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        switch (this.f19825a) {
            case 0:
                ListBuilder listBuilder = (ListBuilder) this.f19829e;
                a();
                int i5 = this.f19827c;
                if (i5 == -1) {
                    throw new IllegalStateException("Call next() or previous() before removing element from the iterator.");
                }
                listBuilder.d(i5);
                this.f19826b = this.f19827c;
                this.f19827c = -1;
                this.f19828d = ((AbstractList) listBuilder).modCount;
                return;
            default:
                b();
                SnapshotStateList snapshotStateList = (SnapshotStateList) this.f19829e;
                snapshotStateList.remove(this.f19827c);
                this.f19826b--;
                this.f19827c = -1;
                this.f19828d = q.d(snapshotStateList);
                return;
        }
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        switch (this.f19825a) {
            case 0:
                a();
                int i5 = this.f19827c;
                if (i5 == -1) {
                    throw new IllegalStateException("Call next() or previous() before replacing element from the iterator.");
                }
                ((ListBuilder) this.f19829e).set(i5, obj);
                return;
            default:
                SnapshotStateList snapshotStateList = (SnapshotStateList) this.f19829e;
                b();
                int i11 = this.f19827c;
                if (i11 < 0) {
                    throw new IllegalStateException("Cannot call set before the first call to next() or previous() or immediately after a call to add() or remove()");
                }
                snapshotStateList.set(i11, obj);
                this.f19828d = q.d(snapshotStateList);
                return;
        }
    }

    public a(SnapshotStateList snapshotStateList, int i5) {
        this.f19829e = snapshotStateList;
        this.f19826b = i5 - 1;
        this.f19828d = q.d(snapshotStateList);
    }
}
