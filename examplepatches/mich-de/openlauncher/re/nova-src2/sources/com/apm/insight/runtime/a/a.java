package com.apm.insight.runtime.a;

import android.content.Context;
import com.apm.insight.CrashType;
import com.apm.insight.entity.Header;
import org.json.JSONException;

/* loaded from: classes2.dex */
final class a extends c {
    public a(Context context, b bVar, d dVar) {
        super(CrashType.ANR, context, bVar, dVar);
    }

    @Override // com.apm.insight.runtime.a.c
    public final com.apm.insight.entity.a a(com.apm.insight.entity.a aVar) throws JSONException {
        com.apm.insight.entity.a aVarA = super.a(aVar);
        Header headerA = Header.a(this.f21852b);
        Header.a(headerA);
        Header.b(headerA);
        headerA.c();
        headerA.d();
        headerA.e();
        aVarA.a(headerA);
        aVarA.a("process_name", (Object) com.apm.insight.l.a.b());
        com.apm.insight.a.a(aVarA, headerA, this.f21851a);
        return aVarA;
    }
}
