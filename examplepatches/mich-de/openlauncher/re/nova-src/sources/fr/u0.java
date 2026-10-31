package fr;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f55705a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f55706b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f55707c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f55708d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f55709e;

    /* renamed from: f, reason: collision with root package name */
    public final m0 f55710f;

    public u0(Map map, String str, int i5) {
        this.f55705a = i5;
        this.f55706b = str;
        this.f55707c = map;
        this.f55708d = i5 == 200;
        this.f55709e = i5 < 200 || i5 >= 300;
        List listA = a("Request-Id");
        String str2 = listA != null ? (String) b70.g.Y0(listA) : null;
        str2 = (str2 == null || r70.k.U0(str2)) ? null : str2;
        this.f55710f = str2 != null ? new m0(str2) : null;
    }

    public final List a(String str) {
        Object next;
        Iterator it = this.f55707c.entrySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (r70.j.B0((String) ((Map.Entry) next).getKey(), str, true)) {
                break;
            }
        }
        Map.Entry entry = (Map.Entry) next;
        if (entry != null) {
            return (List) entry.getValue();
        }
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0)) {
            return false;
        }
        u0 u0Var = (u0) obj;
        return this.f55705a == u0Var.f55705a && Intrinsics.b(this.f55706b, u0Var.f55706b) && Intrinsics.b(this.f55707c, u0Var.f55707c);
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f55705a) * 31;
        Object obj = this.f55706b;
        return this.f55707c.hashCode() + ((iHashCode + (obj == null ? 0 : obj.hashCode())) * 31);
    }

    public final String toString() {
        return "Request-Id: " + this.f55710f + ", Status Code: " + this.f55705a;
    }
}
