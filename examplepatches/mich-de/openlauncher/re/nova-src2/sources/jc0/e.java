package jc0;

import java.util.Map;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class e extends dc0.b {

    /* renamed from: d, reason: collision with root package name */
    public final dc0.b f69440d;

    /* renamed from: e, reason: collision with root package name */
    public final x60.e f69441e;

    /* renamed from: f, reason: collision with root package name */
    public final x60.f f69442f;

    public e(String str, String str2, x60.e eVar, x60.e eVar2, x60.f fVar) {
        if (!(eVar instanceof dc0.b)) {
            throw new IllegalArgumentException("The parent unit: " + eVar + " is not an abstract unit.");
        }
        this.f69441e = eVar2;
        this.f69440d = (dc0.b) eVar;
        this.f69442f = fVar;
        this.f49218b = str;
        this.f49217a = str2;
    }

    @Override // dc0.b, x60.e
    public final Map a() {
        return this.f69440d.a();
    }

    @Override // dc0.b, x60.e
    public final x60.b b() {
        return this.f69440d.b();
    }

    @Override // dc0.b
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof e) {
            e eVar = (e) obj;
            if (Objects.equals(this.f69440d, eVar.f69440d) && Objects.equals(this.f69442f, eVar.f69442f)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.f69440d, this.f69442f);
    }

    @Override // dc0.b
    public final x60.f k() {
        return this.f69440d.k().d(this.f69442f);
    }

    @Override // dc0.b
    public final x60.e q() {
        x60.e eVar = this.f69441e;
        return eVar != null ? eVar : this.f69440d.q();
    }

    public e(x60.e eVar, x60.f fVar) {
        this(null, null, eVar, ((dc0.b) eVar).q(), fVar);
    }
}
