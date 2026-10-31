package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93854t;

    /* renamed from: u, reason: collision with root package name */
    public int f93855u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ z f93856v;

    /* renamed from: w, reason: collision with root package name */
    public z f93857w;

    /* renamed from: x, reason: collision with root package name */
    public n f93858x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(z zVar, Continuation continuation) {
        super(continuation);
        this.f93856v = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93854t = obj;
        this.f93855u |= Integer.MIN_VALUE;
        return this.f93856v.collect(null, this);
    }
}
