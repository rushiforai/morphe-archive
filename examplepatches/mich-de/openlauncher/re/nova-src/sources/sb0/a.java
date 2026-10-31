package sb0;

import java.util.AbstractQueue;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReferenceArray;
import ps.f;

/* loaded from: classes5.dex */
public abstract class a extends AbstractQueue {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReferenceArray f87102a;

    /* renamed from: b, reason: collision with root package name */
    public final int f87103b;

    public a(int i5) {
        int iN = f.n(i5);
        this.f87103b = iN - 1;
        this.f87102a = new AtomicReferenceArray(iN);
    }

    @Override // java.util.AbstractQueue, java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        while (true) {
            if (((b) this).poll() == null && isEmpty()) {
                return;
            }
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        throw new UnsupportedOperationException();
    }
}
