package io.sentry.rrweb;

import java.util.Arrays;

/* loaded from: classes4.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public c f67714a;

    /* renamed from: b, reason: collision with root package name */
    public long f67715b = System.currentTimeMillis();

    public b(c cVar) {
        this.f67714a = cVar;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f67715b == bVar.f67715b && this.f67714a == bVar.f67714a;
    }

    public int hashCode() {
        return Arrays.hashCode(new Object[]{this.f67714a, Long.valueOf(this.f67715b)});
    }
}
