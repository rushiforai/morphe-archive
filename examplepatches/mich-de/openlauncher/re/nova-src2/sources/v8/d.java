package v8;

import coil.memory.MemoryCache$Key;
import fa.t;
import z.x;

/* loaded from: classes.dex */
public final class d extends x {

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ x7.c f92210g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(int i5, x7.c cVar) {
        super(i5);
        this.f92210g = cVar;
    }

    @Override // z.x
    public final void b(Object obj, Object obj2, Object obj3) {
        c cVar = (c) obj2;
        ((t) this.f92210g.f95126a).o((MemoryCache$Key) obj, cVar.f92207a, cVar.f92208b, cVar.f92209c);
    }

    @Override // z.x
    public final int g(Object obj, Object obj2) {
        return ((c) obj2).f92209c;
    }
}
