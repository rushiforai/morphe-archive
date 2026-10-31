package x4;

import java.util.List;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public String f95062a;

    /* renamed from: b, reason: collision with root package name */
    public String f95063b;

    /* renamed from: c, reason: collision with root package name */
    public List f95064c;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Objects.equals(this.f95062a, aVar.f95062a) && Objects.equals(this.f95063b, aVar.f95063b) && Objects.equals(this.f95064c, aVar.f95064c);
    }

    public final int hashCode() {
        return Objects.hash(this.f95062a, this.f95063b, this.f95064c);
    }
}
