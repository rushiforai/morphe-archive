package defpackage;

import gen.model.ImageMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u09 implements y09 {
    public final String a;
    public final ImageMetadata b;
    public final Integer c;
    public final Integer d;
    public final ImageMetadata e;

    public u09(String str, ImageMetadata imageMetadata) {
        str.getClass();
        this.a = str;
        this.b = imageMetadata;
        this.c = imageMetadata.original_width;
        this.d = imageMetadata.original_height;
        this.e = imageMetadata;
    }

    @Override // defpackage.y09
    public final Integer a() {
        return this.d;
    }

    @Override // defpackage.y09
    public final Integer b() {
        return this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u09)) {
            return false;
        }
        u09 u09Var = (u09) obj;
        return g76.L(this.a, u09Var.a) && this.b.equals(u09Var.b);
    }

    @Override // defpackage.y09
    public final Object getData() {
        return this.e;
    }

    @Override // defpackage.y09
    public final String getParagraphName() {
        return this.a;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "UploadedImage(paragraphName=" + this.a + ", imageMetadata=" + this.b + ")";
    }
}
