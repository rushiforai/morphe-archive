package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c0 extends ContinuationImpl {
    public f0 A;
    public /* synthetic */ Object B;
    public final /* synthetic */ f0 C;
    public int D;

    /* renamed from: t, reason: collision with root package name */
    public f0 f55744t;

    /* renamed from: u, reason: collision with root package name */
    public String f55745u;

    /* renamed from: v, reason: collision with root package name */
    public String f55746v;

    /* renamed from: w, reason: collision with root package name */
    public String f55747w;

    /* renamed from: x, reason: collision with root package name */
    public String f55748x;

    /* renamed from: y, reason: collision with root package name */
    public String f55749y;

    /* renamed from: z, reason: collision with root package name */
    public rs.b0 f55750z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(f0 f0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.C = f0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.B = obj;
        this.D |= Integer.MIN_VALUE;
        Object objD = this.C.d(null, null, null, null, null, null, this);
        return objD == CoroutineSingletons.f71806a ? objD : new Result(objD);
    }
}
