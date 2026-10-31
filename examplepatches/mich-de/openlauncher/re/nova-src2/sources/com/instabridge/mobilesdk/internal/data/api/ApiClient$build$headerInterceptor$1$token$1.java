package com.instabridge.mobilesdk.internal.data.api;

import com.instabridge.mobilesdk.api.TokenProvider;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)Ljava/lang/String;"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.api.ApiClient$build$headerInterceptor$1$token$1", f = "ApiClient.kt", l = {57}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class ApiClient$build$headerInterceptor$1$token$1 extends SuspendLambda implements Function2<j0, Continuation<? super String>, Object> {
    final /* synthetic */ TokenProvider $tokenProvider;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ApiClient$build$headerInterceptor$1$token$1(TokenProvider tokenProvider, Continuation<? super ApiClient$build$headerInterceptor$1$token$1> continuation) {
        super(2, continuation);
        this.$tokenProvider = tokenProvider;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new ApiClient$build$headerInterceptor$1$token$1(this.$tokenProvider, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        TokenProvider tokenProvider = this.$tokenProvider;
        this.label = 1;
        Object token = tokenProvider.getToken(this);
        return token == coroutineSingletons ? coroutineSingletons : token;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(j0 j0Var, Continuation<? super String> continuation) {
        return ((ApiClient$build$headerInterceptor$1$token$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
