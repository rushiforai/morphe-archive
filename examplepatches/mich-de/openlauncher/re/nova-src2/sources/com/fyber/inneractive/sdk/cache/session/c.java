package com.fyber.inneractive.sdk.cache.session;

import android.app.Application;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.o;
import com.fyber.inneractive.sdk.util.r;
import com.fyber.inneractive.sdk.util.v;
import java.io.Closeable;
import java.io.FileInputStream;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f27681a;

    public c(e eVar) {
        this.f27681a = eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0036 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        FileInputStream fileInputStreamOpenFileInput;
        String str;
        Application application = o.f31210a;
        JSONObject jSONObject = null;
        try {
            fileInputStreamOpenFileInput = application.openFileInput("session_details.json");
        } catch (Throwable unused) {
            fileInputStreamOpenFileInput = null;
        }
        try {
            int iAvailable = fileInputStreamOpenFileInput.available();
            byte[] bArr = new byte[iAvailable];
            str = fileInputStreamOpenFileInput.read(bArr) == iAvailable ? new String(bArr, "UTF-8") : null;
        } catch (Throwable unused2) {
            try {
                IAlog.a("readFileFromContext failed reading %s", "session_details.json");
                v.a((Closeable) fileInputStreamOpenFileInput);
                str = null;
                if (!TextUtils.isEmpty(str)) {
                }
            } finally {
                v.a((Closeable) fileInputStreamOpenFileInput);
            }
        }
        if (!TextUtils.isEmpty(str)) {
            this.f27681a.getClass();
            return;
        }
        try {
            jSONObject = new JSONObject(str);
        } catch (Throwable unused3) {
            IAlog.f("Failed parsing SessionCache", new Object[0]);
        }
        if (jSONObject != null) {
            r.f31216b.post(new b(this, jSONObject));
        } else {
            application.deleteFile("session_details.json");
            this.f27681a.getClass();
        }
    }
}
