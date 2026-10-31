package ic0;

import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes5.dex */
public abstract class a extends z60.a implements Comparable {
    public a() {
        new ConcurrentHashMap();
        new ConcurrentHashMap();
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return Integer.compare(a(), ((z60.a) obj).a());
    }
}
