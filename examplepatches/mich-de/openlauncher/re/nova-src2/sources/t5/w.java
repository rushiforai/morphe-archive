package t5;

import java.io.Serializable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class w extends ContinuationImpl {
    public final /* synthetic */ c0 A;
    public int B;

    /* renamed from: t, reason: collision with root package name */
    public Object f88724t;

    /* renamed from: u, reason: collision with root package name */
    public Object f88725u;

    /* renamed from: v, reason: collision with root package name */
    public Serializable f88726v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.ObjectRef f88727w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f88728x;

    /* renamed from: y, reason: collision with root package name */
    public int f88729y;

    /* renamed from: z, reason: collision with root package name */
    public /* synthetic */ Object f88730z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(c0 c0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.A = c0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88730z = obj;
        this.B |= Integer.MIN_VALUE;
        return c0.f(this.A, false, this);
    }
}
