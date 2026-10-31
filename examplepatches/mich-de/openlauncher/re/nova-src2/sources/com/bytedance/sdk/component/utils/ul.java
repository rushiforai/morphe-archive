package com.bytedance.sdk.component.utils;

import android.content.Context;
import androidx.recyclerview.widget.n0;
import b.c0;
import com.google.android.gms.internal.measurement.k2;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/* loaded from: classes2.dex */
public class ul {

    /* renamed from: com.bytedance.sdk.component.utils.ul$1, reason: invalid class name */
    public static class AnonymousClass1 implements Comparator<File> {
        @Override // java.util.Comparator
        public /* bridge */ /* synthetic */ int compare(File file, File file2) {
            throw null;
        }
    }

    public static final class ycx implements Comparator<File> {
        private ycx() {
        }

        private int ycx(long j11, long j12) {
            if (j11 < j12) {
                return -1;
            }
            return j11 == j12 ? 0 : 1;
        }

        public /* synthetic */ ycx(AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // java.util.Comparator
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public int compare(File file, File file2) {
            return ycx(file.lastModified(), file2.lastModified());
        }
    }

    public static byte[] dj(File file) {
        FileInputStream fileInputStream;
        if (file != null && file.isFile() && file.exists() && file.canRead() && file.length() > 0) {
            try {
                long length = file.length();
                Long lValueOf = Long.valueOf(length);
                fileInputStream = new FileInputStream(file);
                try {
                    byte[] bArr = new byte[lValueOf.intValue()];
                    if (fileInputStream.read(bArr) == length) {
                        try {
                            fileInputStream.close();
                            return bArr;
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "SesskSW1ZcI=", n0.DEFAULT_SWIPE_ANIMATION_DURATION);
                            return bArr;
                        }
                    }
                } catch (Throwable th3) {
                    th = th3;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "SesskSW1ZcI=", 245);
                    if (fileInputStream != null) {
                        fileInputStream.close();
                    }
                    return null;
                }
            } catch (Throwable th4) {
                th = th4;
                fileInputStream = null;
            }
            try {
                fileInputStream.close();
            } catch (Throwable th5) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "SesskSW1ZcI=", n0.DEFAULT_SWIPE_ANIMATION_DURATION);
            }
        }
        return null;
    }

    private static void lt(File file) throws IOException {
        if (!file.delete() || !file.createNewFile()) {
            throw new IOException("Error recreate zero-size file ".concat(String.valueOf(file)));
        }
    }

    private static void lud(File file) throws IOException {
        long length = file.length();
        if (length == 0) {
            lt(file);
            return;
        }
        RandomAccessFile randomAccessFile = null;
        try {
            RandomAccessFile randomAccessFile2 = new RandomAccessFile(file, "rwd");
            long j11 = length - 1;
            try {
                randomAccessFile2.seek(j11);
                byte b11 = randomAccessFile2.readByte();
                randomAccessFile2.seek(j11);
                randomAccessFile2.write(b11);
                randomAccessFile2.close();
            } catch (Throwable th2) {
                th = th2;
                randomAccessFile = randomAccessFile2;
                try {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "VuEpnAWl", Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE);
                } finally {
                    if (randomAccessFile != null) {
                        randomAccessFile.close();
                    }
                }
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public static void sya(File file) {
        if (file == null || !file.exists()) {
            return;
        }
        if (file.isFile()) {
            try {
                file.delete();
                return;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "X+shkBe5Tc6S", 169);
                return;
            }
        }
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles != null && fileArrListFiles.length > 0) {
            for (File file2 : fileArrListFiles) {
                if (file2.isDirectory()) {
                    sya(file2);
                } else {
                    try {
                        file2.delete();
                    } catch (Throwable th3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "X+shkBe5Tc6S", 180);
                    }
                }
            }
        }
        try {
            file.delete();
        } catch (Throwable th4) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "X+shkBe5Tc6S", 188);
        }
    }

    public static File ycx(Context context, File file, String str) {
        if (file != null) {
            try {
                if (!file.exists()) {
                    file.mkdirs();
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "XOs5uAK1Z+iSecJfvAOvK179PrMKsGw=", 45);
                return new File(file, str);
            }
        }
        if (thx.ycx(context)) {
            return new File(file, str);
        }
        return new File(file, str + "_" + thx.sya(context));
    }

    public static File zb(Context context, String str) {
        String absolutePath = context.getCacheDir().getAbsolutePath();
        if (absolutePath != null) {
            String str2 = File.separator;
            if (!absolutePath.endsWith(str2)) {
                absolutePath = c0.E(absolutePath, str2);
            }
        }
        File file = new File(c0.E(absolutePath, str));
        if (!file.exists()) {
            file.mkdirs();
        }
        return file;
    }

    public static File ycx(Context context, String str, String str2) {
        String strYcx = ycx(context);
        if (!thx.ycx(context)) {
            StringBuilder sbK = k2.k(str, "_");
            sbK.append(thx.sya(context));
            str = sbK.toString();
        }
        if (strYcx != null) {
            String str3 = File.separator;
            if (!strYcx.endsWith(str3)) {
                strYcx = c0.E(strYcx, str3);
            }
        }
        String strE = c0.E(strYcx, str);
        File file = new File(strE);
        if (!file.exists()) {
            file.mkdirs();
        }
        return new File(strE, str2);
    }

    public static void zb(File file) throws IOException {
        if (file.exists()) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (file.setLastModified(jCurrentTimeMillis)) {
                return;
            }
            lud(file);
            if (file.lastModified() < jCurrentTimeMillis) {
                new Date(file.lastModified()).toString();
                file.getAbsolutePath();
            }
        }
    }

    public static File ycx(Context context, String str) {
        String absolutePath = context.getCacheDir().getAbsolutePath();
        if (!thx.ycx(context)) {
            StringBuilder sbK = k2.k(str, "_");
            sbK.append(thx.sya(context));
            str = sbK.toString();
        }
        if (absolutePath != null) {
            String str2 = File.separator;
            if (!absolutePath.endsWith(str2)) {
                absolutePath = c0.E(absolutePath, str2);
            }
        }
        File file = new File(c0.E(absolutePath, str));
        if (!file.exists()) {
            file.mkdirs();
        }
        return file;
    }

    private static String ycx(Context context) {
        File cacheDir;
        if (context == null || (cacheDir = context.getCacheDir()) == null) {
            return null;
        }
        return cacheDir.getPath();
    }

    public static List<File> ycx(File file) {
        LinkedList linkedList = new LinkedList();
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles == null) {
            return linkedList;
        }
        List<File> listAsList = Arrays.asList(fileArrListFiles);
        Collections.sort(listAsList, new ycx(null));
        return listAsList;
    }

    public static boolean ycx(File file, File file2) {
        FileOutputStream fileOutputStream;
        if (file == null || !file.exists() || !file.isFile() || !file.canRead() || file2 == null) {
            return false;
        }
        FileInputStream fileInputStream = null;
        try {
            if (file2.exists()) {
                file2.delete();
            }
            file2.createNewFile();
            fileOutputStream = new FileOutputStream(file2);
            try {
                byte[] bArr = new byte[1024];
                FileInputStream fileInputStream2 = new FileInputStream(file);
                while (true) {
                    try {
                        int i5 = fileInputStream2.read(bArr);
                        if (i5 != -1) {
                            fileOutputStream.write(bArr, 0, i5);
                        } else {
                            try {
                                fileInputStream2.close();
                                fileOutputStream.close();
                                return true;
                            } catch (Throwable th2) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "WOE9jCW1ZcI=", 288);
                                return true;
                            }
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        fileInputStream = fileInputStream2;
                        try {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "WOE9jCW1ZcI=", 278);
                            if (fileInputStream != null) {
                                try {
                                } catch (Throwable th4) {
                                    return false;
                                }
                            }
                            return false;
                        } finally {
                            if (fileInputStream != null) {
                                try {
                                    fileInputStream.close();
                                } catch (Throwable th42) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th42, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "fechkDaoYMuT", "WOE9jCW1ZcI=", 288);
                                }
                            }
                            if (fileOutputStream != null) {
                                fileOutputStream.close();
                            }
                        }
                    }
                }
            } catch (Throwable th5) {
                th = th5;
            }
        } catch (Throwable th6) {
            th = th6;
            fileOutputStream = null;
        }
    }
}
