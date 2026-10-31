package com.bytedance.sdk.component.lud.ycx;

import com.bytedance.sdk.component.lud.lud;
import com.bytedance.sdk.component.lud.xkz;

/* loaded from: classes2.dex */
public class zb implements lud {

    /* renamed from: dj, reason: collision with root package name */
    private xkz f23967dj;
    private boolean sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f23968zb;

    public zb(String str, boolean z11, boolean z12, xkz xkzVar) {
        this.ycx = str;
        this.f23968zb = z11;
        this.sya = z12;
        this.f23967dj = xkzVar;
    }

    @Override // com.bytedance.sdk.component.lud.lud
    public boolean sya() {
        return this.sya;
    }

    @Override // com.bytedance.sdk.component.lud.lud
    public String ycx() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.lud.lud
    public boolean zb() {
        return this.f23968zb;
    }
}
