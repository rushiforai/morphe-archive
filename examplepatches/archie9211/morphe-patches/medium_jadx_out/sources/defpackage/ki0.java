package defpackage;

import androidx.work.impl.yX.VrhD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ki0 extends ld2 {
    public final long a;
    public final String b;
    public final fd2 c;
    public final gd2 d;
    public final hd2 e;
    public final kd2 f;

    public ki0(long j, String str, fd2 fd2Var, gd2 gd2Var, hd2 hd2Var, kd2 kd2Var) {
        this.a = j;
        this.b = str;
        this.c = fd2Var;
        this.d = gd2Var;
        this.e = hd2Var;
        this.f = kd2Var;
    }

    public final ji0 a() {
        ji0 ji0Var = new ji0();
        ji0Var.a = this.a;
        ji0Var.b = this.b;
        ji0Var.c = this.c;
        ji0Var.d = this.d;
        ji0Var.e = this.e;
        ji0Var.f = this.f;
        ji0Var.g = (byte) 1;
        return ji0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof ld2) {
            ki0 ki0Var = (ki0) ((ld2) obj);
            if (this.a == ki0Var.a && this.b.equals(ki0Var.b) && this.c.equals(ki0Var.c) && this.d.equals(ki0Var.d)) {
                hd2 hd2Var = ki0Var.e;
                hd2 hd2Var2 = this.e;
                if (hd2Var2 != null ? hd2Var2.equals(hd2Var) : hd2Var == null) {
                    kd2 kd2Var = ki0Var.f;
                    kd2 kd2Var2 = this.f;
                    if (kd2Var2 != null ? kd2Var2.equals(kd2Var) : kd2Var == null) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        int iHashCode = (((((((((int) (j ^ (j >>> 32))) ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003) ^ this.c.hashCode()) * 1000003) ^ this.d.hashCode()) * 1000003;
        hd2 hd2Var = this.e;
        int iHashCode2 = (iHashCode ^ (hd2Var == null ? 0 : hd2Var.hashCode())) * 1000003;
        kd2 kd2Var = this.f;
        return iHashCode2 ^ (kd2Var != null ? kd2Var.hashCode() : 0);
    }

    public final String toString() {
        return "Event{timestamp=" + this.a + ", type=" + this.b + ", app=" + this.c + ", device=" + this.d + ", log=" + this.e + ", rollouts=" + this.f + VrhD.uRjeAfKBcMALZGQ;
    }
}
