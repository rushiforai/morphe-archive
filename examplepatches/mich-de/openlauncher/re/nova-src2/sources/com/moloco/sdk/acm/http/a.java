package com.moloco.sdk.acm.http;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import o50.n;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class a {
    @NotNull
    public final Function1<n, Unit> a(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5, @Nullable String str6) {
        return new g(str4, str5, str3, str, str6, str2, 0);
    }

    public static final Unit a(String str, String str2, String str3, String str4, String str5, String str6, n nVar) {
        Intrinsics.g(nVar, "<this>");
        StringBuilder sb2 = new StringBuilder();
        if (str != null) {
            sb2.append("AppBundle/" + str + ';');
        }
        if (str2 != null) {
            sb2.append("AppVersion/" + str2 + ';');
        }
        if (str3 != null) {
            sb2.append("AppKey/" + str3 + ';');
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        StringBuilder sb3 = new StringBuilder();
        if (str4 != null) {
            sb3.append("SdkVersion/" + str4 + ';');
        }
        if (str5 != null) {
            sb3.append("Mediator/" + str5 + ';');
        }
        String string2 = sb3.toString();
        Intrinsics.f(string2, "toString(...)");
        StringBuilder sb4 = new StringBuilder("OS/Android;");
        if (str6 != null) {
            sb4.append("osv/" + str6 + ';');
        }
        String string3 = sb4.toString();
        Intrinsics.f(string3, "toString(...)");
        nVar.d("X-Moloco-App-Info", string);
        nVar.d("X-Moloco-Device-Info", string3);
        nVar.d("X-Moloco-SDK-Info", string2);
        return Unit.f71706a;
    }
}
