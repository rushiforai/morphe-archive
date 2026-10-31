package com.apm.insight.runtime.a;

import android.content.Context;
import com.apm.insight.CrashType;
import com.apm.insight.entity.Header;
import com.apm.insight.nativecrash.NativeCrashCollector;
import org.json.JSONException;

/* loaded from: classes2.dex */
final class l extends c {
    public l(Context context, b bVar, d dVar) {
        super(CrashType.NATIVE, context, bVar, dVar);
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
        if (i5 != 1) {
            if (i5 != 2) {
                return aVarA;
            }
            Header.a(aVarA.d());
            return aVarA;
        }
        Header headerD = aVarA.d();
        headerD.d();
        headerD.e();
        return aVarA;
    }

    @Override // com.apm.insight.runtime.a.c
    public final boolean c() {
        return false;
    }

    @Override // com.apm.insight.runtime.a.c
    public final int a() {
        return NativeCrashCollector.a();
    }
}
