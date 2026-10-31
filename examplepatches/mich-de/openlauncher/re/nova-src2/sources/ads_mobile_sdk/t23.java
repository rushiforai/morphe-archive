package ads_mobile_sdk;

import b.p2;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class t23 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final p2 f9769a;

    public t23(p2 nativeJavascriptEngine) {
        Intrinsics.g(nativeJavascriptEngine, "nativeJavascriptEngine");
        this.f9769a = nativeJavascriptEngine;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        com.google.gson.r rVar = new com.google.gson.r();
        for (Map.Entry entry : map.entrySet()) {
            rVar.s((String) entry.getKey(), (String) entry.getValue());
        }
        Object objA = this.f9769a.a(rVar, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 48;
    }
}
