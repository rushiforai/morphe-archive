package xt;

import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.paymentelement.confirmation.linkinline.LinkInlineSignupConfirmationOption;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f f96312t;

    /* renamed from: u, reason: collision with root package name */
    public LinkInlineSignupConfirmationOption f96313u;

    /* renamed from: v, reason: collision with root package name */
    public LinkConfiguration f96314v;

    /* renamed from: w, reason: collision with root package name */
    public UserInput f96315w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f96316x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ f f96317y;

    /* renamed from: z, reason: collision with root package name */
    public int f96318z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f96317y = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f96316x = obj;
        this.f96318z |= Integer.MIN_VALUE;
        return this.f96317y.k(null, this);
    }
}
