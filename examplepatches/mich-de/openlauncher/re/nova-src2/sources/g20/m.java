package g20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import nova.branch.engage.sesame_lite.internal.IdHash;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public w f56954t;

    /* renamed from: u, reason: collision with root package name */
    public IdHash f56955u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56956v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ w f56957w;

    /* renamed from: x, reason: collision with root package name */
    public int f56958x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56957w = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56956v = obj;
        this.f56958x |= Integer.MIN_VALUE;
        return this.f56957w.b(null, this);
    }
}
