package qx;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class b0 extends ContinuationImpl {
    public List A;
    public e B;
    public int C;
    public int D;
    public int E;
    public /* synthetic */ Object F;
    public final /* synthetic */ g0 G;
    public int H;

    /* renamed from: t, reason: collision with root package name */
    public g0 f84437t;

    /* renamed from: u, reason: collision with root package name */
    public l f84438u;

    /* renamed from: v, reason: collision with root package name */
    public Function1 f84439v;

    /* renamed from: w, reason: collision with root package name */
    public sx.j f84440w;

    /* renamed from: x, reason: collision with root package name */
    public Function2 f84441x;

    /* renamed from: y, reason: collision with root package name */
    public String f84442y;

    /* renamed from: z, reason: collision with root package name */
    public String f84443z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(g0 g0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.G = g0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.F = obj;
        this.H |= Integer.MIN_VALUE;
        return this.G.c(0, null, null, null, null, this);
    }
}
