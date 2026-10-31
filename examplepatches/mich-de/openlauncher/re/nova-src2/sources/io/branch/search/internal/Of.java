package io.branch.search.internal;

import java.lang.reflect.Type;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class Of implements com.google.gson.u, com.google.gson.o {
    @Override // com.google.gson.o
    public final Object deserialize(com.google.gson.p json, Type typeOfT, com.google.gson.n context) {
        Intrinsics.g(json, "json");
        Intrinsics.g(typeOfT, "typeOfT");
        Intrinsics.g(context, "context");
        String str = "ALWAYS";
        Nf nf2 = new Nf("ALWAYS");
        try {
            com.google.gson.p pVarA = S4.a(json.j(), "strategy");
            String strO = pVarA != null ? pVarA.o() : null;
            if (strO != null) {
                str = strO;
            }
            return new Nf(str);
        } catch (Exception unused) {
            return nf2;
        }
    }

    @Override // com.google.gson.u
    public final com.google.gson.p serialize(Object obj, Type typeOfSrc, com.google.gson.t context) {
        Nf src = (Nf) obj;
        Intrinsics.g(src, "src");
        Intrinsics.g(typeOfSrc, "typeOfSrc");
        Intrinsics.g(context, "context");
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.p("strategy", new com.google.gson.s(src.f62997a));
        return rVar;
    }
}
