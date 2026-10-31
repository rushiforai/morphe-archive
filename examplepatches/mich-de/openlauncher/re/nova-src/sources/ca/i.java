package ca;

import java.util.Objects;

/* loaded from: classes2.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final p9.a f19926a;

    /* renamed from: b, reason: collision with root package name */
    public final int f19927b;

    public i(p9.a aVar, int i5) {
        this.f19927b = i5;
        this.f19926a = aVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return this.f19927b == iVar.f19927b && this.f19926a.equals(iVar.f19926a);
    }

    public final int hashCode() {
        return Objects.hash(Integer.valueOf(this.f19927b), this.f19926a);
    }
}
