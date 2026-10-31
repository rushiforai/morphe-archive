package mt;

import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import h6.u0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;

/* loaded from: classes4.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public final u0 f76755a;

    /* renamed from: b, reason: collision with root package name */
    public final j f76756b;

    /* renamed from: c, reason: collision with root package name */
    public Object f76757c;

    /* renamed from: d, reason: collision with root package name */
    public final String f76758d;

    /* renamed from: e, reason: collision with root package name */
    public final String f76759e;

    public g0(u0 savedStateHandle, j definition) {
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Intrinsics.g(definition, "definition");
        this.f76755a = savedStateHandle;
        this.f76756b = definition;
        this.f76758d = definition.getKey().concat("Parameters");
        this.f76759e = definition.getKey();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationHandler$Args, ContinuationImpl continuationImpl) {
        f0 f0Var;
        g0 g0Var;
        ConfirmationHandler$Option confirmationHandler$Option2;
        if (continuationImpl instanceof f0) {
            f0Var = (f0) continuationImpl;
            int i5 = f0Var.f76752y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f0Var.f76752y = i5 - Integer.MIN_VALUE;
            } else {
                f0Var = new f0(this, continuationImpl);
            }
        }
        Object objD = f0Var.f76750w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f0Var.f76752y;
        if (i11 == 0) {
            ResultKt.b(objD);
            j jVar = this.f76756b;
            ConfirmationHandler$Option confirmationHandler$OptionB = jVar.b(confirmationHandler$Option);
            if (confirmationHandler$OptionB == null) {
                Class<?> cls = confirmationHandler$Option.getClass();
                ReflectionFactory reflectionFactory = Reflection.f71864a;
                return new c0(new IllegalArgumentException(b.c0.n("Parameter type of '", reflectionFactory.getOrCreateKotlinClass(cls).getSimpleName(), "' cannot be used with ", reflectionFactory.getOrCreateKotlinClass(g0.class).getSimpleName(), " to read a result")), zg.a.G(2132020022), p.f76802a);
            }
            f0Var.f76747t = this;
            f0Var.f76748u = confirmationHandler$Args;
            f0Var.f76749v = confirmationHandler$OptionB;
            f0Var.f76752y = 1;
            objD = jVar.d(confirmationHandler$OptionB, confirmationHandler$Args, f0Var);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
            g0Var = this;
            confirmationHandler$Option2 = confirmationHandler$OptionB;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ConfirmationHandler$Option confirmationHandler$Option3 = f0Var.f76749v;
            confirmationHandler$Args = f0Var.f76748u;
            g0 g0Var2 = f0Var.f76747t;
            ResultKt.b(objD);
            confirmationHandler$Option2 = confirmationHandler$Option3;
            g0Var = g0Var2;
        }
        ConfirmationHandler$Args confirmationHandler$Args2 = confirmationHandler$Args;
        d dVar = (d) objD;
        if (dVar instanceof c) {
            Object obj = g0Var.f76757c;
            if (obj != null) {
                c cVar = (c) dVar;
                return new d0(new com.instabridge.mobilesdk.internal.ui.screens.t(g0Var, confirmationHandler$Option2, confirmationHandler$Args2, cVar, obj, 11), cVar.f76736b);
            }
            IllegalStateException illegalStateException = new IllegalStateException(b.c0.l("No launcher for ", Reflection.f71864a.getOrCreateKotlinClass(g0Var.f76756b.getClass()).getSimpleName(), " was found, did you call register?"));
            return new c0(illegalStateException, p50.i.w(illegalStateException), n.f76789a);
        }
        if (dVar instanceof a) {
            a aVar = (a) dVar;
            return new b0(aVar.f76726a, aVar.f76727b, aVar.f76728c);
        }
        if (!(dVar instanceof b)) {
            throw new NoWhenBranchMatchedException();
        }
        b bVar = (b) dVar;
        return new c0(bVar.f76729a, bVar.f76730b, bVar.f76731c);
    }
}
