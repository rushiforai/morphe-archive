package bp;

import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Objects;
import java.util.Set;

/* loaded from: classes4.dex */
public final class k extends d {

    /* renamed from: t, reason: collision with root package name */
    public static final Set f18399t = Collections.unmodifiableSet(new HashSet(Arrays.asList(a.f18349h, a.f18350i, a.f18351j, a.f18352k)));
    public final a o;

    /* renamed from: p, reason: collision with root package name */
    public final lp.b f18400p;

    /* renamed from: q, reason: collision with root package name */
    public final byte[] f18401q;

    /* renamed from: r, reason: collision with root package name */
    public final lp.b f18402r;

    /* renamed from: s, reason: collision with root package name */
    public final byte[] f18403s;

    public k(a aVar, lp.b bVar, i iVar, LinkedHashSet linkedHashSet, uo.a aVar2, String str, URI uri, lp.b bVar2, lp.b bVar3, LinkedList linkedList, Date date, Date date2, Date date3, g gVar) {
        super(h.f18393e, iVar, linkedHashSet, aVar2, str, uri, bVar2, bVar3, linkedList, date, date2, date3, gVar);
        Objects.requireNonNull(aVar, "The curve must not be null");
        if (!f18399t.contains(aVar)) {
            throw new IllegalArgumentException("Unknown / unsupported curve: " + aVar);
        }
        this.o = aVar;
        Objects.requireNonNull(bVar, "The x parameter must not be null");
        this.f18400p = bVar;
        this.f18401q = bVar.a();
        this.f18402r = null;
        this.f18403s = null;
    }

    @Override // bp.d
    public final boolean b() {
        return this.f18402r != null;
    }

    @Override // bp.d
    public final HashMap d() {
        HashMap mapD = super.d();
        mapD.put("crv", this.o.f18353a);
        mapD.put("x", this.f18400p.f75082a);
        lp.b bVar = this.f18402r;
        if (bVar != null) {
            mapD.put("d", bVar.f75082a);
        }
        return mapD;
    }

    @Override // bp.d
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k) || !super.equals(obj)) {
            return false;
        }
        k kVar = (k) obj;
        return Objects.equals(this.o, kVar.o) && Objects.equals(this.f18400p, kVar.f18400p) && Arrays.equals(this.f18401q, kVar.f18401q) && Objects.equals(this.f18402r, kVar.f18402r) && Arrays.equals(this.f18403s, kVar.f18403s);
    }

    @Override // bp.d
    public final int hashCode() {
        return Arrays.hashCode(this.f18403s) + ((Arrays.hashCode(this.f18401q) + (Objects.hash(Integer.valueOf(super.hashCode()), this.o, this.f18400p, this.f18402r) * 31)) * 31);
    }

    public k(a aVar, lp.b bVar, lp.b bVar2, i iVar, LinkedHashSet linkedHashSet, uo.a aVar2, String str, URI uri, lp.b bVar3, lp.b bVar4, LinkedList linkedList, Date date, Date date2, Date date3, g gVar) {
        super(h.f18393e, iVar, linkedHashSet, aVar2, str, uri, bVar3, bVar4, linkedList, date, date2, date3, gVar);
        Objects.requireNonNull(aVar, "The curve must not be null");
        if (f18399t.contains(aVar)) {
            this.o = aVar;
            Objects.requireNonNull(bVar, "The x parameter must not be null");
            this.f18400p = bVar;
            this.f18401q = bVar.a();
            this.f18402r = bVar2;
            this.f18403s = bVar2.a();
            return;
        }
        throw new IllegalArgumentException("Unknown / unsupported curve: " + aVar);
    }
}
