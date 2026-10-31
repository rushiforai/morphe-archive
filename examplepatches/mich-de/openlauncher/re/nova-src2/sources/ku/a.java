package ku;

import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.stripe3ds2.transaction.ChallengeResult;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public d f72210t;

    /* renamed from: u, reason: collision with root package name */
    public ChallengeResult f72211u;

    /* renamed from: v, reason: collision with root package name */
    public ApiRequest$Options f72212v;

    /* renamed from: w, reason: collision with root package name */
    public int f72213w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f72214x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ d f72215y;

    /* renamed from: z, reason: collision with root package name */
    public int f72216z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f72215y = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f72214x = obj;
        this.f72216z |= Integer.MIN_VALUE;
        return this.f72215y.a(null, null, 0, this);
    }
}
