package o50;

import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final String f79572a;

    /* renamed from: b, reason: collision with root package name */
    public final List f79573b;

    public h(String value, List params) {
        Object next;
        String str;
        Intrinsics.g(value, "value");
        Intrinsics.g(params, "params");
        this.f79572a = value;
        this.f79573b = params;
        Iterator it = params.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            } else {
                next = it.next();
                if (Intrinsics.b(((i) next).f79574a, "q")) {
                    break;
                }
            }
        }
        i iVar = (i) next;
        if (iVar == null || (str = iVar.f79575b) == null) {
            return;
        }
        r70.i.r0(str);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.f79572a, hVar.f79572a) && Intrinsics.b(this.f79573b, hVar.f79573b);
    }

    public final int hashCode() {
        return this.f79573b.hashCode() + (this.f79572a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("HeaderValue(value=");
        sb2.append(this.f79572a);
        sb2.append(", params=");
        return fq.c.e(sb2, this.f79573b, ')');
    }
}
