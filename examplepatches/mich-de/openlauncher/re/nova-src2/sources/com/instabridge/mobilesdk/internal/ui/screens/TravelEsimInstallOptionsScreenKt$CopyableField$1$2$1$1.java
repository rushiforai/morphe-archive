package com.instabridge.mobilesdk.internal.ui.screens;

import android.content.ClipData;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.screens.TravelEsimInstallOptionsScreenKt$CopyableField$1$2$1$1", f = "TravelEsimInstallOptionsScreen.kt", l = {TTAdConstant.DOWNLOAD_URL_AND_PACKAGE_NAME}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class TravelEsimInstallOptionsScreenKt$CopyableField$1$2$1$1 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {
    final /* synthetic */ c3.u1 $clipboard;
    final /* synthetic */ String $label;
    final /* synthetic */ String $value;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TravelEsimInstallOptionsScreenKt$CopyableField$1$2$1$1(c3.u1 u1Var, String str, String str2, Continuation<? super TravelEsimInstallOptionsScreenKt$CopyableField$1$2$1$1> continuation) {
        super(2, continuation);
        this.$clipboard = u1Var;
        this.$label = str;
        this.$value = str2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new TravelEsimInstallOptionsScreenKt$CopyableField$1$2$1$1(this.$clipboard, this.$label, this.$value, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            c3.u1 u1Var = this.$clipboard;
            ClipData clipDataNewPlainText = ClipData.newPlainText(this.$label, this.$value);
            Intrinsics.f(clipDataNewPlainText, "newPlainText(...)");
            this.label = 1;
            ((c3.i) u1Var).f19319a.f19327a.setPrimaryClip(clipDataNewPlainText);
            if (Unit.f71706a == coroutineSingletons) {
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
        return ((TravelEsimInstallOptionsScreenKt$CopyableField$1$2$1$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
