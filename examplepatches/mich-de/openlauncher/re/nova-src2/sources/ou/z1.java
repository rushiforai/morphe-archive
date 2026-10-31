package ou;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class z1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g2 f81021t;

    /* renamed from: u, reason: collision with root package name */
    public Object f81022u;

    /* renamed from: v, reason: collision with root package name */
    public Object f81023v;

    /* renamed from: w, reason: collision with root package name */
    public Function1 f81024w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f81025x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ g2 f81026y;

    /* renamed from: z, reason: collision with root package name */
    public int f81027z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z1(g2 g2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f81026y = g2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81025x = obj;
        this.f81027z |= Integer.MIN_VALUE;
        Object objA = this.f81026y.a(null, null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
