package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ffe implements jfe {
    public final String a;
    public final boolean b;
    public final cfe c;
    public final SourceParameter d;
    public final boolean e;

    public ffe(String str, boolean z, cfe cfeVar, SourceParameter sourceParameter, boolean z2) {
        sourceParameter.getClass();
        this.a = str;
        this.b = z;
        this.c = cfeVar;
        this.d = sourceParameter;
        this.e = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ffe)) {
            return false;
        }
        ffe ffeVar = (ffe) obj;
        return this.a.equals(ffeVar.a) && this.b == ffeVar.b && this.c.equals(ffeVar.c) && g76.L(this.d, ffeVar.d) && this.e == ffeVar.e;
    }

    public final int hashCode() {
        return ev6.o(this.d, (this.c.hashCode() + (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31)) * 31, 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbD = ev6.D("Empty(userName=", this.a, ", isCurrentUser=", ", footerData=", this.b);
        sbD.append(this.c);
        sbD.append(", sourceParameter=");
        sbD.append(this.d);
        sbD.append(", isRefreshing=");
        return lv8.t(sbD, this.e, ")");
    }
}
