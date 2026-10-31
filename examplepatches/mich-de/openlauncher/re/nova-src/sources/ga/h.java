package ga;

import android.os.UserHandle;
import java.util.Objects;

/* loaded from: classes.dex */
public final class h extends f {

    /* renamed from: x, reason: collision with root package name */
    public final String f57319x;

    /* renamed from: y, reason: collision with root package name */
    public final int f57320y;

    public h(int i5, UserHandle userHandle, String str) {
        this.f57319x = str;
        this.f57320y = i5;
        this.o = userHandle;
        this.f57290b = -1;
    }

    @Override // ga.e
    public final String b() {
        return super.b() + " packageName=" + this.f57319x;
    }

    public final Object clone() {
        return new h(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && h.class == obj.getClass()) {
            h hVar = (h) obj;
            if (Objects.equals(this.f57319x, hVar.f57319x) && Objects.equals(this.o, hVar.o) && this.f57320y == hVar.f57320y) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.f57319x, this.o, Integer.valueOf(this.f57320y));
    }

    public h(h hVar) {
        this.f57319x = hVar.f57319x;
        this.f57320y = hVar.f57320y;
        this.o = hVar.o;
        this.f57290b = -1;
    }
}
