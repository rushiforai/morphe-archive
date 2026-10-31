package a5;

import android.view.DisplayCutout;
import android.view.WindowInsets;
import java.util.Objects;

/* loaded from: classes.dex */
public class c2 extends a2 {
    public c2(h2 h2Var, WindowInsets windowInsets) {
        super(h2Var, windowInsets);
    }

    @Override // a5.f2
    public h2 a() {
        return h2.g(null, this.f395c.consumeDisplayCutout());
    }

    @Override // a5.z1, a5.f2
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c2)) {
            return false;
        }
        c2 c2Var = (c2) obj;
        return Objects.equals(this.f395c, c2Var.f395c) && Objects.equals(this.f399g, c2Var.f399g);
    }

    @Override // a5.f2
    public n f() {
        DisplayCutout displayCutout = this.f395c.getDisplayCutout();
        if (displayCutout == null) {
            return null;
        }
        return new n(displayCutout);
    }

    @Override // a5.f2
    public int hashCode() {
        return this.f395c.hashCode();
    }

    public c2(h2 h2Var, c2 c2Var) {
        super(h2Var, c2Var);
    }
}
