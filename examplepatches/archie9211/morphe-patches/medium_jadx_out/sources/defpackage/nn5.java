package defpackage;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import com.medium.android.newsletters.consent.SubscribeToNewsletterConsentDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class nn5 extends d0 implements b75 {
    public vte C0;
    public volatile u60 E0;
    public boolean D0 = false;
    public final Object F0 = new Object();
    public boolean G0 = false;

    @Override // defpackage.fb3, defpackage.j15
    public final LayoutInflater F(Bundle bundle) {
        LayoutInflater layoutInflaterF = super.F(bundle);
        return layoutInflaterF.cloneInContext(new vte(layoutInflaterF, this));
    }

    @Override // defpackage.a75
    public final Object c() {
        if (this.E0 == null) {
            synchronized (this.F0) {
                try {
                    if (this.E0 == null) {
                        this.E0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.E0.c();
    }

    public final void e0() {
        if (this.C0 == null) {
            this.C0 = new vte(super.i(), this);
            this.D0 = bo.W(super.i());
        }
    }

    @Override // defpackage.j15, defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        return f49.C(this, super.getDefaultViewModelProviderFactory());
    }

    @Override // defpackage.j15
    public final Context i() {
        if (super.i() == null && !this.D0) {
            return null;
        }
        e0();
        return this.C0;
    }

    @Override // defpackage.j15
    public final void y(Activity activity) {
        this.E = true;
        vte vteVar = this.C0;
        gq7.l(vteVar == null || u60.d(vteVar) == activity, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
        e0();
        if (this.G0) {
            return;
        }
        this.G0 = true;
        ((SubscribeToNewsletterConsentDialogFragment) this).H0 = (rn2) ((fo2) ((iwc) c())).C.get();
    }

    @Override // defpackage.fb3, defpackage.j15
    public final void z(Context context) {
        super.z(context);
        e0();
        if (this.G0) {
            return;
        }
        this.G0 = true;
        ((SubscribeToNewsletterConsentDialogFragment) this).H0 = (rn2) ((fo2) ((iwc) c())).C.get();
    }
}
