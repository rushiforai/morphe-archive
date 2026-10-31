package io.branch.search.internal;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import java.lang.reflect.Type;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class B3 implements com.google.gson.u, com.google.gson.o {
    @Override // com.google.gson.o
    public final Object deserialize(com.google.gson.p json, Type typeOfT, com.google.gson.n context) {
        Intrinsics.g(json, "json");
        Intrinsics.g(typeOfT, "typeOfT");
        Intrinsics.g(context, "context");
        com.google.gson.r rVarJ = json.j();
        com.google.gson.p pVarA = S4.a(rVarJ, "max_default_keep_alive");
        long jL = pVarA != null ? pVarA.l() : TTAdConstant.AD_MAX_EVENT_TIME;
        com.google.gson.p pVarA2 = S4.a(rVarJ, "automatic_clear_cache");
        return new A3(jL, pVarA2 != null ? pVarA2.d() : false);
    }

    @Override // com.google.gson.u
    public final com.google.gson.p serialize(Object obj, Type typeOfSrc, com.google.gson.t context) {
        A3 src = (A3) obj;
        Intrinsics.g(src, "src");
        Intrinsics.g(typeOfSrc, "typeOfSrc");
        Intrinsics.g(context, "context");
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.p("max_default_keep_alive", new com.google.gson.s(Long.valueOf(src.f61921a)));
        rVar.p("automatic_clear_cache", new com.google.gson.s(Boolean.valueOf(src.f61922b)));
        return rVar;
    }
}
