package com.medium.android.donkey.initializer;

import android.content.Context;
import defpackage.c1e;
import defpackage.cfd;
import defpackage.d46;
import defpackage.ko2;
import defpackage.op8;
import defpackage.pu7;
import defpackage.u16;
import defpackage.v16;
import defpackage.vx0;
import defpackage.wld;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/medium/android/donkey/initializer/UserDismissableMigrationInitializer;", "Lu16;", "Lc1e;", "<init>", "()V", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserDismissableMigrationInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return d46.Q(TimberInitializer.class);
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        context.getClass();
        wld.a.a("Migrating from shared preferences to user dismissable flags", new Object[0]);
        Object objV = op8.V(v16.class, context);
        objV.getClass();
        v16 v16Var = (v16) objV;
        ko2 ko2Var = (ko2) v16Var;
        vx0.c0(ko2Var.a(), null, null, new cfd((pu7) ko2Var.w.get(), v16Var, null, 10), 3);
        return c1e.a;
    }
}
