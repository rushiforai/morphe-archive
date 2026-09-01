package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x6g extends o7g {
    public final boolean a;

    public x6g(boolean z) {
        this.a = z;
    }

    @Override // defpackage.o7g
    public final int a() {
        return o7g.d((byte) -32);
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        o7g o7gVar = (o7g) obj;
        int iA = o7gVar.a();
        int iD = o7g.d((byte) -32);
        if (iD != iA) {
            return iD - o7gVar.a();
        }
        return (true != this.a ? 20 : 21) - (true != ((x6g) o7gVar).a ? 20 : 21);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && x6g.class == obj.getClass() && this.a == ((x6g) obj).a;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(o7g.d((byte) -32)), Boolean.valueOf(this.a)});
    }

    public final String toString() {
        return Boolean.toString(this.a);
    }
}
