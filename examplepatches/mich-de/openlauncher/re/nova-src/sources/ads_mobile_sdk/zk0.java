package ads_mobile_sdk;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;

/* loaded from: classes2.dex */
public final class zk0 extends LinkedHashMap {

    /* renamed from: a, reason: collision with root package name */
    public final int f12563a;

    /* renamed from: b, reason: collision with root package name */
    public final g13 f12564b = g13.EVICTION_REASON_OVERFLOW;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f12565c;

    public zk0(ArrayList arrayList, int i5) {
        this.f12563a = i5;
        this.f12565c = arrayList;
    }

    @Override // java.util.LinkedHashMap
    public final boolean removeEldestEntry(Map.Entry entry) {
        if (size() <= this.f12563a) {
            return false;
        }
        this.f12565c.add(new Pair(this.f12564b, entry.getValue()));
        return true;
    }
}
