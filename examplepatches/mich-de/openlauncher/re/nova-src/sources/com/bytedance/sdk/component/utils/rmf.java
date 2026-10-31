package com.bytedance.sdk.component.utils;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/* loaded from: classes2.dex */
public class rmf {
    public static List<File> ycx(String str, String str2) throws IOException {
        return ycx(str, str2, (String) null);
    }

    private static boolean zb(File file) {
        if (file == null) {
            return false;
        }
        if (file.exists()) {
            return file.isFile();
        }
        if (!ycx(file.getParentFile())) {
            return false;
        }
        try {
            return file.createNewFile();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "Yec9oBe1ZdQ=", "WPwolBe5RtWlUt5OmAKGIVfr", 165);
            return false;
        }
    }

    public static List<File> ycx(String str, String str2, String str3) throws IOException {
        return ycx(ycx(str), ycx(str2), str3);
    }

    public static List<File> ycx(File file, File file2, String str) throws IOException {
        if (file == null || file2 == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        ZipFile zipFile = new ZipFile(file);
        Enumeration<? extends ZipEntry> enumerationEntries = zipFile.entries();
        try {
            if (zb(str)) {
                while (enumerationEntries.hasMoreElements()) {
                    ZipEntry zipEntryNextElement = enumerationEntries.nextElement();
                    String name = zipEntryNextElement.getName();
                    if (!name.contains("../") && !ycx(file2, arrayList, zipFile, zipEntryNextElement, name)) {
                        return arrayList;
                    }
                }
            } else {
                while (enumerationEntries.hasMoreElements()) {
                    ZipEntry zipEntryNextElement2 = enumerationEntries.nextElement();
                    String name2 = zipEntryNextElement2.getName();
                    if (!name2.contains("../") && name2.contains(str) && !ycx(file2, arrayList, zipFile, zipEntryNextElement2, name2)) {
                        return arrayList;
                    }
                }
            }
            return arrayList;
        } finally {
            zipFile.close();
        }
    }

    private static boolean zb(String str) {
        if (str == null) {
            return true;
        }
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            if (!Character.isWhitespace(str.charAt(i5))) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static boolean ycx(File file, List<File> list, ZipFile zipFile, ZipEntry zipEntry, String str) throws Throwable {
        BufferedOutputStream bufferedOutputStream;
        FileOutputStream fileOutputStream;
        BufferedInputStream bufferedInputStream;
        Throwable th2;
        File file2 = new File(file, str);
        list.add(file2);
        if (zipEntry.isDirectory()) {
            return ycx(file2);
        }
        if (!zb(file2)) {
            return false;
        }
        try {
            fileOutputStream = new FileOutputStream(file2);
            try {
                bufferedInputStream = new BufferedInputStream(zipFile.getInputStream(zipEntry));
                try {
                    bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
                } catch (Throwable th3) {
                    th = th3;
                    bufferedOutputStream = null;
                    th2 = th;
                    if (bufferedInputStream != null) {
                        bufferedInputStream.close();
                    }
                    if (bufferedOutputStream != null) {
                        bufferedOutputStream.close();
                    }
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                    throw th2;
                }
                try {
                    byte[] bArr = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
                    while (true) {
                        int i5 = bufferedInputStream.read(bArr);
                        if (i5 != -1) {
                            bufferedOutputStream.write(bArr, 0, i5);
                        } else {
                            bufferedInputStream.close();
                            bufferedOutputStream.close();
                            fileOutputStream.close();
                            return true;
                        }
                    }
                } catch (Throwable th4) {
                    th2 = th4;
                    if (bufferedInputStream != null) {
                    }
                    if (bufferedOutputStream != null) {
                    }
                    if (fileOutputStream != null) {
                    }
                    throw th2;
                }
            } catch (Throwable th5) {
                th = th5;
                bufferedOutputStream = null;
                bufferedInputStream = null;
            }
        } catch (Throwable th6) {
            th = th6;
            bufferedOutputStream = null;
            fileOutputStream = null;
            bufferedInputStream = null;
        }
    }

    private static boolean ycx(File file) {
        if (file != null) {
            return file.exists() ? file.isDirectory() : file.mkdirs();
        }
        return false;
    }

    private static File ycx(String str) {
        if (zb(str)) {
            return null;
        }
        return new File(str);
    }
}
