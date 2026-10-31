package com.pgl.ssdk;

import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import b.u4;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class av {

    /* renamed from: a, reason: collision with root package name */
    private static List<String> f42318a = new ArrayList();

    public static class a {

        /* renamed from: a, reason: collision with root package name */
        public int f42319a;

        /* renamed from: b, reason: collision with root package name */
        public String f42320b;

        public a(int i5, String... strArr) {
            this.f42319a = i5;
            JSONArray jSONArray = new JSONArray();
            for (String str : strArr) {
                jSONArray.put(str);
            }
            this.f42320b = jSONArray.toString();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static a a(Context context, String str, File file) throws IOException {
        InputStream inputStream;
        ZipFile zipFile;
        ZipFile zipFile2 = null;
        try {
            ZipFile zipFile3 = new ZipFile(new File(context.getApplicationInfo().sourceDir), 1);
            try {
                ZipEntry zipEntryA = a(zipFile3, Build.CPU_ABI, str);
                if (zipEntryA == null) {
                    try {
                        zipEntryA = a(zipFile3, Build.CPU_ABI2, str);
                    } catch (Throwable th2) {
                        th = th2;
                        inputStream = null;
                        zipFile = null;
                        zipFile2 = zipFile3;
                        try {
                            return new a(3, th.getMessage());
                        } finally {
                            as.a((Closeable) zipFile);
                            as.a(inputStream);
                            as.a(zipFile2);
                        }
                    }
                }
                if (zipEntryA == null) {
                    a aVar = new a(2, a(zipFile3, str));
                    as.a((Closeable) null);
                    as.a((Closeable) null);
                    as.a(zipFile3);
                    return aVar;
                }
                file.createNewFile();
                InputStream inputStream2 = zipFile3.getInputStream(zipEntryA);
                try {
                    FileOutputStream fileOutputStream = new FileOutputStream(file);
                    try {
                        byte[] bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                        while (true) {
                            int i5 = inputStream2.read(bArr);
                            if (i5 <= 0) {
                                as.a(file.getAbsolutePath(), 493);
                                as.a(fileOutputStream);
                                as.a(inputStream2);
                                as.a(zipFile3);
                                return null;
                            }
                            fileOutputStream.write(bArr, 0, i5);
                        }
                    } catch (Throwable th3) {
                        zipFile2 = fileOutputStream;
                        inputStream = inputStream2;
                        th = th3;
                        zipFile = zipFile2;
                        zipFile2 = zipFile3;
                        return new a(3, th.getMessage());
                    }
                } catch (Throwable th4) {
                    inputStream = inputStream2;
                    th = th4;
                }
            } catch (Throwable th5) {
                th = th5;
                inputStream = null;
            }
        } catch (Throwable th6) {
            th = th6;
            inputStream = null;
            zipFile = null;
        }
    }

    public static synchronized a b(Context context, String str) {
        if (f42318a.contains(str)) {
            return null;
        }
        try {
            System.loadLibrary(str);
            f42318a.add(str);
        } catch (UnsatisfiedLinkError e3) {
            File fileA = a(context, str);
            if (fileA == null) {
                return new a(3, e3.getMessage(), "output null");
            }
            if (fileA.exists()) {
                fileA.delete();
            }
            a aVarA = a(context, str, fileA);
            if (aVarA != null) {
                return aVarA;
            }
            try {
                System.load(fileA.getAbsolutePath());
                f42318a.add(str);
            } catch (Throwable th2) {
                return new a(3, e3.getMessage(), th2.getMessage());
            }
        } catch (Throwable th3) {
            return new a(3, th3.getMessage());
        }
        return null;
    }

    private static File a(Context context) {
        if (context == null || context.getFilesDir() == null) {
            return null;
        }
        File file = new File(context.getFilesDir(), "libso");
        if (!file.exists()) {
            as.a(file.getAbsolutePath());
        }
        return file;
    }

    public static void b(String str) {
        if (f42318a.contains(str)) {
            return;
        }
        try {
            System.loadLibrary(str);
            f42318a.add(str);
        } catch (Throwable unused) {
        }
    }

    private static File a(Context context, String str) {
        String strMapLibraryName = System.mapLibraryName(str);
        File fileA = a(context);
        if (fileA != null) {
            return new File(fileA, strMapLibraryName);
        }
        return null;
    }

    private static String a(ZipFile zipFile, String str) throws JSONException {
        ArrayList arrayList = new ArrayList();
        String[] strArr = {"armeabi-v7a", "arm64-v8a", "x86", "x86_64", "armeabi"};
        for (int i5 = 0; i5 < 5; i5++) {
            String str2 = strArr[i5];
            if (a(zipFile, str2, str) != null) {
                arrayList.add(str2);
            }
        }
        List listAsList = Arrays.asList(Build.SUPPORTED_ABIS);
        ArrayList arrayList2 = new ArrayList();
        String str3 = Build.CPU_ABI;
        if (!TextUtils.isEmpty(str3)) {
            arrayList2.add(str3);
        }
        String str4 = Build.CPU_ABI2;
        if (!TextUtils.isEmpty(str4)) {
            arrayList2.add(str4);
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("supportedABIS", listAsList);
            jSONObject.put("curABIs", arrayList2);
            jSONObject.put("apkABIS", arrayList);
            return jSONObject.toString();
        } catch (JSONException unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    private static ZipEntry a(ZipFile zipFile, String str, String str2) {
        StringBuilder sbK = u4.k("lib/", str, "/");
        sbK.append(System.mapLibraryName(str2));
        ZipEntry entry = zipFile.getEntry(sbK.toString());
        if (entry != null) {
            return entry;
        }
        int iIndexOf = str.indexOf(45);
        StringBuilder sb2 = new StringBuilder("lib/");
        if (iIndexOf <= 0) {
            iIndexOf = str.length();
        }
        sb2.append(str.substring(0, iIndexOf));
        sb2.append("/");
        sb2.append(System.mapLibraryName(str2));
        return zipFile.getEntry(sb2.toString());
    }

    public static boolean a(String str) {
        return f42318a.contains(str);
    }
}
