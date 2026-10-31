package ads_mobile_sdk;

import java.util.concurrent.CancellationException;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import t70.r1;
import w70.n;

/* loaded from: classes.dex */
public final class eu2 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ r1 f3002a;

    public eu2(r1 r1Var) {
        this.f3002a = r1Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        this.f3002a.c(new kq2(new CancellationException("Ad request cancelled by publisher action.")));
        return Unit.f71706a;
    }
}
