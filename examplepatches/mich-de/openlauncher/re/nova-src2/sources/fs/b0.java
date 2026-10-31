package fs;

import java.util.List;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b0 extends ContinuationImpl {
    public f0 A;
    public /* synthetic */ Object B;
    public final /* synthetic */ f0 C;
    public int D;

    /* renamed from: t, reason: collision with root package name */
    public f0 f55733t;

    /* renamed from: u, reason: collision with root package name */
    public String f55734u;

    /* renamed from: v, reason: collision with root package name */
    public ft.x f55735v;

    /* renamed from: w, reason: collision with root package name */
    public String f55736w;

    /* renamed from: x, reason: collision with root package name */
    public String f55737x;

    /* renamed from: y, reason: collision with root package name */
    public String f55738y;

    /* renamed from: z, reason: collision with root package name */
    public List f55739z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(f0 f0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.C = f0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.B = obj;
        this.D |= Integer.MIN_VALUE;
        Object objC = this.C.c(null, null, null, null, null, null, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
