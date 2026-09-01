package com.android.billingclient.api;

import defpackage.cbg;
import defpackage.plf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j extends plf {
    public final e g;
    public final Boolean h;
    public final int i;
    public final /* synthetic */ a j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(a aVar, e eVar, Boolean bool, int i) {
        super("com.android.vending.billing.IInAppBillingInitializeCallback", 4);
        this.j = aVar;
        this.g = eVar;
        this.h = bool;
        this.i = i;
    }

    public final void q(e eVar, BillingResult billingResult, cbg cbgVar, boolean z, String str, int i) {
        this.j.D(0);
        eVar.c(billingResult, cbgVar, str, z, i);
        eVar.e(billingResult);
    }
}
