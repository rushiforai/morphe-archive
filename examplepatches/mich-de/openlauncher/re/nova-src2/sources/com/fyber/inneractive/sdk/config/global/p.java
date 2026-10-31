package com.fyber.inneractive.sdk.config.global;

import java.util.Map;

/* loaded from: classes.dex */
public abstract class p implements n {

    /* renamed from: a, reason: collision with root package name */
    public n f27833a;

    @Override // com.fyber.inneractive.sdk.config.global.n
    public Integer a(String str) {
        n nVar = this.f27833a;
        if (nVar == null || nVar.a() == null || this.f27833a.a().size() <= 0) {
            return null;
        }
        return this.f27833a.a(str);
    }

    @Override // com.fyber.inneractive.sdk.config.global.n
    public String b(String str) {
        n nVar = this.f27833a;
        if (nVar == null || nVar.a() == null || this.f27833a.a().size() <= 0) {
            return null;
        }
        return this.f27833a.b(str);
    }

    @Override // com.fyber.inneractive.sdk.config.global.n
    public Boolean c(String str) {
        n nVar = this.f27833a;
        if (nVar == null || nVar.a() == null || this.f27833a.a().size() <= 0) {
            return null;
        }
        return this.f27833a.c(str);
    }

    @Override // com.fyber.inneractive.sdk.config.global.n
    public String a(String str, String str2) {
        n nVar = this.f27833a;
        return nVar != null ? nVar.a(str, str2) : str2;
    }

    @Override // com.fyber.inneractive.sdk.config.global.n
    public final Map a() {
        n nVar = this.f27833a;
        if (nVar != null) {
            return nVar.a();
        }
        return null;
    }
}
