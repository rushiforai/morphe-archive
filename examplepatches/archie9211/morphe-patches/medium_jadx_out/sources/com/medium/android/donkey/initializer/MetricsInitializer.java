package com.medium.android.donkey.initializer;

import android.content.Context;
import defpackage.ak4;
import defpackage.c1e;
import defpackage.d46;
import defpackage.in3;
import defpackage.kd7;
import defpackage.km4;
import defpackage.ko2;
import defpackage.n92;
import defpackage.o08;
import defpackage.o9;
import defpackage.op8;
import defpackage.sb2;
import defpackage.u16;
import defpackage.uld;
import defpackage.v16;
import defpackage.vx0;
import defpackage.wld;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/medium/android/donkey/initializer/MetricsInitializer;", "Lu16;", "Lc1e;", "<init>", "()V", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MetricsInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return d46.Q(TimberInitializer.class);
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        context.getClass();
        o08 o08Var = (o08) ((ko2) ((v16) op8.V(v16.class, context))).C.get();
        o08Var.getClass();
        uld uldVar = wld.a;
        km4.I(uldVar, null, "Initializing", new Object[0], "Initializing");
        sb2 sb2Var = o08Var.a;
        vx0.c0(sb2Var, null, null, new o9(o08Var, (n92) null, 3), 3);
        String strConcat = "Starting periodic flush every ".concat(in3.k(o08Var.f));
        uldVar.b(null, strConcat, new Object[0]);
        ak4.a().b(strConcat);
        vx0.c0(sb2Var, null, null, new kd7(o08Var, null, 4), 3);
        return c1e.a;
    }
}
