package com.amplitude.core.utilities;

import com.amplitude.core.events.BaseEvent;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
@DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$triggerEventsCallback$1$2$1", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes2.dex */
public final class FileResponseHandler$triggerEventsCallback$1$2$1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
    final /* synthetic */ BaseEvent $event;
    final /* synthetic */ String $insertId;
    final /* synthetic */ String $message;
    final /* synthetic */ int $status;
    int label;
    final /* synthetic */ FileResponseHandler this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FileResponseHandler$triggerEventsCallback$1$2$1(FileResponseHandler fileResponseHandler, String str, BaseEvent baseEvent, int i5, String str2, Continuation<? super FileResponseHandler$triggerEventsCallback$1$2$1> continuation) {
        super(2, continuation);
        this.this$0 = fileResponseHandler;
        this.$insertId = str;
        this.$event = baseEvent;
        this.$status = i5;
        this.$message = str2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new FileResponseHandler$triggerEventsCallback$1$2$1(this.this$0, this.$insertId, this.$event, this.$status, this.$message, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (this.label != 0) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        Function3<BaseEvent, Integer, String, Unit> eventCallback = this.this$0.storage.getEventCallback(this.$insertId);
        if (eventCallback != null) {
            BaseEvent baseEvent = this.$event;
            int i5 = this.$status;
            String str = this.$message;
            FileResponseHandler fileResponseHandler = this.this$0;
            String str2 = this.$insertId;
            eventCallback.invoke(baseEvent, new Integer(i5), str);
            fileResponseHandler.storage.removeEventCallback(str2);
        }
        return Unit.f71706a;
    }

    @Override // kotlin.jvm.functions.Function2
    @Nullable
    public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
        return ((FileResponseHandler$triggerEventsCallback$1$2$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
