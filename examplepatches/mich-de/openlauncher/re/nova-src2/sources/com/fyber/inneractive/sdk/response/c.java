package com.fyber.inneractive.sdk.response;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.n;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.util.o;
import com.fyber.inneractive.sdk.util.s0;
import java.io.IOException;
import java.io.StringWriter;

/* loaded from: classes3.dex */
public final class c extends b {
    @Override // com.fyber.inneractive.sdk.response.b
    public final void a(String str, w0 w0Var) throws IOException, NumberFormatException {
        f fVar = (f) this.f31031a;
        if (TextUtils.isEmpty(fVar.f31065z) && w0Var != null) {
            fVar.f31065z = w0Var.f27944b;
        }
        if (str == null) {
            str = null;
        } else {
            s0 s0Var = s0.f31222c;
            s0Var.getClass();
            int iIndexOf = str.indexOf(38);
            if (iIndexOf >= 0) {
                StringWriter stringWriter = new StringWriter((int) ((str.length() * 0.1d) + str.length()));
                try {
                    s0Var.a(stringWriter, str, iIndexOf);
                } catch (IOException unused) {
                }
                str = stringWriter.toString();
            }
        }
        int i5 = n.f27870a;
        String property = System.getProperty("ia.testEnvironmentConfiguration.assetResponse");
        if (!TextUtils.isEmpty(property)) {
            String strB = o.b(property);
            if (!TextUtils.isEmpty(strB)) {
                str = strB;
            }
        }
        fVar.M = str;
    }

    @Override // com.fyber.inneractive.sdk.response.b
    public final e a() {
        f fVar = new f();
        this.f31031a = fVar;
        return fVar;
    }
}
