package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.util.BncExecutor", f = "BncExecutor.kt", l = {41}, m = "internalExecutor")
/* loaded from: classes4.dex */
public final class F1<T> extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Function0 f62431a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f62432b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ H1 f62433c;

    /* renamed from: d, reason: collision with root package name */
    public int f62434d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public F1(H1 h1, Continuation<? super F1> continuation) {
        super(continuation);
        this.f62433c = h1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f62432b = obj;
        this.f62434d |= Integer.MIN_VALUE;
        return H1.a(this.f62433c, null, null, null, null, this);
    }
}
