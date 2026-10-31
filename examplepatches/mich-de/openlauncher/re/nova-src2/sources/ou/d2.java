package ou;

import com.stripe.android.lpmfoundations.paymentmethod.CustomerMetadata;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g2 f80839t;

    /* renamed from: u, reason: collision with root package name */
    public String f80840u;

    /* renamed from: v, reason: collision with root package name */
    public CustomerMetadata f80841v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f80842w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f80843x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ g2 f80844y;

    /* renamed from: z, reason: collision with root package name */
    public int f80845z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d2(g2 g2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f80844y = g2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80843x = obj;
        this.f80845z |= Integer.MIN_VALUE;
        Object objC = this.f80844y.c(null, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
