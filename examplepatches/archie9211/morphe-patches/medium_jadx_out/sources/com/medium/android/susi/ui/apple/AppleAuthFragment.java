package com.medium.android.susi.ui.apple;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import defpackage.b75;
import defpackage.bo;
import defpackage.f25;
import defpackage.f49;
import defpackage.fo2;
import defpackage.gq7;
import defpackage.ko2;
import defpackage.m60;
import defpackage.mz1;
import defpackage.n60;
import defpackage.u60;
import defpackage.uue;
import defpackage.vte;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/medium/android/susi/ui/apple/AppleAuthFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AppleAuthFragment extends AbstractMediumFragment implements b75 {
    public vte o0;
    public volatile u60 q0;
    public boolean p0 = false;
    public final Object r0 = new Object();
    public boolean s0 = false;

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new m60(this, 0), true, -71796767));
        return composeView;
    }

    @Override // defpackage.j15
    public final LayoutInflater F(Bundle bundle) {
        LayoutInflater layoutInflaterF = super.F(bundle);
        return layoutInflaterF.cloneInContext(new vte(layoutInflaterF, this));
    }

    public final void a0() {
        if (this.o0 == null) {
            this.o0 = new vte(super.i(), this);
            this.p0 = bo.W(super.i());
        }
    }

    public final void b0() {
        if (this.s0) {
            return;
        }
        this.s0 = true;
        fo2 fo2Var = (fo2) ((n60) c());
        fo2Var.getClass();
        this.m0 = true;
        ko2 ko2Var = fo2Var.b;
        this.n0 = ko2Var.s();
    }

    @Override // defpackage.a75
    public final Object c() {
        if (this.q0 == null) {
            synchronized (this.r0) {
                try {
                    if (this.q0 == null) {
                        this.q0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.q0.c();
    }

    public final void c0(AppleAuthResult appleAuthResult) {
        f25 f25VarM = m();
        Bundle bundle = new Bundle();
        bundle.putParcelable("apple_auth_result", appleAuthResult);
        f25VarM.Z("apple_auth_result", bundle);
    }

    @Override // defpackage.j15, defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        return f49.C(this, super.getDefaultViewModelProviderFactory());
    }

    @Override // defpackage.j15
    public final Context i() {
        if (super.i() == null && !this.p0) {
            return null;
        }
        a0();
        return this.o0;
    }

    @Override // defpackage.j15
    public final void y(Activity activity) {
        boolean z = true;
        this.E = true;
        vte vteVar = this.o0;
        if (vteVar != null && u60.d(vteVar) != activity) {
            z = false;
        }
        gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
        a0();
        b0();
    }

    @Override // defpackage.j15
    public final void z(Context context) {
        super.z(context);
        a0();
        b0();
    }
}
