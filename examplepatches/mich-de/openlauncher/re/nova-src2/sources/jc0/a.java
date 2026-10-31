package jc0;

import java.util.Map;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class a extends dc0.b {

    /* renamed from: d, reason: collision with root package name */
    public final x60.e f69433d;

    public a(x60.e eVar, String str) {
        super(str);
        if (!(eVar instanceof dc0.b)) {
            throw new IllegalArgumentException("The parent unit: " + eVar + " is not an AbstractUnit");
        }
        dc0.b bVar = (dc0.b) eVar;
        x60.e eVarQ = bVar.q();
        if (bVar == eVarQ || bVar.equals(eVarQ)) {
            this.f69433d = eVar instanceof a ? ((a) eVar).f69433d : eVar;
            return;
        }
        throw new IllegalArgumentException("The parent unit: " + eVar + " is not an unscaled SI unit");
    }

    @Override // dc0.b, x60.e
    public final Map a() {
        return this.f69433d.a();
    }

    @Override // dc0.b, x60.e
    public final x60.b b() {
        return this.f69433d.b();
    }

    @Override // dc0.b
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof a) {
            a aVar = (a) obj;
            if (Objects.equals(this.f69433d, aVar.f69433d) && Objects.equals(this.f49218b, aVar.f49218b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.f69433d, this.f49218b);
    }

    @Override // dc0.b
    public final x60.f k() {
        return ((dc0.b) this.f69433d).k();
    }

    @Override // dc0.b
    public final x60.e q() {
        return this;
    }

    public a(x60.e eVar, String str, String str2) {
        this(eVar, str);
        this.f49217a = str2;
    }
}
