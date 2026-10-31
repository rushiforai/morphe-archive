package com.apm.insight.runtime.a;

import android.content.Context;
import com.apm.insight.CrashType;
import com.apm.insight.entity.Header;
import org.json.JSONException;

/* loaded from: classes2.dex */
public final class i extends c {
    public i(Context context, b bVar, d dVar) {
        super(CrashType.ENSURE, context, bVar, dVar);
    }

    @Override // com.apm.insight.runtime.a.c
    public final com.apm.insight.entity.a a(com.apm.insight.entity.a aVar) throws JSONException {
        com.apm.insight.entity.a aVarA = super.a(aVar);
        com.apm.insight.a.a(aVarA, (Header) null, this.f21851a);
        return aVarA;
    }

    @Override // com.apm.insight.runtime.a.c
    public final boolean b() {
        return false;
    }

    @Override // com.apm.insight.runtime.a.c
    public final boolean c() {
        return false;
    }
}
