package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.telephony.TelephonyManager;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nj1 implements msd {
    public final rz2 a;
    public final ConnectivityManager b;
    public final Context c;
    public final URL d;
    public final dp1 e;
    public final dp1 f;

    public nj1(Context context, dp1 dp1Var, dp1 dp1Var2) {
        yb6 yb6Var = new yb6();
        kf0 kf0Var = kf0.a;
        yb6Var.a(bq0.class, kf0Var);
        yb6Var.a(rh0.class, kf0Var);
        rf0 rf0Var = rf0.a;
        yb6Var.a(y77.class, rf0Var);
        yb6Var.a(uj0.class, rf0Var);
        lf0 lf0Var = lf0.a;
        yb6Var.a(xo1.class, lf0Var);
        yb6Var.a(sh0.class, lf0Var);
        jf0 jf0Var = jf0.a;
        yb6Var.a(sm.class, jf0Var);
        yb6Var.a(ph0.class, jf0Var);
        qf0 qf0Var = qf0.a;
        yb6Var.a(t77.class, qf0Var);
        yb6Var.a(tj0.class, qf0Var);
        mf0 mf0Var = mf0.a;
        yb6Var.a(ey1.class, mf0Var);
        yb6Var.a(th0.class, mf0Var);
        pf0 pf0Var = pf0.a;
        yb6Var.a(a84.class, pf0Var);
        yb6Var.a(mj0.class, pf0Var);
        of0 of0Var = of0.a;
        yb6Var.a(z74.class, of0Var);
        yb6Var.a(lj0.class, of0Var);
        sf0 sf0Var = sf0.a;
        yb6Var.a(td8.class, sf0Var);
        yb6Var.a(wj0.class, sf0Var);
        nf0 nf0Var = nf0.a;
        yb6Var.a(s54.class, nf0Var);
        yb6Var.a(kj0.class, nf0Var);
        yb6Var.d = true;
        this.a = new rz2(24, yb6Var);
        this.c = context;
        this.b = (ConnectivityManager) context.getSystemService("connectivity");
        this.d = b(j21.c);
        this.e = dp1Var2;
        this.f = dp1Var;
    }

    public static URL b(String str) {
        try {
            return new URL(str);
        } catch (MalformedURLException e) {
            throw new IllegalArgumentException(ka1.r("Invalid url: ", str), e);
        }
    }

    public final ij0 a(ij0 ij0Var) {
        int subtype;
        NetworkInfo activeNetworkInfo = this.b.getActiveNetworkInfo();
        hj0 hj0VarC = ij0Var.c();
        int i = Build.VERSION.SDK_INT;
        HashMap map = (HashMap) hj0VarC.i;
        if (map == null) {
            ygf.f("Property \"autoMetadata\" has not been set");
            return null;
        }
        map.put("sdk-version", String.valueOf(i));
        hj0VarC.a("model", Build.MODEL);
        hj0VarC.a("hardware", Build.HARDWARE);
        hj0VarC.a("device", Build.DEVICE);
        hj0VarC.a("product", Build.PRODUCT);
        hj0VarC.a("os-uild", Build.ID);
        hj0VarC.a("manufacturer", Build.MANUFACTURER);
        hj0VarC.a("fingerprint", Build.FINGERPRINT);
        Calendar.getInstance();
        long offset = TimeZone.getDefault().getOffset(Calendar.getInstance().getTimeInMillis()) / PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
        HashMap map2 = (HashMap) hj0VarC.i;
        if (map2 == null) {
            ygf.f("Property \"autoMetadata\" has not been set");
            return null;
        }
        map2.put("tz-offset", String.valueOf(offset));
        int value = activeNetworkInfo == null ? sd8.NONE.getValue() : activeNetworkInfo.getType();
        HashMap map3 = (HashMap) hj0VarC.i;
        if (map3 == null) {
            ygf.f("Property \"autoMetadata\" has not been set");
            return null;
        }
        map3.put("net-type", String.valueOf(value));
        int i2 = -1;
        if (activeNetworkInfo == null) {
            subtype = rd8.UNKNOWN_MOBILE_SUBTYPE.getValue();
        } else {
            subtype = activeNetworkInfo.getSubtype();
            if (subtype == -1) {
                subtype = rd8.COMBINED.getValue();
            } else if (rd8.forNumber(subtype) == null) {
                subtype = 0;
            }
        }
        HashMap map4 = (HashMap) hj0VarC.i;
        if (map4 == null) {
            ygf.f("Property \"autoMetadata\" has not been set");
            return null;
        }
        map4.put("mobile-subtype", String.valueOf(subtype));
        hj0VarC.a("country", Locale.getDefault().getCountry());
        hj0VarC.a("locale", Locale.getDefault().getLanguage());
        Context context = this.c;
        String simOperator = ((TelephonyManager) context.getSystemService("phone")).getSimOperator();
        if (simOperator == null) {
            simOperator = "";
        }
        hj0VarC.a("mcc_mnc", simOperator);
        try {
            i2 = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            n01.U(e, "CctTransportBackend", "Unable to find version code for package");
        }
        hj0VarC.a("application_build", Integer.toString(i2));
        return hj0VarC.b();
    }
}
