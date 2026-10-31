package com.amplitude;

import com.amplitude.android.sessionreplay.config.MaskLevel;
import java.util.Collection;
import java.util.Iterator;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class F0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ G0 f20228a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MaskLevel f20229b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public F0(G0 g02, MaskLevel maskLevel, Continuation continuation) {
        super(2, continuation);
        this.f20228a = g02;
        this.f20229b = maskLevel;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new F0(this.f20228a, this.f20229b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new F0(this.f20228a, this.f20229b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        Collection collectionValues = this.f20228a.f20790d.values();
        MaskLevel maskLevel = this.f20229b;
        Iterator it = collectionValues.iterator();
        while (it.hasNext()) {
            A a11 = ((B0) it.next()).f20185h;
            if (a11.f20178c != null) {
                a11.a(AbstractC0534x.a("config", maskLevel, null));
            }
        }
        return Unit.f71706a;
    }
}
