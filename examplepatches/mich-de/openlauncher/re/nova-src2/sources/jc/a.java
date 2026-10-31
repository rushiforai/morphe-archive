package jc;

import ai.h;
import lc.c;

/* loaded from: classes2.dex */
public abstract class a implements pc.b {

    /* renamed from: a, reason: collision with root package name */
    public c f69429a;

    /* renamed from: b, reason: collision with root package name */
    public b f69430b;

    public void authenticate() {
        uc.b.f90789a.execute(new h(this, 20));
    }

    public void destroy() {
        this.f69430b = null;
        this.f69429a.destroy();
    }

    public String getOdt() {
        b bVar = this.f69430b;
        return bVar != null ? bVar.f69431a : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public boolean isAuthenticated() {
        return this.f69429a.h();
    }

    public boolean isConnected() {
        return this.f69429a.a();
    }

    @Override // pc.b
    public void onCredentialsRequestFailed(String str) {
        this.f69429a.onCredentialsRequestFailed(str);
    }

    @Override // pc.b
    public void onCredentialsRequestSuccess(String str, String str2) {
        this.f69429a.onCredentialsRequestSuccess(str, str2);
    }
}
