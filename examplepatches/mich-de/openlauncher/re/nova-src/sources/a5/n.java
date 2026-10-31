package a5;

import android.os.Build;
import android.view.DisplayCutout;
import androidx.core.graphics.Insets;
import java.util.Objects;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final DisplayCutout f328a;

    public n(DisplayCutout displayCutout) {
        this.f328a = displayCutout;
    }

    public final Insets a() {
        return Build.VERSION.SDK_INT >= 30 ? Insets.toCompatInsets(m.a(this.f328a)) : Insets.NONE;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || n.class != obj.getClass()) {
            return false;
        }
        return Objects.equals(this.f328a, ((n) obj).f328a);
    }

    public final int hashCode() {
        return this.f328a.hashCode();
    }

    public final String toString() {
        return "DisplayCutoutCompat{" + this.f328a + "}";
    }
}
