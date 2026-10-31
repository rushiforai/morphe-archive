package z90;

import ba0.f;
import ba0.r;
import ba0.v;
import ba0.w;
import y90.d;

/* loaded from: classes5.dex */
public final class a implements ea0.a {

    /* renamed from: a, reason: collision with root package name */
    public final char f98405a;

    public a(char c11) {
        this.f98405a = c11;
    }

    @Override // ea0.a
    public final int a(d dVar, d dVar2) {
        if (dVar.f97020d || dVar2.f97019c) {
            int i5 = dVar2.f97024h;
            if (i5 % 3 != 0 && (dVar.f97024h + i5) % 3 == 0) {
                return 0;
            }
        }
        return (dVar.f97023g < 2 || dVar2.f97023g < 2) ? 1 : 2;
    }

    @Override // ea0.a
    public final char b() {
        return this.f98405a;
    }

    @Override // ea0.a
    public final int c() {
        return 1;
    }

    @Override // ea0.a
    public final char d() {
        return this.f98405a;
    }

    @Override // ea0.a
    public final void e(w wVar, w wVar2, int i5) {
        r fVar = i5 == 1 ? new f() : new v();
        r rVar = wVar.f17785e;
        while (rVar != null && rVar != wVar2) {
            r rVar2 = rVar.f17785e;
            fVar.b(rVar);
            rVar = rVar2;
        }
        fVar.f();
        r rVar3 = wVar.f17785e;
        fVar.f17785e = rVar3;
        if (rVar3 != null) {
            rVar3.f17784d = fVar;
        }
        fVar.f17784d = wVar;
        wVar.f17785e = fVar;
        r rVar4 = wVar.f17781a;
        fVar.f17781a = rVar4;
        if (fVar.f17785e == null) {
            rVar4.f17783c = fVar;
        }
    }
}
