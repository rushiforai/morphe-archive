package com.bytedance.adsdk.zb.dj;

import android.content.Context;
import android.util.Pair;
import com.bytedance.adsdk.zb.ok;
import java.io.Closeable;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipInputStream;

/* loaded from: classes2.dex */
public class fby {
    private final ul ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final lt f22831zb;

    public fby(ul ulVar, lt ltVar) {
        this.ycx = ulVar;
        this.f22831zb = ltVar;
    }

    private ok<com.bytedance.adsdk.zb.ul> sya(Context context, String str, String str2) throws IOException {
        Closeable closeable = null;
        try {
            try {
                dj djVarYcx = this.f22831zb.ycx(str);
                if (!djVarYcx.ycx()) {
                    ok<com.bytedance.adsdk.zb.ul> okVar = new ok<>(new IllegalArgumentException(djVarYcx.dj()));
                    try {
                        djVarYcx.close();
                    } catch (IOException unused) {
                    }
                    return okVar;
                }
                ok<com.bytedance.adsdk.zb.ul> okVarYcx = ycx(context, str, djVarYcx.zb(), djVarYcx.sya(), str2);
                okVarYcx.ycx();
                try {
                    djVarYcx.close();
                } catch (IOException unused2) {
                }
                return okVarYcx;
            } finally {
            }
        } catch (Exception e3) {
            ok<com.bytedance.adsdk.zb.ul> okVar2 = new ok<>(e3);
            if (0 != 0) {
                try {
                    closeable.close();
                } catch (IOException unused3) {
                }
            }
            return okVar2;
        }
    }

    private com.bytedance.adsdk.zb.ul zb(Context context, String str, String str2) {
        ul ulVar;
        Pair<sya, InputStream> pairYcx;
        if (str2 == null || (ulVar = this.ycx) == null || (pairYcx = ulVar.ycx(str)) == null) {
            return null;
        }
        sya syaVar = (sya) pairYcx.first;
        InputStream inputStream = (InputStream) pairYcx.second;
        ok<com.bytedance.adsdk.zb.ul> okVarYcx = syaVar == sya.ZIP ? com.bytedance.adsdk.zb.fby.ycx(context, new ZipInputStream(inputStream), str2) : com.bytedance.adsdk.zb.fby.zb(inputStream, str2);
        if (okVarYcx.ycx() != null) {
            return okVarYcx.ycx();
        }
        return null;
    }

    public ok<com.bytedance.adsdk.zb.ul> ycx(Context context, String str, String str2) {
        com.bytedance.adsdk.zb.ul ulVarZb = zb(context, str, str2);
        return ulVarZb != null ? new ok<>(ulVarZb) : sya(context, str, str2);
    }

    private ok<com.bytedance.adsdk.zb.ul> ycx(Context context, String str, InputStream inputStream, String str2, String str3) throws IOException {
        ok<com.bytedance.adsdk.zb.ul> okVarYcx;
        sya syaVar;
        ul ulVar;
        if (str2 == null) {
            str2 = "application/json";
        }
        if (!str2.contains("application/zip") && !str2.contains("application/x-zip") && !str2.contains("application/x-zip-compressed") && !str.split("\\?")[0].endsWith(".lottie")) {
            syaVar = sya.JSON;
            okVarYcx = ycx(str, inputStream, str3);
        } else {
            sya syaVar2 = sya.ZIP;
            okVarYcx = ycx(context, str, inputStream, str3);
            syaVar = syaVar2;
        }
        if (str3 != null && okVarYcx.ycx() != null && (ulVar = this.ycx) != null) {
            ulVar.ycx(str, syaVar);
        }
        return okVarYcx;
    }

    private ok<com.bytedance.adsdk.zb.ul> ycx(Context context, String str, InputStream inputStream, String str2) throws IOException {
        ul ulVar;
        if (str2 != null && (ulVar = this.ycx) != null) {
            return com.bytedance.adsdk.zb.fby.ycx(context, new ZipInputStream(new FileInputStream(ulVar.ycx(str, inputStream, sya.ZIP))), str);
        }
        return com.bytedance.adsdk.zb.fby.ycx(context, new ZipInputStream(inputStream), (String) null);
    }

    private ok<com.bytedance.adsdk.zb.ul> ycx(String str, InputStream inputStream, String str2) throws IOException {
        ul ulVar;
        if (str2 != null && (ulVar = this.ycx) != null) {
            return com.bytedance.adsdk.zb.fby.zb(new FileInputStream(ulVar.ycx(str, inputStream, sya.JSON).getAbsolutePath()), str);
        }
        return com.bytedance.adsdk.zb.fby.zb(inputStream, (String) null);
    }
}
