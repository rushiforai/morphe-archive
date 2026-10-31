package hv;

import b.c9;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h4 {

    /* renamed from: a, reason: collision with root package name */
    public final List f60296a;

    /* renamed from: b, reason: collision with root package name */
    public final ou.h0 f60297b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f60298c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f60299d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f60300e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f60301f;

    public h4(List list, ou.h0 h0Var, boolean z11, boolean z12, boolean z13, boolean z14) {
        this.f60296a = list;
        this.f60297b = h0Var;
        this.f60298c = z11;
        this.f60299d = z12;
        this.f60300e = z13;
        this.f60301f = z14;
    }

    public static h4 a(h4 h4Var, List list, ou.h0 h0Var, boolean z11, boolean z12, boolean z13, boolean z14, int i5) {
        if ((i5 & 1) != 0) {
            list = h4Var.f60296a;
        }
        List paymentOptionsItems = list;
        if ((i5 & 2) != 0) {
            h0Var = h4Var.f60297b;
        }
        ou.h0 h0Var2 = h0Var;
        if ((i5 & 4) != 0) {
            z11 = h4Var.f60298c;
        }
        boolean z15 = z11;
        if ((i5 & 8) != 0) {
            z12 = h4Var.f60299d;
        }
        boolean z16 = z12;
        if ((i5 & 16) != 0) {
            z13 = h4Var.f60300e;
        }
        boolean z17 = z13;
        if ((i5 & 32) != 0) {
            z14 = h4Var.f60301f;
        }
        h4Var.getClass();
        Intrinsics.g(paymentOptionsItems, "paymentOptionsItems");
        return new h4(paymentOptionsItems, h0Var2, z15, z16, z17, z14);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h4)) {
            return false;
        }
        h4 h4Var = (h4) obj;
        return Intrinsics.b(this.f60296a, h4Var.f60296a) && Intrinsics.b(this.f60297b, h4Var.f60297b) && this.f60298c == h4Var.f60298c && this.f60299d == h4Var.f60299d && this.f60300e == h4Var.f60300e && this.f60301f == h4Var.f60301f;
    }

    public final int hashCode() {
        int iHashCode = this.f60296a.hashCode() * 31;
        ou.h0 h0Var = this.f60297b;
        return Boolean.hashCode(this.f60301f) + c9.f(c9.f(c9.f((iHashCode + (h0Var == null ? 0 : h0Var.hashCode())) * 31, 31, this.f60298c), 31, this.f60299d), 31, this.f60300e);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("State(paymentOptionsItems=");
        sb2.append(this.f60296a);
        sb2.append(", selectedPaymentOptionsItem=");
        sb2.append(this.f60297b);
        sb2.append(", isEditing=");
        a80.m.s(sb2, this.f60298c, ", isProcessing=", this.f60299d, ", canEdit=");
        sb2.append(this.f60300e);
        sb2.append(", canRemove=");
        sb2.append(this.f60301f);
        sb2.append(")");
        return sb2.toString();
    }
}
