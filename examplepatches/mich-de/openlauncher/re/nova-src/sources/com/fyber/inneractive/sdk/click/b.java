package com.fyber.inneractive.sdk.click;

import b.c0;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final q f27697a;

    /* renamed from: b, reason: collision with root package name */
    public final Throwable f27698b;

    /* renamed from: c, reason: collision with root package name */
    public final String f27699c;

    /* renamed from: d, reason: collision with root package name */
    public final String f27700d;

    /* renamed from: e, reason: collision with root package name */
    public long f27701e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f27702f = new ArrayList();

    public b(String str, q qVar, String str2, Exception exc) {
        this.f27700d = str;
        this.f27697a = qVar;
        this.f27699c = str2;
        this.f27698b = exc;
    }

    public final String toString() {
        q qVar = this.f27697a;
        if (qVar == q.FAILED) {
            Throwable th2 = this.f27698b;
            return c0.k("Open result: Failed! error: ", th2 != null ? th2.getMessage() : "none");
        }
        return "Open result: Success! target: " + qVar + " method: " + this.f27699c;
    }
}
