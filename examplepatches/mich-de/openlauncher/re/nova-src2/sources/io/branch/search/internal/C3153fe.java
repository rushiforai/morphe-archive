package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function1;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.SingleCallStrategy", f = "QueryPlanner.kt", l = {Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE}, m = "queueCallback")
/* renamed from: io.branch.search.internal.fe, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3153fe<T> extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3220je f64491a;

    /* renamed from: b, reason: collision with root package name */
    public String f64492b;

    /* renamed from: c, reason: collision with root package name */
    public Function1 f64493c;

    /* renamed from: d, reason: collision with root package name */
    public c80.a f64494d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f64495e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ C3220je f64496f;

    /* renamed from: g, reason: collision with root package name */
    public int f64497g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3153fe(C3220je c3220je, Continuation<? super C3153fe> continuation) {
        super(continuation);
        this.f64496f = c3220je;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f64495e = obj;
        this.f64497g |= Integer.MIN_VALUE;
        return C3220je.a(this.f64496f, (String) null, (Function1) null, (Continuation) this);
    }
}
