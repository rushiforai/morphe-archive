package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class x0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h2 f56755t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.FloatRef f56756u;

    /* renamed from: v, reason: collision with root package name */
    public float f56757v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f56758w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ c1 f56759x;

    /* renamed from: y, reason: collision with root package name */
    public int f56760y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x0(c1 c1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56759x = c1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56758w = obj;
        this.f56760y |= Integer.MIN_VALUE;
        return c1.a(this.f56759x, null, null, 0.0f, 0.0f, this);
    }
}
