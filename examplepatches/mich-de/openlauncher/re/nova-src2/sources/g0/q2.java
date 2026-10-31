package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class q2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f56669t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56670u;

    /* renamed from: v, reason: collision with root package name */
    public int f56671v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56670u = obj;
        this.f56671v |= Integer.MIN_VALUE;
        return t2.h(null, null, this);
    }
}
