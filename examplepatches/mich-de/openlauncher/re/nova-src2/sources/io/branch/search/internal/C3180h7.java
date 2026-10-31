package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import java.io.InputStream;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.network.HttpPool$postForStream$2", f = "HttpPool.kt", l = {Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.h7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3180h7 extends SuspendLambda implements Function2<t70.j0, Continuation<? super AbstractC3196i6<? extends J2, ? extends InputStream>>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f64650a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f64651b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f64652c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f64653d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ C3112d7 f64654e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3180h7(String str, String str2, String str3, C3112d7 c3112d7, Continuation<? super C3180h7> continuation) {
        super(2, continuation);
        this.f64651b = str;
        this.f64652c = str2;
        this.f64653d = str3;
        this.f64654e = c3112d7;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3180h7(this.f64651b, this.f64652c, this.f64653d, this.f64654e, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3180h7) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f64650a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        x80.g0 g0Var = new x80.g0();
        g0Var.k(this.f64651b);
        g0Var.a("Accept", "application/json");
        g0Var.a("analytics_window_id", this.f64652c);
        g0Var.h(x80.k0.create(C3329q4.f65531b, this.f64653d));
        x80.h0 h0VarB = g0Var.b();
        C3112d7 c3112d7 = this.f64654e;
        String str = this.f64652c;
        this.f64650a = 1;
        Object objA = c3112d7.a(str, h0VarB, null, this);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }
}
