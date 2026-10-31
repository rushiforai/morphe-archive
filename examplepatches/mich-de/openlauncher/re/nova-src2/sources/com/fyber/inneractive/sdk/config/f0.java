package com.fyber.inneractive.sdk.config;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InvalidAppIdException;
import com.fyber.inneractive.sdk.network.i1;
import com.fyber.inneractive.sdk.network.k1;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.FileNotFoundException;

/* loaded from: classes3.dex */
public final class f0 implements com.fyber.inneractive.sdk.network.f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ IAConfigManager f27801a;

    public f0(IAConfigManager iAConfigManager) {
        this.f27801a = iAConfigManager;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        int i5;
        m0 m0Var = (m0) obj;
        if (m0Var != null) {
            if (z11) {
                IAConfigManager iAConfigManager = this.f27801a;
                IAConfigManager iAConfigManager2 = IAConfigManager.Q;
                iAConfigManager.getClass();
                iAConfigManager.f27747e = m0Var.f27866c;
                iAConfigManager.f27746d = m0Var.f27865b;
                iAConfigManager.f27743a = m0Var.f27867d;
                iAConfigManager.f27744b = m0Var.f27868e;
            } else {
                IAConfigManager.R = System.currentTimeMillis();
                IAConfigManager iAConfigManager3 = this.f27801a;
                iAConfigManager3.getClass();
                IAlog.a("Got new remote configuration from server:", new Object[0]);
                iAConfigManager3.f27747e = m0Var.f27866c;
                iAConfigManager3.f27746d = m0Var.f27865b;
                iAConfigManager3.f27743a = m0Var.f27867d;
                iAConfigManager3.f27744b = m0Var.f27868e;
            }
        } else if (exc instanceof com.fyber.inneractive.sdk.network.g) {
            IAConfigManager.R = System.currentTimeMillis();
        }
        if (z11) {
            return;
        }
        IAConfigManager iAConfigManager4 = this.f27801a;
        IAConfigManager iAConfigManager5 = IAConfigManager.Q;
        if (iAConfigManager5.f27747e != null) {
            iAConfigManager4.a(true, null);
        } else {
            iAConfigManager4.getClass();
            if ((exc instanceof InvalidAppIdException) || (exc instanceof FileNotFoundException) || (!(exc instanceof k1) ? !TextUtils.isEmpty(iAConfigManager4.f27745c.trim()) : (i5 = ((k1) exc).f28732a) < 400 || i5 >= 500)) {
                iAConfigManager4.a(false, new InvalidAppIdException());
            } else if (exc instanceof com.fyber.inneractive.sdk.network.b) {
                iAConfigManager4.a(false, exc);
            } else {
                iAConfigManager4.a(false, new n0());
            }
        }
        if (iAConfigManager5.f27747e != null) {
            IAConfigManager iAConfigManager6 = this.f27801a;
            if (iAConfigManager6.D == null) {
                iAConfigManager6.D = new com.fyber.inneractive.sdk.network.v0(new i0(iAConfigManager6), iAConfigManager6.f27749g, new com.fyber.inneractive.sdk.config.global.m());
            }
            i1 i1Var = iAConfigManager6.D.f28782f;
            if (i1Var == i1.RUNNING || i1Var == i1.QUEUED) {
                return;
            }
            iAConfigManager5.f27759s.a(iAConfigManager6.D);
        }
    }
}
