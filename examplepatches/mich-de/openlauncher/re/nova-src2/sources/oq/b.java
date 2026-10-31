package oq;

import com.stripe.android.model.ElementsSession;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$State;
import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {
    public /* synthetic */ Object A;
    public final /* synthetic */ c B;
    public int C;

    /* renamed from: t, reason: collision with root package name */
    public c f80588t;

    /* renamed from: u, reason: collision with root package name */
    public ElementsSession f80589u;

    /* renamed from: v, reason: collision with root package name */
    public PaymentElementLoader$State f80590v;

    /* renamed from: w, reason: collision with root package name */
    public List f80591w;

    /* renamed from: x, reason: collision with root package name */
    public ElementsSession.ExperimentsData f80592x;

    /* renamed from: y, reason: collision with root package name */
    public String f80593y;

    /* renamed from: z, reason: collision with root package name */
    public f f80594z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.B = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.A = obj;
        this.C |= Integer.MIN_VALUE;
        return c.a(this.B, null, null, null, this);
    }
}
