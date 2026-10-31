package com.stripe.android.paymentsheet.addresselement;

import com.stripe.android.paymentsheet.addresselement.AutocompleteContract;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class p extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f44762t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f44763u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ AutocompleteContract.Args f44764v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ AutocompleteActivity f44765w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ lw.l f44766x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(AutocompleteActivity autocompleteActivity, AutocompleteContract.Args args, Continuation continuation, lw.l lVar) {
        super(2, continuation);
        this.f44764v = args;
        this.f44765w = autocompleteActivity;
        this.f44766x = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        p pVar = new p(this.f44765w, this.f44764v, continuation, this.f44766x);
        pVar.f44763u = obj;
        return pVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((p) create((pu.x) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        AutocompleteContract.Result address;
        String str = this.f44764v.f44711a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f44762t;
        AutocompleteActivity autocompleteActivity = this.f44765w;
        if (i5 == 0) {
            ResultKt.b(obj);
            pu.x xVar = (pu.x) this.f44763u;
            if (xVar instanceof pu.v) {
                address = new AutocompleteContract.Result.EnterManually(str, ((pu.v) xVar).f83094a);
            } else {
                if (!(xVar instanceof pu.w)) {
                    throw new NoWhenBranchMatchedException();
                }
                address = new AutocompleteContract.Result.Address(str, ((pu.w) xVar).f83095a);
            }
            int i11 = AutocompleteActivity.f44706q;
            autocompleteActivity.Z(address);
            this.f44762t = 1;
            if (this.f44766x.b(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        autocompleteActivity.finish();
        return Unit.f71706a;
    }
}
