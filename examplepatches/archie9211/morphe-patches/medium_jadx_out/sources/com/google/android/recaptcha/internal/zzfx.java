package com.google.android.recaptcha.internal;

import com.google.android.recaptcha.RecaptchaException;
import defpackage.bwa;
import defpackage.d87;
import defpackage.ei7;
import defpackage.f09;
import defpackage.g76;
import defpackage.qtf;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzfx extends Exception {
    public static final Map f;
    public final d87 a;
    public final d87 b;
    public final String c;
    public final Exception d;
    public final Map e;

    static {
        String str = null;
        int i = 12;
        f09 f09Var = new f09(qtf.JS_NETWORK_ERROR, new zzfx(d87.U0, d87.h, str, i));
        qtf qtfVar = qtf.JS_INTERNAL_ERROR;
        d87 d87Var = d87.T0;
        f = ei7.Q(f09Var, new f09(qtfVar, new zzfx(d87Var, d87.g, str, i)), new f09(qtf.JS_INVALID_SITE_KEY, new zzfx(d87.V0, d87.i, str, i)), new f09(qtf.JS_INVALID_SITE_KEY_TYPE, new zzfx(d87.W0, d87.j, str, i)), new f09(qtf.JS_THIRD_PARTY_APP_PACKAGE_NAME_NOT_ALLOWED, new zzfx(d87.X0, d87.k, str, i)), new f09(qtf.JS_INVALID_ACTION, new zzfx(d87.Y0, d87.l, str, i)), new f09(qtf.JS_PROGRAM_ERROR, new zzfx(d87Var, d87.n, str, i)));
    }

    public zzfx(d87 d87Var, d87 d87Var2, String str, Exception exc) {
        this.a = d87Var;
        this.b = d87Var2;
        this.c = str;
        this.d = exc;
        d87 d87Var3 = d87.U0;
        bwa bwaVar = bwa.NETWORK_ERROR;
        this.e = ei7.Q(new f09(d87Var3, new RecaptchaException(bwaVar)), new f09(d87.Z0, new RecaptchaException(bwaVar)), new f09(d87.a1, new RecaptchaException(bwaVar)), new f09(d87.V0, new RecaptchaException(bwa.INVALID_SITEKEY)), new f09(d87.W0, new RecaptchaException(bwa.INVALID_KEYTYPE)), new f09(d87.X0, new RecaptchaException(bwa.INVALID_PACKAGE_NAME)), new f09(d87.Y0, new RecaptchaException(bwa.INVALID_ACTION)), new f09(d87.T0, new RecaptchaException(bwa.INTERNAL_ERROR)), new f09(d87.b1, new RecaptchaException(bwa.INVALID_TIMEOUT)));
    }

    public final RecaptchaException a() {
        d87 d87Var = d87.q;
        d87 d87Var2 = this.b;
        if (g76.L(d87Var2, d87Var)) {
            return new RecaptchaException(bwa.INVALID_TIMEOUT);
        }
        if (g76.L(d87Var2, d87.C)) {
            return new RecaptchaException(bwa.NO_NETWORK_FOUND);
        }
        RecaptchaException recaptchaException = (RecaptchaException) this.e.get(this.a);
        return recaptchaException == null ? new RecaptchaException(bwa.INTERNAL_ERROR) : recaptchaException;
    }

    @Override // java.lang.Throwable
    public final /* synthetic */ Throwable getCause() {
        return this.d;
    }

    public /* synthetic */ zzfx(d87 d87Var, d87 d87Var2, String str, int i) {
        this(d87Var, d87Var2, (i & 4) != 0 ? null : str, (Exception) null);
    }
}
