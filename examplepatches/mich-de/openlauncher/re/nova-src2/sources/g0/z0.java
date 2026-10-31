package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class z0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c1 f56780t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.ObjectRef f56781u;

    /* renamed from: v, reason: collision with root package name */
    public Ref.FloatRef f56782v;

    /* renamed from: w, reason: collision with root package name */
    public h2 f56783w;

    /* renamed from: x, reason: collision with root package name */
    public Ref.ObjectRef f56784x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f56785y;

    /* renamed from: z, reason: collision with root package name */
    public int f56786z;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56785y = obj;
        this.f56786z |= Integer.MIN_VALUE;
        return c1.b(null, null, null, null, null, 0L, this);
    }
}
