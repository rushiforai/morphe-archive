package com.fyber.inneractive.sdk.measurement.tracker;

import android.webkit.WebView;
import com.fyber.inneractive.sdk.web.m;
import com.google.android.gms.internal.consent_sdk.v;
import un.i;
import un.k;

/* loaded from: classes3.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public un.b f28527a;

    /* renamed from: b, reason: collision with root package name */
    public un.a f28528b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f28529c = false;

    /* renamed from: d, reason: collision with root package name */
    public final i f28530d;

    /* renamed from: e, reason: collision with root package name */
    public WebView f28531e;

    public e(i iVar, m mVar) {
        this.f28530d = iVar;
        this.f28531e = mVar;
    }

    public abstract void a();

    public void a(m mVar) {
        m mVar2;
        v vVar;
        i iVar;
        try {
            un.c cVarB = b();
            try {
                iVar = this.f28530d;
                x7.f.j(iVar, "Partner is null");
                x7.f.j(mVar, "WebView is null");
                mVar2 = mVar;
            } catch (Throwable unused) {
                mVar2 = mVar;
            }
            try {
                vVar = new v(iVar, mVar2, null, null, un.d.HTML);
            } catch (Throwable unused2) {
                vVar = null;
                k kVarB = un.b.b(cVarB, vVar);
                this.f28527a = kVarB;
                kVarB.d(mVar2);
                this.f28527a.e();
            }
            k kVarB2 = un.b.b(cVarB, vVar);
            this.f28527a = kVarB2;
            kVarB2.d(mVar2);
            this.f28527a.e();
        } catch (Throwable unused3) {
        }
    }

    public abstract un.c b();

    public abstract void c();
}
