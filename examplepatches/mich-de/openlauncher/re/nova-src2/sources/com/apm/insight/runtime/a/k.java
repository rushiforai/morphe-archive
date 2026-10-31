package com.apm.insight.runtime.a;

import android.content.Context;
import com.apm.insight.CrashType;
import com.apm.insight.entity.Header;
import org.json.JSONException;

/* loaded from: classes2.dex */
final class k extends c {
    public k(Context context, b bVar, d dVar) {
        super(CrashType.LAUNCH, context, bVar, dVar);
    }

    @Override // com.apm.insight.runtime.a.c
    public final com.apm.insight.entity.a a(int i5, com.apm.insight.entity.a aVar) throws JSONException {
        com.apm.insight.entity.a aVarA = super.a(i5, aVar);
        if (i5 == 0) {
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
            try {
                aVarA.d().f().put("launch_did", com.apm.insight.i.a.a(this.f21852b));
            } catch (Throwable unused) {
            }
        } else if (i5 == 5) {
            Header.b(aVarA.d());
            return aVarA;
        }
        return aVarA;
    }
}
