package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class amb implements m3c {
    public final fb2 a;
    public final fb2 b;
    public final fb2 c;
    public final fb2 d;

    public amb(fb2 fb2Var, fb2 fb2Var2, fb2 fb2Var3, fb2 fb2Var4) {
        this.a = fb2Var;
        this.b = fb2Var2;
        this.c = fb2Var3;
        this.d = fb2Var4;
    }

    public static amb b(amb ambVar, fb2 fb2Var, fb2 fb2Var2, fb2 fb2Var3, fb2 fb2Var4, int i) {
        if ((i & 1) != 0) {
            fb2Var = ambVar.a;
        }
        if ((i & 2) != 0) {
            fb2Var2 = ambVar.b;
        }
        if ((i & 4) != 0) {
            fb2Var3 = ambVar.c;
        }
        if ((i & 8) != 0) {
            fb2Var4 = ambVar.d;
        }
        ambVar.getClass();
        return new amb(fb2Var, fb2Var2, fb2Var3, fb2Var4);
    }

    @Override // defpackage.m3c
    public final er7 a(long j, ip6 ip6Var, m73 m73Var) {
        float fA = this.a.a(j, m73Var);
        float fA2 = this.b.a(j, m73Var);
        float fA3 = this.c.a(j, m73Var);
        float fA4 = this.d.a(j, m73Var);
        float fC = dfc.c(j);
        float f = fA + fA4;
        if (f > fC) {
            float f2 = fC / f;
            fA *= f2;
            fA4 *= f2;
        }
        float f3 = fA2 + fA3;
        if (f3 > fC) {
            float f4 = fC / f3;
            fA2 *= f4;
            fA3 *= f4;
        }
        if (fA < 0.0f || fA2 < 0.0f || fA3 < 0.0f || fA4 < 0.0f) {
            e26.a("Corner size in Px can't be negative(topStart = " + fA + ", topEnd = " + fA2 + ", bottomEnd = " + fA3 + ", bottomStart = " + fA4 + ")!");
        }
        if (fA + fA2 + fA3 + fA4 == 0.0f) {
            return new ow8(lk7.l(0L, j));
        }
        zwa zwaVarL = lk7.l(0L, j);
        ip6 ip6Var2 = ip6.Ltr;
        float f5 = ip6Var == ip6Var2 ? fA : fA2;
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(f5)) << 32) | (((long) Float.floatToRawIntBits(f5)) & 4294967295L);
        if (ip6Var == ip6Var2) {
            fA = fA2;
        }
        long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(fA)) << 32) | (((long) Float.floatToRawIntBits(fA)) & 4294967295L);
        float f6 = ip6Var == ip6Var2 ? fA3 : fA4;
        long jFloatToRawIntBits3 = (((long) Float.floatToRawIntBits(f6)) << 32) | (((long) Float.floatToRawIntBits(f6)) & 4294967295L);
        if (ip6Var != ip6Var2) {
            fA4 = fA3;
        }
        return new pw8(new wlb(zwaVarL.a, zwaVarL.b, zwaVarL.c, zwaVarL.d, jFloatToRawIntBits, jFloatToRawIntBits2, jFloatToRawIntBits3, (((long) Float.floatToRawIntBits(fA4)) << 32) | (((long) Float.floatToRawIntBits(fA4)) & 4294967295L)));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof amb)) {
            return false;
        }
        amb ambVar = (amb) obj;
        return g76.L(this.a, ambVar.a) && g76.L(this.b, ambVar.b) && g76.L(this.c, ambVar.c) && g76.L(this.d, ambVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "RoundedCornerShape(topStart = " + this.a + ", topEnd = " + this.b + ", bottomEnd = " + this.c + ", bottomStart = " + this.d + ')';
    }
}
