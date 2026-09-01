package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class khc implements dic {
    public final String a;
    public final String b;
    public final boolean c;
    public final bhc d;

    public khc(String str, String str2, boolean z, bhc bhcVar) {
        this.a = str;
        this.b = str2;
        this.c = z;
        this.d = bhcVar;
    }

    @Override // defpackage.dic
    public final String a() {
        return this.a;
    }

    @Override // defpackage.dic
    public final String b() {
        return this.b;
    }

    @Override // defpackage.dic
    public final boolean c() {
        return this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || khc.class != obj.getClass()) {
            return false;
        }
        khc khcVar = (khc) obj;
        return g76.L(this.a, khcVar.a) && g76.L(this.b, khcVar.b) && this.c == khcVar.c && this.d == khcVar.d;
    }

    @Override // defpackage.dic
    public final bhc getDuration() {
        return this.d;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.d.hashCode() + ((((iHashCode + (str != null ? str.hashCode() : 0)) * 31) + (this.c ? 1231 : 1237)) * 31);
    }
}
