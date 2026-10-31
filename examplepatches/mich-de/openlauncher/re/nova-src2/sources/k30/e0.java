package k30;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e0 extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public Object f70934t;

    /* renamed from: u, reason: collision with root package name */
    public Object f70935u;

    /* renamed from: v, reason: collision with root package name */
    public Object f70936v;

    /* renamed from: w, reason: collision with root package name */
    public Object f70937w;

    /* renamed from: x, reason: collision with root package name */
    public List f70938x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f70939y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ h0 f70940z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e0(h0 h0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f70940z = h0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f70939y = obj;
        this.A |= Integer.MIN_VALUE;
        return h0.a(this.f70940z, this);
    }
}
