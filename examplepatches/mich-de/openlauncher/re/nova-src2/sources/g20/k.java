package g20;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56948t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ w f56949u;

    /* renamed from: v, reason: collision with root package name */
    public int f56950v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(w wVar, Continuation continuation) {
        super(continuation);
        this.f56949u = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56948t = obj;
        this.f56950v |= Integer.MIN_VALUE;
        return this.f56949u.a(this);
    }
}
