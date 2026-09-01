package defpackage;

import android.widget.ImageView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xs9 implements ou9 {
    public final String a;
    public final String b;
    public final String c;
    public final Integer d;
    public final Integer e;
    public final String f;
    public final ImageView g;
    public final cx7 h;

    public xs9(String str, String str2, String str3, Integer num, Integer num2, String str4, ImageView imageView, cx7 cx7Var) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = num;
        this.e = num2;
        this.f = str4;
        this.g = imageView;
        this.h = cx7Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xs9)) {
            return false;
        }
        xs9 xs9Var = (xs9) obj;
        return g76.L(this.a, xs9Var.a) && g76.L(this.b, xs9Var.b) && g76.L(this.c, xs9Var.c) && g76.L(this.d, xs9Var.d) && g76.L(this.e, xs9Var.e) && g76.L(this.f, xs9Var.f) && this.g.equals(xs9Var.g) && g76.L(this.h, xs9Var.h);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        Integer num = this.d;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.e;
        int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
        String str2 = this.f;
        int iHashCode4 = (this.g.hashCode() + ((iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31;
        cx7 cx7Var = this.h;
        return iHashCode4 + (cx7Var != null ? cx7Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("NavigateToImageCarousel(postId=", this.a, ", referrerSource=", this.b, ", selectedImageId=");
        sbU.append(this.c);
        sbU.append(", selectedImageOriginalWidth=");
        sbU.append(this.d);
        sbU.append(", selectedImageOriginalHeight=");
        sbU.append(this.e);
        sbU.append(", selectedImageAlt=");
        sbU.append(this.f);
        sbU.append(", selectedImageView=");
        sbU.append(this.g);
        sbU.append(", selectedImageMemoryCacheKey=");
        sbU.append(this.h);
        sbU.append(")");
        return sbU.toString();
    }
}
