package tk;

import com.google.android.gms.internal.consent_sdk.x0;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import ps.f0;

/* loaded from: classes3.dex */
public final class e extends x0 implements ListIterator {

    /* renamed from: b, reason: collision with root package name */
    public final int f89415b;

    /* renamed from: c, reason: collision with root package name */
    public int f89416c;

    /* renamed from: d, reason: collision with root package name */
    public final g f89417d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(g gVar, int i5) {
        super(3);
        int size = gVar.size();
        if (i5 < 0 || i5 > size) {
            throw new IndexOutOfBoundsException(f0.j(i5, size, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX));
        }
        this.f89415b = size;
        this.f89416c = i5;
        this.f89417d = gVar;
    }

    public final Object a(int i5) {
        return this.f89417d.get(i5);
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final boolean hasNext() {
        return this.f89416c < this.f89415b;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f89416c > 0;
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f89416c;
        this.f89416c = i5 + 1;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f89416c;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f89416c - 1;
        this.f89416c = i5;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f89416c - 1;
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
