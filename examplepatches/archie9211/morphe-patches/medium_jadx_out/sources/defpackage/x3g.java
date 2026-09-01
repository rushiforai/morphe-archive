package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x3g extends t0g {
    public final d1g a;
    public final String b;
    public final zwf c;
    public final t0g d;

    public x3g(d1g d1gVar, String str, zwf zwfVar, t0g t0gVar) {
        this.a = d1gVar;
        this.b = str;
        this.c = zwfVar;
        this.d = t0gVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.a != d1g.o;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof x3g) {
            x3g x3gVar = (x3g) obj;
            return x3gVar.c == this.c && x3gVar.d.equals(this.d) && x3gVar.b.equals(this.b) && x3gVar.a == this.a;
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(x3g.class, this.b, this.c, this.d, this.a);
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.c);
        return km4.C(y30.u("LegacyKmsEnvelopeAead Parameters (kekUri: ", this.b, ", dekParsingStrategy: ", strValueOf, ", dekParametersForNewKeys: "), String.valueOf(this.d), ", variant: ", String.valueOf(this.a), ")");
    }
}
