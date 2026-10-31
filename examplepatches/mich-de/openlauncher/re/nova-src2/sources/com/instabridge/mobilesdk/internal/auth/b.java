package com.instabridge.mobilesdk.internal.auth;

import c90.f;
import x80.g0;
import x80.m0;
import x80.x;
import x80.y;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35574a;

    public /* synthetic */ b(int i5) {
        this.f35574a = i5;
    }

    @Override // x80.y
    public final m0 intercept(x xVar) {
        switch (this.f35574a) {
            case 0:
                return RequestSigner.interceptor$lambda$0((f) xVar);
            default:
                f fVar = (f) xVar;
                g0 g0VarB = fVar.f19892e.b();
                g0VarB.e("User-Agent", "Nova/89400 (8.9.4)");
                return fVar.b(g0VarB.b());
        }
    }
}
