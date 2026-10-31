package com.fyber.inneractive.sdk.response;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public e f31031a;

    /* renamed from: b, reason: collision with root package name */
    public String f31032b;

    /* renamed from: c, reason: collision with root package name */
    public j f31033c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f31034d = true;

    public abstract e a();

    public final e a(String str) throws Exception {
        this.f31034d = str != null;
        e eVar = this.f31031a;
        eVar.getClass();
        eVar.f31044c = System.currentTimeMillis();
        this.f31033c.a(this);
        String strA = this.f31033c.a();
        this.f31031a.f31049h = strA;
        w0 w0VarA = com.fyber.inneractive.sdk.config.a.a(this.f31032b);
        IAlog.a("%sGot unit config for unitId: %s from config manager", IAlog.a(this), this.f31032b);
        IAlog.a("%s%s", IAlog.a(this), w0VarA);
        if (this.f31034d) {
            a(str, w0VarA);
        } else if (this instanceof l) {
            a(strA, w0VarA);
        } else {
            h hVar = new h(strA);
            if (hVar.f31066a) {
                String str2 = hVar.f31067b;
                if (str2 == null || TextUtils.isEmpty(str2.trim())) {
                    throw new Exception("empty ad content detected. failing fast.");
                }
                a(str2, w0VarA);
            }
        }
        return this.f31031a;
    }

    public abstract void a(String str, w0 w0Var);

    public boolean b() {
        return this instanceof c;
    }
}
