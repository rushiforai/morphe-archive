package com.medium.android.catalogs.listscatalogselector;

import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import defpackage.bx6;
import defpackage.ek6;
import defpackage.em4;
import defpackage.iq1;
import defpackage.ir;
import defpackage.kn2;
import defpackage.m40;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.n92;
import defpackage.o7f;
import defpackage.p13;
import defpackage.pj3;
import defpackage.pu7;
import defpackage.s37;
import defpackage.u37;
import defpackage.v37;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.x47;
import defpackage.ym5;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006²\u0006\f\u0010\u0005\u001a\u00020\u00048\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/android/catalogs/listscatalogselector/ListsCatalogSelectorDialogFragment;", "Ld0;", "<init>", "()V", "Lk47;", "viewState", "catalogs_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ListsCatalogSelectorDialogFragment extends ym5 {
    public p13 H0;
    public kn2 I0;
    public final iq1 J0;

    public ListsCatalogSelectorDialogFragment() {
        bx6 bx6Var = new bx6(1, new em4(16, this));
        vq6 vq6VarD0 = vx0.d0(yw6.NONE, new ir(23, new ir(22, this)));
        this.J0 = m40.I(this, n1b.a.b(x47.class), new pj3(vq6VarD0, 3), new pj3(vq6VarD0, 4), bx6Var);
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        u37 u37Var = new u37(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new s37(this, u37Var, 0), true, 302955754));
        return composeView;
    }

    @Override // defpackage.j15
    public final void M(View view) {
        view.getClass();
        n92 n92Var = null;
        vx0.c0(o7f.x(q()), null, null, new v37(this, n92Var, 1), 3);
        vx0.c0(o7f.x(q()), null, null, new v37(this, n92Var, 3), 3);
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.I(false);
        bottomSheetBehavior.L(6);
        bottomSheetBehavior.K = true;
    }

    public final x47 g0() {
        return (x47) this.J0.getValue();
    }

    @Override // defpackage.fb3, android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        dialogInterface.getClass();
        super.onDismiss(dialogInterface);
        pu7 pu7Var = g0().k;
        pu7Var.getClass();
        ek6 ek6Var = ek6.ADD_TO_LIST_USES_COUNT;
        pu7Var.A(ek6Var, pu7Var.k(ek6Var, 0) + 1);
    }
}
