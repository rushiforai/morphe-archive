package bp;

import java.net.URI;
import java.security.cert.X509Certificate;
import java.security.interfaces.RSAPublicKey;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class n extends d {
    public final lp.b o;

    /* renamed from: p, reason: collision with root package name */
    public final lp.b f18407p;

    /* renamed from: q, reason: collision with root package name */
    public final lp.b f18408q;

    /* renamed from: r, reason: collision with root package name */
    public final lp.b f18409r;

    /* renamed from: s, reason: collision with root package name */
    public final lp.b f18410s;

    /* renamed from: t, reason: collision with root package name */
    public final lp.b f18411t;

    /* renamed from: u, reason: collision with root package name */
    public final lp.b f18412u;

    /* renamed from: v, reason: collision with root package name */
    public final lp.b f18413v;

    /* renamed from: w, reason: collision with root package name */
    public final List f18414w;

    public n(lp.b bVar, lp.b bVar2, lp.b bVar3, lp.b bVar4, lp.b bVar5, lp.b bVar6, lp.b bVar7, lp.b bVar8, ArrayList arrayList, i iVar, LinkedHashSet linkedHashSet, uo.a aVar, String str, URI uri, lp.b bVar9, lp.b bVar10, LinkedList linkedList, Date date, Date date2, Date date3, g gVar) {
        lp.b bVar11;
        lp.b bVar12;
        super(h.f18391c, iVar, linkedHashSet, aVar, str, uri, bVar9, bVar10, linkedList, date, date2, date3, gVar);
        Objects.requireNonNull(bVar, "The modulus value must not be null");
        this.o = bVar;
        Objects.requireNonNull(bVar2, "The public exponent value must not be null");
        this.f18407p = bVar2;
        if (a() != null) {
            boolean zEquals = false;
            try {
                RSAPublicKey rSAPublicKey = (RSAPublicKey) ((X509Certificate) a().get(0)).getPublicKey();
                if (bVar2.b().equals(rSAPublicKey.getPublicExponent())) {
                    zEquals = bVar.b().equals(rSAPublicKey.getModulus());
                }
            } catch (ClassCastException unused) {
            }
            if (!zEquals) {
                throw new IllegalArgumentException("The public subject key info of the first X.509 certificate in the chain must match the JWK type and public parameters");
            }
        }
        this.f18408q = bVar3;
        if (bVar4 != null && bVar5 != null) {
            bVar11 = bVar7;
            if (bVar6 != null) {
                bVar12 = bVar8;
                if (bVar11 != null && bVar12 != null) {
                    this.f18409r = bVar4;
                    this.f18410s = bVar5;
                    this.f18411t = bVar6;
                    this.f18412u = bVar11;
                    this.f18413v = bVar12;
                    if (arrayList != null) {
                        this.f18414w = Collections.unmodifiableList(arrayList);
                        return;
                    } else {
                        this.f18414w = Collections.EMPTY_LIST;
                        return;
                    }
                }
            }
            if (bVar4 != null && bVar5 == null && bVar6 == null && bVar11 == null && bVar12 == null && arrayList == null) {
                this.f18409r = null;
                this.f18410s = null;
                this.f18411t = null;
                this.f18412u = null;
                this.f18413v = null;
                this.f18414w = Collections.EMPTY_LIST;
                return;
            }
            if (bVar4 == null || bVar5 != null || bVar6 != null || bVar11 != null || bVar12 != null) {
                Objects.requireNonNull(bVar4, "Incomplete second private (CRT) representation: The first prime factor must not be null");
                Objects.requireNonNull(bVar5, "Incomplete second private (CRT) representation: The second prime factor must not be null");
                Objects.requireNonNull(bVar6, "Incomplete second private (CRT) representation: The first factor CRT exponent must not be null");
                Objects.requireNonNull(bVar11, "Incomplete second private (CRT) representation: The second factor CRT exponent must not be null");
                throw new IllegalArgumentException("Incomplete second private (CRT) representation: The first CRT coefficient must not be null");
            }
            this.f18409r = null;
            this.f18410s = null;
            this.f18411t = null;
            this.f18412u = null;
            this.f18413v = null;
            this.f18414w = Collections.EMPTY_LIST;
            return;
        }
        bVar11 = bVar7;
        bVar12 = bVar8;
        if (bVar4 != null) {
        }
        if (bVar4 == null) {
        }
        Objects.requireNonNull(bVar4, "Incomplete second private (CRT) representation: The first prime factor must not be null");
        Objects.requireNonNull(bVar5, "Incomplete second private (CRT) representation: The second prime factor must not be null");
        Objects.requireNonNull(bVar6, "Incomplete second private (CRT) representation: The first factor CRT exponent must not be null");
        Objects.requireNonNull(bVar11, "Incomplete second private (CRT) representation: The second factor CRT exponent must not be null");
        throw new IllegalArgumentException("Incomplete second private (CRT) representation: The first CRT coefficient must not be null");
    }

    @Override // bp.d
    public final boolean b() {
        return (this.f18408q == null && this.f18409r == null) ? false : true;
    }

    @Override // bp.d
    public final HashMap d() {
        HashMap mapD = super.d();
        mapD.put("n", this.o.f75082a);
        mapD.put("e", this.f18407p.f75082a);
        lp.b bVar = this.f18408q;
        if (bVar != null) {
            mapD.put("d", bVar.f75082a);
        }
        lp.b bVar2 = this.f18409r;
        if (bVar2 != null) {
            mapD.put("p", bVar2.f75082a);
        }
        lp.b bVar3 = this.f18410s;
        if (bVar3 != null) {
            mapD.put("q", bVar3.f75082a);
        }
        lp.b bVar4 = this.f18411t;
        if (bVar4 != null) {
            mapD.put("dp", bVar4.f75082a);
        }
        lp.b bVar5 = this.f18412u;
        if (bVar5 != null) {
            mapD.put("dq", bVar5.f75082a);
        }
        lp.b bVar6 = this.f18413v;
        if (bVar6 != null) {
            mapD.put("qi", bVar6.f75082a);
        }
        List<m> list = this.f18414w;
        if (list != null && !list.isEmpty()) {
            int i5 = lp.c.f75083a;
            ArrayList arrayList = new ArrayList();
            for (m mVar : list) {
                cp.m mVar2 = lp.d.f75084a;
                HashMap map = new HashMap();
                map.put("r", mVar.f18404a.f75082a);
                map.put("d", mVar.f18405b.f75082a);
                map.put("t", mVar.f18406c.f75082a);
                arrayList.add(map);
            }
            mapD.put("oth", arrayList);
        }
        return mapD;
    }

    @Override // bp.d
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n) || !super.equals(obj)) {
            return false;
        }
        n nVar = (n) obj;
        return Objects.equals(this.o, nVar.o) && Objects.equals(this.f18407p, nVar.f18407p) && Objects.equals(this.f18408q, nVar.f18408q) && Objects.equals(this.f18409r, nVar.f18409r) && Objects.equals(this.f18410s, nVar.f18410s) && Objects.equals(this.f18411t, nVar.f18411t) && Objects.equals(this.f18412u, nVar.f18412u) && Objects.equals(this.f18413v, nVar.f18413v) && Objects.equals(this.f18414w, nVar.f18414w);
    }

    @Override // bp.d
    public final int hashCode() {
        return Objects.hash(Integer.valueOf(super.hashCode()), this.o, this.f18407p, this.f18408q, this.f18409r, this.f18410s, this.f18411t, this.f18412u, this.f18413v, this.f18414w, null);
    }
}
