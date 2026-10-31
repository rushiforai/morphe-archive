package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.services.CoroutinesJobManager", f = "RunningJobMonitor.kt", l = {63}, m = "addJob")
/* loaded from: classes4.dex */
public final class H4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public J4 f62573a;

    /* renamed from: b, reason: collision with root package name */
    public t70.r1 f62574b;

    /* renamed from: c, reason: collision with root package name */
    public int f62575c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f62576d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ J4 f62577e;

    /* renamed from: f, reason: collision with root package name */
    public int f62578f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public H4(J4 j42, Continuation<? super H4> continuation) {
        super(continuation);
        this.f62577e = j42;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f62576d = obj;
        this.f62578f |= Integer.MIN_VALUE;
        return J4.a(this.f62577e, 0, null, this);
    }
}
