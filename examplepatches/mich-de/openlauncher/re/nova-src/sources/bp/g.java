package bp;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class g implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Date f18388a;

    /* renamed from: b, reason: collision with root package name */
    public final f f18389b;

    public g(Date date, f fVar) {
        this.f18388a = date;
        this.f18389b = fVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Objects.equals(this.f18388a, gVar.f18388a) && Objects.equals(this.f18389b, gVar.f18389b);
    }

    public final int hashCode() {
        return Objects.hash(this.f18388a, this.f18389b);
    }
}
