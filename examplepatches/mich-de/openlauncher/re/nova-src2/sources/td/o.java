package td;

import java.util.Set;

/* loaded from: classes.dex */
public final class o implements qd.g {

    /* renamed from: a, reason: collision with root package name */
    public final Set f88998a;

    /* renamed from: b, reason: collision with root package name */
    public final i f88999b;

    /* renamed from: c, reason: collision with root package name */
    public final q f89000c;

    public o(Set set, i iVar, q qVar) {
        this.f88998a = set;
        this.f88999b = iVar;
        this.f89000c = qVar;
    }

    public final p a(String str, qd.c cVar, qd.e eVar) {
        Set set = this.f88998a;
        if (set.contains(cVar)) {
            return new p(this.f88999b, str, cVar, eVar, this.f89000c);
        }
        throw new IllegalArgumentException(String.format("%s is not supported byt this factory. Supported encodings are: %s.", cVar, set));
    }
}
