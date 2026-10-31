package b;

import ads_mobile_sdk.om3;
import ads_mobile_sdk.pm3;
import sun.misc.Unsafe;

/* loaded from: classes2.dex */
public final class z5 extends om3 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f16033b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z5(Unsafe unsafe, int i5) {
        super(unsafe);
        this.f16033b = i5;
    }

    @Override // ads_mobile_sdk.om3
    public final void a(Object obj, long j11, double d5) {
        switch (this.f16033b) {
            case 0:
                a(obj, j11, Double.doubleToLongBits(d5));
                break;
            default:
                a(obj, j11, Double.doubleToLongBits(d5));
                break;
        }
    }

    @Override // ads_mobile_sdk.om3
    public final double b(long j11, Object obj) {
        switch (this.f16033b) {
        }
        return Double.longBitsToDouble(e(j11, obj));
    }

    @Override // ads_mobile_sdk.om3
    public final float c(long j11, Object obj) {
        switch (this.f16033b) {
        }
        return Float.intBitsToFloat(d(j11, obj));
    }

    @Override // ads_mobile_sdk.om3
    public final void a(Object obj, long j11, float f11) {
        switch (this.f16033b) {
            case 0:
                a(j11, obj, Float.floatToIntBits(f11));
                break;
            default:
                a(j11, obj, Float.floatToIntBits(f11));
                break;
        }
    }

    @Override // ads_mobile_sdk.om3
    public final boolean a(Object obj, long j11) {
        switch (this.f16033b) {
            case 0:
                if (pm3.f8325e) {
                    if (((byte) ((pm3.f8323c.d((-4) & j11, obj) >>> ((int) (((~j11) & 3) << 3))) & 255)) == 0) {
                    }
                } else {
                    if (((byte) ((pm3.f8323c.d((-4) & j11, obj) >>> ((int) ((j11 & 3) << 3))) & 255)) == 0) {
                    }
                }
                break;
            default:
                if (pm3.f8325e) {
                    if (((byte) ((pm3.f8323c.d((-4) & j11, obj) >>> ((int) (((~j11) & 3) << 3))) & 255)) == 0) {
                    }
                } else {
                    if (((byte) ((pm3.f8323c.d((-4) & j11, obj) >>> ((int) ((j11 & 3) << 3))) & 255)) == 0) {
                    }
                }
                break;
        }
        return false;
    }

    @Override // ads_mobile_sdk.om3
    public final void a(Object obj, long j11, boolean z11) {
        switch (this.f16033b) {
            case 0:
                if (pm3.f8325e) {
                    byte b11 = z11 ? (byte) 1 : (byte) 0;
                    long j12 = j11 & (-4);
                    om3 om3Var = pm3.f8323c;
                    int iD = om3Var.d(j12, obj);
                    int i5 = ((~((int) j11)) & 3) << 3;
                    om3Var.a(j12, obj, ((b11 & 255) << i5) | ((~(255 << i5)) & iD));
                    break;
                } else {
                    byte b12 = z11 ? (byte) 1 : (byte) 0;
                    long j13 = j11 & (-4);
                    om3 om3Var2 = pm3.f8323c;
                    int i11 = (((int) j11) & 3) << 3;
                    om3Var2.a(j13, obj, ((b12 & 255) << i11) | ((~(255 << i11)) & om3Var2.d(j13, obj)));
                    break;
                }
            default:
                if (pm3.f8325e) {
                    byte b13 = z11 ? (byte) 1 : (byte) 0;
                    long j14 = j11 & (-4);
                    om3 om3Var3 = pm3.f8323c;
                    int iD2 = om3Var3.d(j14, obj);
                    int i12 = ((~((int) j11)) & 3) << 3;
                    om3Var3.a(j14, obj, ((b13 & 255) << i12) | ((~(255 << i12)) & iD2));
                    break;
                } else {
                    byte b14 = z11 ? (byte) 1 : (byte) 0;
                    long j15 = j11 & (-4);
                    om3 om3Var4 = pm3.f8323c;
                    int i13 = (((int) j11) & 3) << 3;
                    om3Var4.a(j15, obj, ((b14 & 255) << i13) | ((~(255 << i13)) & om3Var4.d(j15, obj)));
                    break;
                }
        }
    }
}
