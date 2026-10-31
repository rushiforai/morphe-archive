package b70;

import androidx.compose.ui.node.LayoutNode;
import java.util.Collections;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class k extends x7.f {
    public static MapBuilder b0(MapBuilder mapBuilder) {
        return mapBuilder.b();
    }

    public static MapBuilder c0() {
        return new MapBuilder();
    }

    public static int d0(int i5) {
        return i5 < 0 ? i5 : i5 < 3 ? i5 + 1 : i5 < 1073741824 ? (int) ((i5 / 0.75f) + 1.0f) : LayoutNode.NotPlacedPlaceOrder;
    }

    public static Map e0(Pair pair) {
        Intrinsics.g(pair, "pair");
        Map mapSingletonMap = Collections.singletonMap(pair.f71683a, pair.f71684b);
        Intrinsics.f(mapSingletonMap, "singletonMap(...)");
        return mapSingletonMap;
    }

    public static final Map f0(Map map) {
        Intrinsics.g(map, "<this>");
        Map.Entry entry = (Map.Entry) map.entrySet().iterator().next();
        Map mapSingletonMap = Collections.singletonMap(entry.getKey(), entry.getValue());
        Intrinsics.f(mapSingletonMap, "with(...)");
        return mapSingletonMap;
    }
}
