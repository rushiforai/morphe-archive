package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class s extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.t f56681t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.ObjectRef f56682u;

    /* renamed from: v, reason: collision with root package name */
    public Ref.BooleanRef f56683v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f56684w;

    /* renamed from: x, reason: collision with root package name */
    public int f56685x;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56684w = obj;
        this.f56685x |= Integer.MIN_VALUE;
        return x.b(null, 0L, this);
    }
}
