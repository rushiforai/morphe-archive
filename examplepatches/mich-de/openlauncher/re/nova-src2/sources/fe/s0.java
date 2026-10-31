package fe;

import android.net.Uri;

/* loaded from: classes3.dex */
public final class s0 implements e {

    /* renamed from: c, reason: collision with root package name */
    public static final s0 f54981c = new s0(new mg.l(29, false));

    /* renamed from: d, reason: collision with root package name */
    public static final ep.c f54982d = new ep.c(11);

    /* renamed from: a, reason: collision with root package name */
    public final Uri f54983a;

    /* renamed from: b, reason: collision with root package name */
    public final String f54984b;

    public s0(mg.l lVar) {
        this.f54983a = (Uri) lVar.f76309b;
        this.f54984b = (String) lVar.f76310c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s0)) {
            return false;
        }
        s0 s0Var = (s0) obj;
        return wf.v.a(this.f54983a, s0Var.f54983a) && wf.v.a(this.f54984b, s0Var.f54984b);
    }

    public final int hashCode() {
        Uri uri = this.f54983a;
        int iHashCode = (uri == null ? 0 : uri.hashCode()) * 31;
        String str = this.f54984b;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }
}
