package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uid {
    public static final mya d = new mya(new n2c(8), 3, new d3d(26));
    public final mx a;
    public final long b;
    public final bkd c;

    public uid(mx mxVar, long j, bkd bkdVar) {
        bkd bkdVar2;
        this.a = mxVar;
        this.b = lk7.s(mxVar.b.length(), j);
        if (bkdVar != null) {
            bkdVar2 = new bkd(lk7.s(mxVar.b.length(), bkdVar.a));
        } else {
            bkdVar2 = null;
        }
        this.c = bkdVar2;
    }

    public static uid a(uid uidVar, mx mxVar, long j, int i) {
        if ((i & 1) != 0) {
            mxVar = uidVar.a;
        }
        if ((i & 2) != 0) {
            j = uidVar.b;
        }
        bkd bkdVar = (i & 4) != 0 ? uidVar.c : null;
        uidVar.getClass();
        return new uid(mxVar, j, bkdVar);
    }

    public static uid b(uid uidVar, String str, long j, int i) {
        if ((i & 2) != 0) {
            j = uidVar.b;
        }
        bkd bkdVar = uidVar.c;
        uidVar.getClass();
        return new uid(new mx(str), j, bkdVar);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uid)) {
            return false;
        }
        uid uidVar = (uid) obj;
        return bkd.b(this.b, uidVar.b) && g76.L(this.c, uidVar.c) && g76.L(this.a, uidVar.a);
    }

    public final int hashCode() {
        int i;
        int iHashCode = this.a.hashCode() * 31;
        int i2 = bkd.c;
        long j = this.b;
        int i3 = (((int) (j ^ (j >>> 32))) + iHashCode) * 31;
        bkd bkdVar = this.c;
        if (bkdVar != null) {
            long j2 = bkdVar.a;
            i = (int) ((j2 >>> 32) ^ j2);
        } else {
            i = 0;
        }
        return i3 + i;
    }

    public final String toString() {
        return "TextFieldValue(text='" + ((Object) this.a) + "', selection=" + ((Object) bkd.h(this.b)) + ", composition=" + this.c + ')';
    }

    public uid(String str, int i, long j) {
        this(new mx((i & 1) != 0 ? "" : str), (i & 2) != 0 ? bkd.b : j, (bkd) null);
    }
}
