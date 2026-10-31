package ads_mobile_sdk;

import android.os.Build;

/* loaded from: classes2.dex */
public final class br0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ br0 f1505a;

    /* renamed from: b, reason: collision with root package name */
    public static final com.google.gson.r f1506b;

    static {
        Double dValueOf = Double.valueOf(0.5d);
        f1505a = new br0();
        com.google.gson.r rVar = new com.google.gson.r();
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 30) {
            rVar.q(1, "4");
            rVar.q(1, "5");
            rVar.q(dValueOf, "6");
            rVar.q(dValueOf, "9");
            rVar.q(0, "0");
            rVar.q(0, "2");
            rVar.q(0, "3");
            rVar.q(0, "7");
            rVar.q(-1, "12");
            rVar.q(-1, "1");
            if (i5 >= 33) {
                rVar.q(-1, "14");
            }
            rVar.q(-1, "13");
            if (i5 >= 35) {
                rVar.q(-1, "15");
                rVar.q(-1, "16");
            }
            rVar.q(-1, "8");
            rVar.q(-1, "10");
            rVar.q(-1, "11");
        }
        f1506b = rVar;
    }
}
