package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vl extends fp7 {
    public final int h;

    public vl(int i) {
        this.h = i;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof vl) && ((vl) obj).h == this.h;
    }

    public final int hashCode() {
        return this.h * 31;
    }
}
