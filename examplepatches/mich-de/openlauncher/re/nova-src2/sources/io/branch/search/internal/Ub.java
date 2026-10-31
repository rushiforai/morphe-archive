package io.branch.search.internal;

import java.lang.reflect.Type;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class Ub implements com.google.gson.u, com.google.gson.o {
    @Override // com.google.gson.o
    public final Object deserialize(com.google.gson.p json, Type typeOfT, com.google.gson.n context) {
        Intrinsics.g(json, "json");
        Intrinsics.g(typeOfT, "typeOfT");
        Intrinsics.g(context, "context");
        com.google.gson.r rVarJ = json.j();
        String strO = rVarJ.v("policy_type").o();
        Intrinsics.f(strO, "it.get(\"policy_type\").asString");
        return new Tb(rVarJ.v("time_threshold").l(), rVarJ.v("delay").l(), strO);
    }

    @Override // com.google.gson.u
    public final com.google.gson.p serialize(Object obj, Type typeOfSrc, com.google.gson.t context) {
        Tb src = (Tb) obj;
        Intrinsics.g(src, "src");
        Intrinsics.g(typeOfSrc, "typeOfSrc");
        Intrinsics.g(context, "context");
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.p("policy_type", new com.google.gson.s(src.f63384a));
        rVar.p("time_threshold", new com.google.gson.s(Long.valueOf(src.f63385b)));
        rVar.p("delay", new com.google.gson.s(Long.valueOf(src.f63386c)));
        return rVar;
    }
}
