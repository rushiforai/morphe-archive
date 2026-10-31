package jc0;

import java.io.Serializable;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class c implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final x60.e f69435a;

    /* renamed from: b, reason: collision with root package name */
    public final int f69436b;

    /* renamed from: c, reason: collision with root package name */
    public final int f69437c;

    public c(x60.e eVar, int i5, int i11) {
        this.f69435a = eVar;
        this.f69436b = i5;
        this.f69437c = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || c.class != obj.getClass()) {
            return false;
        }
        c cVar = (c) obj;
        if (Integer.valueOf(this.f69436b).equals(Integer.valueOf(cVar.f69436b)) && Integer.valueOf(this.f69437c).equals(Integer.valueOf(cVar.f69437c))) {
            return Objects.equals(this.f69435a, cVar.f69435a);
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.f69435a, Integer.valueOf(this.f69436b), Integer.valueOf(this.f69437c));
    }
}
