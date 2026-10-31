package hq;

import com.stripe.android.cards.Bin;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public w f60022t;

    /* renamed from: u, reason: collision with root package name */
    public f f60023u;

    /* renamed from: v, reason: collision with root package name */
    public Bin f60024v;

    /* renamed from: w, reason: collision with root package name */
    public Object f60025w;

    /* renamed from: x, reason: collision with root package name */
    public u f60026x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f60027y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ w f60028z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f60028z = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f60027y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f60028z.d(null, this);
    }
}
