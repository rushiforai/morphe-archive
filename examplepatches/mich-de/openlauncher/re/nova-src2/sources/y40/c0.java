package y40;

import io.branch.search.internal.D1;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;

/* loaded from: classes4.dex */
public final class c0 {
    public static Pair[] a(d0 r11) {
        Intrinsics.g(r11, "r");
        Long l9 = r11.f96659a;
        Pair pair = new Pair("u", l9 != null ? l9.toString() : null);
        g gVar = r11.f96660b;
        Pair pair2 = new Pair("SA_ROWS", String.valueOf(gVar != null ? gVar.f96669c : 0));
        g gVar2 = r11.f96660b;
        Pair pair3 = new Pair("SA_SIZE", String.valueOf(gVar2 != null ? gVar2.f96670d : 0));
        k kVar = r11.f96661c;
        Pair pair4 = new Pair("SL_ROWS", String.valueOf(kVar != null ? kVar.f96674c : 0));
        i iVar = r11.f96662d;
        Pair pair5 = new Pair("SI_ROWS", String.valueOf(iVar != null ? iVar.f96671c : 0));
        i iVar2 = r11.f96662d;
        return D1.a((Map<String, String>) MapsKt.j0(pair, pair2, pair3, pair4, pair5, new Pair("SI_SIZE", String.valueOf(iVar2 != null ? iVar2.f96672d : 0)), new Pair("cache", String.valueOf(r11.f96663e)), new Pair("disable_organic", String.valueOf(r11.f96664f))));
    }

    public static d0 b(j0 scope, Function2 function2) {
        Intrinsics.g(scope, "scope");
        return new d0(null, null, null, null, false, false, function2);
    }
}
