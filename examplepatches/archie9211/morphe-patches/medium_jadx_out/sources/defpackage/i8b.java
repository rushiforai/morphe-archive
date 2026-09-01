package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i8b {
    public final boolean a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final bo4 f;
    public final String g;
    public final boolean h;
    public final boolean i;
    public final boolean j;
    public final boolean k;

    public i8b(boolean z, boolean z2, boolean z3, boolean z4, boolean z5, bo4 bo4Var, String str, boolean z6, boolean z7, boolean z8) {
        this.a = z;
        this.b = z2;
        this.c = z3;
        this.d = z4;
        this.e = z5;
        this.f = bo4Var;
        this.g = str;
        this.h = z6;
        this.i = z7;
        this.j = z8;
        this.k = z || z2 || z3 || z4 || z5 || z6 || z7 || z8;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i8b)) {
            return false;
        }
        i8b i8bVar = (i8b) obj;
        return this.a == i8bVar.a && this.b == i8bVar.b && this.c == i8bVar.c && this.d == i8bVar.d && this.e == i8bVar.e && this.f.equals(i8bVar.f) && g76.L(this.g, i8bVar.g) && this.h == i8bVar.h && this.i == i8bVar.i && this.j == i8bVar.j;
    }

    public final int hashCode() {
        int iA = ka1.a(this.f, (((((((((this.a ? 1231 : 1237) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31, 31);
        String str = this.g;
        return ((((((iA + (str == null ? 0 : str.hashCode())) * 31) + (this.h ? 1231 : 1237)) * 31) + (this.i ? 1231 : 1237)) * 31) + (this.j ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MenuOptions(canEditNote=");
        sb.append(this.a);
        sb.append(", canRemoveNote=");
        sb.append(this.b);
        sb.append(", canAddNote=");
        ho2.R(sb, this.c, ", canDeleteRepost=", this.d, ", canSaveStory=");
        sb.append(this.e);
        sb.append(", reposterFollowStateStream=");
        sb.append(this.f);
        sb.append(", reposterNewsletterId=");
        ka1.D(sb, this.g, ", canFollowReposter=", this.h, ", canBlockReposter=");
        return b09.C(sb, this.i, kSWQKWZ.RghVMCEYzRKLw, this.j, ")");
    }
}
