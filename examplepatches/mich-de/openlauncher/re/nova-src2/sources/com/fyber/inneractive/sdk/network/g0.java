package com.fyber.inneractive.sdk.network;

import java.util.List;

/* loaded from: classes.dex */
public final class g0 {

    /* renamed from: c, reason: collision with root package name */
    public static final g0 f28722c = new g0();

    /* renamed from: a, reason: collision with root package name */
    public final k f28723a = new k();

    /* renamed from: b, reason: collision with root package name */
    public p1 f28724b;

    public final h a() {
        String property;
        if (this.f28724b == null) {
            try {
                property = System.getProperty("fyber.marketplace.http_executor_stack_name");
            } catch (Throwable unused) {
                property = "hurl";
            }
            if (property != null && property.equals("okhttp")) {
                try {
                    List list = x80.e0.C;
                    this.f28724b = new p1();
                } catch (ClassNotFoundException unused2) {
                }
            }
        }
        p1 p1Var = this.f28724b;
        return p1Var != null ? p1Var : this.f28723a;
    }
}
