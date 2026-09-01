package defpackage;

import android.graphics.RectF;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ib implements eb2 {
    public final eb2 a;
    public final float b;

    public ib(float f, eb2 eb2Var) {
        while (eb2Var instanceof ib) {
            eb2Var = ((ib) eb2Var).a;
            f += ((ib) eb2Var).b;
        }
        this.a = eb2Var;
        this.b = f;
    }

    @Override // defpackage.eb2
    public final float a(RectF rectF) {
        return Math.max(0.0f, this.a.a(rectF) + this.b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ib)) {
            return false;
        }
        ib ibVar = (ib) obj;
        return this.a.equals(ibVar.a) && this.b == ibVar.b;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, Float.valueOf(this.b)});
    }
}
