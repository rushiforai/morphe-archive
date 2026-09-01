package com.medium.android.donkey.main;

import android.content.Intent;
import android.os.Bundle;
import androidx.compose.ui.platform.ComposeView;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.medium.android.core.navigation.s;
import defpackage.ax2;
import defpackage.b75;
import defpackage.bf7;
import defpackage.bx6;
import defpackage.df7;
import defpackage.ek6;
import defpackage.f49;
import defpackage.f76;
import defpackage.g7;
import defpackage.g76;
import defpackage.h10;
import defpackage.iq1;
import defpackage.k7;
import defpackage.kf7;
import defpackage.lv5;
import defpackage.mya;
import defpackage.n1b;
import defpackage.n32;
import defpackage.n92;
import defpackage.o41;
import defpackage.ov6;
import defpackage.p13;
import defpackage.pu7;
import defpackage.py2;
import defpackage.q6;
import defpackage.sg7;
import defpackage.t7;
import defpackage.te7;
import defpackage.ue7;
import defpackage.uue;
import defpackage.vpc;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wm2;
import defpackage.xe7;
import defpackage.xpc;
import defpackage.ye7;
import defpackage.yw6;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class MainActivity extends lv5 implements b75 {
    public static final /* synthetic */ int H = 0;
    public final vq6 A;
    public final ue7 B;
    public final k7 C;
    public final ye7 D;
    public final xe7 E;
    public final bf7 F;
    public final vq6 G;
    public volatile q6 n;
    public final Object o = new Object();
    public boolean p = false;
    public mya q;
    public o41 r;
    public n32 s;
    public ax2 t;
    public p13 u;
    public py2 v;
    public String w;
    public wm2 x;
    public final iq1 y;
    public iq1 z;

    public MainActivity() {
        addOnContextAvailableListener(new h10(this, 4));
        int i = 2;
        this.y = new iq1(n1b.a.b(sg7.class), new df7(this, 0), new bx6(i, new te7(this, i)), new df7(this, 1));
        yw6 yw6Var = yw6.NONE;
        this.A = vx0.d0(yw6Var, new ov6(12));
        this.B = new ue7(this);
        int i2 = 3;
        this.C = registerForActivityResult(new g7(i2), new t7(i, this));
        this.D = new ye7(this);
        this.E = new xe7(this);
        this.F = new bf7(this);
        this.G = vx0.d0(yw6Var, new te7(this, i2));
    }

    @Override // defpackage.a75
    public final Object c() {
        return r().c();
    }

    @Override // defpackage.xy1, defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        return f49.A(this, super.getDefaultViewModelProviderFactory());
    }

    @Override // defpackage.m15, defpackage.xy1, android.app.Activity
    public final void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        o41 o41Var = this.r;
        if (o41Var != null) {
            o41Var.a(i, i2, intent);
        } else {
            g76.g0("facebookCallbackManager");
            throw null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x0176  */
    @Override // defpackage.lv5, defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onCreate(android.os.Bundle r13) {
        /*
            Method dump skipped, instruction units count: 584
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.main.MainActivity.onCreate(android.os.Bundle):void");
    }

    @Override // defpackage.n1, defpackage.i10, defpackage.m15, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        r().a();
    }

    @Override // defpackage.n1, defpackage.m15, android.app.Activity
    public final void onResume() {
        super.onResume();
        sg7 sg7VarV = v();
        pu7 pu7Var = sg7VarV.b;
        pu7Var.getClass();
        ek6 ek6Var = ek6.HAS_PUBLISHED_A_POST;
        int i = 3;
        n92 n92Var = null;
        if (pu7Var.j(ek6Var, false)) {
            pu7Var.z(ek6Var, false);
            vx0.c0(f76.F(sg7VarV), null, null, new kf7(sg7VarV, n92Var, 2), 3);
        }
        vx0.c0(f76.F(sg7VarV), null, null, new kf7(sg7VarV, n92Var, i), 3);
    }

    public final q6 r() {
        if (this.n == null) {
            synchronized (this.o) {
                try {
                    if (this.n == null) {
                        this.n = new q6(this);
                    }
                } finally {
                }
            }
        }
        return this.n;
    }

    public final vpc s() {
        return (vpc) this.G.getValue();
    }

    public final s t() {
        p13 p13Var = this.u;
        if (p13Var != null) {
            return p13Var;
        }
        g76.g0("router");
        throw null;
    }

    public final ConstraintLayout u() {
        iq1 iq1Var = this.z;
        if (iq1Var == null) {
            g76.g0("binding");
            throw null;
        }
        ConstraintLayout constraintLayout = (ConstraintLayout) iq1Var.b;
        constraintLayout.getClass();
        return constraintLayout;
    }

    public final sg7 v() {
        return (sg7) this.y.getValue();
    }

    public final void w(Bundle bundle) {
        super.onCreate(bundle);
        r().d();
    }

    public final void x(boolean z) {
        xpc xpcVar = (xpc) this.A.getValue();
        Boolean boolValueOf = Boolean.valueOf(z);
        xpcVar.getClass();
        xpcVar.m(null, boolValueOf);
    }

    public final void y(boolean z) {
        iq1 iq1Var = this.z;
        if (iq1Var != null) {
            ((ComposeView) iq1Var.f).setVisibility(z ? 0 : 8);
        } else {
            g76.g0("binding");
            throw null;
        }
    }
}
