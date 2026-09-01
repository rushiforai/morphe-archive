package defpackage;

import j$.util.Objects;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class m21 implements Cloneable {
    public final char[] a;
    public long b = -1;
    public long c = Long.MAX_VALUE;
    public l21 d;

    public m21(char[] cArr) {
        this.a = cArr;
    }

    @Override // 
    public m21 d() {
        try {
            return (m21) super.clone();
        } catch (CloneNotSupportedException unused) {
            ywb.d();
            return null;
        }
    }

    public final String e() {
        String str = new String(this.a);
        if (str.length() < 1) {
            return "";
        }
        long j = this.c;
        if (j != Long.MAX_VALUE) {
            long j2 = this.b;
            if (j >= j2) {
                return str.substring((int) j2, ((int) j) + 1);
            }
        }
        long j3 = this.b;
        return str.substring((int) j3, ((int) j3) + 1);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m21)) {
            return false;
        }
        m21 m21Var = (m21) obj;
        if (this.b == m21Var.b && this.c == m21Var.c && Arrays.equals(this.a, m21Var.a)) {
            return Objects.equals(this.d, m21Var.d);
        }
        return false;
    }

    public int hashCode() {
        int iHashCode = Arrays.hashCode(this.a) * 31;
        long j = this.b;
        int i = (iHashCode + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.c;
        int i2 = (i + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        l21 l21Var = this.d;
        return (i2 + (l21Var != null ? l21Var.hashCode() : 0)) * 31;
    }

    public float q() {
        if (this instanceof o21) {
            return ((o21) this).q();
        }
        return Float.NaN;
    }

    public int r() {
        if (this instanceof o21) {
            return ((o21) this).r();
        }
        return 0;
    }

    public final String s() {
        String string = getClass().toString();
        return string.substring(string.lastIndexOf(46) + 1);
    }

    public final void t(long j) {
        if (this.c != Long.MAX_VALUE) {
            return;
        }
        this.c = j;
        l21 l21Var = this.d;
        if (l21Var != null) {
            l21Var.u(this);
        }
    }

    public String toString() {
        long j = this.b;
        long j2 = this.c;
        if (j > j2 || j2 == Long.MAX_VALUE) {
            StringBuilder sb = new StringBuilder();
            sb.append(getClass());
            sb.append(" (INVALID, ");
            sb.append(this.b);
            sb.append("-");
            return ev6.t(this.c, ")", sb);
        }
        return s() + " (" + this.b + " : " + this.c + ") <<" + new String(this.a).substring((int) this.b, ((int) this.c) + 1) + ">>";
    }
}
