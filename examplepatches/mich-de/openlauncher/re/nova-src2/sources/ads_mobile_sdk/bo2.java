package ads_mobile_sdk;

import java.util.concurrent.CancellationException;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import w70.n;

/* loaded from: classes2.dex */
public final class bo2 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.g2 f1478a;

    public bo2(t70.g2 g2Var) {
        this.f1478a = g2Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        this.f1478a.B(new kq2(new CancellationException("Ad request cancelled by publisher action.")));
        return Unit.f71706a;
    }
}
