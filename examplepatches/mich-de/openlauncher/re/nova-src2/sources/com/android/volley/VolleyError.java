package com.android.volley;

import jb.f;

/* loaded from: classes2.dex */
public class VolleyError extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final f f21380a;

    public VolleyError() {
        this.f21380a = null;
    }

    public VolleyError(f fVar) {
        this.f21380a = fVar;
    }

    public VolleyError(Throwable th2) {
        super(th2);
        this.f21380a = null;
    }
}
