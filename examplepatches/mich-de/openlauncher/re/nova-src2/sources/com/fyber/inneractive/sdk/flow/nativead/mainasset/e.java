package com.fyber.inneractive.sdk.flow.nativead.mainasset;

import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.response.nativead.i;
import com.fyber.inneractive.sdk.response.nativead.j;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public abstract class e {
    public static d a(r rVar, j jVar, InneractiveAdRequest inneractiveAdRequest, i iVar, String str, com.fyber.inneractive.sdk.flow.nativead.f fVar) {
        com.fyber.inneractive.sdk.response.nativead.c cVar;
        String str2;
        ArrayList arrayList = iVar.f31087a;
        if (arrayList == null || arrayList.isEmpty()) {
            return null;
        }
        Iterator it = iVar.f31087a.iterator();
        while (it.hasNext()) {
            com.fyber.inneractive.sdk.response.nativead.f fVar2 = (com.fyber.inneractive.sdk.response.nativead.f) it.next();
            if (fVar2.f31074a == 3 && jVar.S.d()) {
                return new f(fVar2, rVar, jVar, inneractiveAdRequest, str, fVar);
            }
            r rVar2 = rVar;
            j jVar2 = jVar;
            InneractiveAdRequest inneractiveAdRequest2 = inneractiveAdRequest;
            String str3 = str;
            com.fyber.inneractive.sdk.flow.nativead.f fVar3 = fVar;
            if (fVar2.f31074a == 2 && (cVar = fVar2.f31077d) != null && (str2 = cVar.f31071a) != null && !str2.trim().isEmpty()) {
                return new b(fVar2, fVar3, jVar2, rVar2);
            }
            rVar = rVar2;
            jVar = jVar2;
            inneractiveAdRequest = inneractiveAdRequest2;
            str = str3;
            fVar = fVar3;
        }
        return null;
    }
}
