package com.fyber.inneractive.sdk.network;

import android.os.Environment;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URI;
import java.util.List;
import java.util.Map;

/* loaded from: classes3.dex */
public final class b1 extends t0 {

    /* renamed from: q, reason: collision with root package name */
    public final String f28692q;

    public b1(com.fyber.inneractive.sdk.web.x xVar, String str, com.fyber.inneractive.sdk.config.global.r rVar) {
        super(xVar, g0.f28722c.a(), rVar);
        this.f28692q = str;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final o0 a(l lVar, Map map, int i5) throws Throwable {
        FileOutputStream fileOutputStream;
        String string;
        o0 o0Var = new o0();
        FileOutputStream fileOutputStream2 = null;
        try {
            try {
                InputStream inputStream = lVar.f28735c;
                File file = new File(Environment.getExternalStorageDirectory(), "Pictures");
                file.mkdirs();
                String strA = a(URI.create(this.f28692q), map);
                if (TextUtils.isEmpty(strA)) {
                    string = null;
                } else {
                    File file2 = new File(file, strA);
                    string = file2.toString();
                    fileOutputStream = new FileOutputStream(file2);
                    try {
                        com.fyber.inneractive.sdk.util.v.a(inputStream, fileOutputStream);
                        fileOutputStream2 = fileOutputStream;
                    } catch (Exception unused) {
                        fileOutputStream2 = fileOutputStream;
                        IAlog.a("failed to download and save the image file.", new Object[0]);
                        com.fyber.inneractive.sdk.util.v.b(fileOutputStream2);
                        return o0Var;
                    } catch (Throwable th2) {
                        th = th2;
                        com.fyber.inneractive.sdk.util.v.b(fileOutputStream);
                        throw th;
                    }
                }
                o0Var.f28757a = string;
            } catch (Exception unused2) {
            }
            com.fyber.inneractive.sdk.util.v.b(fileOutputStream2);
            return o0Var;
        } catch (Throwable th3) {
            th = th3;
            fileOutputStream = fileOutputStream2;
        }
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final int g() {
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final m0 m() {
        return m0.GET;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final g1 o() {
        return g1.LOW;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final String r() {
        return this.f28692q;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final boolean u() {
        return false;
    }

    public static String a(URI uri, Map map) {
        String path = uri.getPath();
        if (path == null) {
            return null;
        }
        String name = new File(path).getName();
        List list = map != null ? (List) map.get("Content-Type") : null;
        int i5 = 0;
        String str = list != null ? (String) list.get(0) : null;
        if (str != null) {
            String[] strArrSplit = str.split(";");
            int length = strArrSplit.length;
            while (true) {
                if (i5 >= length) {
                    break;
                }
                String str2 = strArrSplit[i5];
                if (str2.contains("image/")) {
                    String str3 = "." + str2.split("/")[1];
                    if (!name.endsWith(str3)) {
                        return b.c0.E(name, str3);
                    }
                } else {
                    i5++;
                }
            }
        }
        return name;
    }
}
