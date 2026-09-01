package com.google.android.gms.common.internal;

import defpackage.h42;
import defpackage.vp7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzaf extends Exception {
    public final h42 a;

    public zzaf(h42 h42Var) {
        vp7.k("ResolvableConnectionException can only be created with a connection result containing a resolution.", (h42Var.b == 0 || h42Var.c == null) ? false : true);
        this.a = h42Var;
    }
}
