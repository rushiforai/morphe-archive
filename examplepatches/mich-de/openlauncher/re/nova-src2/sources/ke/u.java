package ke;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final int f71435a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f71436b;

    /* renamed from: c, reason: collision with root package name */
    public final int f71437c;

    /* renamed from: d, reason: collision with root package name */
    public final int f71438d;

    public u(int i5, int i11, int i12, byte[] bArr) {
        this.f71435a = i5;
        this.f71436b = bArr;
        this.f71437c = i11;
        this.f71438d = i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && u.class == obj.getClass()) {
            u uVar = (u) obj;
            if (this.f71435a == uVar.f71435a && this.f71437c == uVar.f71437c && this.f71438d == uVar.f71438d && Arrays.equals(this.f71436b, uVar.f71436b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((((Arrays.hashCode(this.f71436b) + (this.f71435a * 31)) * 31) + this.f71437c) * 31) + this.f71438d;
    }
}
