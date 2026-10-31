package ads_mobile_sdk;

import com.amplitude.android.migration.DatabaseConstants;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r31 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final xj f8917a;

    public r31(xj appState) {
        Intrinsics.g(appState, "appState");
        this.f8917a = appState;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        String str = (String) map.get(DatabaseConstants.KEY_FIELD);
        String str2 = (String) map.get("value");
        if (str == null || str.length() == 0) {
            return Unit.f71706a;
        }
        xj xjVar = this.f8917a;
        xjVar.getClass();
        Object objA = xj.a(xjVar, str, str2, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 53;
    }
}
