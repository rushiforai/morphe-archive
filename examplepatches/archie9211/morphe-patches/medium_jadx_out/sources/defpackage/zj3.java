package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zj3 {
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof zj3) && vj3.b(10.0f, 10.0f) && vj3.b(40.0f, 40.0f) && vj3.b(10.0f, 10.0f) && vj3.b(40.0f, 40.0f);
    }

    public final int hashCode() {
        return ((Float.floatToIntBits(40.0f) + km4.p(10.0f, km4.p(40.0f, Float.floatToIntBits(10.0f) * 31, 31), 31)) * 31) + 1231;
    }

    public final String toString() {
        return "DpTouchBoundsExpansion(start=" + ((Object) vj3.c(10.0f)) + ", top=" + ((Object) vj3.c(40.0f)) + ", end=" + ((Object) vj3.c(10.0f)) + ", bottom=" + ((Object) vj3.c(40.0f)) + ", isLayoutDirectionAware=true)";
    }
}
