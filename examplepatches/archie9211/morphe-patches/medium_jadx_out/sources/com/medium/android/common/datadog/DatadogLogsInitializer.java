package com.medium.android.common.datadog;

import android.content.Context;
import defpackage.at;
import defpackage.c1e;
import defpackage.d46;
import defpackage.ko2;
import defpackage.op8;
import defpackage.u16;
import defpackage.v16;
import defpackage.vx0;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/medium/android/common/datadog/DatadogLogsInitializer;", "Lu16;", "Lc1e;", "<init>", "()V", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DatadogLogsInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return d46.Q(DatadogSdkInitializer.class);
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        context.getClass();
        Object objV = op8.V(v16.class, context);
        objV.getClass();
        vx0.c0(((ko2) ((v16) objV)).a(), null, null, new at(2, 2, null), 3);
        return c1e.a;
    }
}
