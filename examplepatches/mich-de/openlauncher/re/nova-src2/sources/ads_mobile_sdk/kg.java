package ads_mobile_sdk;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class kg implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final y2 f5726a;

    public kg(y2 adEventEmitter) {
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        this.f5726a = adEventEmitter;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        String str = (String) map.get(PendingUpgradeStore.KEY_NAME);
        if (str == null) {
            mu0.c("App event with no name parameter.", null);
            return Unit.f71706a;
        }
        Unit unitA = this.f5726a.a(str, (String) map.get("info"), continuation);
        return unitA == CoroutineSingletons.f71806a ? unitA : Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 13;
    }
}
