package defpackage;

import android.view.DisplayCutout;
import android.view.WindowInsets;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class q4f extends p4f {
    public q4f(z4f z4fVar, WindowInsets windowInsets) {
        super(z4fVar, windowInsets);
    }

    @Override // defpackage.w4f
    public z4f a() {
        return z4f.h(this.c.consumeDisplayCutout(), null);
    }

    @Override // defpackage.o4f, defpackage.w4f
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q4f)) {
            return false;
        }
        q4f q4fVar = (q4f) obj;
        return Objects.equals(this.c, q4fVar.c) && Objects.equals(this.g, q4fVar.g) && o4f.M(this.h, q4fVar.h);
    }

    @Override // defpackage.w4f
    public yg3 h() {
        DisplayCutout displayCutout = this.c.getDisplayCutout();
        if (displayCutout == null) {
            return null;
        }
        return new yg3(displayCutout);
    }

    @Override // defpackage.w4f
    public int hashCode() {
        return this.c.hashCode();
    }

    public q4f(z4f z4fVar, q4f q4fVar) {
        super(z4fVar, q4fVar);
    }
}
