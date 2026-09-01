package com.medium.android.donkey.initializer;

import android.content.Context;
import defpackage.c1e;
import defpackage.d46;
import defpackage.ex2;
import defpackage.ko2;
import defpackage.lig;
import defpackage.m1;
import defpackage.o08;
import defpackage.op8;
import defpackage.sb2;
import defpackage.u16;
import defpackage.v16;
import defpackage.vx0;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/medium/android/donkey/initializer/BackgroundWatcherInitializer;", "Lu16;", "Lc1e;", "<init>", "()V", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class BackgroundWatcherInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return d46.Q(MetricsInitializer.class);
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        context.getClass();
        ko2 ko2Var = (ko2) ((v16) op8.V(v16.class, context));
        sb2 sb2Var = (sb2) ko2Var.d.get();
        vx0.c0(sb2Var, null, null, new m1(new lig(sb2Var, (ex2) ko2Var.J.get(), (o08) ko2Var.C.get()), null, 4), 3);
        return c1e.a;
    }
}
