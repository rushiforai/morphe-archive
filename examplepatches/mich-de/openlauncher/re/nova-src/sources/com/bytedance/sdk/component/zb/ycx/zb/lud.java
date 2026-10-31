package com.bytedance.sdk.component.zb.ycx.zb;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;

/* loaded from: classes2.dex */
final class lud {

    /* renamed from: dj, reason: collision with root package name */
    boolean f24227dj;

    /* renamed from: lt, reason: collision with root package name */
    lud f24228lt;
    boolean lud;
    int sya;

    /* renamed from: ul, reason: collision with root package name */
    lud f24229ul;
    final byte[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    int f24230zb;

    public lud() {
        this.ycx = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
        this.lud = true;
        this.f24227dj = false;
    }

    public final lud ycx() {
        this.f24227dj = true;
        return new lud(this.ycx, this.f24230zb, this.sya, true, false);
    }

    public final lud zb() {
        lud ludVar = this.f24228lt;
        lud ludVar2 = ludVar != this ? ludVar : null;
        lud ludVar3 = this.f24229ul;
        if (ludVar3 != null) {
            ludVar3.f24228lt = ludVar;
        }
        lud ludVar4 = this.f24228lt;
        if (ludVar4 != null) {
            ludVar4.f24229ul = ludVar3;
        }
        this.f24228lt = null;
        this.f24229ul = null;
        return ludVar2;
    }

    public final lud ycx(lud ludVar) {
        ludVar.f24229ul = this;
        ludVar.f24228lt = this.f24228lt;
        this.f24228lt.f24229ul = ludVar;
        this.f24228lt = ludVar;
        return ludVar;
    }

    public lud(byte[] bArr, int i5, int i11, boolean z11, boolean z12) {
        this.ycx = bArr;
        this.f24230zb = i5;
        this.sya = i11;
        this.f24227dj = z11;
        this.lud = z12;
    }
}
