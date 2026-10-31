package com.apm.insight.nativecrash;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.text.TextUtils;
import com.amplitude.android.TrackingOptions;
import com.apm.insight.ICommonParams;
import com.apm.insight.l.m;
import com.apm.insight.runtime.j;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    private Context f21799a;

    /* renamed from: b, reason: collision with root package name */
    private ICommonParams f21800b;

    /* renamed from: c, reason: collision with root package name */
    private ICommonParams f21801c;

    /* loaded from: classes2.dex */
    public static class a extends c {
        public a(File file) {
            super(file);
            this.f21803b = "Total FD Count:";
            this.f21804c = ":";
            this.f21805d = -2;
        }
    }

    /* renamed from: com.apm.insight.nativecrash.b$b, reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public static class C0009b extends c {
        public C0009b(File file) {
            super(file);
            this.f21803b = "VmSize:";
            this.f21804c = "\\s+";
            this.f21805d = -1;
        }
    }

    /* loaded from: classes2.dex */
    public static class d extends c {
        public d(File file) {
            super(file);
        }

        public final HashMap<String, List<String>> b() {
            HashMap<String, List<String>> map = new HashMap<>();
            try {
                JSONArray jSONArrayA = com.apm.insight.l.f.a(this.f21802a.getAbsolutePath());
                if (jSONArrayA != null) {
                    for (int i5 = 0; i5 < jSONArrayA.length(); i5++) {
                        String strOptString = jSONArrayA.optString(i5);
                        if (!TextUtils.isEmpty(strOptString) && strOptString.startsWith("[tid:0") && strOptString.endsWith("sigstack:0x0]")) {
                            int iIndexOf = strOptString.indexOf("[routine:0x");
                            int i11 = iIndexOf + 11;
                            String strSubstring = iIndexOf > 0 ? strOptString.substring(i11, strOptString.indexOf(93, i11)) : "unknown addr";
                            List<String> arrayList = map.get(strSubstring);
                            if (arrayList == null) {
                                arrayList = new ArrayList<>();
                                map.put(strSubstring, arrayList);
                            }
                            arrayList.add(strOptString);
                        }
                    }
                }
            } catch (IOException unused) {
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                j.a(th2, "NPTH_CATCH");
            }
            return map;
        }
    }

    /* loaded from: classes2.dex */
    public static class e extends c {
        public e(File file) {
            super(file);
        }

        public final JSONArray a(HashMap<String, List<String>> map) {
            int iIndexOf;
            List<String> list;
            JSONArray jSONArray = new JSONArray();
            if (!map.isEmpty()) {
                try {
                    JSONArray jSONArrayA = com.apm.insight.l.f.a(this.f21802a.getAbsolutePath());
                    if (jSONArrayA != null) {
                        for (int i5 = 0; i5 < jSONArrayA.length(); i5++) {
                            String strOptString = jSONArrayA.optString(i5);
                            if (!TextUtils.isEmpty(strOptString) && (iIndexOf = strOptString.indexOf(":")) > 2) {
                                String strSubstring = strOptString.substring(2, iIndexOf);
                                if (map.containsKey(strSubstring) && (list = map.get(strSubstring)) != null) {
                                    Iterator<String> it = list.iterator();
                                    while (it.hasNext()) {
                                        jSONArray.put(it.next() + " " + strOptString);
                                    }
                                    map.remove(strSubstring);
                                }
                            }
                        }
                        Iterator<List<String>> it2 = map.values().iterator();
                        while (it2.hasNext()) {
                            Iterator<String> it3 = it2.next().iterator();
                            while (it3.hasNext()) {
                                jSONArray.put(it3.next() + "  0x000000:unknown");
                            }
                        }
                    }
                } catch (IOException unused) {
                } catch (Throwable th2) {
                    com.apm.insight.c.a();
                    j.a(th2, "NPTH_CATCH");
                }
            }
            return jSONArray;
        }
    }

    /* loaded from: classes2.dex */
    public static class f extends c {
        public f(File file) {
            super(file);
            this.f21803b = "Total Threads Count:";
            this.f21804c = ":";
            this.f21805d = -2;
        }
    }

    public b(Context context, ICommonParams iCommonParams) {
        this(context, iCommonParams, null);
    }

    public static JSONArray a(File file, File file2) {
        return new e(file2).a(new d(file).b());
    }

    public static int b(String str) {
        return new f(com.apm.insight.l.j.c(str)).a();
    }

    public static int c(String str) {
        return new C0009b(com.apm.insight.l.j.d(str)).a();
    }

    public final String d() {
        try {
            return this.f21800b.getDid();
        } catch (Throwable unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public final String e() {
        try {
            return String.valueOf(this.f21800b.getCommonParams().get("aid"));
        } catch (Throwable unused) {
            return "4444";
        }
    }

    public final long f() {
        try {
            return this.f21800b.getUserId();
        } catch (Throwable unused) {
            return 0L;
        }
    }

    public b(Context context, ICommonParams iCommonParams, b bVar) {
        this.f21799a = context;
        this.f21800b = iCommonParams;
        this.f21801c = bVar == null ? null : bVar.f21800b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:15:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00a3 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0045 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r4v10, types: [java.util.Map] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Map<String, Object> b() {
        HashMap map;
        Throwable th2;
        HashMap map2;
        HashMap commonParams;
        try {
            ICommonParams iCommonParams = this.f21801c;
            commonParams = iCommonParams != null ? iCommonParams.getCommonParams() : new HashMap();
        } catch (Throwable th3) {
            th = th3;
            map = null;
        }
        try {
            commonParams.putAll(this.f21800b.getCommonParams());
            th2 = null;
            map2 = commonParams;
        } catch (Throwable th4) {
            map = commonParams;
            th = th4;
            HashMap map3 = map;
            th2 = th;
            map2 = map3;
            if (map2 == null) {
            }
            if (a(map2)) {
            }
            return map2;
        }
        if (map2 == null) {
            map2 = new HashMap(4);
            if (th2 != null) {
                try {
                    map2.put("err_info", m.a(th2));
                } catch (Throwable unused) {
                }
            }
        }
        if (a(map2)) {
            try {
                String str = this.f21799a.getPackageManager().getPackageInfo(this.f21799a.getPackageName(), 128).versionName;
                String str2 = (String) Class.forName(this.f21799a.getPackageName() + ".BuildConfig").getDeclaredField("VERSION_NAME").get(null);
                if (str != null && !str.equals(str2)) {
                    map2.put("manifest_version", str);
                }
            } catch (Throwable unused2) {
            }
        } else {
            try {
                PackageInfo packageInfo = this.f21799a.getPackageManager().getPackageInfo(this.f21799a.getPackageName(), 128);
                map2.put(TrackingOptions.AMP_TRACKING_OPTION_VERSION_NAME, packageInfo.versionName);
                map2.put("version_code", Integer.valueOf(packageInfo.versionCode));
                if (map2.get("update_version_code") == null) {
                    Bundle bundle = packageInfo.applicationInfo.metaData;
                    Object obj = bundle != null ? bundle.get("UPDATE_VERSION_CODE") : null;
                    if (obj == null) {
                        obj = map2.get("version_code");
                    }
                    map2.put("update_version_code", obj);
                }
            } catch (Throwable unused3) {
                map2.put(TrackingOptions.AMP_TRACKING_OPTION_VERSION_NAME, com.apm.insight.l.a.c(this.f21799a));
                map2.put("version_code", Integer.valueOf(com.apm.insight.l.a.d(this.f21799a)));
                if (map2.get("update_version_code") == null) {
                    map2.put("update_version_code", map2.get("version_code"));
                }
            }
        }
        return map2;
    }

    public final ICommonParams c() {
        return this.f21800b;
    }

    public static int a(String str) {
        return new a(com.apm.insight.l.j.b(str)).a();
    }

    public final Map<String, Object> a() {
        Object obj;
        Map<String, Object> mapB = b();
        if (((mapB == null || (obj = mapB.get("aid")) == null) ? null : String.valueOf(obj)) == null) {
            mapB.put("aid", 4444);
        }
        return mapB;
    }

    /* loaded from: classes2.dex */
    public static class c {

        /* renamed from: a, reason: collision with root package name */
        protected File f21802a;

        /* renamed from: b, reason: collision with root package name */
        protected String f21803b;

        /* renamed from: c, reason: collision with root package name */
        protected String f21804c;

        /* renamed from: d, reason: collision with root package name */
        protected int f21805d;

        public c(File file) {
            this.f21802a = file;
        }

        public final int a() {
            int i5;
            Throwable th2;
            if (!this.f21802a.exists() || !this.f21802a.isFile()) {
                return -1;
            }
            BufferedReader bufferedReader = null;
            try {
                BufferedReader bufferedReader2 = new BufferedReader(new FileReader(this.f21802a));
                int iA = -1;
                do {
                    try {
                        String line = bufferedReader2.readLine();
                        if (line == null) {
                            break;
                        }
                        iA = a(line);
                    } catch (Throwable th3) {
                        th2 = th3;
                        i5 = iA;
                        bufferedReader = bufferedReader2;
                        try {
                            com.apm.insight.c.a();
                            j.a(th2, "NPTH_CATCH");
                            return i5;
                        } finally {
                            if (bufferedReader != null) {
                                com.apm.insight.a.a((Closeable) bufferedReader);
                            }
                        }
                    }
                } while (iA == -1);
                com.apm.insight.a.a((Closeable) bufferedReader2);
                return iA;
            } catch (Throwable th4) {
                i5 = -1;
                th2 = th4;
            }
        }

        private int a(String str) throws NumberFormatException {
            int i5 = this.f21805d;
            if (!str.startsWith(this.f21803b)) {
                return i5;
            }
            try {
                i5 = Integer.parseInt(str.split(this.f21804c)[1].trim());
            } catch (NumberFormatException e3) {
                com.apm.insight.c.a();
                j.a(e3, "NPTH_CATCH");
            }
            if (i5 < 0) {
                return -2;
            }
            return i5;
        }
    }

    public static boolean a(Map<String, Object> map) {
        if (map == null || map.isEmpty()) {
            return true;
        }
        return ((map.containsKey("app_version") || map.containsKey(TrackingOptions.AMP_TRACKING_OPTION_VERSION_NAME)) && map.containsKey("version_code") && map.containsKey("update_version_code")) ? false : true;
    }
}
