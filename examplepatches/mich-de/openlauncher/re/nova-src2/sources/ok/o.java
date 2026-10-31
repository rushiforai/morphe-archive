package ok;

import b.c0;
import java.util.Set;

/* loaded from: classes3.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final String f80487a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f80488b;

    public o(String str, Set set) {
        this.f80487a = str;
        this.f80488b = set;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof o) {
            o oVar = (o) obj;
            String str = oVar.f80487a;
            String str2 = this.f80487a;
            if (str2 != null ? str2.equals(str) : str == null) {
                if (this.f80488b.equals(oVar.f80488b)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f80487a;
        return (((str == null ? 0 : str.hashCode()) ^ 1000003) * 1000003) ^ this.f80488b.hashCode();
    }

    public final String toString() {
        return c0.s(new StringBuilder("StandardIntegrityTokenRequest{requestHash="), this.f80487a, ", verdictOptOut=", this.f80488b.toString(), "}");
    }
}
