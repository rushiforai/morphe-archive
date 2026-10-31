package j00;

import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import p1.y2;

/* loaded from: classes4.dex */
public final class h0 {

    /* renamed from: a, reason: collision with root package name */
    public final q00.l f68495a;

    /* renamed from: b, reason: collision with root package name */
    public final q00.l f68496b;

    /* renamed from: c, reason: collision with root package name */
    public final q00.l f68497c;

    /* renamed from: d, reason: collision with root package name */
    public final q00.l f68498d;

    /* renamed from: e, reason: collision with root package name */
    public final q00.l f68499e;

    /* renamed from: f, reason: collision with root package name */
    public final q00.l f68500f;

    /* renamed from: g, reason: collision with root package name */
    public final q00.l f68501g;

    public h0(q00.l lVar, q00.l lVar2, q00.l lVar3, q00.l lVar4, q00.l lVar5, q00.l lVar6, q00.l lVar7) {
        this.f68495a = lVar;
        this.f68496b = lVar2;
        this.f68497c = lVar3;
        this.f68498d = lVar4;
        this.f68499e = lVar5;
        this.f68500f = lVar6;
        this.f68501g = lVar7;
    }

    public final void a(b0 b0Var) {
        q00.l lVar = this.f68498d;
        y2 y2Var = lVar.f83363b;
        lVar.setValue(((Set) y2Var.getValue()).contains(b0Var) ? b70.n.Z((Set) y2Var.getValue(), b0Var) : b70.n.c0((Set) y2Var.getValue(), b0Var));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h0)) {
            return false;
        }
        h0 h0Var = (h0) obj;
        return Intrinsics.b(this.f68495a, h0Var.f68495a) && Intrinsics.b(this.f68496b, h0Var.f68496b) && Intrinsics.b(this.f68497c, h0Var.f68497c) && Intrinsics.b(this.f68498d, h0Var.f68498d) && Intrinsics.b(this.f68499e, h0Var.f68499e) && Intrinsics.b(this.f68500f, h0Var.f68500f) && Intrinsics.b(this.f68501g, h0Var.f68501g);
    }

    public final int hashCode() {
        return this.f68501g.hashCode() + ((this.f68500f.hashCode() + ((this.f68499e.hashCode() + ((this.f68498d.hashCode() + ((this.f68497c.hashCode() + ((this.f68496b.hashCode() + (this.f68495a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "MediaControlsModel(showInNovaNow=" + this.f68495a + ", showInDrawer=" + this.f68496b + ", preferSmallView=" + this.f68497c + ", actions=" + this.f68498d + ", spotifyRecommendations=" + this.f68499e + ", deezerRecommendations=" + this.f68500f + ", disabledPackages=" + this.f68501g + ")";
    }
}
