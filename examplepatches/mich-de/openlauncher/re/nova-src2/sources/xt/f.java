package xt;

import android.os.Parcelable;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.LinkPaymentDetails;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.Address;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentelement.confirmation.linkinline.LinkInlineSignupConfirmationDefinition$Result;
import com.stripe.android.paymentelement.confirmation.linkinline.LinkInlineSignupConfirmationOption;
import cw.u0;
import es.n;
import fs.r0;
import fs.y;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import mt.f0;
import mt.i;
import mt.j;
import rs.b0;
import w70.u1;

/* loaded from: classes4.dex */
public final class f implements j {

    /* renamed from: a, reason: collision with root package name */
    public final n f96319a;

    /* renamed from: b, reason: collision with root package name */
    public final gs.c f96320b;

    /* renamed from: c, reason: collision with root package name */
    public final r0 f96321c;

    public f(n nVar, gs.c linkAnalyticsHelper, r0 r0Var) {
        Intrinsics.g(linkAnalyticsHelper, "linkAnalyticsHelper");
        this.f96319a = nVar;
        this.f96320b = linkAnalyticsHelper;
        this.f96321c = r0Var;
    }

    public static PaymentMethodConfirmationOption.New l(LinkInlineSignupConfirmationOption linkInlineSignupConfirmationOption) {
        return new PaymentMethodConfirmationOption.New(linkInlineSignupConfirmationOption.f44188a, linkInlineSignupConfirmationOption.f44189b, linkInlineSignupConfirmationOption.f44190c, linkInlineSignupConfirmationOption.f44191d == g.f96322b);
    }

    @Override // mt.j
    public final void a(Object obj, Object obj2, ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationArgs) {
        b arguments = (b) obj2;
        LinkInlineSignupConfirmationOption confirmationOption = (LinkInlineSignupConfirmationOption) confirmationHandler$Option;
        Intrinsics.g(arguments, "arguments");
        Intrinsics.g(confirmationOption, "confirmationOption");
        Intrinsics.g(confirmationArgs, "confirmationArgs");
        ((a) obj).f96300a.invoke(new LinkInlineSignupConfirmationDefinition$Result(arguments.f96301a));
    }

    @Override // mt.j
    public final ConfirmationHandler$Option b(ConfirmationHandler$Option confirmationOption) {
        Intrinsics.g(confirmationOption, "confirmationOption");
        if (confirmationOption instanceof LinkInlineSignupConfirmationOption) {
            return (LinkInlineSignupConfirmationOption) confirmationOption;
        }
        return null;
    }

    @Override // mt.j
    public final Object c(j.b activityResultCaller, jt.e eVar) {
        Intrinsics.g(activityResultCaller, "activityResultCaller");
        return new a(eVar);
    }

    @Override // mt.j
    public final /* bridge */ /* synthetic */ Object d(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationHandler$Args, f0 f0Var) {
        return i((LinkInlineSignupConfirmationOption) confirmationHandler$Option, f0Var);
    }

    @Override // mt.j
    public final boolean e(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationHandler$Args) {
        i30.j.l((LinkInlineSignupConfirmationOption) confirmationHandler$Option, confirmationHandler$Args);
        return true;
    }

    @Override // mt.j
    public final void f(PaymentMethodMetadata paymentMethodMetadata) {
        i30.j.k(paymentMethodMetadata);
    }

    @Override // mt.j
    public final /* bridge */ /* synthetic */ void g(Object obj) {
    }

    @Override // mt.j
    public final String getKey() {
        return "LinkInlineSignup";
    }

