package io.branch.search.internal;

import android.os.UserHandle;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager", f = "PackageSyncManager.kt", l = {609, 610}, m = "onProfileAvailable")
/* loaded from: classes4.dex */
public final class Ia extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3250la f62674a;

    /* renamed from: b, reason: collision with root package name */
    public Object f62675b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f62676c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ C3250la f62677d;

    /* renamed from: e, reason: collision with root package name */
    public int f62678e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Ia(C3250la c3250la, Continuation<? super Ia> continuation) {
        super(continuation);
        this.f62677d = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f62676c = obj;
        this.f62678e |= Integer.MIN_VALUE;
        return C3250la.a(this.f62677d, (UserHandle) null, this);
    }
}
