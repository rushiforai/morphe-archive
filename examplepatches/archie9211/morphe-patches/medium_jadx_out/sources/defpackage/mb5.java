package defpackage;

import com.medium.android.core.models.BillingPeriod;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class mb5 {
    public static gcb a(gcb gcbVar) {
        zv7 zv7Var = gcbVar.b;
        List<ecb> list = gcbVar.c;
        if (zv7Var != null) {
            if (!list.isEmpty()) {
                for (ecb ecbVar : list) {
                    if (ecbVar.f != null || ecbVar.d) {
                    }
                }
            }
            BillingPeriod billingPeriod = gcbVar.a;
            billingPeriod.getClass();
            return new gcb(billingPeriod, null, list);
        }
        return gcbVar;
    }
}
