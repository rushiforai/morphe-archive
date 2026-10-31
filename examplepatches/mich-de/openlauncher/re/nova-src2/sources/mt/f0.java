package mt;

import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g0 f76747t;

    /* renamed from: u, reason: collision with root package name */
    public ConfirmationHandler$Args f76748u;

    /* renamed from: v, reason: collision with root package name */
    public ConfirmationHandler$Option f76749v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f76750w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ g0 f76751x;

    /* renamed from: y, reason: collision with root package name */
    public int f76752y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f0(g0 g0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76751x = g0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76750w = obj;
        this.f76752y |= Integer.MIN_VALUE;
        return this.f76751x.a(null, null, this);
    }
}
