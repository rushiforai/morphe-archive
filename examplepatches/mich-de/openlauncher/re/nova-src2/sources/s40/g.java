package s40;

import androidx.compose.ui.node.LayoutNode;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes4.dex */
public final class g extends a {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f86661b = 0;

    static {
        e.a(Collections.EMPTY_MAP);
    }

    @Override // w60.a
    public final Object get() {
        Map map = this.f86653a;
        int size = map.size();
        LinkedHashMap linkedHashMap = new LinkedHashMap(size < 3 ? size + 1 : size < 1073741824 ? (int) ((size / 0.75f) + 1.0f) : LayoutNode.NotPlacedPlaceOrder);
        for (Map.Entry entry : map.entrySet()) {
            linkedHashMap.put(entry.getKey(), ((h) entry.getValue()).get());
        }
        return Collections.unmodifiableMap(linkedHashMap);
    }
}
