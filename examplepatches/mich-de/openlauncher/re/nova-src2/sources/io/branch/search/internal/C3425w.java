package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.AdsDataSource", f = "AdsDataSource.kt", l = {104}, m = "getDemoAdResults")
/* renamed from: io.branch.search.internal.w, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3425w extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f66195a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AbstractC3324q f66196b;

    /* renamed from: c, reason: collision with root package name */
    public int f66197c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3425w(AbstractC3324q abstractC3324q, Continuation<? super C3425w> continuation) {
        super(continuation);
        this.f66196b = abstractC3324q;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f66195a = obj;
        this.f66197c |= Integer.MIN_VALUE;
        return this.f66196b.b(null, null, null, null, null, null, null, null, null, this);
    }
}
