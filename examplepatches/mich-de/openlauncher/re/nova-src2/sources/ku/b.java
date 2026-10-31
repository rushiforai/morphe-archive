package ku;

import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.stripe3ds2.transaction.ChallengeResult;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public d f72217t;

    /* renamed from: u, reason: collision with root package name */
    public ChallengeResult f72218u;

    /* renamed from: v, reason: collision with root package name */
    public ApiRequest$Options f72219v;

    /* renamed from: w, reason: collision with root package name */
    public int f72220w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f72221x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ d f72222y;

    /* renamed from: z, reason: collision with root package name */
    public int f72223z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f72222y = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f72221x = obj;
        this.f72223z |= Integer.MIN_VALUE;
        return this.f72222y.b(null, null, 0, null, this);
    }
}
