package com.medium.android.donkey.initializer;

import android.content.Context;
import com.medium.android.common.datadog.DatadogLogsInitializer;
import defpackage.c1e;
import defpackage.d46;
import defpackage.ko2;
import defpackage.lo5;
import defpackage.op8;
import defpackage.u16;
import defpackage.v16;
import defpackage.vx0;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/medium/android/donkey/initializer/LoggerInitializer;", "Lu16;", "Lc1e;", "<init>", "()V", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class LoggerInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return d46.Q(DatadogLogsInitializer.class);
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        context.getClass();
        Object objV = op8.V(v16.class, context);
        objV.getClass();
        v16 v16Var = (v16) objV;
        vx0.c0(((ko2) v16Var).a(), null, null, new lo5(v16Var, null, 3), 3);
        return c1e.a;
    }
}
