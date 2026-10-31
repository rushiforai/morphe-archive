package z3;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class c implements a {

    /* renamed from: a, reason: collision with root package name */
    public final float[] f98190a;

    /* renamed from: b, reason: collision with root package name */
    public final float[] f98191b;

    public c(float[] fArr, float[] fArr2) {
        if (fArr.length != fArr2.length || fArr.length == 0) {
            throw new IllegalArgumentException("Array lengths must match and be nonzero");
        }
        this.f98190a = fArr;
        this.f98191b = fArr2;
    }

    @Override // z3.a
    public final float a(float f11) {
        return o7.a.A(f11, this.f98191b, this.f98190a);
    }

    @Override // z3.a
    public final float b(float f11) {
        return o7.a.A(f11, this.f98190a, this.f98191b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Arrays.equals(this.f98190a, cVar.f98190a) && Arrays.equals(this.f98191b, cVar.f98191b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f98191b) + (Arrays.hashCode(this.f98190a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FontScaleConverter{fromSpValues=");
        String string = Arrays.toString(this.f98190a);
        Intrinsics.f(string, "toString(...)");
        sb2.append(string);
        sb2.append(", toDpValues=");
        String string2 = Arrays.toString(this.f98191b);
        Intrinsics.f(string2, "toString(...)");
        sb2.append(string2);
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }
}
