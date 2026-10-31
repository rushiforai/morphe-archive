package w70;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n f93987t;

    /* renamed from: u, reason: collision with root package name */
    public v70.z f93988u;

    /* renamed from: v, reason: collision with root package name */
    public v70.n f93989v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f93990w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f93991x;

    /* renamed from: y, reason: collision with root package name */
    public int f93992y;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93991x = obj;
        this.f93992y |= Integer.MIN_VALUE;
        return u1.n(null, null, false, this);
    }
}
