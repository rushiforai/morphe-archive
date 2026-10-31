package b10;

import b.u4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g2 extends h2 {

    /* renamed from: a, reason: collision with root package name */
    public final m1 f16688a;

    /* renamed from: b, reason: collision with root package name */
    public final List f16689b;

    /* renamed from: c, reason: collision with root package name */
    public final cy.g f16690c;

    /* renamed from: d, reason: collision with root package name */
    public final cy.g f16691d;

    /* renamed from: e, reason: collision with root package name */
    public final cy.g f16692e;

    /* renamed from: f, reason: collision with root package name */
    public final cy.m0 f16693f;

    /* renamed from: g, reason: collision with root package name */
    public final String f16694g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f16695h;

    public g2(m1 m1Var, List list, cy.g gVar, cy.g gVar2, cy.g gVar3, cy.m0 m0Var, String str, boolean z11) {
        this.f16688a = m1Var;
        this.f16689b = list;
        this.f16690c = gVar;
        this.f16691d = gVar2;
        this.f16692e = gVar3;
        this.f16693f = m0Var;
        this.f16694g = str;
        this.f16695h = z11;
    }

    public static g2 a(g2 g2Var, cy.m0 m0Var, String str, int i5) {
        m1 m1Var = g2Var.f16688a;
        List list = g2Var.f16689b;
        cy.g gVar = g2Var.f16690c;
        cy.g gVar2 = g2Var.f16691d;
        cy.g gVar3 = g2Var.f16692e;
        if ((i5 & 32) != 0) {
            m0Var = g2Var.f16693f;
        }
        cy.m0 m0Var2 = m0Var;
        if ((i5 & 64) != 0) {
            str = g2Var.f16694g;
        }
        return new g2(m1Var, list, gVar, gVar2, gVar3, m0Var2, str, g2Var.f16695h);
    }

    public final m1 b() {
        return this.f16688a;
    }

    public final cy.g c() {
        return this.f16691d;
    }

    public final cy.g d() {
        return this.f16692e;
    }

    public final boolean e() {
        return this.f16695h;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g2)) {
            return false;
        }
        g2 g2Var = (g2) obj;
        return Intrinsics.b(this.f16688a, g2Var.f16688a) && Intrinsics.b(this.f16689b, g2Var.f16689b) && Intrinsics.b(this.f16690c, g2Var.f16690c) && Intrinsics.b(this.f16691d, g2Var.f16691d) && Intrinsics.b(this.f16692e, g2Var.f16692e) && Intrinsics.b(this.f16693f, g2Var.f16693f) && Intrinsics.b(this.f16694g, g2Var.f16694g) && this.f16695h == g2Var.f16695h;
    }

    public final int hashCode() {
        int iC = u4.c(this.f16688a.hashCode() * 31, 31, this.f16689b);
        cy.g gVar = this.f16690c;
        int iHashCode = (iC + (gVar == null ? 0 : gVar.hashCode())) * 31;
        cy.g gVar2 = this.f16691d;
        int iHashCode2 = (iHashCode + (gVar2 == null ? 0 : gVar2.hashCode())) * 31;
        cy.g gVar3 = this.f16692e;
        return Boolean.hashCode(this.f16695h) + b.c0.e((this.f16693f.hashCode() + ((iHashCode2 + (gVar3 != null ? gVar3.hashCode() : 0)) * 31)) * 31, 31, this.f16694g);
    }

    public final String toString() {
        return "Ready(config=" + this.f16688a + ", features=" + this.f16689b + ", primeInfo=" + this.f16690c + ", plusInfo=" + this.f16691d + ", plusMonthlyInfo=" + this.f16692e + ", selectedTier=" + this.f16693f + ", selectedPlusPeriod=" + this.f16694g + ", isUpsellMode=" + this.f16695h + ")";
    }
}
