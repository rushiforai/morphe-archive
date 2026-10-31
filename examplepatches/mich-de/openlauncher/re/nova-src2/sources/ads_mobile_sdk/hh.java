package ads_mobile_sdk;

import b.c0;
import b.o8;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;

/* loaded from: classes2.dex */
public final class hh implements o8 {
    public hh(ab0 ab0Var, c71 monitorFactory, b.m6 randomGenerator, jr0 flags) {
        Intrinsics.g(monitorFactory, "monitorFactory");
        Intrinsics.g(randomGenerator, "randomGenerator");
        Intrinsics.g(flags, "flags");
    }

    @Override // b.o8
    public final b.a1 a(ni.k adRequest, int i5) {
        Intrinsics.g(adRequest, "adRequest");
        return new tu0(c0.k("Expected AppOpenAdRequest but received ", Reflection.f71864a.getOrCreateKotlinClass(adRequest.getClass()).getSimpleName()));
    }
}
