package xk;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.SortedMap;

/* loaded from: classes3.dex */
public final class d2 extends com.google.common.collect.a implements Serializable {

    /* renamed from: d, reason: collision with root package name */
    public transient Map f95893d;

    /* renamed from: e, reason: collision with root package name */
    public transient int f95894e;

    /* renamed from: f, reason: collision with root package name */
    public transient c2 f95895f;

    @Override // com.google.common.collect.a
    public final Map a() {
        Map map = this.f34566c;
        if (map != null) {
            return map;
        }
        Map map2 = this.f95893d;
        Map hVar = map2 instanceof NavigableMap ? new h(this, (NavigableMap) map2) : map2 instanceof SortedMap ? new k(this, (SortedMap) map2) : new f(this, map2);
        this.f34566c = hVar;
        return hVar;
    }

    public final void c() {
        Map map = this.f95893d;
        Iterator it = map.values().iterator();
        while (it.hasNext()) {
            ((Collection) it.next()).clear();
        }
        map.clear();
        this.f95894e = 0;
    }
}
