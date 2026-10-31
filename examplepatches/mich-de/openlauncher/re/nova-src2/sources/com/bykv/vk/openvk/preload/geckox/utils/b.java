package com.bykv.vk.openvk.preload.geckox.utils;

import android.os.Process;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes2.dex */
public final class b {
    public static boolean a(File file) {
        if (file == null || !file.exists()) {
            return true;
        }
        GeckoLogger.d("gecko-debug-tag", "delete file，pid:", Integer.valueOf(Process.myPid()), ", thread:", Thread.currentThread().toString(), ", file:" + file.getAbsolutePath());
        return d(file);
    }

    public static List<File> b(File file) {
        File[] fileArrListFiles;
        if (!file.exists() || !file.isDirectory() || (fileArrListFiles = file.listFiles()) == null || fileArrListFiles.length == 0) {
            return null;
        }
        List<File> listAsList = Arrays.asList(fileArrListFiles);
        final HashMap map = new HashMap();
        for (File file2 : listAsList) {
            map.put(file2, Long.valueOf(file2.lastModified()));
        }
        Collections.sort(listAsList, new Comparator<File>() { // from class: com.bykv.vk.openvk.preload.geckox.utils.b.1
            @Override // java.util.Comparator
            public final /* synthetic */ int compare(File file3, File file4) {
                File file5 = file3;
                File file6 = file4;
                if (file5 == null && file6 == null) {
                    return 0;
                }
                if (file5 == null) {
                    return 1;
                }
                if (file6 == null) {
                    return -1;
                }
                return Long.compare(((Long) map.get(file5)).longValue(), ((Long) map.get(file6)).longValue());
            }
        });
        return listAsList;
    }

    public static boolean c(File file) {
        if (file.isDirectory()) {
            for (String str : file.list()) {
                if (!c(new File(file, str))) {
                    return false;
                }
            }
        }
        return file.delete();
    }

    private static boolean d(File file) {
        boolean z11;
        File[] fileArrListFiles;
        if (file == null || !file.exists()) {
            return true;
        }
        if (!file.isDirectory() || (fileArrListFiles = file.listFiles()) == null) {
            z11 = true;
        } else {
            z11 = true;
            for (File file2 : fileArrListFiles) {
                z11 = z11 && d(file2);
            }
        }
        return z11 && file.delete();
    }

    public static void a(InputStream inputStream, OutputStream outputStream) throws IOException {
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
        byte[] bArr = new byte[1024];
        while (true) {
            int i5 = bufferedInputStream.read(bArr);
            if (i5 != -1) {
                bufferedOutputStream.write(bArr, 0, i5);
            } else {
                bufferedOutputStream.flush();
                return;
            }
        }
    }

    public static String a(InputStream inputStream) {
        BufferedReader bufferedReader;
        try {
            StringBuilder sb2 = new StringBuilder();
            bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            while (true) {
                try {
                    String line = bufferedReader.readLine();
                    if (line == null) {
                        break;
                    }
                    sb2.append(line);
                } catch (Throwable unused) {
                    if (bufferedReader != null) {
                        try {
                            bufferedReader.close();
                        } catch (Throwable unused2) {
                        }
                    }
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (Throwable unused3) {
                        }
                    }
                    return null;
                }
            }
            String string = sb2.toString();
            try {
                bufferedReader.close();
            } catch (Throwable unused4) {
            }
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (Throwable unused5) {
                }
            }
            return string;
        } catch (Throwable unused6) {
            bufferedReader = null;
        }
    }
}
