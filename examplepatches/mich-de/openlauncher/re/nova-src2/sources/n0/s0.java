package n0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class s0 extends ContinuationImpl {
    public int A;
    public float B;
    public float C;
    public float D;
    public /* synthetic */ Object E;
    public int F;

    /* renamed from: t, reason: collision with root package name */
    public m0.v f77480t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.BooleanRef f77481u;

    /* renamed from: v, reason: collision with root package name */
    public Ref.ObjectRef f77482v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.IntRef f77483w;

    /* renamed from: x, reason: collision with root package name */
    public int f77484x;

    /* renamed from: y, reason: collision with root package name */
    public int f77485y;

    /* renamed from: z, reason: collision with root package name */
    public int f77486z;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.E = obj;
        this.F |= Integer.MIN_VALUE;
        return t0.a(null, 0, 0, 0, null, this);
    }
}
