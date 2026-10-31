package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.data.remote.source.AutoSuggestDataSource", f = "AutoSuggestDataSource.kt", l = {26}, m = "doCall")
/* loaded from: classes4.dex */
public final class X0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Z0 f63606a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f63607b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Z0 f63608c;

    /* renamed from: d, reason: collision with root package name */
    public int f63609d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public X0(Z0 z02, Continuation<? super X0> continuation) {
        super(continuation);
        this.f63608c = z02;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f63607b = obj;
        this.f63609d |= Integer.MIN_VALUE;
        return Z0.a(this.f63608c, null, null, null, this);
    }
}
