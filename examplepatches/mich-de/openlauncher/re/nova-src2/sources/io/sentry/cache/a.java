package io.sentry.cache;

import io.sentry.g3;
import io.sentry.w3;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Charset f67155a = Charset.forName("UTF-8");

    public static void a(w3 w3Var, String str, String str2) {
        File file;
        String cacheDirPath = w3Var.getCacheDirPath();
        if (cacheDirPath == null) {
            file = null;
        } else {
            File file2 = new File(cacheDirPath, str);
            file2.mkdirs();
            file = file2;
        }
        if (file == null) {
            w3Var.getLogger().g(g3.INFO, "Cache dir is not set, cannot delete from scope cache", new Object[0]);
            return;
        }
        File file3 = new File(file, str2);
        if (file3.exists()) {
            w3Var.getLogger().g(g3.DEBUG, "Deleting %s from scope cache", str2);
            if (file3.delete()) {
                return;
            }
            w3Var.getLogger().g(g3.ERROR, "Failed to delete: %s", file3.getAbsolutePath());
        }
    }

    public static Object b(w3 w3Var, String str, String str2, Class cls, io.sentry.d dVar) {
        File file;
        String cacheDirPath = w3Var.getCacheDirPath();
        if (cacheDirPath == null) {
            file = null;
        } else {
            file = new File(cacheDirPath, str);
            file.mkdirs();
        }
        if (file == null) {
            w3Var.getLogger().g(g3.INFO, "Cache dir is not set, cannot read from scope cache", new Object[0]);
            return null;
        }
        File file2 = new File(file, str2);
        if (!file2.exists()) {
            w3Var.getLogger().g(g3.DEBUG, "No entry stored for %s", str2);
            return null;
        }
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file2), f67155a));
            try {
                if (dVar == null) {
                    Object objD = w3Var.getSerializer().d(bufferedReader, cls);
                    bufferedReader.close();
                    return objD;
                }
                Object objC = w3Var.getSerializer().c(bufferedReader, cls, dVar);
                bufferedReader.close();
                return objC;
            } finally {
            }
        } catch (Throwable th2) {
            w3Var.getLogger().d(g3.ERROR, th2, "Error reading entity from scope cache: %s", str2);
            return null;
        }
    }

    public static void c(w3 w3Var, Object obj, String str, String str2) {
        File file;
        String cacheDirPath = w3Var.getCacheDirPath();
        if (cacheDirPath == null) {
            file = null;
        } else {
            File file2 = new File(cacheDirPath, str);
            file2.mkdirs();
            file = file2;
        }
        if (file == null) {
            w3Var.getLogger().g(g3.INFO, "Cache dir is not set, cannot store in scope cache", new Object[0]);
            return;
        }
        File file3 = new File(file, str2);
        if (file3.exists()) {
            w3Var.getLogger().g(g3.DEBUG, "Overwriting %s in scope cache", str2);
            if (!file3.delete()) {
                w3Var.getLogger().g(g3.ERROR, "Failed to delete: %s", file3.getAbsolutePath());
            }
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(file3);
            try {
                BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(fileOutputStream, f67155a));
                try {
                    w3Var.getSerializer().e(obj, bufferedWriter);
                    bufferedWriter.close();
                    fileOutputStream.close();
                } finally {
                }
            } finally {
            }
        } catch (Throwable th2) {
            w3Var.getLogger().d(g3.ERROR, th2, "Error persisting entity: %s", str2);
        }
    }
}
