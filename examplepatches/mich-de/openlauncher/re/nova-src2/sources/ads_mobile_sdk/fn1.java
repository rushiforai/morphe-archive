package ads_mobile_sdk;

import androidx.compose.ui.node.LayoutNode;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class fn1 extends e {

    /* renamed from: b, reason: collision with root package name */
    public static final hb1 f3443b = hb1.a(Collections.EMPTY_MAP);

    @Override // b.m5
    public final Object get() {
        Map map = this.f2693a;
        int size = map.size();
        LinkedHashMap linkedHashMap = new LinkedHashMap(size < 3 ? size + 1 : size < 1073741824 ? (int) ((size / 0.75f) + 1.0f) : LayoutNode.NotPlacedPlaceOrder);
        for (Map.Entry entry : map.entrySet()) {
            linkedHashMap.put(entry.getKey(), ((b.m5) entry.getValue()).get());
        }
        return Collections.unmodifiableMap(linkedHashMap);
    }
}
