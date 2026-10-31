package i2;

import android.graphics.ColorFilter;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class u extends t {

    /* renamed from: b, reason: collision with root package name */
    public float[] f61169b;

    public u(float[] fArr) {
        super(new ColorMatrixColorFilter(fArr));
        this.f61169b = fArr;
    }

    public final float[] a() {
        float[] fArr = this.f61169b;
        if (fArr != null) {
            return fArr;
        }
        ColorFilter colorFilter = this.f61166a;
        if (!(colorFilter instanceof ColorMatrixColorFilter)) {
            throw new IllegalArgumentException("Unable to obtain ColorMatrix from Android ColorMatrixColorFilter. This method was invoked on an unsupported Android version");
        }
        ColorMatrix colorMatrix = new ColorMatrix();
        ((ColorMatrixColorFilter) colorFilter).getColorMatrix(colorMatrix);
        float[] array = colorMatrix.getArray();
        this.f61169b = array;
        return array;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof u) && Arrays.equals(a(), ((u) obj).a());
    }

    public final int hashCode() {
        float[] fArr = this.f61169b;
        if (fArr != null) {
            return Arrays.hashCode(fArr);
        }
        return 0;
    }

    public final String toString() {
        String str;
        StringBuilder sb2 = new StringBuilder("ColorMatrixColorFilter(colorMatrix=");
        float[] fArr = this.f61169b;
        if (fArr == null) {
            str = AbstractJsonLexerKt.NULL;
        } else {
            str = "ColorMatrix(values=" + Arrays.toString(fArr) + ')';
        }
        sb2.append((Object) str);
        sb2.append(')');
        return sb2.toString();
    }
}
