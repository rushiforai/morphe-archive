package wv;

import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.stripe3ds2.transaction.g f94699t;

    /* renamed from: u, reason: collision with root package name */
    public ChallengeRequestData f94700u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f94701v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.stripe3ds2.transaction.g f94702w;

    /* renamed from: x, reason: collision with root package name */
    public int f94703x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(com.stripe.android.stripe3ds2.transaction.g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f94702w = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94701v = obj;
        this.f94703x |= Integer.MIN_VALUE;
        return com.stripe.android.stripe3ds2.transaction.g.a(this.f94702w, null, this);
    }
}
