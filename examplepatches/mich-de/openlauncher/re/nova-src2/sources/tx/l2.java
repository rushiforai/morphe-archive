package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l2 extends ContinuationImpl {
    public int A;
    public int B;
    public /* synthetic */ Object C;
    public final /* synthetic */ p2 D;
    public int E;

    /* renamed from: t, reason: collision with root package name */
    public p2 f89859t;

    /* renamed from: u, reason: collision with root package name */
    public r f89860u;

    /* renamed from: v, reason: collision with root package name */
    public String f89861v;

    /* renamed from: w, reason: collision with root package name */
    public String f89862w;

    /* renamed from: x, reason: collision with root package name */
    public String f89863x;

    /* renamed from: y, reason: collision with root package name */
    public String f89864y;

    /* renamed from: z, reason: collision with root package name */
    public Object f89865z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l2(p2 p2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.D = p2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.C = obj;
        this.E |= Integer.MIN_VALUE;
        return this.D.a(this);
    }
}
