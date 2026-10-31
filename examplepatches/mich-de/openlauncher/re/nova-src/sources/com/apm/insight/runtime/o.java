package com.apm.insight.runtime;

import android.content.Context;
import android.text.TextUtils;
import com.amplitude.core.events.Identify;
import com.apm.insight.entity.Header;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    private static o f21916a;

    /* renamed from: b, reason: collision with root package name */
    private File f21917b;

    /* renamed from: c, reason: collision with root package name */
    private File f21918c;

    /* renamed from: d, reason: collision with root package name */
    private File f21919d;

    /* renamed from: e, reason: collision with root package name */
    private Context f21920e;

    /* renamed from: f, reason: collision with root package name */
    private a f21921f = null;

    public static class a {

        /* renamed from: a, reason: collision with root package name */
        private long f21924a;

        /* renamed from: b, reason: collision with root package name */
        private long f21925b;

        /* renamed from: c, reason: collision with root package name */
        private File f21926c;

        /* renamed from: d, reason: collision with root package name */
        private JSONObject f21927d;

        public /* synthetic */ a(File file, byte b11) {
            this(file);
        }

        public static /* synthetic */ void d(a aVar) {
            aVar.f21926c.delete();
        }

        private a(File file) throws NumberFormatException {
            this.f21927d = null;
            this.f21926c = file;
            String[] strArrSplit = file.getName().split("-|\\.");
            if (strArrSplit.length >= 2) {
                this.f21924a = Long.parseLong(strArrSplit[0]);
                this.f21925b = Long.parseLong(strArrSplit[1]);
                return;
            }
            String name = file.getName();
            if (TextUtils.isEmpty(name) || name.length() < 13) {
                return;
            }
            String strSubstring = name.substring(0, 13);
            if (TextUtils.isDigitsOnly(strSubstring)) {
                long j11 = Long.parseLong(strSubstring);
                this.f21924a = j11;
                this.f21925b = j11;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public JSONObject a() {
            if (this.f21927d == null) {
                try {
                    this.f21927d = new JSONObject(com.apm.insight.l.f.a(this.f21926c.getAbsolutePath(), "\n"));
                } catch (Throwable unused) {
                }
                if (this.f21927d == null) {
                    this.f21927d = new JSONObject();
                }
            }
            return this.f21927d;
        }

        public static /* synthetic */ boolean a(a aVar, long j11) {
            long j12 = aVar.f21924a;
            if (j12 > j11 && j12 - j11 > 604800000) {
                return true;
            }
            long j13 = aVar.f21925b;
            if (j13 >= j11 || j11 - j13 <= 604800000) {
                return aVar.f21926c.lastModified() < j11 && j11 - aVar.f21926c.lastModified() > 604800000;
            }
            return true;
        }
    }

    private o(Context context) {
        File fileC = com.apm.insight.l.j.c(context);
        if (!fileC.exists() || (!fileC.isDirectory() && fileC.delete())) {
            fileC.mkdirs();
            com.apm.insight.runtime.a.b.a();
        }
        this.f21917b = fileC;
        this.f21918c = new File(fileC, "did");
        this.f21919d = new File(fileC, "device_uuid");
        this.f21920e = context;
    }

    public static o a() {
        if (f21916a == null) {
            f21916a = new o(com.apm.insight.e.g());
        }
        return f21916a;
    }

    public final String b() {
        try {
            return com.apm.insight.l.f.a(this.f21918c.getAbsolutePath(), "\n");
        } catch (Throwable unused) {
            return "0";
        }
    }

    public final String c() {
        try {
            return com.apm.insight.l.f.a(this.f21919d.getAbsolutePath(), "\n");
        } catch (Throwable unused) {
            return null;
        }
    }

    private ArrayList<a> c(final String str) {
        File[] fileArrListFiles = this.f21917b.listFiles(new FilenameFilter() { // from class: com.apm.insight.runtime.o.1
            @Override // java.io.FilenameFilter
            public final boolean accept(File file, String str2) {
                return str2.endsWith(str) && Pattern.compile("^\\d{1,13}-\\d{1,13}.*").matcher(str2).matches();
            }
        });
        ArrayList<a> arrayList = new ArrayList<>();
        if (fileArrListFiles != null) {
            com.apm.insight.a.a((Object) ("foundRuntimeContextFiles " + fileArrListFiles.length));
            byte b11 = 0;
            a aVar = null;
            for (File file : fileArrListFiles) {
                try {
                    a aVar2 = new a(file, b11);
                    arrayList.add(aVar2);
                    if (this.f21921f == null && ".ctx".equals(str) && (aVar == null || aVar2.f21925b >= aVar.f21925b)) {
                        aVar = aVar2;
                    }
                } catch (Throwable th2) {
                    com.apm.insight.c.a();
                    j.a(th2, "NPTH_CATCH");
                }
            }
            if (this.f21921f == null && aVar != null) {
                this.f21921f = aVar;
            }
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x006e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Map<String, Object> map, JSONArray jSONArray) {
        JSONObject jSONObjectA = Header.a(this.f21920e).a(map);
        if (Header.c(jSONObjectA)) {
            return;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (this.f21921f == null) {
            c(".ctx");
        }
        a aVar = this.f21921f;
        if (aVar != null) {
            JSONObject jSONObjectA2 = aVar.a();
            if (!Header.c(jSONObjectA2)) {
                if (!Header.c(jSONObjectA)) {
                    if (String.valueOf(jSONObjectA.opt("update_version_code")).equals(String.valueOf(jSONObjectA2.opt("update_version_code"))) && Header.d(jSONObjectA2)) {
                        a(aVar.f21924a, jCurrentTimeMillis, jSONObjectA, jSONArray);
                        jCurrentTimeMillis = jCurrentTimeMillis;
                        com.apm.insight.l.f.a(aVar.f21926c);
                    }
                }
            } else {
                a(jCurrentTimeMillis, jCurrentTimeMillis, jSONObjectA, jSONArray);
            }
            try {
                ArrayList<a> arrayListC = c(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                if (arrayListC.size() <= 6) {
                    return;
                }
                Iterator<a> it = arrayListC.iterator();
                while (it.hasNext()) {
                    a next = it.next();
                    if (a.a(next, jCurrentTimeMillis)) {
                        a.d(next);
                    }
                }
                return;
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                j.a(th2, "NPTH_CATCH");
                return;
            }
        }
        a(jCurrentTimeMillis, jCurrentTimeMillis, jSONObjectA, jSONArray);
    }

    public final void b(String str) {
        try {
            com.apm.insight.l.f.a(this.f21919d, str, false);
        } catch (Throwable unused) {
        }
    }

    public final JSONArray b(long j11) {
        File file;
        String strA;
        Iterator<a> it = c(".allData").iterator();
        while (true) {
            if (!it.hasNext()) {
                file = null;
                break;
            }
            a next = it.next();
            if (j11 >= next.f21924a && j11 <= next.f21925b) {
                file = next.f21926c;
                break;
            }
        }
        if (file == null) {
            Iterator<a> it2 = c(".allData").iterator();
            a aVar = null;
            while (it2.hasNext()) {
                a next2 = it2.next();
                if (aVar == null || Math.abs(aVar.f21925b - j11) > Math.abs(next2.f21925b - j11)) {
                    aVar = next2;
                }
            }
            file = aVar == null ? null : aVar.f21926c;
        }
        if (file != null) {
            try {
                strA = com.apm.insight.l.f.a(file.getAbsolutePath(), "\n");
                try {
                    return new JSONArray(strA);
                } catch (Throwable th2) {
                    th = th2;
                    com.apm.insight.c.a();
                    j.a(new IOException("content :".concat(String.valueOf(strA)), th), "NPTH_CATCH");
                    return null;
                }
            } catch (Throwable th3) {
                th = th3;
                strA = null;
            }
        }
        return null;
    }

    private void a(long j11, long j12, JSONObject jSONObject, JSONArray jSONArray) {
        File file = new File(this.f21917b, j11 + Identify.UNSET_VALUE + j12 + ".ctx");
        File file2 = new File(this.f21917b, j11 + Identify.UNSET_VALUE + j12 + ".allData");
        try {
            com.apm.insight.l.f.a(file, jSONObject);
            com.apm.insight.l.f.a(file2, jSONArray);
            this.f21921f = new a(file, (byte) 0);
        } catch (IOException e3) {
            com.apm.insight.c.a();
            j.a(e3, "NPTH_CATCH");
        }
    }

    public final void a(String str) {
        try {
            com.apm.insight.l.f.a(this.f21918c, str, false);
        } catch (Throwable unused) {
        }
    }

    public final JSONObject a(long j11) {
        JSONObject jSONObject;
        File file;
        boolean z11;
        String strA;
        Iterator<a> it = c(".ctx").iterator();
        while (true) {
            jSONObject = null;
            if (!it.hasNext()) {
                file = null;
                break;
            }
            a next = it.next();
            if (j11 >= next.f21924a && j11 <= next.f21925b) {
                file = next.f21926c;
                break;
            }
        }
        if (file == null) {
            Iterator<a> it2 = c(".ctx").iterator();
            a aVar = null;
            while (it2.hasNext()) {
                a next2 = it2.next();
                if (aVar == null || Math.abs(aVar.f21925b - j11) > Math.abs(next2.f21925b - j11)) {
                    aVar = next2;
                }
            }
            file = aVar == null ? null : aVar.f21926c;
            z11 = true;
        } else {
            z11 = false;
        }
        if (file != null) {
            try {
                strA = com.apm.insight.l.f.a(file.getAbsolutePath(), "\n");
                try {
                    jSONObject = new JSONObject(strA);
                } catch (Throwable th2) {
                    th = th2;
                    com.apm.insight.c.a();
                    j.a(new IOException("content :".concat(String.valueOf(strA)), th), "NPTH_CATCH");
                    if (jSONObject != null) {
                        try {
                            jSONObject.put("unauthentic_version", 1);
                        } catch (JSONException e3) {
                            com.apm.insight.c.a();
                            j.a(e3, "NPTH_CATCH");
                        }
                    }
                    return jSONObject;
                }
            } catch (Throwable th3) {
                th = th3;
                strA = null;
            }
        }
        if (jSONObject != null && z11) {
            jSONObject.put("unauthentic_version", 1);
        }
        return jSONObject;
    }
}
