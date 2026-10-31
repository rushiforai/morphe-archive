package com.bytedance.sdk.component.adexpress.ycx.zb;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby {
    private static com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycx;

    public static void dj() {
        sya.zb(lud.fby(), zb(), "temp_pkg_info.json");
        ycx = null;
    }

    public static void sya() throws IOException {
        sya.ycx(lud.fby(), zb(), "temp_pkg_info.json");
    }

    public static void ycx() throws IOException {
        FileInputStream fileInputStream;
        Throwable th2;
        FileInputStream fileInputStream2 = null;
        try {
            try {
                File file = new File(lud.fby(), "temp_pkg_info.json");
                long length = file.length();
                Long lValueOf = Long.valueOf(length);
                if (length > 0 && file.exists() && file.isFile()) {
                    byte[] bArr = new byte[lValueOf.intValue()];
                    fileInputStream = new FileInputStream(file);
                    try {
                        fileInputStream.read(bArr);
                        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVarYcx = com.bytedance.sdk.component.adexpress.ycx.sya.ycx.ycx(new JSONObject(new String(bArr, "utf-8")));
                        if (ycxVarYcx != null) {
                            ycx = ycxVarYcx;
                            ycxVarYcx.sya();
                        }
                        fileInputStream2 = fileInputStream;
                    } catch (Throwable th3) {
                        th2 = th3;
                        try {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "bes/hgqzZw==", "UuAkgQ==", 45);
                            if (fileInputStream != null) {
                                fileInputStream.close();
                                return;
                            }
                            return;
                        } catch (Throwable th4) {
                            if (fileInputStream != null) {
                                try {
                                    fileInputStream.close();
                                } catch (IOException e3) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "bes/hgqzZw==", "UuAkgQ==", 51);
                                }
                            }
                            throw th4;
                        }
                    }
                }
                if (fileInputStream2 != null) {
                    fileInputStream2.close();
                }
            } catch (Throwable th5) {
                fileInputStream = null;
                th2 = th5;
            }
        } catch (IOException e11) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "bes/hgqzZw==", "UuAkgQ==", 51);
        }
    }

    public static synchronized com.bytedance.sdk.component.adexpress.ycx.sya.ycx zb() {
        return ycx;
    }

    public static boolean zb(com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar) {
        return sya.sya(zb(), ycxVar);
    }

    public static synchronized void ycx(com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar) {
        if (ycxVar != null) {
            if (ycxVar.fby()) {
                ycx = ycxVar;
            }
        }
    }

    public static boolean ycx(String str) {
        return sya.ycx(zb(), str);
    }
}
