package z;

import java.util.Iterator;
import kotlin.jvm.internal.markers.KMutableIterator;

/* loaded from: classes2.dex */
public final class m0 implements Iterator, KMutableIterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f97799a = 0;

    /* renamed from: b, reason: collision with root package name */
    public int f97800b = -1;

    /* renamed from: c, reason: collision with root package name */
    public final q70.c f97801c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f97802d;

    public m0(r0 r0Var) {
        this.f97802d = r0Var;
        this.f97801c = u90.b.O(new q0(r0Var, this, null));
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f97799a) {
        }
        return this.f97801c.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f97799a) {
        }
        return this.f97801c.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f97799a) {
            case 0:
                int i5 = this.f97800b;
                if (i5 != -1) {
                    ((n0) this.f97802d).f97805b.h(i5);
                    this.f97800b = -1;
                    break;
                }
                break;
            default:
                int i11 = this.f97800b;
                if (i11 != -1) {
                    ((r0) this.f97802d).f97828b.m(i11);
                    this.f97800b = -1;
                    break;
                }
                break;
        }
    }

    public m0(n0 n0Var) {
        this.f97802d = n0Var;
        this.f97801c = u90.b.O(new l0(n0Var, this, null));
    }
}
