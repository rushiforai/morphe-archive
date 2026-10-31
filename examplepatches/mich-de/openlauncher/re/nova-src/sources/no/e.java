package no;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import kotlin.jvm.internal.Intrinsics;
import r70.i;
import r70.j;
import r70.k;
import r70.l;

/* loaded from: classes3.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f78374a = {"yyyy-MM-dd'T'HH:mm:ss.SSSXXX", "yyyy-MM-dd'T'HH:mm:ssXXX", "yyyy-MM-dd'T'HH:mm:ss.SSS", "yyyy-MM-dd'T'HH:mm:ss'Z'", "yyyy-MM-dd'T'HH:mm:ss", "yyyy-MM-dd'T'HH:mm", "yyyy-MM-dd"};

    /* renamed from: b, reason: collision with root package name */
    public static volatile ArrayList f78375b;

    /* renamed from: c, reason: collision with root package name */
    public static volatile long f78376c;

    public static List a(PackageManager packageManager) {
        String string;
        long jCurrentTimeMillis = System.currentTimeMillis();
        ArrayList arrayList = f78375b;
        if (arrayList != null) {
            if (jCurrentTimeMillis - f78376c >= 300000) {
                arrayList = null;
            }
            if (arrayList != null) {
                return arrayList;
            }
        }
        List<ApplicationInfo> installedApplications = packageManager.getInstalledApplications(0);
        Intrinsics.f(installedApplications, "getInstalledApplications(...)");
        List<ApplicationInfo> list = installedApplications;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(list, 10));
        for (ApplicationInfo applicationInfo : list) {
            try {
                string = packageManager.getApplicationLabel(applicationInfo).toString();
            } catch (Exception unused) {
                string = applicationInfo.packageName;
            }
            String packageName = applicationInfo.packageName;
            Intrinsics.f(packageName, "packageName");
            Intrinsics.d(string);
            arrayList2.add(new a(packageName, string));
        }
        f78375b = arrayList2;
        f78376c = jCurrentTimeMillis;
        return arrayList2;
    }

    public static final Long b(Object obj, boolean z11) {
        String string;
        String string2;
        Long lValueOf = null;
        if (obj != null && (string = obj.toString()) != null && (string2 = k.u1(string).toString()) != null && string2.length() != 0) {
            if (k.K0(string2, "T", false) || (string2.length() >= 10 && string2.charAt(4) == '-')) {
                String string3 = k.u1(string2).toString();
                if (string3.length() != 0) {
                    TimeZone timeZone = z11 ? TimeZone.getDefault() : TimeZone.getTimeZone("UTC");
                    if (j.A0(string3, "Z", false)) {
                        string3 = l.C1(string3).concat("+00:00");
                    }
                    for (int i5 = 0; i5 < 7; i5++) {
                        String str = f78374a[i5];
                        try {
                            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(str, Locale.US);
                            if (!k.K0(str, "X", false)) {
                                if (k.K0(str, "'Z'", false)) {
                                    simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
                                } else {
                                    simpleDateFormat.setTimeZone(timeZone);
                                }
                            }
                            simpleDateFormat.setLenient(false);
                            Date date = simpleDateFormat.parse(string3);
                            if (date == null) {
                                break;
                            }
                            lValueOf = Long.valueOf(date.getTime());
                            break;
                        } catch (ParseException unused) {
                        }
                    }
                }
            } else {
                Long lV0 = i.v0(k.u1(string2).toString());
                if (lV0 != null) {
                    long jLongValue = lV0.longValue();
                    if (jLongValue >= 0) {
                        return jLongValue < 100000000000L ? Long.valueOf(jLongValue * 1000) : lV0;
                    }
                }
            }
        }
        return lValueOf;
    }
}
