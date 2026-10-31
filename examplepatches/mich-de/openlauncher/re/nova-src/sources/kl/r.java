package kl;

import pl.b2;

/* loaded from: classes3.dex */
public final class r extends el.g {

    /* renamed from: a, reason: collision with root package name */
    public final String f71631a;

    /* renamed from: b, reason: collision with root package name */
    public final b2 f71632b;

    public r(String str, b2 b2Var) {
        this.f71631a = str;
        this.f71632b = b2Var;
    }

    @Override // el.g
    public final boolean a() {
        return this.f71632b != b2.RAW;
    }

    public final String toString() {
        int iOrdinal = this.f71632b.ordinal();
        return b.c0.n("(typeUrl=", this.f71631a, ", outputPrefixType=", iOrdinal != 1 ? iOrdinal != 2 ? iOrdinal != 3 ? iOrdinal != 4 ? "UNKNOWN" : "CRUNCHY" : "RAW" : "LEGACY" : "TINK", ")");
    }
}
