package defpackage;

import android.graphics.RectF;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dm1 implements eb2 {
    public final float a;

    public dm1(float f) {
        this.a = f;
    }

    @Override // defpackage.eb2
    public final float a(RectF rectF) {
        float fMin = Math.min(rectF.width() / 2.0f, rectF.height() / 2.0f);
        float f = this.a;
        if (f < 0.0f) {
            return 0.0f;
        }
        return f > fMin ? fMin : f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof dm1) && this.a == ((dm1) obj).a;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Float.valueOf(this.a)});
    }
}
