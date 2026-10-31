package t;

import java.util.Iterator;

/* loaded from: classes.dex */
public final class d extends e implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public c f87874a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f87875b = true;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ f f87876c;

    public d(f fVar) {
        this.f87876c = fVar;
    }

    @Override // t.e
    public final void a(c cVar) {
        c cVar2 = this.f87874a;
        if (cVar == cVar2) {
            c cVar3 = cVar2.f87873d;
            this.f87874a = cVar3;
            this.f87875b = cVar3 == null;
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (this.f87875b) {
            return this.f87876c.f87877a != null;
        }
        c cVar = this.f87874a;
        return (cVar == null || cVar.f87872c == null) ? false : true;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (this.f87875b) {
            this.f87875b = false;
            this.f87874a = this.f87876c.f87877a;
        } else {
            c cVar = this.f87874a;
            this.f87874a = cVar != null ? cVar.f87872c : null;
        }
        return this.f87874a;
    }
}
