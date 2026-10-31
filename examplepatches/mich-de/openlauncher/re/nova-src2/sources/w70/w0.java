package w70;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class w0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f94057t;

    /* renamed from: u, reason: collision with root package name */
    public t0 f94058u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f94059v;

    /* renamed from: w, reason: collision with root package name */
    public int f94060w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94059v = obj;
        this.f94060w |= Integer.MIN_VALUE;
        return u1.o(null, this);
    }
}
