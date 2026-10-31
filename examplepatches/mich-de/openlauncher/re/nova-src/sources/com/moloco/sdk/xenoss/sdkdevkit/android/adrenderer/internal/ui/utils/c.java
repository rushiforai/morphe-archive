package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.utils;

import android.content.res.Resources;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import z2.y;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final c f40110a = new c();

    /* renamed from: b, reason: collision with root package name */
    public static final int f40111b = 0;

    public final float a(int i5) {
        return i5 / Resources.getSystem().getDisplayMetrics().density;
    }

    @NotNull
    public final a.AbstractC0299a.g b(@NotNull y yVar) {
        Intrinsics.g(yVar, "<this>");
        return new a.AbstractC0299a.g(a((int) (yVar.g() >> 32)), a((int) (yVar.g() & 4294967295L)));
    }

    @NotNull
    public final a.AbstractC0299a.f a(long j11) {
        return new a.AbstractC0299a.f(a((int) h2.b.d(j11)), a((int) h2.b.e(j11)));
    }

    @NotNull
    public final a.AbstractC0299a.c a(@NotNull y yVar, @NotNull a.AbstractC0299a.c.EnumC0301a buttonType) {
        Intrinsics.g(yVar, "<this>");
        Intrinsics.g(buttonType, "buttonType");
        return new a.AbstractC0299a.c(buttonType, a(yVar), b(yVar));
    }

    public final boolean a(@NotNull a.AbstractC0299a.c cVar) {
        Intrinsics.g(cVar, "<this>");
        return cVar.f().c() > 0.0f && cVar.f().d() > 0.0f;
    }

    @NotNull
    public final a.AbstractC0299a.f a(@NotNull y yVar) {
        Intrinsics.g(yVar, "<this>");
        return new a.AbstractC0299a.f(a((int) h2.b.d(yVar.M(0L))), a((int) h2.b.e(yVar.M(0L))));
    }
}
