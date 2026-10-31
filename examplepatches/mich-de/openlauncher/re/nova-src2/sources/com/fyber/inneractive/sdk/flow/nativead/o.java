package com.fyber.inneractive.sdk.flow.nativead;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class o implements com.fyber.inneractive.sdk.click.o {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f28238a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.util.g f28239b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p f28240c;

    public o(p pVar, i iVar, com.fyber.inneractive.sdk.util.g gVar) {
        this.f28240c = pVar;
        this.f28238a = iVar;
        this.f28239b = gVar;
    }

    @Override // com.fyber.inneractive.sdk.click.o
    public final void a(com.fyber.inneractive.sdk.click.b bVar) {
        if (bVar.f27697a == com.fyber.inneractive.sdk.click.q.FAILED) {
            p pVar = this.f28240c;
            i iVar = this.f28238a;
            String str = bVar.f27700d;
            com.fyber.inneractive.sdk.util.g gVar = this.f28239b;
            pVar.getClass();
            IAlog.f("%s : Trying to resolve fallback Link: %s", p.f28241b, str);
            j jVar = (j) pVar.f28242a;
            i iVar2 = jVar.f28212a;
            if (iVar2 == null || iVar2.equals(iVar)) {
                IAlog.a("%s : No valid link object, origin: %s", j.f28211d, gVar);
                return;
            }
            p pVar2 = jVar.f28214c;
            i iVar3 = jVar.f28212a;
            pVar2.getClass();
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new m(pVar2, iVar3, true, gVar));
        }
    }
}
