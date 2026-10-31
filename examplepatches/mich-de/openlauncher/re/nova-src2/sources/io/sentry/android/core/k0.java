package io.sentry.android.core;

import android.content.Context;
import java.io.File;
import java.io.FileOutputStream;
import java.io.RandomAccessFile;
import java.nio.charset.Charset;
import java.util.UUID;

/* loaded from: classes4.dex */
public abstract class k0 {

    /* renamed from: a, reason: collision with root package name */
    public static String f66985a;

    /* renamed from: b, reason: collision with root package name */
    public static final Charset f66986b = Charset.forName("UTF-8");

    public static synchronized String a(Context context) {
        try {
            if (f66985a == null) {
                File file = new File(context.getFilesDir(), "INSTALLATION");
                try {
                    if (!file.exists()) {
                        FileOutputStream fileOutputStream = new FileOutputStream(file);
                        try {
                            String string = UUID.randomUUID().toString();
                            fileOutputStream.write(string.getBytes(f66986b));
                            fileOutputStream.flush();
                            fileOutputStream.close();
                            f66985a = string;
                            return string;
                        } finally {
                        }
                    }
                    RandomAccessFile randomAccessFile = new RandomAccessFile(file, "r");
                    try {
                        byte[] bArr = new byte[(int) randomAccessFile.length()];
                        randomAccessFile.readFully(bArr);
                        String str = new String(bArr, f66986b);
                        randomAccessFile.close();
                        f66985a = str;
                    } finally {
                    }
                } catch (Throwable th2) {
                    throw new RuntimeException(th2);
                }
            }
            return f66985a;
        } catch (Throwable th3) {
            throw th3;
        }
    }
}
