package com.google.android.datatransport.cct;

import android.content.Context;
import defpackage.fj0;
import defpackage.mg2;
import defpackage.msd;
import defpackage.nj1;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CctBackendFactory {
    public msd create(mg2 mg2Var) {
        Context context = ((fj0) mg2Var).a;
        fj0 fj0Var = (fj0) mg2Var;
        return new nj1(context, fj0Var.b, fj0Var.c);
    }
}
