package io.branch.search.internal;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class Qb implements com.google.gson.u, com.google.gson.o {
    /* JADX WARN: Removed duplicated region for block: B:10:0x0066  */
    @Override // com.google.gson.o
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object deserialize(com.google.gson.p json, Type typeOfT, com.google.gson.n context) {
        ArrayList arrayList;
        Intrinsics.g(json, "json");
        Intrinsics.g(typeOfT, "typeOfT");
        Intrinsics.g(context, "context");
        com.google.gson.r rVarJ = json.j();
        boolean zD = rVarJ.v("enabled").d();
        if (rVarJ.f34795a.containsKey("retry_policies")) {
            com.google.gson.p pVarV = rVarJ.v("retry_policies");
            pVarV.getClass();
            if (pVarV instanceof com.google.gson.q) {
                arrayList = null;
            } else {
                com.google.gson.m mVarH = rVarJ.v("retry_policies").h();
                arrayList = new ArrayList(b70.c.u0(mVarH, 10));
                Iterator it = mVarH.f34793a.iterator();
                while (it.hasNext()) {
                    arrayList.add((Tb) ((gu.j) context).e((com.google.gson.p) it.next(), Tb.class));
                }
            }
        }
        return new Pb(arrayList, zD);
    }

    @Override // com.google.gson.u
    public final com.google.gson.p serialize(Object obj, Type typeOfSrc, com.google.gson.t context) {
        Pb src = (Pb) obj;
        Intrinsics.g(src, "src");
        Intrinsics.g(typeOfSrc, "typeOfSrc");
        Intrinsics.g(context, "context");
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.p("enabled", new com.google.gson.s(Boolean.valueOf(src.f63086a)));
        List<Tb> list = src.f63087b;
        if (list != null) {
            com.google.gson.m mVar = new com.google.gson.m();
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                mVar.p(((gu.j) context).o((Tb) it.next()));
            }
            rVar.p("retry_policies", mVar);
        }
        return rVar;
    }
}
