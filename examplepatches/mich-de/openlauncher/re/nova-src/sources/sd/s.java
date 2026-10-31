package sd;

import java.util.Arrays;

/* loaded from: classes.dex */
public final class s extends f0 {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f87212a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f87213b;

    public s(byte[] bArr, byte[] bArr2) {
        this.f87212a = bArr;
        this.f87213b = bArr2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof f0) {
            f0 f0Var = (f0) obj;
            boolean z11 = f0Var instanceof s;
            s sVar = (s) f0Var;
            if (Arrays.equals(this.f87212a, z11 ? sVar.f87212a : sVar.f87212a)) {
                s sVar2 = (s) f0Var;
                if (Arrays.equals(this.f87213b, z11 ? sVar2.f87213b : sVar2.f87213b)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((Arrays.hashCode(this.f87212a) ^ 1000003) * 1000003) ^ Arrays.hashCode(this.f87213b);
    }

    public final String toString() {
        return "ExperimentIds{clearBlob=" + Arrays.toString(this.f87212a) + ", encryptedBlob=" + Arrays.toString(this.f87213b) + "}";
    }
}
