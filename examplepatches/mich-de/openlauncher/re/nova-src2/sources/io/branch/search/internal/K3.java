package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.services.controllers.CacheUpdateController", f = "CacheUpdateController.kt", l = {36, 57}, m = "onStartJobInternal$suspendImpl")
/* loaded from: classes4.dex */
public final class K3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public M3 f62772a;

    /* renamed from: b, reason: collision with root package name */
    public F4 f62773b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f62774c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ M3 f62775d;

    /* renamed from: e, reason: collision with root package name */
    public int f62776e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public K3(M3 m32, Continuation<? super K3> continuation) {
        super(continuation);
        this.f62775d = m32;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f62774c = obj;
        this.f62776e |= Integer.MIN_VALUE;
        return M3.a(this.f62775d, (F4) null, this);
    }
}
