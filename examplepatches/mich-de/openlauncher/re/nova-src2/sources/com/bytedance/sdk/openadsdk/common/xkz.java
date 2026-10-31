package com.bytedance.sdk.openadsdk.common;

import com.bytedance.sdk.openadsdk.common.ycx;

/* loaded from: classes2.dex */
public class xkz {

    /* renamed from: dj, reason: collision with root package name */
    private final ycx.zb f24744dj;

    /* renamed from: lt, reason: collision with root package name */
    private dy f24745lt;
    private boolean lud;
    private final Runnable sya;

    /* renamed from: ul, reason: collision with root package name */
    private ycx.InterfaceC0054ycx f24746ul;
    private final com.bytedance.sdk.openadsdk.component.reward.ycx.zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final String f24747zb;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private final ycx.zb f24748dj;
        private final Runnable sya;
        private final com.bytedance.sdk.openadsdk.component.reward.ycx.zb ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final String f24751zb;
        private boolean lud = false;

        /* renamed from: lt, reason: collision with root package name */
        private dy f24749lt = null;

        /* renamed from: ul, reason: collision with root package name */
        private ycx.InterfaceC0054ycx f24750ul = null;

        public ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, String str, Runnable runnable, ycx.zb zbVar2) {
            this.ycx = zbVar;
            this.f24751zb = str;
            this.sya = runnable;
            this.f24748dj = zbVar2;
        }

        public ycx ycx(boolean z11) {
            this.lud = z11;
            return this;
        }

        public ycx ycx(dy dyVar) {
            this.f24749lt = dyVar;
            return this;
        }

        public ycx ycx(ycx.InterfaceC0054ycx interfaceC0054ycx) {
            this.f24750ul = interfaceC0054ycx;
            return this;
        }

        public xkz ycx() {
            if (this.ycx != null) {
                if (this.sya != null) {
                    if (this.f24748dj != null) {
                        return new xkz(this);
                    }
                    throw new IllegalArgumentException("SkipResultHandler cannot be null");
                }
                throw new IllegalArgumentException("Runnable finishAction cannot be null");
            }
            throw new IllegalArgumentException("RewardFullContext cannot be null");
        }
    }

    public ycx.zb dj() {
        return this.f24744dj;
    }

    public dy lt() {
        return this.f24745lt;
    }

    public boolean lud() {
        return this.lud;
    }

    public Runnable sya() {
        return this.sya;
    }

    public ycx.InterfaceC0054ycx ul() {
        return this.f24746ul;
    }

    public com.bytedance.sdk.openadsdk.component.reward.ycx.zb ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.f24747zb;
    }

    private xkz(ycx ycxVar) {
        this.ycx = ycxVar.ycx;
        this.f24747zb = ycxVar.f24751zb;
        this.sya = ycxVar.sya;
        this.f24744dj = ycxVar.f24748dj;
        this.lud = ycxVar.lud;
        this.f24745lt = ycxVar.f24749lt;
        this.f24746ul = ycxVar.f24750ul;
    }
}
