package mt;

import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n0 f76780t;

    /* renamed from: u, reason: collision with root package name */
    public ConfirmationHandler$Option f76781u;

    /* renamed from: v, reason: collision with root package name */
    public g0 f76782v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f76783w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ n0 f76784x;

    /* renamed from: y, reason: collision with root package name */
    public int f76785y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(n0 n0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76784x = n0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76783w = obj;
        this.f76785y |= Integer.MIN_VALUE;
        return this.f76784x.d(null, null, null, this);
    }
}
