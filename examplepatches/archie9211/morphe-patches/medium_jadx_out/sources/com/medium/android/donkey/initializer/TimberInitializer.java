package com.medium.android.donkey.initializer;

import android.content.Context;
import defpackage.ay0;
import defpackage.c1e;
import defpackage.ey3;
import defpackage.g3b;
import defpackage.op8;
import defpackage.u16;
import defpackage.uld;
import defpackage.v16;
import defpackage.vld;
import defpackage.wld;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/medium/android/donkey/initializer/TimberInitializer;", "Lu16;", "Lc1e;", "<init>", "()V", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class TimberInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return ey3.a;
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        context.getClass();
        Object objV = op8.V(v16.class, context);
        objV.getClass();
        uld uldVar = wld.a;
        g3b g3bVar = new g3b();
        uldVar.getClass();
        if (g3bVar == uldVar) {
            ay0.e("Cannot plant Timber into itself.");
            return null;
        }
        ArrayList arrayList = wld.b;
        synchronized (arrayList) {
            arrayList.add(g3bVar);
            Object[] array = arrayList.toArray(new vld[0]);
            if (array == null) {
                throw new NullPointerException("null cannot be cast to non-null type kotlin.Array<T>");
            }
            wld.c = (vld[]) array;
        }
        return c1e.a;
    }
}
