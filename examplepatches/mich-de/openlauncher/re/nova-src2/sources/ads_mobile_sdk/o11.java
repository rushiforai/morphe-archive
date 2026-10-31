package ads_mobile_sdk;

import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import x80.i;

/* loaded from: classes2.dex */
public final class o11 extends Lambda implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f7732a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f7733j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o11(i iVar, int i5) {
        super(3);
        this.f7733j = i5;
        this.f7732a = iVar;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f7733j) {
            case 0:
                Intrinsics.g((Throwable) obj, "<anonymous parameter 0>");
                Intrinsics.g((pu0) obj2, "<anonymous parameter 1>");
                Intrinsics.g((CoroutineContext) obj3, "<anonymous parameter 2>");
                this.f7732a.cancel();
                break;
            default:
                Intrinsics.g((Throwable) obj, "<anonymous parameter 0>");
                Intrinsics.g((xu0) obj2, "<anonymous parameter 1>");
                Intrinsics.g((CoroutineContext) obj3, "<anonymous parameter 2>");
                this.f7732a.cancel();
                break;
        }
        return Unit.f71706a;
    }
}
