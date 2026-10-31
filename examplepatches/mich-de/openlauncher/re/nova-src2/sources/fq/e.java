package fq;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f55572t;

    /* renamed from: u, reason: collision with root package name */
    public Object f55573u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f55574v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.attestation.c f55575w;

    /* renamed from: x, reason: collision with root package name */
    public int f55576x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(com.stripe.android.attestation.c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55575w = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55574v = obj;
        this.f55576x |= Integer.MIN_VALUE;
        return com.stripe.android.attestation.c.e(this.f55575w, this);
    }
}
