package com.medium.android.donkey.widget;

import android.content.Intent;
import android.widget.RemoteViewsService;
import defpackage.b75;
import defpackage.cx2;
import defpackage.g76;
import defpackage.go2;
import defpackage.k0c;
import defpackage.ko2;
import defpackage.mq5;
import defpackage.ru7;
import defpackage.su7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class MediumWidgetService extends RemoteViewsService implements b75 {
    public volatile k0c a;
    public final Object b = new Object();
    public boolean c = false;
    public mq5 d;
    public cx2 e;

    @Override // defpackage.a75
    public final Object c() {
        if (this.a == null) {
            synchronized (this.b) {
                try {
                    if (this.a == null) {
                        this.a = new k0c(this);
                    }
                } finally {
                }
            }
        }
        return this.a.c();
    }

    @Override // android.app.Service
    public final void onCreate() {
        if (!this.c) {
            this.c = true;
            ko2 ko2Var = ((go2) ((su7) c())).a;
            this.d = (mq5) ko2Var.R.get();
            this.e = new cx2(ko2Var.x());
        }
        super.onCreate();
    }

    @Override // android.widget.RemoteViewsService
    public final RemoteViewsService.RemoteViewsFactory onGetViewFactory(Intent intent) {
        intent.getClass();
        mq5 mq5Var = this.d;
        if (mq5Var == null) {
            g76.g0("homeRepo");
            throw null;
        }
        cx2 cx2Var = this.e;
        if (cx2Var != null) {
            return new ru7(this, mq5Var, cx2Var);
        }
        g76.g0("widgetTracker");
        throw null;
    }
}
