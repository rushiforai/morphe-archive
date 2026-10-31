package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.services.controllers.PingServiceController", f = "PingServiceController.kt", l = {58}, m = "onStartJobInternal$suspendImpl")
/* loaded from: classes4.dex */
public final class Xa extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f63669a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ya f63670b;

    /* renamed from: c, reason: collision with root package name */
    public int f63671c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Xa(Ya ya2, Continuation<? super Xa> continuation) {
        super(continuation);
        this.f63670b = ya2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f63669a = obj;
        this.f63671c |= Integer.MIN_VALUE;
        return Ya.a(this.f63670b, (Wa) null, this);
    }
}
