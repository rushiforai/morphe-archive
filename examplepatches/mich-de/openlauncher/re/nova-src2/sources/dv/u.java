package dv;

import android.content.Intent;
import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeActivity;
import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeActivityResult;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Function;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.AdaptedFunctionReference;
import kotlin.jvm.internal.FunctionAdapter;
import w70.i2;

/* loaded from: classes4.dex */
public final /* synthetic */ class u implements w70.n, FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49647a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f49648b;

    public /* synthetic */ u(Object obj, int i5) {
        this.f49647a = i5;
        this.f49648b = obj;
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        switch (this.f49647a) {
            case 0:
                return new AdaptedFunctionReference(2, 4, w.class, (w) this.f49648b, "updatePollingState", "updatePollingState(Lcom/stripe/android/paymentsheet/paymentdatacollection/polling/PollingState;)V");
            case 1:
                return new AdaptedFunctionReference(2, 4, AtomicReference.class, (AtomicReference) this.f49648b, "set", "set(Ljava/lang/Object;)V");
            default:
                return new AdaptedFunctionReference(2, 4, IntentConfirmationChallengeActivity.class, (IntentConfirmationChallengeActivity) this.f49648b, "dismissWithResult", "dismissWithResult(Lcom/stripe/android/challenge/confirmation/IntentConfirmationChallengeActivityResult;)V");
        }
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        Object value;
        n nVar;
        int i5 = this.f49647a;
        Object obj2 = this.f49648b;
        switch (i5) {
            case 0:
                m mVar = (m) obj;
                i2 i2Var = ((w) obj2).f49655c;
                do {
                    value = i2Var.getValue();
                    nVar = (n) value;
                } while (!i2Var.i(value, n.a(nVar, 0L, mVar, nVar.f49624d && mVar == m.f49616a, 3)));
                Unit unit = Unit.f71706a;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                return unit;
            case 1:
                ((AtomicReference) obj2).set((en.h) obj);
                Unit unit2 = Unit.f71706a;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                return unit2;
            default:
                IntentConfirmationChallengeActivity intentConfirmationChallengeActivity = (IntentConfirmationChallengeActivity) obj2;
                int i11 = IntentConfirmationChallengeActivity.f42488q;
                intentConfirmationChallengeActivity.setResult(4639, new Intent().putExtras(w.b.a(new Pair("com.stripe.android.challenge.confirmation.IntentConfirmationChallengeActivityContract.extra_result", (IntentConfirmationChallengeActivityResult) obj))));
                intentConfirmationChallengeActivity.finish();
                Unit unit3 = Unit.f71706a;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                return unit3;
        }
    }

    public final boolean equals(Object obj) {
        switch (this.f49647a) {
            case 0:
                if ((obj instanceof w70.n) && (obj instanceof FunctionAdapter)) {
                    break;
                }
                break;
            case 1:
                if ((obj instanceof w70.n) && (obj instanceof FunctionAdapter)) {
                    break;
                }
                break;
            default:
                if ((obj instanceof w70.n) && (obj instanceof FunctionAdapter)) {
                    break;
                }
                break;
        }
        return b().equals(((FunctionAdapter) obj).b());
    }

    public final int hashCode() {
        switch (this.f49647a) {
        }
        return b().hashCode();
    }
}
