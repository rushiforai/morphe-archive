package ads_mobile_sdk;

import java.util.ArrayList;

/* loaded from: classes.dex */
public final class z23 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f12427a;

    /* renamed from: b, reason: collision with root package name */
    public final hv f12428b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f12429c;

    /* renamed from: d, reason: collision with root package name */
    public com.google.gson.r f12430d;

    public z23(ArrayList arrayList, hv hvVar, ArrayList arrayList2) {
        this.f12427a = arrayList;
        this.f12428b = hvVar;
        this.f12429c = arrayList2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z23)) {
            return false;
        }
        z23 z23Var = (z23) obj;
        return this.f12427a.equals(z23Var.f12427a) && this.f12428b.equals(z23Var.f12428b) && this.f12429c.equals(z23Var.f12429c);
    }

    public final int hashCode() {
        return this.f12429c.hashCode() + ((this.f12428b.hashCode() + (this.f12427a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "ServerResponse(adConfigurations=" + this.f12427a + ", commonConfiguration=" + this.f12428b + ", actions=" + this.f12429c + ")";
    }
}
