package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l3g extends t0g {
    public final String a;
    public final d1g b;

    public l3g(String str, d1g d1gVar) {
        this.a = str;
        this.b = d1gVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.b != d1g.m;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof l3g) {
            l3g l3gVar = (l3g) obj;
            return l3gVar.a.equals(this.a) && l3gVar.b == this.b;
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(l3g.class, this.a, this.b);
    }

    public final String toString() {
        return ev6.y("LegacyKmsAead Parameters (keyUri: ", this.a, ", variant: ", String.valueOf(this.b), ")");
    }
}
