package j9;

import java.util.HashMap;

/* loaded from: classes2.dex */
public final class i {

    /* renamed from: c, reason: collision with root package name */
    public static final int[] f69266c = {0, 1, 2, 3, 4};

    /* renamed from: a, reason: collision with root package name */
    public final int f69267a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f69268b = new HashMap();

    public i(int i5) {
        this.f69267a = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && (obj instanceof i)) {
            i iVar = (i) obj;
            HashMap map = iVar.f69268b;
            if (iVar.f69267a == this.f69267a) {
                int size = map.size();
                HashMap map2 = this.f69268b;
                if (size == map2.size()) {
                    for (h hVar : (h[]) map.values().toArray(new h[map.size()])) {
                        if (c.f69209r1.contains(Short.valueOf(hVar.f69259a)) || hVar.equals((h) map2.get(Short.valueOf(hVar.f69259a)))) {
                        }
                    }
                    return true;
                }
            }
        }
        return false;
    }
}
