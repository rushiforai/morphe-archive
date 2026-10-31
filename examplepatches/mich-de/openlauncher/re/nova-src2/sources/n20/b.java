package n20;

import kw.p2;
import l10.z;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final p2 f77716a;

    /* renamed from: b, reason: collision with root package name */
    public final p2 f77717b;

    /* renamed from: c, reason: collision with root package name */
    public final p2 f77718c;

    /* renamed from: d, reason: collision with root package name */
    public final z f77719d;

    /* renamed from: e, reason: collision with root package name */
    public final p2 f77720e;

    /* renamed from: f, reason: collision with root package name */
    public final p2 f77721f;

    /* renamed from: g, reason: collision with root package name */
    public final p2 f77722g;

    /* renamed from: h, reason: collision with root package name */
    public final p2 f77723h;

    public b(p2 p2Var, p2 p2Var2, p2 p2Var3, z zVar, p2 p2Var4, p2 p2Var5, p2 p2Var6, p2 p2Var7) {
        this.f77716a = p2Var;
        this.f77717b = p2Var2;
        this.f77718c = p2Var3;
        this.f77719d = zVar;
        this.f77720e = p2Var4;
        this.f77721f = p2Var5;
        this.f77722g = p2Var6;
        this.f77723h = p2Var7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f77716a.equals(bVar.f77716a) && this.f77717b.equals(bVar.f77717b) && this.f77718c.equals(bVar.f77718c) && this.f77719d.equals(bVar.f77719d) && this.f77720e.equals(bVar.f77720e) && this.f77721f.equals(bVar.f77721f) && this.f77722g.equals(bVar.f77722g) && this.f77723h.equals(bVar.f77723h);
    }

    public final int hashCode() {
        return this.f77723h.hashCode() + ((this.f77722g.hashCode() + ((this.f77721f.hashCode() + ((this.f77720e.hashCode() + ((this.f77719d.hashCode() + ((this.f77718c.hashCode() + ((this.f77717b.hashCode() + ((this.f77716a.hashCode() - 1860743717) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "OneDriveApiParams(url=https://graph.microsoft.com/v1.0/me/drive/root/children, getDataArrayFromRoot=" + this.f77716a + ", getDisplayLabelForItem=" + this.f77717b + ", getContentUriForItem=" + this.f77718c + ", getImageUrlForItem=" + this.f77719d + ", isFolder=" + this.f77720e + ", hasChildren=" + this.f77721f + ", getPath=" + this.f77722g + ", nextPage=" + this.f77723h + ")";
    }
}
