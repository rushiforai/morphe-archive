package mh;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class r0 extends s0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f76374a;

    public r0(String str) {
        this.f76374a = str;
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        s0 s0Var = (s0) obj;
        int iZza = s0Var.zza();
        int iC = s0.c((byte) 96);
        if (iC != iZza) {
            return iC - s0Var.zza();
        }
        String str = ((r0) s0Var).f76374a;
        int length = str.length();
        String str2 = this.f76374a;
        if (str2.length() == length) {
            return str2.compareTo(str);
        }
        return str2.length() - str.length();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && r0.class == obj.getClass()) {
            return this.f76374a.equals(((r0) obj).f76374a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(s0.c((byte) 96)), this.f76374a});
    }

    public final String toString() {
        return b.c0.q(new StringBuilder("\""), this.f76374a, "\"");
    }

    @Override // mh.s0
    public final int zza() {
        return s0.c((byte) 96);
    }
}
