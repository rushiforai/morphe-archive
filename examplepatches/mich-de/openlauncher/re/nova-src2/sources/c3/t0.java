package c3;

import android.os.Binder;
import android.os.Parcelable;
import android.util.Size;
import android.util.SizeF;
import android.util.SparseArray;
import java.io.Serializable;
import kotlin.Function;

/* loaded from: classes.dex */
public abstract class t0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Class[] f19424a = {Serializable.class, Parcelable.class, String.class, SparseArray.class, Binder.class, Size.class, SizeF.class};

    public static final boolean a(Object obj) {
        if (obj instanceof z1.o) {
            z1.o oVar = (z1.o) obj;
            if (oVar.l() == p1.g1.f81422b || oVar.l() == p1.g1.f81425e || oVar.l() == p1.g1.f81423c) {
                Object value = oVar.getValue();
                if (value == null) {
                    return true;
                }
                return a(value);
            }
        } else {
            if ((obj instanceof Function) && (obj instanceof Serializable)) {
                return false;
            }
            for (int i5 = 0; i5 < 7; i5++) {
                if (f19424a[i5].isInstance(obj)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static final float b(int i5, int i11, float[] fArr, float[] fArr2) {
        int i12 = i5 * 4;
        return (fArr[i12 + 3] * fArr2[12 + i11]) + (fArr[i12 + 2] * fArr2[8 + i11]) + (fArr[i12 + 1] * fArr2[4 + i11]) + (fArr[i12] * fArr2[i11]);
    }

    public static final boolean c(float[] fArr, float[] fArr2) {
        if (fArr.length < 16 || fArr2.length < 16) {
            return false;
        }
        float f11 = fArr[0];
        float f12 = fArr[1];
        float f13 = fArr[2];
        float f14 = fArr[3];
        float f15 = fArr[4];
        float f16 = fArr[5];
        float f17 = fArr[6];
        float f18 = fArr[7];
        float f19 = fArr[8];
        float f21 = fArr[9];
        float f22 = fArr[10];
        float f23 = fArr[11];
        float f24 = fArr[12];
        float f25 = fArr[13];
        float f26 = fArr[14];
        float f27 = fArr[15];
        float f28 = (f11 * f16) - (f12 * f15);
        float f29 = (f11 * f17) - (f13 * f15);
        float f31 = (f11 * f18) - (f14 * f15);
        float f32 = (f12 * f17) - (f13 * f16);
        float f33 = (f12 * f18) - (f14 * f16);
        float f34 = (f13 * f18) - (f14 * f17);
        float f35 = (f19 * f25) - (f21 * f24);
        float f36 = (f19 * f26) - (f22 * f24);
        float f37 = (f19 * f27) - (f23 * f24);
        float f38 = (f21 * f26) - (f22 * f25);
        float f39 = (f21 * f27) - (f23 * f25);
        float f40 = (f22 * f27) - (f23 * f26);
        float f41 = (f34 * f35) + (((f32 * f37) + ((f31 * f38) + ((f28 * f40) - (f29 * f39)))) - (f33 * f36));
        if (f41 != 0.0f) {
            float f42 = 1.0f / f41;
            fArr2[0] = ((f18 * f38) + ((f16 * f40) - (f17 * f39))) * f42;
            fArr2[1] = (((f13 * f39) + ((-f12) * f40)) - (f14 * f38)) * f42;
            fArr2[2] = ((f27 * f32) + ((f25 * f34) - (f26 * f33))) * f42;
            fArr2[3] = (((f22 * f33) + ((-f21) * f34)) - (f23 * f32)) * f42;
            float f43 = -f15;
            fArr2[4] = (((f17 * f37) + (f43 * f40)) - (f18 * f36)) * f42;
            fArr2[5] = ((f14 * f36) + ((f40 * f11) - (f13 * f37))) * f42;
            float f44 = -f24;
            fArr2[6] = (((f26 * f31) + (f44 * f34)) - (f27 * f29)) * f42;
            fArr2[7] = ((f23 * f29) + ((f34 * f19) - (f22 * f31))) * f42;
            fArr2[8] = ((f18 * f35) + ((f15 * f39) - (f16 * f37))) * f42;
            fArr2[9] = (((f37 * f12) + ((-f11) * f39)) - (f14 * f35)) * f42;
            fArr2[10] = ((f27 * f28) + ((f24 * f33) - (f25 * f31))) * f42;
            fArr2[11] = (((f31 * f21) + ((-f19) * f33)) - (f23 * f28)) * f42;
            fArr2[12] = (((f16 * f36) + (f43 * f38)) - (f17 * f35)) * f42;
            fArr2[13] = ((f13 * f35) + ((f11 * f38) - (f12 * f36))) * f42;
            fArr2[14] = (((f25 * f29) + (f44 * f32)) - (f26 * f28)) * f42;
            fArr2[15] = ((f22 * f28) + ((f19 * f32) - (f21 * f29))) * f42;
        }
        return !(f41 == 0.0f);
    }

    public static final void d(float[] fArr, float[] fArr2) {
        float fB = b(0, 0, fArr2, fArr);
        float fB2 = b(0, 1, fArr2, fArr);
        float fB3 = b(0, 2, fArr2, fArr);
        float fB4 = b(0, 3, fArr2, fArr);
        float fB5 = b(1, 0, fArr2, fArr);
        float fB6 = b(1, 1, fArr2, fArr);
        float fB7 = b(1, 2, fArr2, fArr);
        float fB8 = b(1, 3, fArr2, fArr);
        float fB9 = b(2, 0, fArr2, fArr);
        float fB10 = b(2, 1, fArr2, fArr);
        float fB11 = b(2, 2, fArr2, fArr);
        float fB12 = b(2, 3, fArr2, fArr);
        float fB13 = b(3, 0, fArr2, fArr);
        float fB14 = b(3, 1, fArr2, fArr);
        float fB15 = b(3, 2, fArr2, fArr);
        float fB16 = b(3, 3, fArr2, fArr);
        fArr[0] = fB;
        fArr[1] = fB2;
        fArr[2] = fB3;
        fArr[3] = fB4;
        fArr[4] = fB5;
        fArr[5] = fB6;
        fArr[6] = fB7;
        fArr[7] = fB8;
        fArr[8] = fB9;
        fArr[9] = fB10;
        fArr[10] = fB11;
        fArr[11] = fB12;
        fArr[12] = fB13;
        fArr[13] = fB14;
        fArr[14] = fB15;
        fArr[15] = fB16;
    }
}
