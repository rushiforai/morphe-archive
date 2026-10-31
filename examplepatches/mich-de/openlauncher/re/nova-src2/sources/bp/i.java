package bp;

import java.io.Serializable;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class i implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final i f18395b = new i("sig");

    /* renamed from: c, reason: collision with root package name */
    public static final i f18396c = new i("enc");

    /* renamed from: a, reason: collision with root package name */
    public final String f18397a;

    public i(String str) {
        this.f18397a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof i) {
            return Objects.equals(this.f18397a, ((i) obj).f18397a);
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.f18397a);
    }

    public final String toString() {
        return this.f18397a;
    }
}
