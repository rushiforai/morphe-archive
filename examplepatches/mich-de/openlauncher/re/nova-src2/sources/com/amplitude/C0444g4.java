package com.amplitude;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* renamed from: com.amplitude.g4, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0444g4 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f20588a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f20589b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ G3 f20590c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0444g4(G3 g32, Continuation continuation) {
        super(2, continuation);
        this.f20590c = g32;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        C0444g4 c0444g4 = new C0444g4(this.f20590c, continuation);
        c0444g4.f20589b = obj;
        return c0444g4;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        C0444g4 c0444g4 = new C0444g4(this.f20590c, (Continuation) obj2);
        c0444g4.f20589b = (t70.j0) obj;
        return c0444g4.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f20588a;
        if (i5 == 0) {
            ResultKt.b(obj);
            if (t70.k0.f((t70.j0) this.f20589b)) {
                G3 g32 = this.f20590c;
                if (g32.f20724k && !g32.f20725l) {
                    g32.f20725l = true;
                    this.f20588a = 1;
                    if (t70.t0.b(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
            }
            return Unit.f71706a;
        }
        if (i5 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        this.f20590c.f20719f.j(new N4(O4.f20352b, null));
        this.f20590c.f20725l = false;
        return Unit.f71706a;
    }
}
