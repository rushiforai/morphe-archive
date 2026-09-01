package defpackage;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class pz5 {
    public static final List a = d46.Q("fb_currency");
    public static final List b = d46.Q("_valueToSum");
    public static final long c = 60000;
    public static final List d = d46.R(new f09("fb_iap_product_id", d46.Q("fb_iap_product_id")), new f09("fb_iap_product_description", d46.Q("fb_iap_product_description")), new f09("fb_iap_product_title", d46.Q("fb_iap_product_title")), new f09("fb_iap_purchase_token", d46.Q("fb_iap_purchase_token")));

    public static f09 a(Bundle bundle, Bundle bundle2, ov8 ov8Var) {
        if (bundle == null) {
            return new f09(bundle2, ov8Var);
        }
        try {
            for (String str : bundle.keySet()) {
                String string = bundle.getString(str);
                if (string != null) {
                    Map map = ov8.b;
                    pv8 pv8Var = pv8.IAPParameters;
                    str.getClass();
                    f09 f09VarI = aq7.i(pv8Var, str, string, bundle2, ov8Var);
                    Bundle bundle3 = (Bundle) f09VarI.a;
                    ov8Var = (ov8) f09VarI.b;
                    bundle2 = bundle3;
                }
            }
        } catch (Exception unused) {
        }
        return new f09(bundle2, ov8Var);
    }

    public static List b(boolean z) {
        xe4 xe4VarB = af4.b(f94.b());
        if ((xe4VarB != null ? xe4VarB.v : null) != null) {
            List<f09> list = xe4VarB.v;
            if (!list.isEmpty()) {
                if (!z) {
                    return list;
                }
                ArrayList arrayList = new ArrayList();
                for (f09 f09Var : list) {
                    Iterator it2 = ((List) f09Var.b).iterator();
                    while (it2.hasNext()) {
                        arrayList.add(new f09((String) it2.next(), d46.Q(f09Var.a)));
                    }
                }
                return arrayList;
            }
        }
        return d;
    }

    public static List c(boolean z) {
        List<f09> list;
        xe4 xe4VarB = af4.b(f94.b());
        if (xe4VarB == null || (list = xe4VarB.w) == null || list.isEmpty()) {
            return null;
        }
        if (!z) {
            return list;
        }
        ArrayList arrayList = new ArrayList();
        for (f09 f09Var : list) {
            Iterator it2 = ((List) f09Var.b).iterator();
            while (it2.hasNext()) {
                arrayList.add(new f09((String) it2.next(), d46.Q(f09Var.a)));
            }
        }
        return arrayList;
    }
}
