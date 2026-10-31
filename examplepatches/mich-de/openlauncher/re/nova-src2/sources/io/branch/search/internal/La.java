package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager", f = "PackageSyncManager.kt", l = {609, 610}, m = "onProfileUnavailable")
/* loaded from: classes4.dex */
public final class La extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3250la f62842a;

    /* renamed from: b, reason: collision with root package name */
    public Object f62843b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f62844c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ C3250la f62845d;

    /* renamed from: e, reason: collision with root package name */
    public int f62846e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public La(C3250la c3250la, Continuation<? super La> continuation) {
        super(continuation);
        this.f62845d = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f62844c = obj;
        this.f62846e |= Integer.MIN_VALUE;
        return C3250la.b(this.f62845d, null, this);
    }
}
