package b;

import ads_mobile_sdk.tx0;
import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public interface gb {
    default gb a() {
        return this;
    }

    Object a(tx0 tx0Var, Map map, Continuation continuation);

    int b();

    default boolean c() {
        return false;
    }

    default String d() {
        return null;
    }

    default void a(String adKey) {
        Intrinsics.g(adKey, "adKey");
    }
}
