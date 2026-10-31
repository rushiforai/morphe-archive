package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager", f = "PackageSyncManager.kt", l = {609, 610}, m = "onPackageRemoved")
/* loaded from: classes4.dex */
public final class Fa extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3250la f62465a;

    /* renamed from: b, reason: collision with root package name */
    public String f62466b;

    /* renamed from: c, reason: collision with root package name */
    public Object f62467c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f62468d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ C3250la f62469e;

    /* renamed from: f, reason: collision with root package name */
    public int f62470f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Fa(C3250la c3250la, Continuation<? super Fa> continuation) {
        super(continuation);
        this.f62469e = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f62468d = obj;
        this.f62470f |= Integer.MIN_VALUE;
        return C3250la.c(this.f62469e, null, null, this);
    }
}