    @Override // mt.j
    public final i h(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationArgs, vt.f0 f0Var, Parcelable parcelable) {
        LinkInlineSignupConfirmationOption confirmationOption = (LinkInlineSignupConfirmationOption) confirmationHandler$Option;
        LinkInlineSignupConfirmationDefinition$Result result = (LinkInlineSignupConfirmationDefinition$Result) parcelable;
        Intrinsics.g(confirmationOption, "confirmationOption");
        Intrinsics.g(confirmationArgs, "confirmationArgs");
        Intrinsics.g(result, "result");
        return new mt.g(result.f44187a, confirmationArgs);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(LinkInlineSignupConfirmationOption linkInlineSignupConfirmationOption, ContinuationImpl continuationImpl) {
        c cVar;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f96304v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f96304v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object objK = cVar.f96302t;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = cVar.f96304v;
        if (i11 == 0) {
            ResultKt.b(objK);
            cVar.f96304v = 1;
            objK = k(linkInlineSignupConfirmationOption, cVar);
            if (objK == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objK);
        }
        return new mt.c(new b((PaymentMethodConfirmationOption) objK), true, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(LinkInlineSignupConfirmationOption linkInlineSignupConfirmationOption, UserInput userInput, ContinuationImpl continuationImpl) {
        d dVar;
        f fVar;
        g gVar;
        Object obj;
        PaymentMethodExtraParams paymentMethodExtraParams;
        LinkInlineSignupConfirmationOption linkInlineSignupConfirmationOption2;
        LinkConfiguration linkConfiguration;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.A = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object obj2 = dVar.f96310y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.A;
        if (i11 == 0) {
            ResultKt.b(obj2);
            if (userInput instanceof UserInput.SignIn) {
                ((gs.a) this.f96320b).f57757a.a(gs.d.f57771i, null);
                return l(linkInlineSignupConfirmationOption);
            }
            PaymentMethodCreateParams paymentMethodCreateParams = linkInlineSignupConfirmationOption.f44188a;
            g gVar2 = linkInlineSignupConfirmationOption.f44191d;
            PaymentMethodExtraParams paymentMethodExtraParams2 = linkInlineSignupConfirmationOption.f44190c;
            LinkConfiguration linkConfiguration2 = linkInlineSignupConfirmationOption.f44192e;
            dVar.f96305t = this;
            dVar.f96306u = linkInlineSignupConfirmationOption;
            dVar.f96307v = gVar2;
            dVar.f96308w = paymentMethodExtraParams2;
            dVar.f96309x = linkConfiguration2;
            dVar.A = 1;
            Object objA = ((com.stripe.android.link.f0) this.f96319a).a(linkConfiguration2, paymentMethodCreateParams, dVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            fVar = this;
            gVar = gVar2;
            obj = objA;
            paymentMethodExtraParams = paymentMethodExtraParams2;
            linkInlineSignupConfirmationOption2 = linkInlineSignupConfirmationOption;
            linkConfiguration = linkConfiguration2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            linkConfiguration = dVar.f96309x;
            paymentMethodExtraParams = dVar.f96308w;
            gVar = dVar.f96307v;
            linkInlineSignupConfirmationOption2 = dVar.f96306u;
            fVar = dVar.f96305t;
            ResultKt.b(obj2);
            obj = ((Result) obj2).f71688a;
        }
        int i12 = Result.f71687b;
        if (obj instanceof Result.Failure) {
            obj = null;
        }
        LinkPaymentDetails linkPaymentDetails = (LinkPaymentDetails) obj;
        if (linkPaymentDetails instanceof LinkPaymentDetails.New) {
            fVar.f96321c.a();
            return new PaymentMethodConfirmationOption.New(((LinkPaymentDetails.New) linkPaymentDetails).f42936b, linkConfiguration.f42902h ? new PaymentMethodOptionsParams.Card(3, gVar.f96326a, null) : new PaymentMethodOptionsParams.Link(gVar.f96326a), paymentMethodExtraParams, gVar == g.f96322b);
        }
        if (!(linkPaymentDetails instanceof LinkPaymentDetails.Saved)) {
            if (linkPaymentDetails != null) {
                throw new NoWhenBranchMatchedException();
            }
            fVar.getClass();
            return l(linkInlineSignupConfirmationOption2);
        }
        fVar.f96321c.a();
        PaymentMethod paymentMethod = ((LinkPaymentDetails.Saved) linkPaymentDetails).f42940c;
        ft.d dVar2 = ft.d.f55925c;
        if (gVar != g.f96322b) {
            dVar2 = null;
        }
        if (dVar2 == null) {
            dVar2 = ft.d.f55926d;
        }
        return new PaymentMethodConfirmationOption.Saved(paymentMethod, new PaymentMethodOptionsParams.Card(3, dVar2, null), 24);
    }

    /* JADX WARN: Code restructure failed: missing block: B:87:0x0162, code lost:
    
        if (r2 == r4) goto L88;
     */
    /* JADX WARN: Removed duplicated region for block: B:37:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0168  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(LinkInlineSignupConfirmationOption linkInlineSignupConfirmationOption, ContinuationImpl continuationImpl) {
        e eVar;
        String str;
        String str2;
        Address address;
        String str3;
        UserInput signUp;
        LinkConfiguration linkConfiguration;
        f fVar;
        Object objD;
        LinkInlineSignupConfirmationOption linkInlineSignupConfirmationOption2 = linkInlineSignupConfirmationOption;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f96318z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f96318z = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object objO = eVar.f96316x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f96318z;
        if (i11 == 0) {
            ResultKt.b(objO);
            LinkConfiguration configuration = linkInlineSignupConfirmationOption2.f44192e;
            PaymentMethodCreateParams paymentMethodCreateParams = linkInlineSignupConfirmationOption2.f44188a;
            UserInput userInput = linkInlineSignupConfirmationOption2.f44193f;
            if (userInput instanceof UserInput.SignIn) {
                signUp = userInput;
            } else {
                if (!(userInput instanceof UserInput.SignUp)) {
                    throw new NoWhenBranchMatchedException();
                }
                UserInput.SignUp signUp2 = (UserInput.SignUp) userInput;
                String str4 = signUp2.f43026b;
                boolean z11 = str4 != null;
                if (str4 == null) {
                    PaymentMethod.BillingDetails billingDetails = paymentMethodCreateParams.f43693p;
                    if (billingDetails != null) {
                        str4 = billingDetails.f43605d;
                    } else {
                        str = null;
                        if (z11) {
                            PaymentMethodExtraParams paymentMethodExtraParams = linkInlineSignupConfirmationOption2.f44190c;
                            PaymentMethodExtraParams.Card card = paymentMethodExtraParams instanceof PaymentMethodExtraParams.Card ? (PaymentMethodExtraParams.Card) paymentMethodExtraParams : null;
                            String str5 = card != null ? card.f43729c : null;
                            if (str5 == null) {
                                PaymentMethod.BillingDetails billingDetails2 = paymentMethodCreateParams.f43693p;
                                if (billingDetails2 == null || (address = billingDetails2.f43602a) == null) {
                                    str2 = null;
                                } else {
                                    str3 = address.f43128b;
                                }
                            } else {
                                str2 = str5;
                            }
                            String str6 = str != null ? "PHONE_NUMBER" : "BILLING_ADDRESS";
                            String email = signUp2.f43025a;
                            String str7 = signUp2.f43028d;
                            b0 consentAction = signUp2.f43029e;
                            Intrinsics.g(email, "email");
                            Intrinsics.g(consentAction, "consentAction");
                            signUp = new UserInput.SignUp(email, str, str2, str7, consentAction, str6);
                        } else {
                            str3 = signUp2.f43027c;
                        }
                        str2 = str3;
                        String str62 = str != null ? "PHONE_NUMBER" : "BILLING_ADDRESS";
                        String email2 = signUp2.f43025a;
                        String str72 = signUp2.f43028d;
                        b0 consentAction2 = signUp2.f43029e;
                        Intrinsics.g(email2, "email");
                        Intrinsics.g(consentAction2, "consentAction");
                        signUp = new UserInput.SignUp(email2, str, str2, str72, consentAction2, str62);
                    }
                }
                str = str4;
                if (z11) {
                }
                str2 = str3;
                String str622 = str != null ? "PHONE_NUMBER" : "BILLING_ADDRESS";
                String email22 = signUp2.f43025a;
                String str722 = signUp2.f43028d;
                b0 consentAction22 = signUp2.f43029e;
                Intrinsics.g(email22, "email");
                Intrinsics.g(consentAction22, "consentAction");
                signUp = new UserInput.SignUp(email22, str, str2, str722, consentAction22, str622);
            }
            com.stripe.android.link.f0 f0Var = (com.stripe.android.link.f0) this.f96319a;
            Intrinsics.g(configuration, "configuration");
            u0 u0Var = ((y) f0Var.b(configuration).a()).f55865m;
            eVar.f96312t = this;
            eVar.f96313u = linkInlineSignupConfirmationOption2;
            eVar.f96314v = configuration;
            eVar.f96315w = signUp;
            eVar.f96318z = 1;
            objO = u1.o(u0Var, eVar);
            if (objO != coroutineSingletons) {
                linkConfiguration = configuration;
                fVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            UserInput userInput2 = eVar.f96315w;
            LinkConfiguration linkConfiguration2 = eVar.f96314v;
            LinkInlineSignupConfirmationOption linkInlineSignupConfirmationOption3 = eVar.f96313u;
            f fVar2 = eVar.f96312t;
            ResultKt.b(objO);
            signUp = userInput2;
            linkInlineSignupConfirmationOption2 = linkInlineSignupConfirmationOption3;
            linkConfiguration = linkConfiguration2;
            fVar = fVar2;
        } else {
            if (i11 == 2) {
                ResultKt.b(objO);
                return objO;
            }
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objO);
                return (PaymentMethodConfirmationOption) objO;
            }
            linkInlineSignupConfirmationOption2 = eVar.f96313u;
            fVar = eVar.f96312t;
            ResultKt.b(objO);
            objD = ((Result) objO).f71688a;
            if (Result.a(objD) == null) {
                fVar.getClass();
                return l(linkInlineSignupConfirmationOption2);
            }
            ((Boolean) objD).getClass();
            eVar.f96312t = null;
            eVar.f96313u = null;
            eVar.f96318z = 4;
            objO = fVar.k(linkInlineSignupConfirmationOption2, eVar);
        }
        ls.f fVar3 = (ls.f) objO;
        if (fVar3 instanceof ls.e) {
            eVar.f96312t = null;
            eVar.f96313u = null;
            eVar.f96314v = null;
            eVar.f96315w = null;
            eVar.f96318z = 2;
            Object objJ = fVar.j(linkInlineSignupConfirmationOption2, signUp, eVar);
            if (objJ != coroutineSingletons) {
                return objJ;
            }
        } else {
            if (Intrinsics.b(fVar3, ls.d.f75090a) || (fVar3 instanceof ls.b)) {
                ((gs.a) fVar.f96320b).f57757a.a(gs.d.f57771i, null);
                return l(linkInlineSignupConfirmationOption2);
            }
            if (!Intrinsics.b(fVar3, ls.c.f75089a) && !(fVar3 instanceof ls.a)) {
                throw new NoWhenBranchMatchedException();
            }
            n nVar = fVar.f96319a;
            eVar.f96312t = fVar;
            eVar.f96313u = linkInlineSignupConfirmationOption2;
            eVar.f96314v = null;
            eVar.f96315w = null;
            eVar.f96318z = 3;
            objD = ((com.stripe.android.link.f0) nVar).d(linkConfiguration, signUp, eVar);
            if (objD != coroutineSingletons) {
                if (Result.a(objD) == null) {
                }
            }
        }
        return coroutineSingletons;
    }
}
