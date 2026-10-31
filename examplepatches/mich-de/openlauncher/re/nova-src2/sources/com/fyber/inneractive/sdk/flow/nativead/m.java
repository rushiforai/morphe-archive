package com.fyber.inneractive.sdk.flow.nativead;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.network.z0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class m implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f28215a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f28216b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.util.g f28217c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p f28218d;

    public m(p pVar, i iVar, boolean z11, com.fyber.inneractive.sdk.util.g gVar) {
        this.f28218d = pVar;
        this.f28215a = iVar;
        this.f28216b = z11;
        this.f28217c = gVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0073  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        com.fyber.inneractive.sdk.click.o oVar;
        Iterator it;
        p pVar = this.f28218d;
        i iVar = this.f28215a;
        boolean z11 = this.f28216b;
        com.fyber.inneractive.sdk.util.g gVar = this.f28217c;
        pVar.getClass();
        String str = iVar.f28208a;
        String str2 = iVar.f28209b;
        if (v.a(str)) {
            oVar = new n(pVar, iVar, str2, gVar);
        } else {
            if (!v.a(str2)) {
                j jVar = (j) pVar.f28242a;
                i iVar2 = jVar.f28212a;
                if (iVar2 == null || iVar2.equals(iVar)) {
                    IAlog.a("%s : No valid link object, origin: %s", j.f28211d, gVar);
                } else {
                    p pVar2 = jVar.f28214c;
                    i iVar3 = jVar.f28212a;
                    pVar2.getClass();
                    com.fyber.inneractive.sdk.util.r.f31215a.execute(new m(pVar2, iVar3, true, gVar));
                }
                p pVar3 = this.f28218d;
                i iVar4 = this.f28215a;
                pVar3.getClass();
                it = iVar4.f28210c.iterator();
                while (it.hasNext()) {
                    String str3 = (String) it.next();
                    if (!TextUtils.isEmpty(str3)) {
                        z0.b(str3);
                    }
                }
            }
            oVar = new o(pVar, iVar, gVar);
            str = str2;
        }
        k kVar = ((j) pVar.f28242a).f28213b;
        if (kVar != null) {
            kVar.a(str, z11, gVar, oVar);
        }
        p pVar32 = this.f28218d;
        i iVar42 = this.f28215a;
        pVar32.getClass();
        it = iVar42.f28210c.iterator();
        while (it.hasNext()) {
        }
    }
}
