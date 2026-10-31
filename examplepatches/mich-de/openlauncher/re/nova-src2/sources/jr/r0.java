package jr;

import com.stripe.android.customersheet.CustomerSheet$Configuration;
import java.io.Serializable;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class r0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t0 f69729t;

    /* renamed from: u, reason: collision with root package name */
    public CustomerSheet$Configuration f69730u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f69731v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ t0 f69732w;

    /* renamed from: x, reason: collision with root package name */
    public int f69733x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r0(t0 t0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f69732w = t0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f69731v = obj;
        this.f69733x |= Integer.MIN_VALUE;
        Serializable serializableA = this.f69732w.a(null, this);
        return serializableA == CoroutineSingletons.f71806a ? serializableA : new Result(serializableA);
    }
}
