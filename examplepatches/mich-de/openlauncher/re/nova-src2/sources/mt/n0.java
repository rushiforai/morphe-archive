package mt;

import android.content.SharedPreferences;
import bn.s0;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.wallets.Wallet;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentelement.confirmation.DefaultConfirmationHandler$AwaitingConfirmationResultData;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentelement.confirmation.gpay.GooglePayConfirmationOption;
import com.stripe.android.paymentelement.confirmation.link.LinkConfirmationOption;
import com.stripe.android.paymentsheet.model.SavedSelection;
import e00.z4;
import h6.u0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kw.s3;
import l1.g4;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f76790a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f76791b;

    /* renamed from: c, reason: collision with root package name */
    public final u0 f76792c;

    /* renamed from: d, reason: collision with root package name */
    public final iu.f f76793d;

    /* renamed from: e, reason: collision with root package name */
    public final CoroutineContext f76794e;

    /* renamed from: f, reason: collision with root package name */
    public final xq.c f76795f;

    /* renamed from: g, reason: collision with root package name */
    public final w f76796g;

    /* renamed from: h, reason: collision with root package name */
    public final DefaultConfirmationHandler$AwaitingConfirmationResultData f76797h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f76798i;

    /* renamed from: j, reason: collision with root package name */
    public final i2 f76799j;

    /* renamed from: k, reason: collision with root package name */
    public final o1 f76800k;

    public n0(ArrayList arrayList, t70.j0 j0Var, u0 savedStateHandle, iu.f errorReporter, CoroutineContext ioContext, xq.c logger, w confirmationSaver) {
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(ioContext, "ioContext");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(confirmationSaver, "confirmationSaver");
        this.f76790a = arrayList;
        this.f76791b = j0Var;
        this.f76792c = savedStateHandle;
        this.f76793d = errorReporter;
        this.f76794e = ioContext;
        this.f76795f = logger;
        this.f76796g = confirmationSaver;
        DefaultConfirmationHandler$AwaitingConfirmationResultData defaultConfirmationHandler$AwaitingConfirmationResultData = (DefaultConfirmationHandler$AwaitingConfirmationResultData) savedStateHandle.a("AwaitingConfirmationResult");
        this.f76797h = defaultConfirmationHandler$AwaitingConfirmationResultData;
        boolean z11 = defaultConfirmationHandler$AwaitingConfirmationResultData != null;
        this.f76798i = z11;
        i2 i2VarC = u1.c(defaultConfirmationHandler$AwaitingConfirmationResultData != null ? new y(defaultConfirmationHandler$AwaitingConfirmationResultData.f44135b) : z.f76813a);
        this.f76799j = i2VarC;
        this.f76800k = new o1(i2VarC);
        if (z11) {
            t70.m0.t(j0Var, null, null, new i0(this, null), 3);
        }
    }

    public static final Object a(n0 n0Var, ConfirmationHandler$Args confirmationHandler$Args, SuspendLambda suspendLambda) throws Throwable {
        Object next;
        n0Var.getClass();
        ConfirmationHandler$Option confirmationHandler$Option = confirmationHandler$Args.f44128a;
        i2 i2Var = n0Var.f76799j;
        y yVar = new y(confirmationHandler$Option);
        i2Var.getClass();
        i2Var.k(null, yVar);
        Iterator it = n0Var.f76790a.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            g0 g0Var = (g0) next;
            g0Var.getClass();
            j jVar = g0Var.f76756b;
            ConfirmationHandler$Option confirmationHandler$OptionB = jVar.b(confirmationHandler$Option);
            if (confirmationHandler$OptionB != null ? jVar.e(confirmationHandler$OptionB, confirmationHandler$Args) : false) {
                break;
            }
        }
        g0 g0Var2 = (g0) next;
        if (g0Var2 != null) {
            Object objD = n0Var.d(confirmationHandler$Option, confirmationHandler$Args, g0Var2, suspendLambda);
            return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
        }
        iu.f fVar = n0Var.f76793d;
        iu.e eVar = iu.e.f68103t;
        int i5 = StripeException.f42562e;
        t2.c.L(fVar, eVar, p6.u.i(new IllegalStateException("Attempting to confirm intent for invalid confirmation option: " + confirmationHandler$Option)), null, 4);
        n0Var.e(new t(new IllegalStateException(b.c0.l("Attempted to confirm invalid ", Reflection.f71864a.getOrCreateKotlinClass(confirmationHandler$Option.getClass()).getQualifiedName(), " confirmation type")), zg.a.G(2132020022), p.f76802a));
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        k0 k0Var;
        if (continuationImpl instanceof k0) {
            k0Var = (k0) continuationImpl;
            int i5 = k0Var.f76778v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k0Var.f76778v = i5 - Integer.MIN_VALUE;
            } else {
                k0Var = new k0(this, continuationImpl);
            }
        }
        Object objP = k0Var.f76776t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k0Var.f76778v;
        if (i11 == 0) {
            ResultKt.b(objP);
            i2 i2Var = this.f76799j;
            a0 a0Var = (a0) i2Var.getValue();
            Continuation continuation = null;
            if (a0Var instanceof z) {
                return null;
            }
            if (a0Var instanceof x) {
                return ((x) a0Var).f76811a;
            }
            if (!(a0Var instanceof y)) {
                throw new NoWhenBranchMatchedException();
            }
            z4 z4Var = new z4(2, continuation, 16);
            k0Var.f76778v = 1;
            objP = u1.p(i2Var, z4Var, k0Var);
            if (objP == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objP);
        }
        if (objP != null) {
            return ((x) objP).f76811a;
        }
        throw new NullPointerException("null cannot be cast to non-null type com.stripe.android.paymentelement.confirmation.ConfirmationHandler.State.Complete");
    }

    public final void c(PaymentMethodMetadata paymentMethodMetadata) {
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        for (g0 g0Var : this.f76790a) {
            g0Var.getClass();
            g0Var.f76756b.f(paymentMethodMetadata);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationHandler$Args, g0 g0Var, ContinuationImpl continuationImpl) throws Throwable {
        l0 l0Var;
        n0 n0Var;
        g0 g0Var2;
        ConfirmationHandler$Option confirmationHandler$Option2;
        if (continuationImpl instanceof l0) {
            l0Var = (l0) continuationImpl;
            int i5 = l0Var.f76785y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l0Var.f76785y = i5 - Integer.MIN_VALUE;
            } else {
                l0Var = new l0(this, continuationImpl);
            }
        }
        Object objY = l0Var.f76783w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l0Var.f76785y;
        if (i11 == 0) {
            ResultKt.b(objY);
            s3 s3Var = new s3(g0Var, confirmationHandler$Option, confirmationHandler$Args, (Continuation) null, 10);
            l0Var.f76780t = this;
            l0Var.f76781u = confirmationHandler$Option;
            l0Var.f76782v = g0Var;
            l0Var.f76785y = 1;
            objY = t70.m0.y(this.f76794e, s3Var, l0Var);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
            n0Var = this;
            g0Var2 = g0Var;
            confirmationHandler$Option2 = confirmationHandler$Option;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            g0Var2 = l0Var.f76782v;
            confirmationHandler$Option2 = l0Var.f76781u;
            n0Var = l0Var.f76780t;
            ResultKt.b(objY);
        }
        e0 e0Var = (e0) objY;
        if (e0Var instanceof d0) {
            d0 d0Var = (d0) e0Var;
            n0Var.f76792c.d("AwaitingConfirmationResult", new DefaultConfirmationHandler$AwaitingConfirmationResultData(g0Var2.f76759e, confirmationHandler$Option2, d0Var.f76742b));
            d0Var.f76741a.invoke();
        } else if (e0Var instanceof c0) {
            c0 c0Var = (c0) e0Var;
            n0Var.e(new t(c0Var.f76738a, c0Var.f76739b, c0Var.f76740c));
        } else {
            if (!(e0Var instanceof b0)) {
                throw new NoWhenBranchMatchedException();
            }
            b0 b0Var = (b0) e0Var;
            n0Var.e(new u(b0Var.f76732a, b0Var.f76733b, b0Var.f76734c));
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00bb  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e(v vVar) {
        ConfirmationHandler$Args confirmationHandler$Args;
        Object paymentMethod;
        Wallet wallet;
        String str;
        String strL;
        vVar.a(this.f76795f);
        x xVar = new x(vVar);
        i2 i2Var = this.f76799j;
        i2Var.getClass();
        i2Var.k(null, xVar);
        boolean z11 = vVar instanceof u;
        u0 u0Var = this.f76792c;
        if (z11 && (confirmationHandler$Args = (ConfirmationHandler$Args) u0Var.a("INITIAL_CONFIRMATION_ARGUMENTS_KEY")) != null) {
            StripeIntent stripeIntent = ((u) vVar).f76808a;
            ConfirmationHandler$Option confirmationOption = confirmationHandler$Args.f44128a;
            boolean z12 = confirmationHandler$Args.f44129b.A;
            com.stripe.android.paymentelement.confirmation.b bVar = (com.stripe.android.paymentelement.confirmation.b) this.f76796g;
            bVar.getClass();
            Intrinsics.g(stripeIntent, "stripeIntent");
            Intrinsics.g(confirmationOption, "confirmationOption");
            boolean z13 = confirmationOption instanceof PaymentMethodConfirmationOption.New;
            boolean zA = true;
            SavedSelection.GooglePay googlePay = SavedSelection.GooglePay.f44850a;
            SavedSelection.Link link = SavedSelection.Link.f44851a;
            if (z13) {
                PaymentMethodConfirmationOption.New r42 = (PaymentMethodConfirmationOption.New) confirmationOption;
                PaymentMethod n = stripeIntent.getN();
                if (stripeIntent instanceof PaymentIntent) {
                    zA = ((PaymentIntent) stripeIntent).a(r42.f44137a.f43680a);
                } else if (!(stripeIntent instanceof SetupIntent)) {
                    throw new NoWhenBranchMatchedException();
                }
                if (!z12 && !r42.f44140d && !zA) {
                    n = null;
                }
                paymentMethod = n != null ? new SavedSelection.PaymentMethod(n.f43569a, false) : null;
                if (paymentMethod != null) {
                    ou.e eVar = bVar.f44148a;
                    PaymentMethod n9 = stripeIntent.getN();
                    String str2 = n9 != null ? n9.f43575g : null;
                    ou.g gVar = new ou.g(eVar.f80846a, str2, eVar.f80847b);
                    if (paymentMethod.equals(googlePay)) {
                        str = "google_pay";
                    } else if (paymentMethod.equals(link)) {
                        str = "link";
                    } else if (paymentMethod instanceof SavedSelection.PaymentMethod) {
                        SavedSelection.PaymentMethod paymentMethod2 = (SavedSelection.PaymentMethod) paymentMethod;
                        str = "payment_method:" + paymentMethod2.f44853a + ":" + paymentMethod2.f44854b;
                    } else {
                        str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    Object value = gVar.f80872d.getValue();
                    Intrinsics.f(value, "getValue(...)");
                    SharedPreferences.Editor editorEdit = ((SharedPreferences) value).edit();
                    if (str2 == null || (strL = b.c0.l("customer[", str2, "]")) == null) {
                        strL = "guest";
                    }
                    editorEdit.putString(strL, str).commit();
                }
            } else {
                if (confirmationOption instanceof PaymentMethodConfirmationOption.Saved) {
                    PaymentMethod paymentMethod3 = ((PaymentMethodConfirmationOption.Saved) confirmationOption).f44143a;
                    PaymentMethod.Card card = paymentMethod3.f43576h;
                    ht.a aVar = (card == null || (wallet = card.f43615j) == null) ? null : wallet.f44059a;
                    int i5 = aVar == null ? -1 : h0.f76763a[aVar.ordinal()];
                    paymentMethod = i5 != 1 ? i5 != 2 ? new SavedSelection.PaymentMethod(paymentMethod3.f43569a, false) : link : googlePay;
                } else {
                    if (!(confirmationOption instanceof GooglePayConfirmationOption)) {
                        if (confirmationOption instanceof LinkConfirmationOption) {
                        }
                    }
                }
                if (paymentMethod != null) {
                }
            }
        }
        u0Var.d("INITIAL_CONFIRMATION_ARGUMENTS_KEY", null);
        u0Var.getClass();
        s0 s0Var = u0Var.f59455b;
        s0Var.getClass();
        ((LinkedHashMap) s0Var.f18279b).remove("AwaitingConfirmationResult");
        ((LinkedHashMap) s0Var.f18281d).remove("AwaitingConfirmationResult");
        ((LinkedHashMap) s0Var.f18282e).remove("AwaitingConfirmationResult");
        if (u0Var.f59454a.remove("AwaitingConfirmationResult") != null) {
            throw new ClassCastException();
        }
    }

    public final void f(j.b activityResultCaller, h6.a0 lifecycleOwner) {
        Intrinsics.g(activityResultCaller, "activityResultCaller");
        Intrinsics.g(lifecycleOwner, "lifecycleOwner");
        for (g0 g0Var : this.f76790a) {
            iv.c cVar = new iv.c(1, this, n0.class, "onResult", "onResult(Lcom/stripe/android/paymentelement/confirmation/ConfirmationDefinition$Result;)V", 0, 9);
            g0Var.getClass();
            g0Var.f76757c = g0Var.f76756b.c(activityResultCaller, new jt.e(22, g0Var, cVar));
        }
        lifecycleOwner.getLifecycle().a(new m0(this, 0));
    }

    public final Object g(ConfirmationHandler$Args confirmationHandler$Args, ContinuationImpl continuationImpl) throws Throwable {
        this.f76792c.d("INITIAL_CONFIRMATION_ARGUMENTS_KEY", confirmationHandler$Args);
        Object objY = t70.m0.y(this.f76791b.getCoroutineContext(), new g4(this, confirmationHandler$Args, null, 7), continuationImpl);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }
}
