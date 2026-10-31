package m7;

import java.util.Objects;
import java.util.Set;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f76022a;

    /* renamed from: b, reason: collision with root package name */
    public final String f76023b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f76024c;

    public a(String str, String str2, Set set) {
        this.f76022a = str;
        this.f76023b = str2;
        this.f76024c = set;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Objects.equals(this.f76022a, aVar.f76022a) && Objects.equals(this.f76023b, aVar.f76023b) && Objects.equals(this.f76024c, aVar.f76024c);
    }

    public final int hashCode() {
        return Objects.hash(this.f76022a, this.f76023b, this.f76024c);
    }
}
