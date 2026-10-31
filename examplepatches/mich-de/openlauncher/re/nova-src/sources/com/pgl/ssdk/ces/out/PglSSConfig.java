package com.pgl.ssdk.ces.out;

import android.text.TextUtils;
import java.util.Map;

/* loaded from: classes.dex */
public final class PglSSConfig {
    public static final int COLLECT_MODE_DEFAULT = 0;
    public static final int COLLECT_MODE_ML_MINIMIZE = 1;
    public static final String CUSTOMINFO_KEY_ADS_URL_BACKUP = "key_ads_url_backup";
    public static final String CUSTOMINFO_KEY_ALLOWED_FIELDS = "fields_allowed";
    public static final String CUSTOMINFO_KEY_CHECKCLAZZ = "check_clz";
    public static final String CUSTOMINFO_KEY_IPV6 = "key_ipv6";
    public static final String CUSTOMINFO_KEY_SEC_CONFIG_STR = "sec_config";
    public static final String CUSTOMINFO_KEY_TARGET_IDC = "target-idc";
    public static final String CUSTOMINFO_KEY_TRANSFER_HOST = "key_transfer_host";
    public static final int OVREGION_TYPE_SG = 2;
    public static final int OVREGION_TYPE_UNKNOWN = -1;
    public static final int OVREGION_TYPE_VA = 1;

    /* renamed from: a, reason: collision with root package name */
    private String f42342a;

    /* renamed from: b, reason: collision with root package name */
    private final int f42343b;

    /* renamed from: c, reason: collision with root package name */
    private final int f42344c;

    /* renamed from: d, reason: collision with root package name */
    private String f42345d;

    /* renamed from: e, reason: collision with root package name */
    private Map<String, Object> f42346e;

    /* renamed from: f, reason: collision with root package name */
    private PglSSCallBack f42347f;

    public static class Builder {

        /* renamed from: a, reason: collision with root package name */
        private String f42348a;

        /* renamed from: b, reason: collision with root package name */
        private int f42349b = -1;

        /* renamed from: c, reason: collision with root package name */
        private int f42350c = 0;

        /* renamed from: d, reason: collision with root package name */
        private String f42351d;

        public PglSSConfig build() {
            if (TextUtils.isEmpty(this.f42348a)) {
                return null;
            }
            return new PglSSConfig(this.f42348a, this.f42349b, this.f42350c, this.f42351d);
        }

        public Builder setAdsdkVersion(String str) {
            this.f42351d = str;
            return this;
        }

        public Builder setAppId(String str) {
            this.f42348a = str;
            return this;
        }

        public Builder setCollectMode(int i5) {
            this.f42350c = i5;
            return this;
        }

        public Builder setOVRegionType(int i5) {
            this.f42349b = i5;
            return this;
        }
    }

    private PglSSConfig(String str, int i5, int i11, String str2) {
        this.f42342a = str;
        this.f42343b = i5;
        this.f42344c = i11;
        this.f42345d = str2;
    }

    public static Builder builder() {
        return new Builder();
    }

    public String getAdSdkVersion() {
        return this.f42345d;
    }

    public String getAppId() {
        return this.f42342a;
    }

    public PglSSCallBack getCallBack() {
        return this.f42347f;
    }

    public int getCollectMode() {
        return this.f42344c;
    }

    public Map<String, Object> getCustomInfo() {
        return this.f42346e;
    }

    public int getOVRegionType() {
        return this.f42343b;
    }

    public void setCallBack(PglSSCallBack pglSSCallBack) {
        this.f42347f = pglSSCallBack;
    }

    public void setCustomInfo(Map<String, Object> map) {
        this.f42346e = map;
    }
}
