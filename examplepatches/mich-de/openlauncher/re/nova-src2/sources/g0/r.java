package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class r extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.b f56672t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.LongRef f56673u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56674v;

    /* renamed from: w, reason: collision with root package name */
    public int f56675w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56674v = obj;
        this.f56675w |= Integer.MIN_VALUE;
        return x.a(null, 0L, this);
    }
}
