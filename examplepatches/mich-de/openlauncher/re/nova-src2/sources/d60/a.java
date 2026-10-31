package d60;

import cm.f;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes4.dex */
public final class a extends LinkedHashMap {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48999a = 1;

    public /* synthetic */ a(int i5, float f11, boolean z11) {
        super(i5, f11, z11);
    }

    @Override // java.util.LinkedHashMap
    public final boolean removeEldestEntry(Map.Entry entry) {
        switch (this.f48999a) {
            case 0:
                if (size() > 100) {
                }
                break;
            default:
                if (size() > 4) {
                }
                break;
        }
        return false;
    }

    public a(f fVar, int i5) {
        super(i5, 0.75f, true);
    }
}
