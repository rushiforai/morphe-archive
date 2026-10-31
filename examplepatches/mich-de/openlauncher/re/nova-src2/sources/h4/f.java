package h4;

import java.util.ArrayList;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class f implements d {

    /* renamed from: d, reason: collision with root package name */
    public final o f59110d;

    /* renamed from: f, reason: collision with root package name */
    public int f59112f;

    /* renamed from: g, reason: collision with root package name */
    public int f59113g;

    /* renamed from: a, reason: collision with root package name */
    public o f59107a = null;

    /* renamed from: b, reason: collision with root package name */
    public boolean f59108b = false;

    /* renamed from: c, reason: collision with root package name */
    public boolean f59109c = false;

    /* renamed from: e, reason: collision with root package name */
    public int f59111e = 1;

    /* renamed from: h, reason: collision with root package name */
    public int f59114h = 1;

    /* renamed from: i, reason: collision with root package name */
    public g f59115i = null;

    /* renamed from: j, reason: collision with root package name */
    public boolean f59116j = false;

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f59117k = new ArrayList();

    /* renamed from: l, reason: collision with root package name */
    public final ArrayList f59118l = new ArrayList();

    public f(o oVar) {
        this.f59110d = oVar;
    }

    @Override // h4.d
    public final void a(d dVar) {
        ArrayList arrayList = this.f59118l;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            if (!((f) it.next()).f59116j) {
                return;
            }
        }
        this.f59109c = true;
        o oVar = this.f59107a;
        if (oVar != null) {
            oVar.a(this);
        }
        if (this.f59108b) {
            this.f59110d.a(this);
            return;
        }
        Iterator it2 = arrayList.iterator();
        f fVar = null;
        int i5 = 0;
        while (it2.hasNext()) {
            f fVar2 = (f) it2.next();
            if (!(fVar2 instanceof g)) {
                i5++;
                fVar = fVar2;
            }
        }
        if (fVar != null && i5 == 1 && fVar.f59116j) {
            g gVar = this.f59115i;
            if (gVar != null) {
                if (!gVar.f59116j) {
                    return;
                } else {
                    this.f59112f = this.f59114h * gVar.f59113g;
                }
            }
            d(fVar.f59113g + this.f59112f);
        }
        o oVar2 = this.f59107a;
        if (oVar2 != null) {
            oVar2.a(this);
        }
    }

    public final void b(o oVar) {
        this.f59117k.add(oVar);
        if (this.f59116j) {
            oVar.a(oVar);
        }
    }

    public final void c() {
        this.f59118l.clear();
        this.f59117k.clear();
        this.f59116j = false;
        this.f59113g = 0;
        this.f59109c = false;
        this.f59108b = false;
    }

    public void d(int i5) {
        if (this.f59116j) {
            return;
        }
        this.f59116j = true;
        this.f59113g = i5;
        Iterator it = this.f59117k.iterator();
        while (it.hasNext()) {
            d dVar = (d) it.next();
            dVar.a(dVar);
        }
    }

    public final String toString() {
        String str;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f59110d.f59133b.f57095g0);
        sb2.append(":");
        switch (this.f59111e) {
            case 1:
                str = "UNKNOWN";
                break;
            case 2:
                str = "HORIZONTAL_DIMENSION";
                break;
            case 3:
                str = "VERTICAL_DIMENSION";
                break;
            case 4:
                str = "LEFT";
                break;
            case 5:
                str = "RIGHT";
                break;
            case 6:
                str = "TOP";
                break;
            case 7:
                str = "BOTTOM";
                break;
            case 8:
                str = "BASELINE";
                break;
            default:
                str = AbstractJsonLexerKt.NULL;
                break;
        }
        sb2.append(str);
        sb2.append("(");
        sb2.append(this.f59116j ? Integer.valueOf(this.f59113g) : "unresolved");
        sb2.append(") <t=");
        sb2.append(this.f59118l.size());
        sb2.append(":d=");
        sb2.append(this.f59117k.size());
        sb2.append(">");
        return sb2.toString();
    }
}
