package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bl4 implements dic {
    public final String a;
    public final bhc b;

    public bl4() {
        bhc bhcVar = bhc.Indefinite;
        bhcVar.getClass();
        this.a = "";
        this.b = bhcVar;
    }

    @Override // defpackage.dic
    public final String a() {
        return this.a;
    }

    @Override // defpackage.dic
    public final String b() {
        return null;
    }

    @Override // defpackage.dic
    public final boolean c() {
        return true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bl4)) {
            return false;
        }
        bl4 bl4Var = (bl4) obj;
        return this.a.equals(bl4Var.a) && this.b == bl4Var.b;
    }

    @Override // defpackage.dic
    public final bhc getDuration() {
        return this.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (((this.a.hashCode() * 961) + 1231) * 31);
    }

    public final String toString() {
        return "FirstRepostSnackbarVisuals(message=" + this.a + ", actionLabel=null, withDismissAction=true, duration=" + this.b + ")";
    }
}
