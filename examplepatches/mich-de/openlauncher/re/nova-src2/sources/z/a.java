package z;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.markers.KMutableIterator;

/* loaded from: classes.dex */
public final class a implements Iterator, KMutableIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f97734a;

    /* renamed from: b, reason: collision with root package name */
    public int f97735b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f97736c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f97737d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f97738e;

    public a(int i5) {
        this.f97734a = i5;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f97735b < this.f97734a;
    }

    @Override // java.util.Iterator
    public final Object next() {
        Object objF;
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f97735b;
        switch (this.f97737d) {
            case 0:
                objF = ((e) this.f97738e).f(i5);
                break;
            case 1:
                objF = ((e) this.f97738e).j(i5);
                break;
            default:
                objF = ((f) this.f97738e).f97765b[i5];
                break;
        }
        this.f97735b++;
        this.f97736c = true;
        return objF;
    }

    @Override // java.util.Iterator
    public final void remove() {
        if (!this.f97736c) {
            android.support.v4.media.session.b.l0("Call next() before removing an element.");
            throw null;
        }
        int i5 = this.f97735b - 1;
        this.f97735b = i5;
        switch (this.f97737d) {
            case 0:
                ((e) this.f97738e).h(i5);
                break;
            case 1:
                ((e) this.f97738e).h(i5);
                break;
            default:
                ((f) this.f97738e).d(i5);
                break;
        }
        this.f97734a--;
        this.f97736c = false;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a(f fVar) {
        this(fVar.f97766c);
        this.f97737d = 2;
        this.f97738e = fVar;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a(e eVar, int i5) {
        this(eVar.f97753c);
        this.f97737d = i5;
        switch (i5) {
            case 1:
                this.f97738e = eVar;
                this(eVar.f97753c);
                break;
            default:
                this.f97738e = eVar;
                break;
        }
    }
}
