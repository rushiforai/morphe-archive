package io.branch.search.internal;

import java.lang.reflect.Type;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: io.branch.search.internal.u8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3400u8 implements com.google.gson.u, com.google.gson.o {
    @Override // com.google.gson.o
    public final Object deserialize(com.google.gson.p json, Type typeOfT, com.google.gson.n context) {
        Intrinsics.g(json, "json");
        Intrinsics.g(typeOfT, "typeOfT");
        Intrinsics.g(context, "context");
        com.google.gson.r rVarJ = json.j();
        int iG = rVarJ.v("days").g();
        long jL = rVarJ.v("byte_limit").l();
        com.google.gson.p pVarA = S4.a(rVarJ, "channels");
        String strO = pVarA != null ? pVarA.o() : null;
        com.google.gson.p pVarA2 = S4.a(rVarJ, "connection_types");
        return new C3383t8(iG, jL, strO, pVarA2 != null ? pVarA2.o() : null);
    }

    @Override // com.google.gson.u
    public final com.google.gson.p serialize(Object obj, Type typeOfSrc, com.google.gson.t context) {
        C3383t8 src = (C3383t8) obj;
        Intrinsics.g(src, "src");
        Intrinsics.g(typeOfSrc, "typeOfSrc");
        Intrinsics.g(context, "context");
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.p("days", new com.google.gson.s(Integer.valueOf(src.f65861a)));
        rVar.p("byte_limit", new com.google.gson.s(Long.valueOf(src.f65862b)));
        String str = src.f65867g;
        if (str != null) {
            rVar.p("channels", new com.google.gson.s(str));
        }
        String str2 = src.f65868h;
        if (str2 != null) {
            rVar.p("connection_types", new com.google.gson.s(str2));
        }
        return rVar;
    }
}
