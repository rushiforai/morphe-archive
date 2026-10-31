package xt;

import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.paymentelement.confirmation.linkinline.LinkInlineSignupConfirmationOption;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public f f96305t;

    /* renamed from: u, reason: collision with root package name */
    public LinkInlineSignupConfirmationOption f96306u;

    /* renamed from: v, reason: collision with root package name */
    public g f96307v;

    /* renamed from: w, reason: collision with root package name */
    public PaymentMethodExtraParams f96308w;

    /* renamed from: x, reason: collision with root package name */
    public LinkConfiguration f96309x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f96310y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ f f96311z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f96311z = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f96310y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f96311z.j(null, null, this);
    }
}
