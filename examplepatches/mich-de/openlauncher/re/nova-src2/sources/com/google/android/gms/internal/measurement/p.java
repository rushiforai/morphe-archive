package com.google.android.gms.internal.measurement;

import java.util.Set;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class p extends c3 {

    /* renamed from: b, reason: collision with root package name */
    public final Level f32941b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f32942c;

    /* renamed from: d, reason: collision with root package name */
    public final ki f32943d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(String str) {
        super(str);
        Level level = Level.ALL;
        Set set = q.f32970f;
        this.f32941b = level;
        this.f32942c = q.f32970f;
        this.f32943d = q.f32971g;
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final boolean e(Level level) {
        return true;
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final void f(jh jhVar) {
        String strA = (String) jhVar.c().j(bi.f32415b);
        if (strA == null) {
            strA = (String) this.f32423a;
        }
        if (strA == null) {
            qh qhVar = jhVar.f32700d;
            if (qhVar == null) {
                throw new IllegalStateException("cannot request log site information prior to postProcess()");
            }
            strA = qhVar.a();
            int iIndexOf = strA.indexOf(36, strA.lastIndexOf(46));
            if (iIndexOf >= 0) {
                strA = strA.substring(0, iIndexOf);
            }
        }
        q.m(jhVar, h.c(strA), this.f32941b, this.f32942c, this.f32943d);
    }
}
