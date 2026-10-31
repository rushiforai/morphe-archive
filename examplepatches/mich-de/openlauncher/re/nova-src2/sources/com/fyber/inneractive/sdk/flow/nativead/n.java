package com.fyber.inneractive.sdk.flow.nativead;

import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v;

/* loaded from: classes3.dex */
public final class n implements com.fyber.inneractive.sdk.click.o {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f28234a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f28235b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.util.g f28236c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p f28237d;

    public n(p pVar, i iVar, String str, com.fyber.inneractive.sdk.util.g gVar) {
        this.f28237d = pVar;
        this.f28234a = iVar;
        this.f28235b = str;
        this.f28236c = gVar;
    }

    @Override // com.fyber.inneractive.sdk.click.o
    public final void a(com.fyber.inneractive.sdk.click.b bVar) {
        if (bVar.f27697a == com.fyber.inneractive.sdk.click.q.FAILED) {
            p pVar = this.f28237d;
            i iVar = this.f28234a;
            String str = this.f28235b;
            com.fyber.inneractive.sdk.util.g gVar = this.f28236c;
            pVar.getClass();
            IAlog.f("%s : Trying to resolve fallback Link: %s", p.f28241b, str);
            if (v.a(str)) {
                o oVar = new o(pVar, iVar, gVar);
                k kVar = ((j) pVar.f28242a).f28213b;
                if (kVar != null) {
                    kVar.a(str, true, gVar, oVar);
                    return;
                }
                return;
            }
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
