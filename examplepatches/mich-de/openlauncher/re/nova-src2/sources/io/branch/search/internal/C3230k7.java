package io.branch.search.internal;

import java.io.IOException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.k7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3230k7 implements x80.j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.l f64920a;

    public C3230k7(t70.m mVar) {
        this.f64920a = mVar;
    }

    @Override // x80.j
    public final void onFailure(@NotNull x80.i call, @NotNull IOException e3) {
        Intrinsics.g(call, "call");
        Intrinsics.g(e3, "e");
        t70.l lVar = this.f64920a;
        int i5 = Result.f71687b;
        lVar.resumeWith(ResultKt.a(e3));
    }

    @Override // x80.j
    public final void onResponse(@NotNull x80.i call, @NotNull x80.m0 response) {
        Intrinsics.g(call, "call");
        Intrinsics.g(response, "response");
        t70.l lVar = this.f64920a;
        int i5 = Result.f71687b;
        lVar.resumeWith(response);
    }
}
