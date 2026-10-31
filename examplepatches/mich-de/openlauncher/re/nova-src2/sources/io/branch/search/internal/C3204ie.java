package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.SingleCallStrategy", f = "QueryPlanner.kt", l = {Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE}, m = "sendResponse")
/* renamed from: io.branch.search.internal.ie, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3204ie<T> extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3220je f64792a;

    /* renamed from: b, reason: collision with root package name */
    public String f64793b;

    /* renamed from: c, reason: collision with root package name */
    public Object f64794c;

    /* renamed from: d, reason: collision with root package name */
    public c80.a f64795d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f64796e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ C3220je f64797f;

    /* renamed from: g, reason: collision with root package name */
    public int f64798g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3204ie(C3220je c3220je, Continuation<? super C3204ie> continuation) {
        super(continuation);
        this.f64797f = c3220je;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f64796e = obj;
        this.f64798g |= Integer.MIN_VALUE;
        return C3220je.a(this.f64797f, (String) null, (Object) null, this);
    }
}
