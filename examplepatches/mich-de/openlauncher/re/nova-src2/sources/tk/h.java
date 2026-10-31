package tk;

import java.util.Set;

/* loaded from: classes3.dex */
public abstract class h extends d implements Set {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f89422c = 0;

    /* renamed from: b, reason: collision with root package name */
    public transient i f89423b;

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this || obj == this) {
            return true;
        }
        if (obj instanceof Set) {
            Set set = (Set) obj;
            try {
                if (set.size() == 0) {
                    return containsAll(set);
                }
            } catch (ClassCastException | NullPointerException unused) {
            }
        }
        return false;
    }
}
