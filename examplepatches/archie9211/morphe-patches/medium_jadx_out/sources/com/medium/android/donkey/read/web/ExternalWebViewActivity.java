package com.medium.android.donkey.read.web;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import defpackage.b75;
import defpackage.b84;
import defpackage.c84;
import defpackage.f49;
import defpackage.g76;
import defpackage.h10;
import defpackage.i03;
import defpackage.mz1;
import defpackage.n1;
import defpackage.py2;
import defpackage.q6;
import defpackage.uue;
import defpackage.yy1;
import defpackage.zk2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ExternalWebViewActivity extends n1 implements b75 {
    public static final /* synthetic */ int r = 0;
    public volatile q6 l;
    public final Object m = new Object();
    public boolean n = false;
    public zk2 o;
    public py2 p;
    public String q;

    public ExternalWebViewActivity() {
        addOnContextAvailableListener(new h10(this, 1));
    }

    @Override // defpackage.a75
    public final Object c() {
        return r().c();
    }

    @Override // defpackage.xy1, defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        return f49.A(this, super.getDefaultViewModelProviderFactory());
    }

    @Override // defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) {
        String string;
        Uri data;
        s(bundle);
        Intent intent = getIntent();
        if (intent == null || (data = intent.getData()) == null || (string = data.toString()) == null || string.length() <= 0) {
            string = null;
        }
        if (string == null) {
            finish();
            return;
        }
        zk2 zk2Var = this.o;
        if (zk2Var == null) {
            g76.g0("currentUserRepo");
            throw null;
        }
        i03 i03Var = this.j;
        if (i03Var != null) {
            yy1.a(this, new mz1(new b84(string, this, new c84(this, zk2Var, i03Var, 0), 0), true, -1446501745));
        } else {
            g76.g0("mediumUris");
            throw null;
        }
    }

    @Override // defpackage.n1, defpackage.i10, defpackage.m15, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        r().a();
    }

    @Override // defpackage.i10
    public final boolean p() {
        finish();
        return true;
    }

    @Override // defpackage.n1
    public final boolean q() {
        return false;
    }

    public final q6 r() {
        if (this.l == null) {
            synchronized (this.m) {
                try {
                    if (this.l == null) {
                        this.l = new q6(this);
                    }
                } finally {
                }
            }
        }
        return this.l;
    }

    public final void s(Bundle bundle) {
        super.onCreate(bundle);
        r().d();
    }
}
