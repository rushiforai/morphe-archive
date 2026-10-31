package ads_mobile_sdk;

import androidx.room.o;

/* loaded from: classes2.dex */
public enum fk implements b.e5 {
    UNSUPPORTED(0),
    ARM7(2),
    X86(4),
    ARM64(5),
    X86_64(6),
    RISCV64(7),
    UNKNOWN(o.MAX_BIND_PARAMETER_CNT);


    /* renamed from: a, reason: collision with root package name */
    public final int f3374a;

    fk(int i5) {
        this.f3374a = i5;
    }

    public static fk a(int i5) {
        if (i5 == 0) {
            return UNSUPPORTED;
        }
        if (i5 == 2) {
            return ARM7;
        }
        if (i5 == 999) {
            return UNKNOWN;
        }
        if (i5 == 4) {
            return X86;
        }
        if (i5 == 5) {
            return ARM64;
        }
        if (i5 == 6) {
            return X86_64;
        }
        if (i5 != 7) {
            return null;
        }
        return RISCV64;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f3374a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "<" + fk.class.getName() + '@' + Integer.toHexString(System.identityHashCode(this)) + " number=" + this.f3374a + " name=" + name() + '>';
    }
}
