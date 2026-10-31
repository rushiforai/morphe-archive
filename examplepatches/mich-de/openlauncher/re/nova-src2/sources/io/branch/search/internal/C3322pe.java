package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.SqlAdsDataSource", f = "SqlAdsDataSource.kt", l = {176}, m = "getSearchSqlDemoAds")
/* renamed from: io.branch.search.internal.pe, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3322pe extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f65487a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3305oe f65488b;

    /* renamed from: c, reason: collision with root package name */
    public int f65489c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3322pe(C3305oe c3305oe, Continuation<? super C3322pe> continuation) {
        super(continuation);
        this.f65488b = c3305oe;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f65487a = obj;
        this.f65489c |= Integer.MIN_VALUE;
        return this.f65488b.a(null, null, this);
    }
}
