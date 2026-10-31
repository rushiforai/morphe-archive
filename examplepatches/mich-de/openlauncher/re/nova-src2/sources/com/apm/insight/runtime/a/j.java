package com.apm.insight.runtime.a;

import android.content.Context;
import com.apm.insight.CrashType;
import com.apm.insight.entity.Header;
import org.json.JSONException;

/* loaded from: classes2.dex */
final class j extends c {
    public j(Context context, b bVar, d dVar) {
        super(CrashType.JAVA, context, bVar, dVar);
    }

    @Override // com.apm.insight.runtime.a.c
    public final com.apm.insight.entity.a a(int i5, com.apm.insight.entity.a aVar) throws JSONException {
        com.apm.insight.entity.a aVarA = super.a(i5, aVar);
        if (i5 == 0) {
            aVarA.a("app_count", (Object) 1);
            aVarA.a("magic_tag", "ss_app_log");
            Header headerA = Header.a(this.f21852b);
            headerA.c();
            aVarA.a(headerA);
            com.apm.insight.a.a(aVarA, headerA, this.f21851a);
            return aVarA;
        }
        if (i5 == 1) {
            Header headerD = aVarA.d();
            headerD.d();
            headerD.e();
            return aVarA;
        }
        if (i5 == 2) {
            Header.a(aVarA.d());
            return aVarA;
        }
        if (i5 != 5) {
            return aVarA;
        }
        Header.b(aVarA.d());
        return aVarA;
    }
}
