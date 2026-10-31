package w70;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class c0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f93866t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93867u;

    /* renamed from: v, reason: collision with root package name */
    public int f93868v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93867u = obj;
        this.f93868v |= Integer.MIN_VALUE;
        return u1.g(this, null, null);
    }
}
