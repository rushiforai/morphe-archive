package c60;

import b.c0;
import java.io.Serializable;

/* loaded from: classes4.dex */
public final class g implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public boolean f19805a;

    /* renamed from: b, reason: collision with root package name */
    public int f19806b;

    /* renamed from: c, reason: collision with root package name */
    public long f19807c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f19808d;

    /* renamed from: e, reason: collision with root package name */
    public String f19809e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f19810f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f19811g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f19812h;

    /* renamed from: i, reason: collision with root package name */
    public int f19813i;

    /* renamed from: j, reason: collision with root package name */
    public String f19814j;

    /* renamed from: k, reason: collision with root package name */
    public int f19815k;

    /* renamed from: l, reason: collision with root package name */
    public String f19816l;

    public final boolean equals(Object obj) {
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        if (this == gVar) {
            return true;
        }
        return this.f19806b == gVar.f19806b && this.f19807c == gVar.f19807c && this.f19809e.equals(gVar.f19809e) && this.f19811g == gVar.f19811g && this.f19813i == gVar.f19813i && this.f19814j.equals(gVar.f19814j) && this.f19815k == gVar.f19815k && this.f19816l.equals(gVar.f19816l);
    }

    public final int hashCode() {
        return ((this.f19816l.hashCode() + ((c0.F(this.f19815k) + c0.e((((c0.e((Long.valueOf(this.f19807c).hashCode() + ((2173 + this.f19806b) * 53)) * 53, 53, this.f19809e) + (this.f19811g ? 1231 : 1237)) * 53) + this.f19813i) * 53, 53, this.f19814j)) * 53)) * 53) + 1237;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Country Code: ");
        sb2.append(this.f19806b);
        sb2.append(" National Number: ");
        sb2.append(this.f19807c);
        if (this.f19810f && this.f19811g) {
            sb2.append(" Leading Zero(s): true");
        }
        if (this.f19812h) {
            sb2.append(" Number of leading zeros: ");
            sb2.append(this.f19813i);
        }
        if (this.f19808d) {
            sb2.append(" Extension: ");
            sb2.append(this.f19809e);
        }
        return sb2.toString();
    }
}
