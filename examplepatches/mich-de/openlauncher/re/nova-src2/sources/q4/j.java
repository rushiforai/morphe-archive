package q4;

import android.content.res.Resources;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final Resources f83636a;

    /* renamed from: b, reason: collision with root package name */
    public final Resources.Theme f83637b;

    public j(Resources resources, Resources.Theme theme) {
        this.f83636a = resources;
        this.f83637b = theme;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && j.class == obj.getClass()) {
            j jVar = (j) obj;
            if (this.f83636a.equals(jVar.f83636a) && Objects.equals(this.f83637b, jVar.f83637b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.f83636a, this.f83637b);
    }
}
