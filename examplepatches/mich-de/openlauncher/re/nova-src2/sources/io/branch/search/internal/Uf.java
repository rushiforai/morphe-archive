package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.internal.multiprocess.ZeroStateCacheModel;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository", f = "ZeroStateCache.kt", l = {Sdk.SDKError.Reason.AD_HTML_FAILED_TO_LOAD_VALUE}, m = "removeAnalyticsForCachedRequest")
/* loaded from: classes4.dex */
public final class Uf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ZeroStateCacheModel f63460a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f63461b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Pf f63462c;

    /* renamed from: d, reason: collision with root package name */
    public int f63463d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Uf(Pf pf2, Continuation<? super Uf> continuation) {
        super(continuation);
        this.f63462c = pf2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f63461b = obj;
        this.f63463d |= Integer.MIN_VALUE;
        return Pf.a(this.f63462c, (ZeroStateCacheModel) null, (RequestMetadata) null, this);
    }
}
