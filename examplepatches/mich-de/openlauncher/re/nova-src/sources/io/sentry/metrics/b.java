package io.sentry.metrics;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f67398a = new HashMap();

    public final HashMap a() {
        HashMap map = new HashMap();
        synchronized (this.f67398a) {
            try {
                for (Map.Entry entry : this.f67398a.entrySet()) {
                    String str = (String) entry.getKey();
                    Objects.requireNonNull(str);
                    ArrayList arrayList = new ArrayList();
                    Iterator it = ((Map) entry.getValue()).values().iterator();
                    if (it.hasNext()) {
                        if (it.next() == null) {
                            throw null;
                        }
                        throw new ClassCastException();
                    }
                    map.put(str, arrayList);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return map;
    }
}
