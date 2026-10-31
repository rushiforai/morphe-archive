package com.fyber.inneractive.sdk.response.nativead;

import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class k extends com.fyber.inneractive.sdk.response.e {
    public i M;

    @Override // com.fyber.inneractive.sdk.response.e
    public final InneractiveErrorCode a(InneractiveAdRequest inneractiveAdRequest, r rVar) {
        return null;
    }

    @Override // com.fyber.inneractive.sdk.response.e
    public final InneractiveErrorCode b() {
        return null;
    }

    public final e c() {
        f fVar;
        ArrayList arrayList;
        i iVar = this.M;
        if (iVar == null || (arrayList = iVar.f31087a) == null) {
            fVar = null;
        } else {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                fVar = (f) it.next();
                if (fVar.f31076c != null) {
                    break;
                }
            }
            fVar = null;
        }
        if (fVar != null) {
            return fVar.f31076c;
        }
        return null;
    }

    public final boolean d() {
        String str;
        e eVarC = c();
        return (eVarC == null || (str = eVarC.f31073a) == null || str.isEmpty()) ? false : true;
    }
}
