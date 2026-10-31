package ads_mobile_sdk;

import b.fd;
import java.util.Collections;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class hv1 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f4566a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f4567b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f4568c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hv1(String str, boolean z11, Continuation continuation) {
        super(2, continuation);
        this.f4567b = str;
        this.f4568c = z11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        hv1 hv1Var = new hv1(this.f4567b, this.f4568c, continuation);
        hv1Var.f4566a = obj;
        return hv1Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((hv1) create((zu1) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        fd fdVar = (fd) ((zu1) this.f4566a).n();
        Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((zu1) fdVar.f1095b).adUnitToUseMediaView_)), "getAdUnitToUseMediaViewMap(...)");
        String key = this.f4567b;
        Intrinsics.g(key, "key");
        fdVar.b();
        zu1 zu1Var = (zu1) fdVar.f1095b;
        gn1 gn1Var = zu1Var.adUnitToUseMediaView_;
        if (!gn1Var.f4009a) {
            zu1Var.adUnitToUseMediaView_ = gn1Var.b();
        }
        zu1Var.adUnitToUseMediaView_.put(key, Boolean.valueOf(this.f4568c));
        return (zu1) fdVar.a();
    }
}
