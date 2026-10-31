package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProviderClickHandler", f = "BncContentProviderPaths.kt", l = {485}, m = "resolveRecordAppUsage")
/* loaded from: classes4.dex */
public final class C1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f62186a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ B1 f62187b;

    /* renamed from: c, reason: collision with root package name */
    public int f62188c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C1(B1 b12, Continuation<? super C1> continuation) {
        super(continuation);
        this.f62187b = b12;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f62186a = obj;
        this.f62188c |= Integer.MIN_VALUE;
        return B1.a(this.f62187b, null, this);
    }
}
