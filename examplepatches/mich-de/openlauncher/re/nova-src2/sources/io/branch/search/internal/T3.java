package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.CancellationStrategy", f = "QueryPlanner.kt", l = {Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE}, m = "schedule")
/* loaded from: classes4.dex */
public final class T3<T> extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f63371a;

    /* renamed from: b, reason: collision with root package name */
    public Object f63372b;

    /* renamed from: c, reason: collision with root package name */
    public Object f63373c;

    /* renamed from: d, reason: collision with root package name */
    public Object f63374d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f63375e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ S3 f63376f;

    /* renamed from: g, reason: collision with root package name */
    public int f63377g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public T3(S3 s32, Continuation<? super T3> continuation) {
        super(continuation);
        this.f63376f = s32;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f63375e = obj;
        this.f63377g |= Integer.MIN_VALUE;
        return this.f63376f.a(null, 0L, null, null, this);
    }
}
