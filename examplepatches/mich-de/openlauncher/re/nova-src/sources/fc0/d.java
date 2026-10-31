package fc0;

import aa.t;
import ai.r2;
import java.util.Objects;
import java.util.stream.Collectors;

/* loaded from: classes5.dex */
public final class d extends e {

    /* renamed from: f, reason: collision with root package name */
    public static final r2 f54602f = new r2(19);

    /* renamed from: d, reason: collision with root package name */
    public final x60.f f54603d;

    /* renamed from: e, reason: collision with root package name */
    public final x60.f f54604e;

    public d(x60.f fVar, x60.f fVar2) {
        if (fVar == null || fVar2 == null) {
            throw new IllegalArgumentException("Converters cannot be null");
        }
        this.f54603d = fVar;
        this.f54604e = fVar2;
    }

    @Override // x60.f
    public final boolean a() {
        return false;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        x60.f fVar = (x60.f) obj;
        if (this == fVar) {
            return 0;
        }
        if (!(fVar instanceof d)) {
            return -1;
        }
        d dVar = (d) fVar;
        x60.f fVar2 = dVar.f54603d;
        x60.f fVar3 = this.f54603d;
        r2 r2Var = f54602f;
        return Objects.compare(this.f54604e, dVar.f54604e, r2Var) + Objects.compare(fVar3, fVar2, r2Var);
    }

    @Override // x60.f
    public final boolean e() {
        return this.f54603d.e() && this.f54604e.e();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof d) {
            d dVar = (d) obj;
            if (Objects.equals(this.f54603d, dVar.f54603d) && Objects.equals(this.f54604e, dVar.f54604e)) {
                return true;
            }
        }
        return false;
    }

    @Override // fc0.e, x60.f
    public final /* bridge */ /* synthetic */ x60.f g() {
        return g();
    }

    @Override // fc0.e
    public final boolean h(e eVar) {
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.f54603d, this.f54604e);
    }

    @Override // fc0.e
    public final Number i(Number number) {
        x60.f fVar = this.f54603d;
        if (!(fVar instanceof e)) {
            throw new IllegalArgumentException("can only handle instances of AbstractConverter");
        }
        x60.f fVar2 = this.f54604e;
        if (fVar2 instanceof e) {
            return ((e) fVar).i(((e) fVar2).i(number));
        }
        throw new IllegalArgumentException("can only handle instances of AbstractConverter");
    }

    @Override // fc0.e
    public final e k() {
        return new d(this.f54604e.g(), this.f54603d.g());
    }

    @Override // fc0.e
    public final String m() {
        return String.format("%s", c().stream().map(new t(18)).collect(Collectors.joining(" ○ ")));
    }
}
