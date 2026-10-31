package wv;

import com.stripe.android.stripe3ds2.transaction.ChallengeRequestExecutor$Config;
import com.stripe.android.stripe3ds2.transaction.InitChallengeArgs;
import com.stripe.android.stripe3ds2.transaction.u;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public u f94710t;

    /* renamed from: u, reason: collision with root package name */
    public InitChallengeArgs f94711u;

    /* renamed from: v, reason: collision with root package name */
    public u f94712v;

    /* renamed from: w, reason: collision with root package name */
    public n f94713w;

    /* renamed from: x, reason: collision with root package name */
    public ChallengeRequestExecutor$Config f94714x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f94715y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ u f94716z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(u uVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f94716z = uVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94715y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f94716z.a(null, this);
    }
}
