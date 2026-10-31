package wt;

import android.os.Parcelable;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SharePaymentDetails;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentelement.confirmation.link.LinkPassthroughConfirmationDefinition$Result;
import com.stripe.android.paymentelement.confirmation.link.LinkPassthroughConfirmationOption;
import fs.h0;
import fs.y;
import gt.m0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import mt.f0;
import mt.i;
import mt.j;
import mt.p;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class f implements j {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f94677a;

    public f(h0 linkAccountManager) {
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        this.f94677a = linkAccountManager;
    }

    @Override // mt.j
    public final void a(Object obj, Object obj2, ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationArgs) {
        c arguments = (c) obj2;
        LinkPassthroughConfirmationOption confirmationOption = (LinkPassthroughConfirmationOption) confirmationHandler$Option;
        Intrinsics.g(arguments, "arguments");
        Intrinsics.g(confirmationOption, "confirmationOption");
        Intrinsics.g(confirmationArgs, "confirmationArgs");
        ((b) obj).f94669a.invoke(new LinkPassthroughConfirmationDefinition$Result(arguments.f94670a));
    }

    @Override // mt.j
    public final ConfirmationHandler$Option b(ConfirmationHandler$Option confirmationOption) {
        Intrinsics.g(confirmationOption, "confirmationOption");
        if (confirmationOption instanceof LinkPassthroughConfirmationOption) {
            return (LinkPassthroughConfirmationOption) confirmationOption;
        }
        return null;
    }

    @Override // mt.j
    public final Object c(j.b activityResultCaller, jt.e eVar) {
        Intrinsics.g(activityResultCaller, "activityResultCaller");
        return new b(eVar);
    }

    @Override // mt.j
    public final /* bridge */ /* synthetic */ Object d(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationHandler$Args, f0 f0Var) {
        return i((LinkPassthroughConfirmationOption) confirmationHandler$Option, f0Var);
    }

    @Override // mt.j
    public final boolean e(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationHandler$Args) {
        i30.j.l((LinkPassthroughConfirmationOption) confirmationHandler$Option, confirmationHandler$Args);
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
        return "LinkPassthrough";
    }

    @Override // mt.j
    public final i h(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationArgs, vt.f0 f0Var, Parcelable parcelable) {
        LinkPassthroughConfirmationOption confirmationOption = (LinkPassthroughConfirmationOption) confirmationHandler$Option;
        LinkPassthroughConfirmationDefinition$Result result = (LinkPassthroughConfirmationDefinition$Result) parcelable;
        Intrinsics.g(confirmationOption, "confirmationOption");
        Intrinsics.g(confirmationArgs, "confirmationArgs");
        Intrinsics.g(result, "result");
        return new mt.g(result.f44181a, confirmationArgs);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(LinkPassthroughConfirmationOption linkPassthroughConfirmationOption, ContinuationImpl continuationImpl) {
        d dVar;
        Object objJ;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f94673v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f94673v = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object obj = dVar.f94671t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = dVar.f94673v;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar.f94673v = 1;
            objJ = j(linkPassthroughConfirmationOption, dVar);
            if (objJ == obj2) {
                return obj2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objJ = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objJ);
        return thA == null ? new mt.c(new c((PaymentMethodConfirmationOption) objJ), true, null) : new mt.b(thA, zg.a.U(2132020022, new Object[0], EmptyList.f71733a), p.f76802a);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(LinkPassthroughConfirmationOption linkPassthroughConfirmationOption, ContinuationImpl continuationImpl) {
        e eVar;
        Object objS;
        Object objA;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f94676v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f94676v = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        e eVar2 = eVar;
        Object obj = eVar2.f94674t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar2.f94676v;
        if (i11 == 0) {
            ResultKt.b(obj);
            String str = linkPassthroughConfirmationOption.f44182a;
            String str2 = linkPassthroughConfirmationOption.f44183b;
            String str3 = linkPassthroughConfirmationOption.f44185d;
            String str4 = linkPassthroughConfirmationOption.f44184c;
            PaymentMethod.AllowRedisplay allowRedisplay = linkPassthroughConfirmationOption.f44186e;
            String str5 = allowRedisplay != null ? allowRedisplay.f43595a : null;
            eVar2.f94676v = 1;
            objS = ((y) this.f94677a).s(str, str2, str3, str4, str5, eVar2);
            if (objS == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objS = ((Result) obj).f71688a;
        }
        int i12 = Result.f71687b;
        if (!(objS instanceof Result.Failure)) {
            try {
                try {
                    objA = new m0().s(new JSONObject(((SharePaymentDetails) objS).f43787b));
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                if (objA instanceof Result.Failure) {
                    objA = null;
                }
                objS = (PaymentMethod) objA;
                if (objS == null) {
                    throw new IllegalArgumentException("Required value was null.");
                }
            } catch (Throwable th3) {
                int i14 = Result.f71687b;
                objS = ResultKt.a(th3);
            }
        }
        return !(objS instanceof Result.Failure) ? new PaymentMethodConfirmationOption.Saved((PaymentMethod) objS, null, 24) : objS;
    }
}
