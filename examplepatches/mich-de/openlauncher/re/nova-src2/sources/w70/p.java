package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93974t;

    /* renamed from: u, reason: collision with root package name */
    public int f93975u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ n8.q f93976v;

    /* renamed from: w, reason: collision with root package name */
    public n8.q f93977w;

    /* renamed from: x, reason: collision with root package name */
    public n f93978x;

    /* renamed from: y, reason: collision with root package name */
    public int f93979y;

    /* renamed from: z, reason: collision with root package name */
    public int f93980z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(n8.q qVar, Continuation continuation) {
        super(continuation);
        this.f93976v = qVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93974t = obj;
        this.f93975u |= Integer.MIN_VALUE;
        return this.f93976v.collect(null, this);
    }
}
