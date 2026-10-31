package i2;

import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h0 {

    /* renamed from: a, reason: collision with root package name */
    public final float[] f61121a;

    public static float[] a() {
        return new float[]{1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    }

    public static final long b(long j11, float[] fArr) {
        if (fArr.length < 16) {
            return j11;
        }
        float f11 = fArr[0];
        float f12 = fArr[1];
        float f13 = fArr[3];
        float f14 = fArr[4];
        float f15 = fArr[5];
        float f16 = fArr[7];
        float f17 = fArr[12];
        float f18 = fArr[13];
        float f19 = fArr[15];
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L));
        float f21 = 1 / (((f16 * fIntBitsToFloat2) + (f13 * fIntBitsToFloat)) + f19);
        if ((Float.floatToRawIntBits(f21) & LayoutNode.NotPlacedPlaceOrder) >= 2139095040) {
            f21 = 0.0f;
        }
        float f22 = f15 * fIntBitsToFloat2;
        return (Float.floatToRawIntBits((((f14 * fIntBitsToFloat2) + (f11 * fIntBitsToFloat)) + f17) * f21) << 32) | (Float.floatToRawIntBits((f22 + (f12 * fIntBitsToFloat) + f18) * f21) & 4294967295L);
    }

    public static final void c(float[] fArr, h2.a aVar) {
        if (fArr.length < 16) {
            return;
        }
        float f11 = fArr[0];
        float f12 = fArr[1];
        float f13 = fArr[3];
        float f14 = fArr[4];
        float f15 = fArr[5];
        float f16 = fArr[7];
        float f17 = fArr[12];
        float f18 = fArr[13];
        float f19 = fArr[15];
        float f21 = aVar.f59012a;
        float f22 = aVar.f59013b;
        float f23 = aVar.f59014c;
        float f24 = aVar.f59015d;
        float f25 = f13 * f21;
        float f26 = f16 * f22;
        float f27 = 1.0f / ((f25 + f26) + f19);
        if ((Float.floatToRawIntBits(f27) & LayoutNode.NotPlacedPlaceOrder) >= 2139095040) {
            f27 = 0.0f;
        }
        float f28 = f11 * f21;
        float f29 = f14 * f22;
        float f31 = (f28 + f29 + f17) * f27;
        float f32 = f21 * f12;
        float f33 = f22 * f15;
        float f34 = (f32 + f33 + f18) * f27;
        float f35 = f16 * f24;
        float f36 = 1.0f / ((f25 + f35) + f19);
        if ((Float.floatToRawIntBits(f36) & LayoutNode.NotPlacedPlaceOrder) >= 2139095040) {
            f36 = 0.0f;
        }
        float f37 = f14 * f24;
        float f38 = (f28 + f37 + f17) * f36;
        float f39 = f15 * f24;
        float f40 = (f32 + f39 + f18) * f36;
        float f41 = f13 * f23;
        float f42 = 1.0f / ((f26 + f41) + f19);
        if ((Float.floatToRawIntBits(f42) & LayoutNode.NotPlacedPlaceOrder) >= 2139095040) {
            f42 = 0.0f;
        }
        float f43 = f11 * f23;
        float f44 = (f43 + f29 + f17) * f42;
        float f45 = f23 * f12;
        float f46 = (f33 + f45 + f18) * f42;
        float f47 = 1.0f / ((f41 + f35) + f19);
        float f48 = (Float.floatToRawIntBits(f47) & LayoutNode.NotPlacedPlaceOrder) < 2139095040 ? f47 : 0.0f;
        float f49 = (f43 + f37 + f17) * f48;
        float f51 = (f45 + f39 + f18) * f48;
        aVar.f59012a = Math.min(f31, Math.min(f38, Math.min(f44, f49)));
        aVar.f59013b = Math.min(f34, Math.min(f40, Math.min(f46, f51)));
        aVar.f59014c = Math.max(f31, Math.max(f38, Math.max(f44, f49)));
        aVar.f59015d = Math.max(f34, Math.max(f40, Math.max(f46, f51)));
    }

    public static final void d(float[] fArr) {
        if (fArr.length < 16) {
            return;
        }
        fArr[0] = 1.0f;
        fArr[1] = 0.0f;
        fArr[2] = 0.0f;
        fArr[3] = 0.0f;
        fArr[4] = 0.0f;
        fArr[5] = 1.0f;
        fArr[6] = 0.0f;
        fArr[7] = 0.0f;
        fArr[8] = 0.0f;
        fArr[9] = 0.0f;
        fArr[10] = 1.0f;
        fArr[11] = 0.0f;
        fArr[12] = 0.0f;
        fArr[13] = 0.0f;
        fArr[14] = 0.0f;
        fArr[15] = 1.0f;
    }

    public static final void e(float[] fArr, float[] fArr2) {
        if (fArr.length >= 16 && fArr2.length >= 16) {
            float f11 = fArr[0];
            float f12 = fArr2[0];
            float f13 = fArr[1];
            float f14 = fArr2[4];
            float f15 = fArr[2];
            float f16 = fArr2[8];
            float f17 = f15 * f16;
            float f18 = fArr[3];
            float f19 = fArr2[12];
            float f21 = f18 * f19;
            float f22 = f21 + f17 + (f13 * f14) + (f11 * f12);
            float f23 = fArr2[1];
            float f24 = fArr2[5];
            float f25 = fArr2[9];
            float f26 = f15 * f25;
            float f27 = fArr2[13];
            float f28 = f18 * f27;
            float f29 = f28 + f26 + (f13 * f24) + (f11 * f23);
            float f31 = fArr2[2];
            float f32 = fArr2[6];
            float f33 = fArr2[10];
            float f34 = f15 * f33;
            float f35 = fArr2[14];
            float f36 = f18 * f35;
            float f37 = f36 + f34 + (f13 * f32) + (f11 * f31);
            float f38 = fArr2[3];
            float f39 = fArr2[7];
            float f40 = fArr2[11];
            float f41 = f15 * f40;
            float f42 = fArr2[15];
            float f43 = f18 * f42;
            float f44 = f43 + f41 + (f13 * f39) + (f11 * f38);
            float f45 = fArr[4];
            float f46 = fArr[5];
            float f47 = fArr[6];
            float f48 = (f47 * f16) + (f46 * f14) + (f45 * f12);
            float f49 = fArr[7];
            float f51 = (f49 * f19) + f48;
            float f52 = (f49 * f27) + (f47 * f25) + (f46 * f24) + (f45 * f23);
            float f53 = (f49 * f35) + (f47 * f33) + (f46 * f32) + (f45 * f31);
            float f54 = f47 * f40;
            float f55 = f49 * f42;
            float f56 = f55 + f54 + (f46 * f39) + (f45 * f38);
            float f57 = fArr[8];
            float f58 = fArr[9];
            float f59 = fArr[10];
            float f61 = (f59 * f16) + (f58 * f14) + (f57 * f12);
            float f62 = fArr[11];
            float f63 = (f62 * f19) + f61;
            float f64 = (f62 * f27) + (f59 * f25) + (f58 * f24) + (f57 * f23);
            float f65 = (f62 * f35) + (f59 * f33) + (f58 * f32) + (f57 * f31);
            float f66 = f59 * f40;
            float f67 = f62 * f42;
            float f68 = f67 + f66 + (f58 * f39) + (f57 * f38);
            float f69 = fArr[12];
            float f70 = fArr[13];
            float f71 = (f14 * f70) + (f12 * f69);
            float f72 = fArr[14];
            float f73 = (f16 * f72) + f71;
            float f74 = fArr[15];
            float f75 = (f19 * f74) + f73;
            float f76 = f25 * f72;
            float f77 = f27 * f74;
            float f78 = f77 + f76 + (f24 * f70) + (f23 * f69);
            float f79 = f33 * f72;
            float f81 = f35 * f74;
            float f82 = f81 + f79 + (f32 * f70) + (f31 * f69);
            float f83 = f72 * f40;
            float f84 = f74 * f42;
            fArr[0] = f22;
            fArr[1] = f29;
            fArr[2] = f37;
            fArr[3] = f44;
            fArr[4] = f51;
            fArr[5] = f52;
            fArr[6] = f53;
            fArr[7] = f56;
            fArr[8] = f63;
            fArr[9] = f64;
            fArr[10] = f65;
            fArr[11] = f68;
            fArr[12] = f75;
            fArr[13] = f78;
            fArr[14] = f82;
            fArr[15] = f84 + f83 + (f70 * f39) + (f69 * f38);
        }
    }

    public static final void f(float[] fArr, float f11, float f12) {
        if (fArr.length < 16) {
            return;
        }
        float f13 = (fArr[8] * 0.0f) + (fArr[4] * f12) + (fArr[0] * f11) + fArr[12];
        float f14 = (fArr[9] * 0.0f) + (fArr[5] * f12) + (fArr[1] * f11) + fArr[13];
        float f15 = (fArr[10] * 0.0f) + (fArr[6] * f12) + (fArr[2] * f11) + fArr[14];
        float f16 = (fArr[11] * 0.0f) + (fArr[7] * f12) + (fArr[3] * f11) + fArr[15];
        fArr[12] = f13;
        fArr[13] = f14;
        fArr[14] = f15;
        fArr[15] = f16;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof h0) {
            return Intrinsics.b(this.f61121a, ((h0) obj).f61121a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f61121a);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("\n            |");
        float[] fArr = this.f61121a;
        sb2.append(fArr[0]);
        sb2.append(' ');
        sb2.append(fArr[1]);
        sb2.append(' ');
        sb2.append(fArr[2]);
        sb2.append(' ');
        sb2.append(fArr[3]);
        sb2.append("|\n            |");
        sb2.append(fArr[4]);
        sb2.append(' ');
        sb2.append(fArr[5]);
        sb2.append(' ');
        sb2.append(fArr[6]);
        sb2.append(' ');
        sb2.append(fArr[7]);
        sb2.append("|\n            |");
        sb2.append(fArr[8]);
        sb2.append(' ');
        sb2.append(fArr[9]);
        sb2.append(' ');
        sb2.append(fArr[10]);
        sb2.append(' ');
        sb2.append(fArr[11]);
        sb2.append("|\n            |");
        sb2.append(fArr[12]);
        sb2.append(' ');
        sb2.append(fArr[13]);
        sb2.append(' ');
        sb2.append(fArr[14]);
        sb2.append(' ');
        sb2.append(fArr[15]);
        sb2.append("|\n        ");
        return r70.f.o0(sb2.toString());
    }
}
