package com.bytedance.adsdk.zb.dj;

import android.util.Pair;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes2.dex */
public class ul {
    private final lud ycx;

    public ul(lud ludVar) {
        this.ycx = ludVar;
    }

    private File zb(String str) throws FileNotFoundException {
        File file = new File(ycx(), ycx(str, sya.JSON, false));
        if (file.exists()) {
            return file;
        }
        File file2 = new File(ycx(), ycx(str, sya.ZIP, false));
        if (file2.exists()) {
            return file2;
        }
        return null;
    }

    public Pair<sya, InputStream> ycx(String str) {
        try {
            File fileZb = zb(str);
            if (fileZb == null) {
                return null;
            }
            FileInputStream fileInputStream = new FileInputStream(fileZb);
            sya syaVar = fileZb.getAbsolutePath().endsWith(".zip") ? sya.ZIP : sya.JSON;
            fileZb.getAbsolutePath();
            return new Pair<>(syaVar, fileInputStream);
        } catch (FileNotFoundException unused) {
            return null;
        }
    }

    public File ycx(String str, InputStream inputStream, sya syaVar) throws IOException {
        File file = new File(ycx(), ycx(str, syaVar, true));
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            try {
                byte[] bArr = new byte[1024];
                while (true) {
                    int i5 = inputStream.read(bArr);
                    if (i5 != -1) {
                        fileOutputStream.write(bArr, 0, i5);
                    } else {
                        fileOutputStream.flush();
                        fileOutputStream.close();
                        return file;
                    }
                }
            } catch (Throwable th2) {
                fileOutputStream.close();
                throw th2;
            }
        } finally {
            inputStream.close();
        }
    }

    public void ycx(String str, sya syaVar) {
        File file = new File(ycx(), ycx(str, syaVar, true));
        File file2 = new File(file.getAbsolutePath().replace(".temp", b.f42142b));
        boolean zRenameTo = file.renameTo(file2);
        file2.toString();
        if (zRenameTo) {
            return;
        }
        file.getAbsolutePath();
        file2.getAbsolutePath();
    }

    private File ycx() {
        File fileYcx = this.ycx.ycx();
        if (fileYcx.isFile()) {
            fileYcx.delete();
        }
        if (!fileYcx.exists()) {
            fileYcx.mkdirs();
        }
        return fileYcx;
    }

    private static String ycx(String str, sya syaVar, boolean z11) {
        StringBuilder sb2 = new StringBuilder("lottie_cache_");
        sb2.append(str.replaceAll("\\W+", b.f42142b));
        sb2.append(z11 ? syaVar.ycx() : syaVar.sya);
        return sb2.toString();
    }
}
