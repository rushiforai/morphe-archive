package com.moloco.sdk.xenoss.sdkdevkit.android.core;

import f50.h;
import h50.g1;
import h50.h1;
import h50.q;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class a {
    public static final Unit a(long j11, h1 timeout) {
        Intrinsics.g(timeout, "$this$timeout");
        Long lValueOf = Long.valueOf(j11);
        h1.a(lValueOf);
        timeout.f59203a = lValueOf;
        return Unit.f71706a;
    }

    public static final void a(@NotNull k50.c cVar, long j11) {
        Intrinsics.g(cVar, "<this>");
        h1 h1Var = new h1();
        a(j11, h1Var);
        ((Map) cVar.f71122f.a(h.f54327a, new q(7))).put(g1.f59194a, h1Var);
    }
}
