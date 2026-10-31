package com.instabridge.mobilesdk.internal.ui.screens;

import c0.h2;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.screens.InstallingScreenKt$InstallingScreen$1$1", f = "InstallingScreen.kt", l = {43}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class InstallingScreenKt$InstallingScreen$1$1 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {
    final /* synthetic */ c0.e $progress;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public InstallingScreenKt$InstallingScreen$1$1(c0.e eVar, Continuation<? super InstallingScreenKt$InstallingScreen$1$1> continuation) {
        super(2, continuation);
        this.$progress = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new InstallingScreenKt$InstallingScreen$1$1(this.$progress, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            c0.e eVar = this.$progress;
            Float f11 = new Float(0.99f);
            h2 h2VarI = c0.f.i(90000, 0, c0.b0.f18711b, 2);
            this.label = 1;
            if (c0.e.d(eVar, f11, h2VarI, null, this, 12) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(t70.j0 j0Var, Continuation<? super Unit> continuation) {
        return ((InstallingScreenKt$InstallingScreen$1$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
