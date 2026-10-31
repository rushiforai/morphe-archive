package com.amplitude.core.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.text.MatchResult;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
@DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$removeCallbackByInsertId$1$1", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes2.dex */
public final class FileResponseHandler$removeCallbackByInsertId$1$1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
    final /* synthetic */ MatchResult $it;
    int label;
    final /* synthetic */ FileResponseHandler this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FileResponseHandler$removeCallbackByInsertId$1$1(FileResponseHandler fileResponseHandler, MatchResult matchResult, Continuation<? super FileResponseHandler$removeCallbackByInsertId$1$1> continuation) {
        super(2, continuation);
        this.this$0 = fileResponseHandler;
        this.$it = matchResult;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new FileResponseHandler$removeCallbackByInsertId$1$1(this.this$0, this.$it, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (this.label != 0) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        this.this$0.storage.removeEventCallback((String) this.$it.a().get(1));
        return Unit.f71706a;
    }

    @Override // kotlin.jvm.functions.Function2
    @Nullable
    public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
        return ((FileResponseHandler$removeCallbackByInsertId$1$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
