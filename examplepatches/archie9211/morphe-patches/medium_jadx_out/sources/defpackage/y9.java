package defpackage;

import android.app.PendingIntent;
import com.medium.android.catalogs.addnotetolistitem.AddNoteToListItemDialogFragment;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.navigation.s;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y9 implements sh9 {
    public final /* synthetic */ AddNoteToListItemDialogFragment a;
    public final /* synthetic */ ua b;

    public y9(AddNoteToListItemDialogFragment addNoteToListItemDialogFragment, ua uaVar) {
        this.a = addNoteToListItemDialogFragment;
        this.b = uaVar;
    }

    @Override // defpackage.sh9
    public final /* bridge */ void A(SourceParameter sourceParameter, String str, String str2, boolean z) {
        b09.a(sourceParameter, str, str2);
        throw null;
    }

    @Override // defpackage.sh9
    public final void B(String str, PostClientVisibilityState postClientVisibilityState, SourceParameter sourceParameter) {
        postClientVisibilityState.getClass();
        sourceParameter.getClass();
        ua uaVar = this.b;
        uaVar.getClass();
        b09.Y(uaVar.e, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, uaVar.h, gp7.u(sourceParameter), uaVar.n, false, 448);
    }

    @Override // defpackage.sh9
    public final void C(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new oa(uaVar, str, sourceParameter, null, 3), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void D(SourceParameter sourceParameter, String str, String str2, String str3) {
        b09.c(sourceParameter, str, str2, str3);
        throw null;
    }

    @Override // defpackage.sh9
    public final void E(String str, SourceParameter sourceParameter) {
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        ((p13) addNoteToListItemDialogFragment.f0()).y(addNoteToListItemDialogFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.sh9
    public final void F(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new qa((que) uaVar, str, true, sourceParameter, (n92) null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void G(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        b09.e(sourceParameter, str, str2, str3, str4);
        throw null;
    }

    @Override // defpackage.sh9
    public final void H(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new pa(uaVar, true, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void I(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new pa(uaVar, false, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void J(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        ((p13) addNoteToListItemDialogFragment.f0()).p0(addNoteToListItemDialogFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final /* bridge */ void K(SourceParameter sourceParameter, String str, String str2, boolean z) {
        b09.k(sourceParameter, str, str2);
        throw null;
    }

    @Override // defpackage.sh9
    public final void L(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new pa(uaVar, true, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void M(lj3 lj3Var, SourceParameter sourceParameter) {
        b09.d(sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new ra(uaVar, str2, str, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final void O(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new oa(uaVar, str, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        b09.j(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void b(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        ua uaVar = this.b;
        uaVar.getClass();
        uaVar.f.s(sourceParameter, str, str2, uaVar.h, uaVar.n);
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        s sVarF0 = addNoteToListItemDialogFragment.f0();
        ((p13) sVarF0).j0(addNoteToListItemDialogFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void c(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        ua uaVar = this.b;
        uaVar.getClass();
        uaVar.f.r(sourceParameter, str, str2, uaVar.h, uaVar.n);
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        s sVarF0 = addNoteToListItemDialogFragment.f0();
        ((p13) sVarF0).j0(addNoteToListItemDialogFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new oa(uaVar, str, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void i(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        ((p13) addNoteToListItemDialogFragment.f0()).Q(addNoteToListItemDialogFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void n(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        ((p13) addNoteToListItemDialogFragment.f0()).u0(addNoteToListItemDialogFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new qa((que) uaVar, str, false, sourceParameter, (n92) null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void p(String str, SourceParameter sourceParameter) {
        b09.f(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final /* bridge */ void q(String str, SourceParameter sourceParameter) {
        b09.g(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final /* bridge */ void r(String str, SourceParameter sourceParameter) {
        b09.b(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void s(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        ((p13) addNoteToListItemDialogFragment.f0()).m0(addNoteToListItemDialogFragment.S(), CatalogItemType.POST, str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final /* bridge */ void t(String str, SourceParameter sourceParameter) {
        b09.h(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void u(PostShareData postShareData, g08 g08Var) throws PendingIntent.CanceledException {
        postShareData.getClass();
        g08Var.getClass();
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        ((p13) addNoteToListItemDialogFragment.f0()).t0(addNoteToListItemDialogFragment.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
    }

    @Override // defpackage.sh9
    public final void v(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
    }

    @Override // defpackage.sh9
    public final void w(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        ((p13) addNoteToListItemDialogFragment.f0()).j(addNoteToListItemDialogFragment.S(), str, EntityType.AUTHOR, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void x(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new pa(uaVar, false, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ua uaVar = this.b;
        uaVar.getClass();
        vx0.c0(f76.F(uaVar), null, null, new oa(uaVar, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.sh9
    public final void z(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = this.a;
        b09.O(addNoteToListItemDialogFragment.f0(), addNoteToListItemDialogFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
    }
}
