package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tga {
    public final String a;
    public final boolean b;

    public tga(String str, boolean z) {
        this.a = str;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tga)) {
            return false;
        }
        tga tgaVar = (tga) obj;
        return this.a.equals(tgaVar.a) && this.b == tgaVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return km4.z("SelectableImage(imageId=", ax5.a(this.a), ", isFeatured=", ")", this.b);
    }
}
