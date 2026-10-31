package un;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final h f91366a;

    /* renamed from: b, reason: collision with root package name */
    public final h f91367b;

    /* renamed from: c, reason: collision with root package name */
    public final e f91368c;

    /* renamed from: d, reason: collision with root package name */
    public final g f91369d;

    public c(e eVar, g gVar, h hVar, h hVar2) {
        this.f91368c = eVar;
        this.f91369d = gVar;
        this.f91366a = hVar;
        this.f91367b = hVar2;
    }

    public static c a(e eVar, g gVar, h hVar, h hVar2) {
        if (hVar == h.NONE) {
            throw new IllegalArgumentException("Impression owner is none");
        }
        e eVar2 = e.DEFINED_BY_JAVASCRIPT;
        h hVar3 = h.NATIVE;
        if (eVar == eVar2 && hVar == hVar3) {
            throw new IllegalArgumentException("ImpressionType/CreativeType can only be defined as DEFINED_BY_JAVASCRIPT if Impression Owner is JavaScript");
        }
        if (gVar == g.DEFINED_BY_JAVASCRIPT && hVar == hVar3) {
            throw new IllegalArgumentException("ImpressionType/CreativeType can only be defined as DEFINED_BY_JAVASCRIPT if Impression Owner is JavaScript");
        }
        return new c(eVar, gVar, hVar, hVar2);
    }
}
