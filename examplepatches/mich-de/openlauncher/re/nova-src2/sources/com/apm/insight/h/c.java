package com.apm.insight.h;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import androidx.recyclerview.widget.u1;
import com.apm.insight.l.f;
import dalvik.system.BaseDexClassLoader;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/* loaded from: classes2.dex */
public class c {
    static {
        new ArrayList();
    }

    public static String a(Context context, String str, File file) throws IOException {
        ApplicationInfo applicationInfo = context.getApplicationInfo();
        String strA = a(applicationInfo.sourceDir, str, file);
        if (strA == null) {
            return null;
        }
        for (String str2 : applicationInfo.splitSourceDirs) {
            strA = a(str2, str, file);
            if (strA == null) {
                return null;
            }
        }
        try {
            ClassLoader classLoader = c.class.getClassLoader();
            while (!(classLoader instanceof BaseDexClassLoader) && classLoader.getParent() != null) {
                classLoader = classLoader.getParent();
            }
            if (!(classLoader instanceof BaseDexClassLoader)) {
                return strA;
            }
            Field declaredField = BaseDexClassLoader.class.getDeclaredField("pathList");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(classLoader);
            Field declaredField2 = obj.getClass().getDeclaredField("nativeLibraryDirectories");
            declaredField2.setAccessible(true);
            for (String str3 : (String[]) declaredField2.get(obj)) {
                File file2 = new File(str3, System.mapLibraryName(str));
                if (file2.exists()) {
                    f.a(file2, file);
                    com.apm.insight.a.a(file.getAbsolutePath());
                    return null;
                }
            }
            return "not_found";
        } catch (Throwable th2) {
            return th2.getMessage();
        }
    }

    private static String a(String str, String str2, File file) throws IOException {
        InputStream inputStream;
        ZipFile zipFile;
        String message;
        String str3;
        ZipEntry entry;
        FileOutputStream fileOutputStream;
        FileOutputStream fileOutputStream2 = null;
        try {
            zipFile = new ZipFile(new File(str), 1);
            try {
                StringBuilder sb2 = new StringBuilder("lib/");
                str3 = Build.CPU_ABI;
                sb2.append(str3);
                sb2.append("/");
                sb2.append(System.mapLibraryName(str2));
                entry = zipFile.getEntry(sb2.toString());
            } catch (Throwable th2) {
                th = th2;
                inputStream = null;
            }
        } catch (Throwable th3) {
            th = th3;
            inputStream = null;
            zipFile = null;
        }
        if (entry == null) {
            int iIndexOf = str3.indexOf(45);
            StringBuilder sb3 = new StringBuilder("lib/");
            if (iIndexOf <= 0) {
                iIndexOf = str3.length();
            }
            sb3.append(str3.substring(0, iIndexOf));
            sb3.append("/");
            sb3.append(System.mapLibraryName(str2));
            String string = sb3.toString();
            ZipEntry entry2 = zipFile.getEntry(string);
            if (entry2 == null) {
                message = "Library entry not found:".concat(String.valueOf(string));
                com.apm.insight.a.a((Closeable) null);
                com.apm.insight.a.a((Closeable) null);
                com.apm.insight.a.a(zipFile);
                return message;
            }
            entry = entry2;
        }
        file.createNewFile();
        InputStream inputStream2 = zipFile.getInputStream(entry);
        try {
            fileOutputStream = new FileOutputStream(file);
        } catch (Throwable th4) {
            inputStream = inputStream2;
            th = th4;
        }
        try {
            byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
            while (true) {
                int i5 = inputStream2.read(bArr);
                if (i5 > 0) {
                    fileOutputStream.write(bArr, 0, i5);
                } else {
                    com.apm.insight.a.a(file.getAbsolutePath());
                    com.apm.insight.a.a((Closeable) fileOutputStream);
                    com.apm.insight.a.a((Closeable) inputStream2);
                    com.apm.insight.a.a(zipFile);
                    return null;
                }
            }
        } catch (Throwable th5) {
            fileOutputStream2 = fileOutputStream;
            inputStream = inputStream2;
            th = th5;
            try {
                message = th.getMessage();
                com.apm.insight.a.a((Closeable) fileOutputStream2);
                com.apm.insight.a.a((Closeable) inputStream);
                com.apm.insight.a.a(zipFile);
                return message;
            } catch (Throwable th6) {
                com.apm.insight.a.a((Closeable) fileOutputStream2);
                com.apm.insight.a.a((Closeable) inputStream);
                com.apm.insight.a.a(zipFile);
                throw th6;
            }
        }
    }
}
