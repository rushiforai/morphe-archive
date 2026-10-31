package com.bytedance.sdk.openadsdk.api.init;

import android.text.TextUtils;
import com.bytedance.sdk.component.ul.sya.dj;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.syc;
import com.bytedance.sdk.openadsdk.InitConfig;
import com.bytedance.sdk.openadsdk.api.PAGConstant;
import com.bytedance.sdk.openadsdk.core.xz;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes.dex */
public final class PAGConfig implements InitConfig {

    /* renamed from: ul, reason: collision with root package name */
    private static String f24657ul;
    private String fby;

    /* renamed from: lt, reason: collision with root package name */
    private String f24659lt;
    private String lud;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f24660zb;
    private int sya = -1;

    /* renamed from: dj, reason: collision with root package name */
    private int f24658dj = 0;

    public static class Builder {

        /* renamed from: lt, reason: collision with root package name */
        private String f24662lt;
        private String[] lud;

        /* renamed from: ul, reason: collision with root package name */
        private String f24663ul;
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private boolean f24664zb;
        private int sya = -1;

        /* renamed from: dj, reason: collision with root package name */
        private int f24661dj = 0;
        private String fby = b.f42142b;

        @Deprecated
        public Builder appIcon(int i5) {
            return this;
        }

        public Builder appId(String str) {
            this.ycx = str;
            return this;
        }

        public PAGConfig build() {
            PAGConfig pAGConfig = new PAGConfig();
            pAGConfig.zb(this.ycx);
            pAGConfig.zb(this.f24661dj);
            pAGConfig.ycx(this.sya);
            pAGConfig.ycx(this.f24664zb);
            pAGConfig.sya(this.f24662lt);
            pAGConfig.ycx(this.f24663ul);
            pAGConfig.dj(this.fby);
            return pAGConfig;
        }

        public Builder debugLog(boolean z11) {
            this.f24664zb = z11;
            return this;
        }

        public Builder needClearTaskReset(String... strArr) {
            this.lud = strArr;
            return this;
        }

        public Builder setAdxId(String str) {
            this.fby = str;
            return this;
        }

        public Builder setPAConsent(@PAGConstant.PAGPAConsentType int i5) {
            if (i5 == 0 || i5 == 1) {
                this.sya = i5;
                return this;
            }
            this.sya = -2;
            return this;
        }

        public Builder setPackageName(String str) {
            this.f24662lt = str;
            return this;
        }

        public Builder setUserData(String str) {
            this.f24663ul = str;
            return this;
        }

        public Builder supportMultiProcess(boolean z11) {
            return this;
        }

        public Builder titleBarTheme(int i5) {
            this.f24661dj = i5;
            return this;
        }

        public Builder useTextureView(boolean z11) {
            return this;
        }
    }

    public static void debugLog(boolean z11) {
        if (xz.ycx() != null) {
            if (z11) {
                xz.ycx().zb(1);
                xz.ycx().zb();
            } else {
                xz.ycx().zb(0);
                dj.ycx(dj.ycx.OFF);
                syc.zb();
                htf.zb();
            }
        }
    }

    public static int getPAConsent() {
        if (oby.ea("getPAConsent")) {
            return xz.ycx().lud();
        }
        return -1;
    }

    @Deprecated
    public static void setAppIconId(int i5) {
    }

    public static void setPAConsent(@PAGConstant.PAGPAConsentType int i5) {
        if (oby.ea("setPAConsent")) {
            if (i5 == 1 || i5 == 0) {
                xz.ycx().dj(i5);
            } else {
                xz.ycx().dj(-2);
            }
        }
    }

    public static void setPackageName(String str) {
        f24657ul = str;
    }

    public static void setUserData(String str) {
        if (xz.ycx() != null) {
            xz.ycx().zb(str);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.InitConfig
    public String getAdxId() {
        return this.fby;
    }

    @Override // com.bytedance.sdk.openadsdk.InitConfig
    public String getAppId() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.openadsdk.InitConfig
    public String getData() {
        return this.f24659lt;
    }

    public boolean getDebugLog() {
        return this.f24660zb;
    }

    @Override // com.bytedance.sdk.openadsdk.InitConfig
    public int getPA() {
        return this.sya;
    }

    @Override // com.bytedance.sdk.openadsdk.InitConfig
    public String getPackageName() {
        return TextUtils.isEmpty(this.lud) ? f24657ul : this.lud;
    }

    @Override // com.bytedance.sdk.openadsdk.InitConfig
    public int getTitleBarTheme() {
        return this.f24658dj;
    }

    @Override // com.bytedance.sdk.openadsdk.InitConfig
    public boolean isSupportMultiProcess() {
        return false;
    }

    @Override // com.bytedance.sdk.openadsdk.InitConfig
    public boolean isUseTextureView() {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dj(String str) {
        this.fby = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sya(String str) {
        this.lud = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(String str) {
        this.ycx = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(String str) {
        this.f24659lt = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(int i5) {
        this.f24658dj = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(boolean z11) {
        this.f24660zb = z11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(int i5) {
        this.sya = i5;
    }
}
