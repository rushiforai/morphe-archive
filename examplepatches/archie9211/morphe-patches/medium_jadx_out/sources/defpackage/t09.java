package defpackage;

import com.medium.android.unsplash.data.UnsplashPhoto;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t09 implements y09 {
    public final String a;
    public final UnsplashPhoto b;
    public final int c;
    public final int d;
    public final UnsplashPhoto e;

    public t09(UnsplashPhoto unsplashPhoto, String str) {
        str.getClass();
        unsplashPhoto.getClass();
        this.a = str;
        this.b = unsplashPhoto;
        this.c = unsplashPhoto.getWidth();
        this.d = unsplashPhoto.getHeight();
        this.e = unsplashPhoto;
    }

    @Override // defpackage.y09
    public final Integer a() {
        return Integer.valueOf(this.d);
    }

    @Override // defpackage.y09
    public final Integer b() {
        return Integer.valueOf(this.c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t09)) {
            return false;
        }
        t09 t09Var = (t09) obj;
        return g76.L(this.a, t09Var.a) && g76.L(this.b, t09Var.b);
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
        return "UploadFailedUnsplashImage(paragraphName=" + this.a + ", unsplashPhoto=" + this.b + ")";
    }
}
