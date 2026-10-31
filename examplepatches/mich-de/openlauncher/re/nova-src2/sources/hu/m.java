package hu;

import com.stripe.android.financialconnections.ElementsSessionContext;
import com.stripe.android.model.FinancialConnectionsSession;
import com.stripe.android.payments.bankaccount.CollectBankAccountConfiguration;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountResultInternal;
import ft.d0;
import h6.f1;
import h6.g1;
import h6.u0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import w70.t1;

/* loaded from: classes4.dex */
public final class m extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final CollectBankAccountContract.Args f60093a;

    /* renamed from: b, reason: collision with root package name */
    public final t1 f60094b;

    /* renamed from: c, reason: collision with root package name */
    public final gu.h f60095c;

    /* renamed from: d, reason: collision with root package name */
    public final gu.c f60096d;

    /* renamed from: e, reason: collision with root package name */
    public final gu.j f60097e;

    /* renamed from: f, reason: collision with root package name */
    public final u0 f60098f;

    /* renamed from: g, reason: collision with root package name */
    public final xq.c f60099g;

    /* renamed from: h, reason: collision with root package name */
    public final t1 f60100h;

    public m(CollectBankAccountContract.Args args, t1 t1Var, gu.h hVar, gu.c cVar, gu.j jVar, u0 u0Var, xq.c logger) {
        Intrinsics.g(logger, "logger");
        this.f60093a = args;
        this.f60094b = t1Var;
        this.f60095c = hVar;
        this.f60096d = cVar;
        this.f60097e = jVar;
        this.f60098f = u0Var;
        this.f60099g = logger;
        this.f60100h = t1Var;
        if (Intrinsics.b(u0Var.a("key_has_launched"), Boolean.TRUE)) {
            return;
        }
        m0.t(g1.f(this), null, null, new f(this, null), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:76:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01ba  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x014a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(m mVar, ContinuationImpl continuationImpl) {
        i iVar;
        Object obj;
        Object objC;
        String str;
        String str2;
        m mVar2;
        Object objA;
        m mVar3;
        Throwable thA;
        m mVar4 = mVar;
        CollectBankAccountContract.Args args = mVar4.f60093a;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f60082x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f60082x = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(mVar4, continuationImpl);
            }
        }
        i iVar2 = iVar;
        Object obj2 = iVar2.f60080v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (iVar2.f60082x) {
            case 0:
                ResultKt.b(obj2);
                if (args instanceof CollectBankAccountContract.Args.ForDeferredPaymentIntent) {
                    CollectBankAccountContract.Args.ForDeferredPaymentIntent forDeferredPaymentIntent = (CollectBankAccountContract.Args.ForDeferredPaymentIntent) args;
                    ElementsSessionContext elementsSessionContextA = n.a(forDeferredPaymentIntent.f44256e);
                    gu.h hVar = mVar4.f60095c;
                    String str3 = forDeferredPaymentIntent.f44254c;
                    String str4 = forDeferredPaymentIntent.f44255d;
                    String str5 = forDeferredPaymentIntent.f44258g;
                    String str6 = forDeferredPaymentIntent.f44259h;
                    String str7 = forDeferredPaymentIntent.f44260i;
                    String str8 = forDeferredPaymentIntent.f44261j;
                    d0 d0Var = elementsSessionContextA != null ? elementsSessionContextA.f42635c : null;
                    Integer num = forDeferredPaymentIntent.f44262k;
                    String str9 = forDeferredPaymentIntent.f44263l;
                    CollectBankAccountConfiguration f44282f = args.getF44282f();
                    if (f44282f instanceof CollectBankAccountConfiguration.InstantDebits) {
                        str2 = "instant_debits";
                    } else {
                        if (!(f44282f instanceof CollectBankAccountConfiguration.USBankAccountInternal) && !(f44282f instanceof CollectBankAccountConfiguration.USBankAccount)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        str2 = null;
                    }
                    iVar2.f60078t = mVar4;
                    iVar2.f60082x = 1;
                    obj = null;
                    objC = hVar.a(str3, str4, str6, str7, str8, str5, d0Var, num, str9, str2, iVar2);
                    if (objC == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    obj = null;
                    if (args instanceof CollectBankAccountContract.Args.ForDeferredSetupIntent) {
                        CollectBankAccountContract.Args.ForDeferredSetupIntent forDeferredSetupIntent = (CollectBankAccountContract.Args.ForDeferredSetupIntent) args;
                        ElementsSessionContext elementsSessionContextA2 = n.a(forDeferredSetupIntent.f44266e);
                        gu.h hVar2 = mVar4.f60095c;
                        String str10 = forDeferredSetupIntent.f44264c;
                        String str11 = forDeferredSetupIntent.f44265d;
                        String str12 = forDeferredSetupIntent.f44267f;
                        String str13 = forDeferredSetupIntent.f44269h;
                        String str14 = forDeferredSetupIntent.f44270i;
                        String str15 = forDeferredSetupIntent.f44271j;
                        d0 d0Var2 = elementsSessionContextA2 != null ? elementsSessionContextA2.f42635c : null;
                        CollectBankAccountConfiguration f44282f2 = args.getF44282f();
                        if (f44282f2 instanceof CollectBankAccountConfiguration.InstantDebits) {
                            str = "instant_debits";
                        } else {
                            if (!(f44282f2 instanceof CollectBankAccountConfiguration.USBankAccountInternal) && !(f44282f2 instanceof CollectBankAccountConfiguration.USBankAccount)) {
                                throw new NoWhenBranchMatchedException();
                            }
                            str = null;
                        }
                        iVar2.f60078t = mVar4;
                        iVar2.f60082x = 2;
                        objC = hVar2.a(str10, str11, str13, str14, str15, str12, d0Var2, null, null, str, iVar2);
                        if (objC == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } else if (args instanceof CollectBankAccountContract.Args.ForPaymentIntent) {
                        gu.h hVar3 = mVar4.f60095c;
                        CollectBankAccountContract.Args.ForPaymentIntent forPaymentIntent = (CollectBankAccountContract.Args.ForPaymentIntent) args;
                        String str16 = forPaymentIntent.f44272c;
                        String str17 = forPaymentIntent.f44273d;
                        String str18 = forPaymentIntent.f44278i;
                        String str19 = forPaymentIntent.f44274e;
                        CollectBankAccountConfiguration collectBankAccountConfiguration = forPaymentIntent.f44275f;
                        iVar2.f60078t = mVar4;
                        iVar2.f60082x = 3;
                        objC = hVar3.b(str16, str19, str17, str18, collectBankAccountConfiguration, iVar2);
                        if (objC == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } else {
                        if (!(args instanceof CollectBankAccountContract.Args.ForSetupIntent)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        gu.h hVar4 = mVar4.f60095c;
                        CollectBankAccountContract.Args.ForSetupIntent forSetupIntent = (CollectBankAccountContract.Args.ForSetupIntent) args;
                        String str20 = forSetupIntent.f44279c;
                        String str21 = forSetupIntent.f44280d;
                        String str22 = forSetupIntent.f44285i;
                        String str23 = forSetupIntent.f44281e;
                        CollectBankAccountConfiguration collectBankAccountConfiguration2 = forSetupIntent.f44282f;
                        iVar2.f60078t = mVar4;
                        iVar2.f60082x = 4;
                        objC = hVar4.c(str20, str23, str21, str22, collectBankAccountConfiguration2, iVar2);
                        if (objC == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                }
                mVar2 = mVar4;
                int i11 = Result.f71687b;
                if (objC instanceof Result.Failure) {
                    try {
                        objA = ((FinancialConnectionsSession) objC).f43496a;
                        if (objA == null) {
                            throw new IllegalArgumentException("Required value was null.");
                        }
                    } catch (Throwable th2) {
                        int i12 = Result.f71687b;
                        objA = ResultKt.a(th2);
                    }
                } else {
                    objA = objC;
                }
                if (!(objA instanceof Result.Failure)) {
                    String str24 = (String) objA;
                    xq.c cVar = mVar2.f60099g;
                    CollectBankAccountContract.Args args2 = mVar2.f60093a;
                    cVar.a("Bank account session created! " + str24 + ".");
                    mVar2.f60098f.d("key_has_launched", Boolean.TRUE);
                    ElementsSessionContext elementsSessionContextA3 = n.a(args2.getF44282f());
                    t1 t1Var = mVar2.f60094b;
                    d dVar = new d(args2.getF44279c(), str24, args2.getF44280d(), elementsSessionContextA3);
                    iVar2.f60078t = mVar2;
                    iVar2.f60079u = objA;
                    iVar2.f60082x = 5;
                    if (t1Var.emit(dVar, iVar2) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    mVar3 = mVar2;
                    mVar2 = mVar3;
                }
                thA = Result.a(objA);
                if (thA != null) {
                    iVar2.f60078t = objA;
                    iVar2.f60079u = obj;
                    iVar2.f60082x = 6;
                    if (mVar2.f(thA, iVar2) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                return Unit.f71706a;
            case 1:
            case 2:
            case 3:
            case 4:
                mVar4 = (m) iVar2.f60078t;
                ResultKt.b(obj2);
                objC = ((Result) obj2).f71688a;
                obj = null;
                mVar2 = mVar4;
                int i112 = Result.f71687b;
                if (objC instanceof Result.Failure) {
                }
                if (!(objA instanceof Result.Failure)) {
                }
                thA = Result.a(objA);
                if (thA != null) {
                }
                return Unit.f71706a;
            case 5:
                objA = iVar2.f60079u;
                mVar3 = (m) iVar2.f60078t;
                ResultKt.b(obj2);
                obj = null;
                mVar2 = mVar3;
                thA = Result.a(objA);
                if (thA != null) {
                }
                return Unit.f71706a;
            case 6:
                ResultKt.b(obj2);
                return Unit.f71706a;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    public final Object f(Throwable th2, ContinuationImpl continuationImpl) throws Throwable {
        this.f60099g.b(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40331e, new Exception(th2));
        Object objG = g(new CollectBankAccountResultInternal.Failed(th2), continuationImpl);
        return objG == CoroutineSingletons.f71806a ? objG : Unit.f71706a;
    }

    public final Object g(CollectBankAccountResultInternal collectBankAccountResultInternal, ContinuationImpl continuationImpl) throws Throwable {
        Object objEmit = this.f60094b.emit(new c(collectBankAccountResultInternal), continuationImpl);
        return objEmit == CoroutineSingletons.f71806a ? objEmit : Unit.f71706a;
    }
}
