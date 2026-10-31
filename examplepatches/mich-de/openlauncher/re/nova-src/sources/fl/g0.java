package fl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class g0 extends c {

    /* renamed from: a, reason: collision with root package name */
    public final b0 f55313a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55314b;

    /* renamed from: c, reason: collision with root package name */
    public final b0 f55315c;

    /* renamed from: d, reason: collision with root package name */
    public final c f55316d;

    public g0(b0 b0Var, String str, b0 b0Var2, c cVar) {
        this.f55313a = b0Var;
        this.f55314b = str;
        this.f55315c = b0Var2;
        this.f55316d = cVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f55313a != b0.f55293l;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof g0)) {
            return false;
        }
        g0 g0Var = (g0) obj;
        return g0Var.f55315c.equals(this.f55315c) && g0Var.f55316d.equals(this.f55316d) && g0Var.f55314b.equals(this.f55314b) && g0Var.f55313a.equals(this.f55313a);
    }

    public final int hashCode() {
        return Objects.hash(g0.class, this.f55314b, this.f55315c, this.f55316d, this.f55313a);
    }

    public final String toString() {
        return "LegacyKmsEnvelopeAead Parameters (kekUri: " + this.f55314b + ", dekParsingStrategy: " + this.f55315c + ", dekParametersForNewKeys: " + this.f55316d + ", variant: " + this.f55313a + ")";
    }
}
