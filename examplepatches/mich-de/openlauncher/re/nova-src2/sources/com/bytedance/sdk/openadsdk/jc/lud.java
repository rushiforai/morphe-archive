package com.bytedance.sdk.openadsdk.jc;

import com.bytedance.sdk.component.lud.jw;
import com.bytedance.sdk.component.lud.uh;

/* loaded from: classes2.dex */
public class lud implements uh {
    private static int ycx;

    /* renamed from: dj, reason: collision with root package name */
    private boolean f26853dj;
    private final String lud;
    private long sya;

    /* renamed from: zb, reason: collision with root package name */
    private long f26854zb = 0;

    public lud() {
        ycx++;
        this.lud = "image_request_" + ycx;
    }

    private String sya(String str, jw jwVar) {
        return str;
    }

    @Override // com.bytedance.sdk.component.lud.uh
    public void ycx(String str, jw jwVar) {
        if (!this.f26853dj) {
            jwVar.ycx();
            jwVar.zb();
            jwVar.sya();
            this.f26853dj = true;
        }
        this.f26854zb = System.currentTimeMillis();
        sya(str, jwVar);
    }

    @Override // com.bytedance.sdk.component.lud.uh
    public void zb(String str, jw jwVar) {
        this.sya += System.currentTimeMillis() - this.f26854zb;
        sya(str, jwVar);
    }
}
