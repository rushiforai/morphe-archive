package com.apm.insight.l;

import android.text.TextUtils;
import androidx.recyclerview.widget.u1;
import b.c0;
import com.apm.insight.CrashType;
import com.apm.insight.entity.Header;
import com.apm.insight.nativecrash.NativeImpl;
import com.google.android.gms.internal.measurement.k2;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    private final int f21753a;

    /* renamed from: b, reason: collision with root package name */
    private String f21754b;

    /* renamed from: c, reason: collision with root package name */
    private JSONObject f21755c;

    /* renamed from: d, reason: collision with root package name */
    private byte[] f21756d;

    public f(int i5) {
        this.f21753a = i5;
    }

    public static void a(File file, String str, boolean z11) throws Throwable {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        file.getParentFile().mkdirs();
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(file, z11);
            try {
                fileOutputStream2.write(str.getBytes());
                fileOutputStream2.flush();
                com.apm.insight.a.a((Closeable) fileOutputStream2);
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                com.apm.insight.a.a((Closeable) fileOutputStream);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    private static String b(File file, String str) throws Throwable {
        StringBuilder sb2 = new StringBuilder();
        BufferedReader bufferedReader = null;
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new FileReader(file));
            while (true) {
                try {
                    String line = bufferedReader2.readLine();
                    if (line == null) {
                        com.apm.insight.a.a((Closeable) bufferedReader2);
                        return sb2.toString();
                    }
                    if (sb2.length() != 0 && str != null) {
                        sb2.append(str);
                    }
                    sb2.append(line);
                } catch (Throwable th2) {
                    th = th2;
                    bufferedReader = bufferedReader2;
                    com.apm.insight.a.a((Closeable) bufferedReader);
                    throw th;
                }
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public static Map<String, String> c(File file) throws Throwable {
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2 = null;
        try {
            Properties properties = new Properties();
            fileInputStream = new FileInputStream(file);
            try {
                try {
                    properties.load(fileInputStream);
                    Set<String> setStringPropertyNames = properties.stringPropertyNames();
                    HashMap map = new HashMap();
                    for (String str : setStringPropertyNames) {
                        map.put(str, properties.getProperty(str));
                    }
                    com.apm.insight.a.a((Closeable) fileInputStream);
                    return map;
                } catch (IOException e3) {
                    e = e3;
                    com.apm.insight.a.b((Throwable) e);
                    com.apm.insight.a.a((Closeable) fileInputStream);
                    return null;
                }
            } catch (Throwable th2) {
                th = th2;
                fileInputStream2 = fileInputStream;
                com.apm.insight.a.a((Closeable) fileInputStream2);
                throw th;
            }
        } catch (IOException e11) {
            e = e11;
            fileInputStream = null;
        } catch (Throwable th3) {
            th = th3;
            com.apm.insight.a.a((Closeable) fileInputStream2);
            throw th;
        }
    }

    public static void d(File file) {
        File file2 = new File(file, "lock");
        try {
            file2.createNewFile();
            NativeImpl.c(file2.getAbsolutePath());
        } catch (Throwable th2) {
            com.apm.insight.c.a();
            com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
        }
    }

    public static boolean e(File file) {
        int iC;
        if (!file.isFile()) {
            file = new File(file, "lock");
        }
        if (!file.exists()) {
            return false;
        }
        try {
            iC = NativeImpl.c(file.getAbsolutePath());
        } catch (Throwable th2) {
            com.apm.insight.c.a();
            com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
        }
        if (iC <= 0) {
            return iC < 0;
        }
        NativeImpl.a(iC);
        return false;
    }

    private static com.apm.insight.entity.a f(File file) {
        com.apm.insight.entity.a aVarA = a(new File(file, "logEventStack"), file.getName().contains("oom"));
        boolean z11 = false;
        for (int i5 = 0; i5 < 6; i5++) {
            File fileA = j.a(file, ".".concat(String.valueOf(i5)));
            if (fileA.exists()) {
                try {
                    aVarA.c(new JSONObject(a(fileA.getAbsolutePath(), "\n")));
                    z11 = true;
                } catch (Throwable unused) {
                }
            }
        }
        aVarA.a("crash_type", z11 ? "step" : "simple");
        JSONObject jSONObjectOptJSONObject = aVarA.c().optJSONObject("header");
        com.apm.insight.e.g();
        JSONObject jSONObjectF = Header.a(aVarA.c().optLong("crash_time", 0L)).f();
        if (jSONObjectOptJSONObject == null) {
            aVarA.a(jSONObjectF);
        } else {
            com.apm.insight.a.a(jSONObjectOptJSONObject, jSONObjectF);
        }
        return aVarA;
    }

    public f(byte[] bArr) {
        this.f21753a = Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE;
        this.f21756d = bArr;
    }

    public f(int i5, Throwable th2) {
        this.f21753a = i5;
        this.f21754b = th2.getMessage();
    }

    public static void a(File file, JSONObject jSONObject) throws IOException {
        BufferedWriter bufferedWriter;
        if (jSONObject == null) {
            return;
        }
        file.getParentFile().mkdirs();
        try {
            bufferedWriter = new BufferedWriter(new FileWriter(file));
        } catch (Throwable unused) {
            bufferedWriter = null;
        }
        try {
            h.a(jSONObject, bufferedWriter);
            com.apm.insight.a.a((Closeable) bufferedWriter);
        } catch (Throwable unused2) {
            com.apm.insight.a.a((Closeable) bufferedWriter);
        }
    }

    public f(String str) {
        this.f21753a = Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE;
        this.f21754b = str;
    }

    public static boolean b(File file) {
        String[] list = file.list();
        return list == null || list.length == 0;
    }

    public static void a(File file, JSONArray jSONArray) throws IOException {
        BufferedWriter bufferedWriter;
        if (jSONArray == null) {
            return;
        }
        file.getParentFile().mkdirs();
        try {
            bufferedWriter = new BufferedWriter(new FileWriter(file));
        } catch (Throwable unused) {
            bufferedWriter = null;
        }
        try {
            h.a(jSONArray, bufferedWriter);
            com.apm.insight.a.a((Closeable) bufferedWriter);
        } catch (Throwable unused2) {
            com.apm.insight.a.a((Closeable) bufferedWriter);
        }
    }

    public static com.apm.insight.f.b c(String str) {
        try {
            JSONObject jSONObject = new JSONObject(a(str, "\n"));
            com.apm.insight.f.b bVar = new com.apm.insight.f.b();
            bVar.d(jSONObject.optString("aid"));
            bVar.c(jSONObject.optString("did"));
            bVar.e(jSONObject.optString("processName"));
            ArrayList arrayList = new ArrayList();
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("alogFiles");
            if (jSONArrayOptJSONArray != null) {
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    arrayList.add(jSONArrayOptJSONArray.getString(i5));
                }
                bVar.a(arrayList);
            }
            return bVar;
        } catch (IOException e3) {
            e3.printStackTrace();
            return null;
        } catch (JSONException e11) {
            e11.printStackTrace();
            return null;
        }
    }

    public f(JSONObject jSONObject) {
        this.f21753a = 0;
        this.f21755c = jSONObject;
    }

    private static String b(File file, String str, String str2, JSONObject jSONObject, boolean z11) throws JSONException {
        if (!file.exists()) {
            file.mkdirs();
        }
        File file2 = new File(file, str);
        JSONObject jSONObject2 = new JSONObject();
        try {
            jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str2);
            jSONObject2.put("body", jSONObject);
            jSONObject2.put("dump_file", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            jSONObject2.put("encrypt", z11);
            a(file2, jSONObject2);
        } catch (IOException e3) {
            e3.printStackTrace();
        } catch (JSONException e11) {
            e11.printStackTrace();
        }
        return file2.getAbsolutePath();
    }

    public static boolean a(File file) {
        boolean zA;
        boolean z11 = true;
        if (!file.exists()) {
            return true;
        }
        if (!file.canWrite()) {
            return false;
        }
        if (file.isFile()) {
            return file.delete();
        }
        if (!file.isDirectory()) {
            return true;
        }
        File[] fileArrListFiles = file.listFiles();
        for (int i5 = 0; fileArrListFiles != null && i5 < fileArrListFiles.length; i5++) {
            if (fileArrListFiles[i5].isFile()) {
                if (fileArrListFiles[i5].canWrite()) {
                    zA = fileArrListFiles[i5].delete();
                } else {
                    z11 = false;
                }
            } else {
                zA = a(fileArrListFiles[i5]);
            }
            z11 &= zA;
        }
        return file.delete() & z11;
    }

    public static void b(String str, String str2) throws Exception {
        ZipOutputStream zipOutputStream;
        Throwable th2;
        File file = new File(str);
        try {
            new File(str2).getParentFile().mkdirs();
            zipOutputStream = new ZipOutputStream(new FileOutputStream(str2));
            try {
                a(zipOutputStream, file, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                com.apm.insight.a.a((Closeable) zipOutputStream);
            } catch (Throwable th3) {
                th2 = th3;
                com.apm.insight.a.a((Closeable) zipOutputStream);
                throw th2;
            }
        } catch (Throwable th4) {
            zipOutputStream = null;
            th2 = th4;
        }
    }

    public static String a(String str, String str2) throws IOException {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return b(new File(str), str2);
    }

    public static com.apm.insight.f.b b(String str) {
        try {
            String strA = a(str, "\n");
            if (strA == null) {
                return null;
            }
            JSONObject jSONObject = new JSONObject(strA);
            com.apm.insight.f.b bVar = new com.apm.insight.f.b();
            bVar.a(jSONObject.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
            bVar.a(jSONObject.optJSONObject("body"));
            bVar.b(jSONObject.optString("dump_file"));
            bVar.a(jSONObject.optBoolean("encrypt", false));
            return bVar;
        } catch (Throwable unused) {
            return null;
        }
    }

    public static String a(File file, String str) throws IOException {
        return b(file, str);
    }

    public static JSONArray a(String str) throws IOException {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return a(new File(str), -1L);
    }

    public static JSONArray a(File file, long j11) throws Throwable {
        JSONArray jSONArray = new JSONArray();
        BufferedReader bufferedReader = null;
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new FileReader(file));
            if (j11 > 0) {
                try {
                    bufferedReader2.skip(j11);
                    bufferedReader2.readLine();
                } catch (Throwable th2) {
                    th = th2;
                    bufferedReader = bufferedReader2;
                    com.apm.insight.a.a((Closeable) bufferedReader);
                    throw th;
                }
            }
            while (true) {
                String line = bufferedReader2.readLine();
                if (line != null) {
                    jSONArray.put(line);
                } else {
                    com.apm.insight.a.a((Closeable) bufferedReader2);
                    return jSONArray;
                }
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public final byte[] b() {
        return this.f21756d;
    }

    public static com.apm.insight.f.b a(File file, CrashType crashType) {
        String strC;
        com.apm.insight.entity.a aVarF = f(file);
        String name = file.getName();
        String strSubstring = name.substring(name.lastIndexOf(95) + 1);
        JSONObject jSONObjectOptJSONObject = aVarF.c().optJSONObject("header");
        if (jSONObjectOptJSONObject.optString("unique_key", null) == null) {
            try {
                jSONObjectOptJSONObject.put("unique_key", "android_" + com.apm.insight.e.c().a() + "_" + strSubstring + "_" + CrashType.LAUNCH);
            } catch (Throwable th2) {
                th2.printStackTrace();
            }
        }
        com.apm.insight.f.b bVar = new com.apm.insight.f.b();
        if (crashType == CrashType.LAUNCH) {
            strC = com.apm.insight.k.e.e();
        } else {
            strC = com.apm.insight.k.e.c();
        }
        bVar.a(strC);
        bVar.a(aVarF.c());
        bVar.a(com.apm.insight.k.e.a());
        return bVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0023  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static com.apm.insight.entity.a a(File file, boolean z11) {
        String string;
        String strA;
        String str;
        String str2;
        com.apm.insight.entity.a aVar = new com.apm.insight.entity.a();
        string = "InvalidStack.NoStackAvailable: Catch a crash not OOM without stack.\n";
        if (file.exists()) {
            try {
                strA = a(file.getAbsolutePath(), "\n");
            } catch (IOException unused) {
                strA = null;
            }
            if (TextUtils.isEmpty(strA)) {
                if (z11) {
                    string = "InvalidStack.NoStackAvailable: Catch a OOM Exception without stack.\n";
                }
                str2 = null;
                str = null;
            } else {
                String[] strArrSplit = strA.split("\n");
                ArrayList arrayList = new ArrayList();
                StringBuilder sb2 = new StringBuilder();
                StringBuilder sb3 = new StringBuilder();
                boolean z12 = false;
                boolean z13 = false;
                for (String str3 : strArrSplit) {
                    if (!z12 && str3.startsWith("stack:")) {
                        z12 = true;
                    } else if (!z13 && str3.startsWith("err:")) {
                        z13 = true;
                    } else if (z13) {
                        sb3.append(str3);
                        sb3.append("\n");
                    } else if (z12) {
                        sb2.append(str3);
                        sb2.append("\n");
                    } else {
                        arrayList.add(str3);
                    }
                }
                String str4 = arrayList.size() > 0 ? (String) arrayList.get(0) : null;
                String str5 = arrayList.size() >= 2 ? (String) arrayList.get(1) : null;
                String str6 = arrayList.size() >= 3 ? (String) arrayList.get(2) : null;
                String str7 = arrayList.size() >= 4 ? (String) arrayList.get(3) : null;
                if (z12 && sb2.length() > 0) {
                    string = sb2.toString();
                } else if (str6 != null) {
                    StringBuilder sbK = k2.k(str6, "\nCaused by: ");
                    sbK.append(z11 ? "InvalidStack.NoStackAvailable: Catch a OOM Exception without stack.\n" : "InvalidStack.NoStackAvailable: Catch a crash not OOM without stack.\n");
                    string = sbK.toString();
                } else if (str5 != null) {
                    StringBuilder sbK2 = k2.k(str5, "\nCaused by: ");
                    sbK2.append(z11 ? "InvalidStack.NoStackAvailable: Catch a OOM Exception without stack.\n" : "InvalidStack.NoStackAvailable: Catch a crash not OOM without stack.\n");
                    string = sbK2.toString();
                } else if (z11) {
                    string = "InvalidStack.NoStackAvailable: Catch a OOM Exception without stack.\n";
                }
                if (z13 && sb3.length() > 0) {
                    string = string + "\nCaused by: InvalidStack.CrashWhenWriteStack: Npth error when dumpping the stack:\n" + ((Object) sb3);
                }
                str = str4;
                str2 = str7;
            }
        } else {
            if (z11) {
            }
            str2 = null;
            str = null;
        }
        aVar.a("data", (Object) string);
        aVar.a("process_name", (Object) str);
        aVar.a("crash_thread_name", (Object) str2);
        aVar.a("isOOM", Boolean.valueOf(z11));
        return aVar;
    }

    public static void a(File file, Map<String, String> map) throws Throwable {
        Properties properties;
        FileOutputStream fileOutputStream;
        if (map == null || map.isEmpty()) {
            return;
        }
        FileOutputStream fileOutputStream2 = null;
        try {
            try {
                properties = new Properties();
                fileOutputStream = new FileOutputStream(file);
            } catch (IOException e3) {
                e = e3;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                properties.setProperty(entry.getKey(), entry.getValue());
            }
            properties.store(fileOutputStream, "no");
            com.apm.insight.a.a((Closeable) fileOutputStream);
        } catch (IOException e11) {
            e = e11;
            fileOutputStream2 = fileOutputStream;
            com.apm.insight.a.b((Throwable) e);
            com.apm.insight.a.a((Closeable) fileOutputStream2);
        } catch (Throwable th3) {
            th = th3;
            fileOutputStream2 = fileOutputStream;
            com.apm.insight.a.a((Closeable) fileOutputStream2);
            throw th;
        }
    }

    public static String a(File file, String str, String str2, JSONObject jSONObject, boolean z11) {
        return b(file, str, str2, jSONObject, z11);
    }

    public static void a(File file, File file2) throws Throwable {
        FileOutputStream fileOutputStream;
        if (file2 == null) {
            return;
        }
        FileInputStream fileInputStream = null;
        try {
            file2.getParentFile().mkdirs();
            FileInputStream fileInputStream2 = new FileInputStream(file);
            try {
                fileOutputStream = new FileOutputStream(file2);
            } catch (Exception e3) {
                e = e3;
                fileOutputStream = null;
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = null;
            }
            try {
                byte[] bArr = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
                while (true) {
                    int i5 = fileInputStream2.read(bArr);
                    if (i5 <= 0) {
                        break;
                    } else {
                        fileOutputStream.write(bArr, 0, i5);
                    }
                }
                com.apm.insight.a.a((Closeable) fileInputStream2);
            } catch (Exception e11) {
                e = e11;
                fileInputStream = fileInputStream2;
                try {
                    e.printStackTrace();
                    com.apm.insight.a.a((Closeable) fileInputStream);
                    com.apm.insight.a.a((Closeable) fileOutputStream);
                } catch (Throwable th3) {
                    th = th3;
                    com.apm.insight.a.a((Closeable) fileInputStream);
                    com.apm.insight.a.a((Closeable) fileOutputStream);
                    throw th;
                }
            } catch (Throwable th4) {
                th = th4;
                fileInputStream = fileInputStream2;
                com.apm.insight.a.a((Closeable) fileInputStream);
                com.apm.insight.a.a((Closeable) fileOutputStream);
                throw th;
            }
        } catch (Exception e12) {
            e = e12;
            fileOutputStream = null;
        } catch (Throwable th5) {
            th = th5;
            fileOutputStream = null;
        }
        com.apm.insight.a.a((Closeable) fileOutputStream);
    }

    public static void a(OutputStream outputStream, File... fileArr) throws IOException {
        ZipOutputStream zipOutputStream;
        ZipOutputStream zipOutputStream2 = null;
        try {
            zipOutputStream = new ZipOutputStream(outputStream);
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            zipOutputStream.putNextEntry(new ZipEntry("/"));
            for (File file : fileArr) {
                a(zipOutputStream, file);
            }
            com.apm.insight.a.a((Closeable) zipOutputStream);
        } catch (Throwable th3) {
            th = th3;
            zipOutputStream2 = zipOutputStream;
            com.apm.insight.a.a((Closeable) zipOutputStream2);
            throw th;
        }
    }

    private static void a(ZipOutputStream zipOutputStream, File file) throws IOException {
        if (file == null || !file.exists()) {
            return;
        }
        File[] fileArrListFiles = file.isDirectory() ? file.listFiles() : new File[]{file};
        if (fileArrListFiles == null) {
            return;
        }
        for (File file2 : fileArrListFiles) {
            a(zipOutputStream, file2, file2.getName());
        }
    }

    private static void a(ZipOutputStream zipOutputStream, File file, String str) throws IOException {
        FileInputStream fileInputStream;
        if (file == null || !file.exists()) {
            return;
        }
        if (file.isDirectory()) {
            File[] fileArrListFiles = file.listFiles();
            if (fileArrListFiles == null) {
                return;
            }
            zipOutputStream.putNextEntry(new ZipEntry(c0.E(str, "/")));
            String strConcat = str.length() == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str.concat("/");
            for (int i5 = 0; i5 < fileArrListFiles.length; i5++) {
                File file2 = fileArrListFiles[i5];
                StringBuilder sbQ = a2.c.q(strConcat);
                sbQ.append(fileArrListFiles[i5].getName());
                a(zipOutputStream, file2, sbQ.toString());
            }
            return;
        }
        zipOutputStream.putNextEntry(new ZipEntry(str));
        FileInputStream fileInputStream2 = null;
        try {
            fileInputStream = new FileInputStream(file);
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
            while (true) {
                int i11 = fileInputStream.read(bArr);
                if (-1 != i11) {
                    zipOutputStream.write(bArr, 0, i11);
                } else {
                    com.apm.insight.a.a((Closeable) fileInputStream);
                    return;
                }
            }
        } catch (Throwable th3) {
            th = th3;
            fileInputStream2 = fileInputStream;
            com.apm.insight.a.a((Closeable) fileInputStream2);
            throw th;
        }
    }

    public final boolean a() {
        return this.f21753a != 207;
    }
}
