package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheConfigRepository", f = "ZeroStateCacheConfig.kt", l = {69}, m = "saveRemoteConfig")
/* loaded from: classes4.dex */
public final class Gf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f62548a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ff f62549b;

    /* renamed from: c, reason: collision with root package name */
    public int f62550c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Gf(Ff ff, Continuation<? super Gf> continuation) {
        super(continuation);
        this.f62549b = ff;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f62548a = obj;
        this.f62550c |= Integer.MIN_VALUE;
        return Ff.a(this.f62549b, null, this);
    }
}
