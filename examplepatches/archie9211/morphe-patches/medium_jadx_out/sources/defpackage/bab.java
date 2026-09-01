package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bab implements dab {
    public final hne a;
    public final String b;
    public final boolean c;
    public final aab d;

    public bab(hne hneVar, String str, boolean z, aab aabVar) {
        str.getClass();
        this.a = hneVar;
        this.b = str;
        this.c = z;
        this.d = aabVar;
    }

    public final bab a(boolean z) {
        aab aabVar = this.d;
        aab aabVar2 = new aab(aabVar.a, !z, z, aabVar.d, aabVar.e);
        String str = this.b;
        str.getClass();
        return new bab(this.a, str, z, aabVar2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bab)) {
            return false;
        }
        bab babVar = (bab) obj;
        return this.a.equals(babVar.a) && g76.L(this.b, babVar.b) && this.c == babVar.c && this.d.equals(babVar.d);
    }

    @Override // defpackage.dab
    public final String getKey() {
        return this.a.a;
    }

    public final int hashCode() {
        return this.d.hashCode() + ((wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "WithNote(user=" + this.a + ", note=" + this.b + ", isNoteHidden=" + this.c + ", menuOptions=" + this.d + ")";
    }
}
