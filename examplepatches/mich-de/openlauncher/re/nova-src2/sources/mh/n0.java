package mh;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class n0 extends s0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f76361a;

    public n0(boolean z11) {
        this.f76361a = z11;
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        s0 s0Var = (s0) obj;
        int iZza = s0Var.zza();
        int iC = s0.c((byte) -32);
        if (iC != iZza) {
            return iC - s0Var.zza();
        }
        return (true != this.f76361a ? 20 : 21) - (true != ((n0) s0Var).f76361a ? 20 : 21);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && n0.class == obj.getClass() && this.f76361a == ((n0) obj).f76361a;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(s0.c((byte) -32)), Boolean.valueOf(this.f76361a)});
    }

    public final String toString() {
        return Boolean.toString(this.f76361a);
    }

    @Override // mh.s0
    public final int zza() {
        return s0.c((byte) -32);
    }
}
