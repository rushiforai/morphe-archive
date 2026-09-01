package defpackage;

import java.lang.annotation.Annotation;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f1b extends u0b implements o86 {
    public final d1b a;
    public final Annotation[] b;
    public final String c;
    public final boolean d;

    public f1b(d1b d1bVar, Annotation[] annotationArr, String str, boolean z) {
        annotationArr.getClass();
        this.a = d1bVar;
        this.b = annotationArr;
        this.c = str;
        this.d = z;
    }

    @Override // defpackage.o86
    public final f0b a(y05 y05Var) {
        y05Var.getClass();
        return vn7.w(this.b, y05Var);
    }

    @Override // defpackage.o86
    public final Collection getAnnotations() {
        return vn7.y(this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(f1b.class.getName());
        sb.append(": ");
        sb.append(this.d ? "vararg " : "");
        String str = this.c;
        sb.append(str != null ? n98.d(str) : null);
        sb.append(": ");
        sb.append(this.a);
        return sb.toString();
    }
}
