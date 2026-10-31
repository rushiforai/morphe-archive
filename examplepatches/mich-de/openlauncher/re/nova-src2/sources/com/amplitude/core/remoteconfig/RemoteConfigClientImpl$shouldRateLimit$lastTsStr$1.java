package com.amplitude.core.remoteconfig;

import com.amplitude.core.Storage;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)Ljava/lang/String;"}, k = 3, mv = {1, 9, 0})
@DebugMetadata(c = "com.amplitude.core.remoteconfig.RemoteConfigClientImpl$shouldRateLimit$lastTsStr$1", f = "RemoteConfigClient.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes2.dex */
public final class RemoteConfigClientImpl$shouldRateLimit$lastTsStr$1 extends SuspendLambda implements Function2<j0, Continuation<? super String>, Object> {
    int label;
    final /* synthetic */ RemoteConfigClientImpl this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RemoteConfigClientImpl$shouldRateLimit$lastTsStr$1(RemoteConfigClientImpl remoteConfigClientImpl, Continuation<? super RemoteConfigClientImpl$shouldRateLimit$lastTsStr$1> continuation) {
        super(2, continuation);
        this.this$0 = remoteConfigClientImpl;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new RemoteConfigClientImpl$shouldRateLimit$lastTsStr$1(this.this$0, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (this.label != 0) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        return this.this$0.storage.read(Storage.Constants.REMOTE_CONFIG_TIMESTAMP);
    }

    @Override // kotlin.jvm.functions.Function2
    @Nullable
    public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super String> continuation) {
        return ((RemoteConfigClientImpl$shouldRateLimit$lastTsStr$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
