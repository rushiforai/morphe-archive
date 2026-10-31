package com.fyber.inneractive.sdk.config;

import java.util.HashMap;

/* loaded from: classes.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f27871a = new HashMap();

    public final boolean a() {
        try {
            if (this.f27871a.containsKey("dsos")) {
                return Boolean.parseBoolean((String) this.f27871a.get("dsos"));
            }
            return false;
        } catch (Exception unused) {
            return false;
        }
    }
}
