package com.fyber.inneractive.sdk.config;

import android.content.Context;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes.dex */
public final class r0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f27887a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ z f27888b;

    public r0(Context context, z zVar) {
        this.f27887a = context;
        this.f27888b = zVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (InneractiveAdManager.isCurrentUserAChild()) {
            return;
        }
        try {
            s0.a(this.f27887a, this.f27888b);
            y yVar = x.f27950a.f27966b;
            if (TextUtils.isEmpty(yVar != null ? yVar.f27951a : null)) {
                q.a(this.f27887a, this.f27888b);
            }
        } catch (Throwable th2) {
            IAlog.a("SDK internal error: Make sure that Google Play Services for Mobile Ads is added to the compile dependencies of your project", th2, new Object[0]);
        }
    }
}
