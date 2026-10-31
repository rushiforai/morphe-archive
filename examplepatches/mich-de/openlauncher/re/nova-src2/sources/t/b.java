package t;

import java.util.Iterator;

/* loaded from: classes.dex */
public final class b extends e implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public c f87867a;

    /* renamed from: b, reason: collision with root package name */
    public c f87868b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f87869c;

    public b(c cVar, c cVar2, int i5) {
        this.f87869c = i5;
        this.f87867a = cVar2;
        this.f87868b = cVar;
    }

    @Override // t.e
    public final void a(c cVar) {
        c cVar2;
        c cVarB = null;
        if (this.f87867a == cVar && cVar == this.f87868b) {
            this.f87868b = null;
            this.f87867a = null;
        }
        c cVar3 = this.f87867a;
        if (cVar3 == cVar) {
            switch (this.f87869c) {
                case 0:
                    cVar2 = cVar3.f87873d;
                    break;
                default:
                    cVar2 = cVar3.f87872c;
                    break;
            }
            this.f87867a = cVar2;
        }
        c cVar4 = this.f87868b;
        if (cVar4 == cVar) {
            c cVar5 = this.f87867a;
            if (cVar4 != cVar5 && cVar5 != null) {
                cVarB = b(cVar4);
            }
            this.f87868b = cVarB;
        }
    }

    public final c b(c cVar) {
        switch (this.f87869c) {
            case 0:
                return cVar.f87872c;
            default:
                return cVar.f87873d;
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f87868b != null;
    }

    @Override // java.util.Iterator
    public final Object next() {
        c cVar = this.f87868b;
        c cVar2 = this.f87867a;
        this.f87868b = (cVar == cVar2 || cVar2 == null) ? null : b(cVar);
        return cVar;
    }
}
