package com.medium.android.common.sprig;

import android.content.Context;
import com.userleap.Sprig;
import defpackage.c1e;
import defpackage.ey3;
import defpackage.u16;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/medium/android/common/sprig/SprigSdkInitializer;", "Lu16;", "Lc1e;", "<init>", "()V", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SprigSdkInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return ey3.a;
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        context.getClass();
        Sprig.INSTANCE.configure(context, "WISfSM8eD3");
        return c1e.a;
    }
}
