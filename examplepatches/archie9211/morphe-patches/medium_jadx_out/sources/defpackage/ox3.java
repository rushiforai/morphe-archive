package defpackage;

import android.text.InputFilter;
import android.widget.TextView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ox3 extends xz5 {
    public final nx3 m;

    public ox3(TextView textView) {
        this.m = new nx3(textView);
    }

    @Override // defpackage.xz5
    public final InputFilter[] T(InputFilter[] inputFilterArr) {
        return !yw3.d() ? inputFilterArr : this.m.T(inputFilterArr);
    }

    @Override // defpackage.xz5
    public final void y0(boolean z) {
        if (yw3.d()) {
            this.m.y0(z);
        }
    }

    @Override // defpackage.xz5
    public final void z0(boolean z) {
        boolean zD = yw3.d();
        nx3 nx3Var = this.m;
        if (zD) {
            nx3Var.z0(z);
        } else {
            nx3Var.o = z;
        }
    }
}
