package rd;

import android.content.Context;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.util.SparseArray;
import b.c0;
import im.d;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;
import sd.k0;
import sd.l;
import sd.l0;
import td.h;
import ud.f;
import vm.c;

/* loaded from: classes.dex */
public final class b implements f {

    /* renamed from: a, reason: collision with root package name */
    public final c f85800a;

    /* renamed from: b, reason: collision with root package name */
    public final ConnectivityManager f85801b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f85802c;

    /* renamed from: d, reason: collision with root package name */
    public final URL f85803d;

    /* renamed from: e, reason: collision with root package name */
    public final de.a f85804e;

    /* renamed from: f, reason: collision with root package name */
    public final de.a f85805f;

    /* renamed from: g, reason: collision with root package name */
    public final int f85806g;

    public b(Context context, de.a aVar, de.a aVar2) {
        d dVar = new d();
        l.f87174a.configure(dVar);
        dVar.f61648d = true;
        this.f85800a = new c(dVar, 14);
        this.f85802c = context;
        this.f85801b = (ConnectivityManager) context.getSystemService("connectivity");
        this.f85803d = b(a.f85794c);
        this.f85804e = aVar2;
        this.f85805f = aVar;
        this.f85806g = 130000;
    }

    public static URL b(String str) {
        try {
            return new URL(str);
        } catch (MalformedURLException e3) {
            throw new IllegalArgumentException(c0.k("Invalid url: ", str), e3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0112  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final h a(h hVar) {
        int subtype;
        HashMap map;
        NetworkInfo activeNetworkInfo = this.f85801b.getActiveNetworkInfo();
        ra.f fVarC = hVar.c();
        int i5 = Build.VERSION.SDK_INT;
        HashMap map2 = (HashMap) fVarC.f85765g;
        if (map2 == null) {
            throw new IllegalStateException("Property \"autoMetadata\" has not been set");
        }
        map2.put("sdk-version", String.valueOf(i5));
        fVarC.a("model", Build.MODEL);
        fVarC.a("hardware", Build.HARDWARE);
        fVarC.a("device", Build.DEVICE);
        fVarC.a("product", Build.PRODUCT);
        fVarC.a("os-uild", Build.ID);
        fVarC.a("manufacturer", Build.MANUFACTURER);
        fVarC.a("fingerprint", Build.FINGERPRINT);
        Calendar.getInstance();
        long offset = TimeZone.getDefault().getOffset(Calendar.getInstance().getTimeInMillis()) / 1000;
        HashMap map3 = (HashMap) fVarC.f85765g;
        if (map3 == null) {
            throw new IllegalStateException("Property \"autoMetadata\" has not been set");
        }
        map3.put("tz-offset", String.valueOf(offset));
        int iB = activeNetworkInfo == null ? l0.NONE.b() : activeNetworkInfo.getType();
        HashMap map4 = (HashMap) fVarC.f85765g;
        if (map4 == null) {
            throw new IllegalStateException("Property \"autoMetadata\" has not been set");
        }
        map4.put("net-type", String.valueOf(iB));
        int i11 = -1;
        if (activeNetworkInfo != null) {
            subtype = activeNetworkInfo.getSubtype();
            if (subtype == -1) {
                SparseArray sparseArray = k0.f87172a;
                subtype = 100;
            } else if (((k0) k0.f87172a.get(subtype)) == null) {
            }
            map = (HashMap) fVarC.f85765g;
            if (map != null) {
                throw new IllegalStateException("Property \"autoMetadata\" has not been set");
            }
            map.put("mobile-subtype", String.valueOf(subtype));
            fVarC.a("country", Locale.getDefault().getCountry());
            fVarC.a("locale", Locale.getDefault().getLanguage());
            Context context = this.f85802c;
            String simOperator = ((TelephonyManager) context.getSystemService("phone")).getSimOperator();
            if (simOperator == null) {
                simOperator = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            fVarC.a("mcc_mnc", simOperator);
            try {
                i11 = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
            } catch (PackageManager.NameNotFoundException e3) {
                w.b.g("CctTransportBackend", "Unable to find version code for package", e3);
            }
            fVarC.a("application_build", Integer.toString(i11));
            return fVarC.c();
        }
        SparseArray sparseArray2 = k0.f87172a;
        subtype = 0;
        map = (HashMap) fVarC.f85765g;
        if (map != null) {
        }
    }
}
