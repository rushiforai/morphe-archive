package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j7g extends o7g {
    public final String a;

    public j7g(String str) {
        this.a = str;
    }

    @Override // defpackage.o7g
    public final int a() {
        return o7g.d((byte) 96);
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        o7g o7gVar = (o7g) obj;
        int iA = o7gVar.a();
        int iD = o7g.d((byte) 96);
        if (iD != iA) {
            return iD - o7gVar.a();
        }
        String str = ((j7g) o7gVar).a;
        int length = str.length();
        String str2 = this.a;
        if (str2.length() == length) {
            return str2.compareTo(str);
        }
        return str2.length() - str.length();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && j7g.class == obj.getClass()) {
            return this.a.equals(((j7g) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(o7g.d((byte) 96)), this.a});
    }

    public final String toString() {
        return ka1.v(new StringBuilder("\""), this.a, "\"");
    }
}
