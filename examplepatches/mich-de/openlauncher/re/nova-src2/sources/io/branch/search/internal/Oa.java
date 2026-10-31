package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager", f = "PackageSyncManager.kt", l = {389, 391, 396, 399}, m = "syncAll")
/* loaded from: classes4.dex */
public final class Oa extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3250la f63018a;

    /* renamed from: b, reason: collision with root package name */
    public Object f63019b;

    /* renamed from: c, reason: collision with root package name */
    public Object f63020c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f63021d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ C3250la f63022e;

    /* renamed from: f, reason: collision with root package name */
    public int f63023f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Oa(C3250la c3250la, Continuation<? super Oa> continuation) {
        super(continuation);
        this.f63022e = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f63021d = obj;
        this.f63023f |= Integer.MIN_VALUE;
        return C3250la.b(this.f63022e, this);
    }
}
