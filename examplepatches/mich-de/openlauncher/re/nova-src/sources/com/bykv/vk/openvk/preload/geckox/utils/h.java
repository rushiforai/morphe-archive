package com.bykv.vk.openvk.preload.geckox.utils;

import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Arrays;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    private static byte[] f22163a = {80, 75, 3, 4};

    /* renamed from: b, reason: collision with root package name */
    private static byte[] f22164b = {80, 75, 5, 6};

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v5, types: [java.io.Closeable, java.io.FileOutputStream, java.io.OutputStream] */
    public static void a(InputStream inputStream, String str, String str2) throws Exception {
        ZipInputStream zipInputStream = null;
        try {
            String canonicalPath = new File(str).getCanonicalPath();
            ZipInputStream zipInputStream2 = new ZipInputStream(inputStream);
            boolean z11 = false;
            while (true) {
                try {
                    ZipEntry nextEntry = zipInputStream2.getNextEntry();
                    if (nextEntry == null) {
                        if (z11) {
                            CloseableUtils.close(zipInputStream2);
                            return;
                        }
                        inputStream.reset();
                        if (!a(inputStream)) {
                            throw new RuntimeException("not zip file  channel:".concat(String.valueOf(str2)));
                        }
                        throw new RuntimeException("unzip file: channel:".concat(String.valueOf(str2)));
                    }
                    String name = nextEntry.getName();
                    if (!name.startsWith("__MACOSX/") && !name.equals(".DS_Store") && !name.contains("../")) {
                        if (!name.startsWith(str2 + File.separator)) {
                            throw new RuntimeException("the zip package outermost folder is not named by channel channel:".concat(String.valueOf(str2)));
                        }
                        if (nextEntry.isDirectory()) {
                            File file = new File(canonicalPath, name);
                            if (!file.getCanonicalPath().startsWith(canonicalPath)) {
                                throw new RuntimeException("directory traversal, dir:" + name + ", channel:" + str2);
                            }
                            file.mkdirs();
                        } else {
                            String canonicalPath2 = new File(canonicalPath, name).getCanonicalPath();
                            if (!canonicalPath2.startsWith(canonicalPath)) {
                                throw new RuntimeException("directory traversal, file name:".concat(name));
                            }
                            File file2 = new File(canonicalPath2);
                            file2.getParentFile().mkdirs();
                            try {
                                ?? fileOutputStream = new FileOutputStream(file2);
                                try {
                                    b.a(zipInputStream2, fileOutputStream);
                                    CloseableUtils.close((Closeable) fileOutputStream);
                                } catch (Throwable th2) {
                                    th = th2;
                                    zipInputStream = fileOutputStream;
                                    CloseableUtils.close(zipInputStream);
                                    throw th;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                            }
                        }
                    }
                    z11 = true;
                } catch (Throwable th4) {
                    th = th4;
                    zipInputStream = zipInputStream2;
                    CloseableUtils.close(zipInputStream);
                    throw th;
                }
            }
        } catch (Throwable th5) {
            th = th5;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static boolean a(InputStream inputStream) throws Exception {
        boolean z11;
        try {
            byte[] bArr = new byte[4];
            if (inputStream.read(bArr, 0, 4) != 4) {
                return false;
            }
            if (!Arrays.equals(f22163a, bArr)) {
                z11 = Arrays.equals(f22164b, bArr);
            }
            return z11;
        } finally {
            CloseableUtils.close(inputStream);
        }
    }
}
