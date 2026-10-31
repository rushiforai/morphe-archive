package com.fyber.inneractive.sdk.mraid;

import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.web.i0;
import java.util.Map;

/* loaded from: classes3.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public String f28667a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f28668b;

    /* renamed from: c, reason: collision with root package name */
    public final i0 f28669c;

    /* renamed from: d, reason: collision with root package name */
    public final g1 f28670d;

    public f(Map map, i0 i0Var, g1 g1Var) {
        this.f28668b = map;
        this.f28670d = g1Var;
        this.f28669c = i0Var;
    }

    public final int a(String str) {
        String str2 = (String) this.f28668b.get(str);
        if (str2 == null) {
            return -1;
        }
        try {
            return Integer.parseInt(str2, 10);
        } catch (NumberFormatException unused) {
            return -1;
        }
    }

    public abstract void a();

    public abstract boolean b();
}
