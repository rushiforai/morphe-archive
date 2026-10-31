package b70;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.collections.AbstractList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public class a implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17587a = 0;

    /* renamed from: b, reason: collision with root package name */
    public int f17588b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f17589c;

    public a(Object[] array) {
        Intrinsics.g(array, "array");
        this.f17589c = array;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f17587a) {
            case 0:
                if (this.f17588b < ((AbstractList) this.f17589c).c()) {
                }
                break;
            default:
                if (this.f17588b < ((Object[]) this.f17589c).length) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f17587a) {
            case 0:
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                AbstractList abstractList = (AbstractList) this.f17589c;
                int i5 = this.f17588b;
                this.f17588b = i5 + 1;
                return abstractList.get(i5);
            default:
                try {
                    Object[] objArr = (Object[]) this.f17589c;
                    int i11 = this.f17588b;
                    this.f17588b = i11 + 1;
                    return objArr[i11];
                } catch (ArrayIndexOutOfBoundsException e3) {
                    this.f17588b--;
                    throw new NoSuchElementException(e3.getMessage());
                }
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f17587a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public a(AbstractList abstractList) {
        this.f17589c = abstractList;
    }
}
