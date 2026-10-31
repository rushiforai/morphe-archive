package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {
    public String A;
    public /* synthetic */ Object B;
    public final /* synthetic */ y C;
    public int D;

    /* renamed from: t, reason: collision with root package name */
    public y f55833t;

    /* renamed from: u, reason: collision with root package name */
    public String f55834u;

    /* renamed from: v, reason: collision with root package name */
    public String f55835v;

    /* renamed from: w, reason: collision with root package name */
    public String f55836w;

    /* renamed from: x, reason: collision with root package name */
    public String f55837x;

    /* renamed from: y, reason: collision with root package name */
    public String f55838y;

    /* renamed from: z, reason: collision with root package name */
    public rs.b0 f55839z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.C = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.B = obj;
        this.D |= Integer.MIN_VALUE;
        Object objV = this.C.v(null, null, null, null, null, null, this);
        return objV == CoroutineSingletons.f71806a ? objV : new Result(objV);
    }
}
