package wv;

import com.stripe.android.stripe3ds2.transaction.a0;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public ChallengeRequestData f94735t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f94736u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ a0 f94737v;

    /* renamed from: w, reason: collision with root package name */
    public int f94738w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(a0 a0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f94737v = a0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94736u = obj;
        this.f94738w |= Integer.MIN_VALUE;
        return this.f94737v.b(null, this);
    }
}
