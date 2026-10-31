package w70;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class x0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f94067t;

    /* renamed from: u, reason: collision with root package name */
    public v0 f94068u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f94069v;

    /* renamed from: w, reason: collision with root package name */
    public int f94070w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94069v = obj;
        this.f94070w |= Integer.MIN_VALUE;
        return u1.p(null, null, this);
    }
}
