package com.bytedance.sdk.openadsdk;

import android.text.TextUtils;
import com.bytedance.sdk.component.utils.syc;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
import rb.a;

/* loaded from: classes2.dex */
public class AdSlot {
    public static final int ANCHORED_BANNER = 2;
    public static final int FIX_BANNER = 1;
    public static final int INLINE_BANNER = 3;
    public static final int TYPE_BANNER = 1;
    public static final int TYPE_CACHED_SPLASH = 4;
    public static final int TYPE_FEED = 5;
    public static final int TYPE_FULL_SCREEN_VIDEO = 8;
    public static final int TYPE_INTERACTION_AD = 2;
    public static final int TYPE_OPEN_AD = 3;
    public static final int TYPE_REWARD_VIDEO = 7;
    private Map<String, Object> bhi;

    /* renamed from: dj, reason: collision with root package name */
    private float f24235dj;

    /* renamed from: dv, reason: collision with root package name */
    private int f24236dv;

    /* renamed from: dy, reason: collision with root package name */
    private String f24237dy;

    /* renamed from: ea, reason: collision with root package name */
    private String f24238ea;
    private String fby;

    /* renamed from: hf, reason: collision with root package name */
    private int f24239hf;
    private int htf;

    /* renamed from: jc, reason: collision with root package name */
    private String f24240jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f24241jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f24242lt;
    private float lud;

    /* renamed from: ok, reason: collision with root package name */
    private int f24243ok;
    private boolean oty;
    private String pmi;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f24244ry;
    private int sya;
    private String syc;
    private int thx;

    /* renamed from: tn, reason: collision with root package name */
    private int f24245tn;
    private long tru;

    /* renamed from: uh, reason: collision with root package name */
    private String f24246uh;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f24247ul;
    private String wie;
    private int wwx;
    private boolean xkz;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f24248zb;

    public static class Builder {

        /* renamed from: dy, reason: collision with root package name */
        private String f24250dy;

        /* renamed from: ea, reason: collision with root package name */
        private float f24251ea;
        private String fby;

        /* renamed from: jc, reason: collision with root package name */
        private int f24252jc;

        /* renamed from: ok, reason: collision with root package name */
        private float f24255ok;
        private String pmi;

        /* renamed from: ry, reason: collision with root package name */
        private boolean f24256ry;
        private String syc;
        private int thx;
        private String wie;
        private String xkz;
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private int f24259zb = 640;
        private int sya = Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE;

        /* renamed from: dj, reason: collision with root package name */
        private final boolean f24249dj = true;
        private int lud = 1;

        /* renamed from: lt, reason: collision with root package name */
        private final String f24254lt = b.f42142b;

        /* renamed from: ul, reason: collision with root package name */
        private final int f24258ul = 0;

        /* renamed from: jw, reason: collision with root package name */
        private String f24253jw = "defaultUser";

        /* renamed from: uh, reason: collision with root package name */
        private boolean f24257uh = true;
        private Map<String, Object> htf = null;
        private int wwx = 1;

        public AdSlot build() {
            AdSlot adSlot = new AdSlot();
            adSlot.ycx = this.ycx;
            adSlot.f24242lt = this.lud;
            adSlot.f24247ul = true;
            adSlot.f24248zb = this.f24259zb;
            adSlot.sya = this.sya;
            float f11 = this.f24251ea;
            if (f11 <= 0.0f) {
                adSlot.f24235dj = this.f24259zb;
                adSlot.lud = this.sya;
            } else {
                adSlot.f24235dj = f11;
                adSlot.lud = this.f24255ok;
            }
            adSlot.fby = b.f42142b;
            adSlot.f24241jw = 0;
            adSlot.f24240jc = this.fby;
            adSlot.f24238ea = this.f24253jw;
            adSlot.f24243ok = this.f24252jc;
            adSlot.f24244ry = this.f24257uh;
            adSlot.xkz = this.f24256ry;
            adSlot.syc = this.xkz;
            adSlot.f24237dy = this.syc;
            adSlot.wie = this.f24250dy;
            adSlot.pmi = this.wie;
            adSlot.f24246uh = this.pmi;
            adSlot.bhi = this.htf;
            adSlot.f24245tn = this.thx;
            adSlot.f24236dv = this.wwx;
            return adSlot;
        }

        public Builder isExpressAd(boolean z11) {
            this.f24256ry = z11;
            return this;
        }

        public Builder setAdCount(int i5) {
            if (i5 <= 0) {
                i5 = 1;
            }
            if (i5 > 20) {
                i5 = 20;
            }
            this.lud = i5;
            return this;
        }

        public Builder setAdId(String str) {
            this.syc = str;
            return this;
        }

        public Builder setBannerType(int i5) {
            this.wwx = i5;
            return this;
        }

        public Builder setCodeId(String str) {
            this.ycx = str;
            return this;
        }

        public Builder setCreativeId(String str) {
            this.f24250dy = str;
            return this;
        }

        public Builder setDurationSlotType(int i5) {
            this.thx = i5;
            return this;
        }

        public Builder setExpressViewAcceptedSize(float f11, float f12) {
            this.f24251ea = f11;
            this.f24255ok = f12;
            return this;
        }

        public Builder setExt(String str) {
            this.wie = str;
            return this;
        }

        public Builder setImageAcceptedSize(int i5, int i11) {
            this.f24259zb = i5;
            this.sya = i11;
            return this;
        }

        public Builder setIsAutoPlay(boolean z11) {
            this.f24257uh = z11;
            return this;
        }

        public Builder setMediaExtra(String str) {
            this.fby = str;
            return this;
        }

        public Builder setNativeAdType(int i5) {
            this.f24252jc = i5;
            return this;
        }

        public Builder setRequestExtraMap(Map<String, Object> map) {
            this.htf = map;
            return this;
        }

        public Builder setRewardAmount(int i5) {
            return this;
        }

        public Builder setRewardName(String str) {
            return this;
        }

        public Builder setSupportDeepLink(boolean z11) {
            return this;
        }

        public Builder setUserData(String str) {
            this.pmi = str;
            return this;
        }

        public Builder setUserID(String str) {
            this.f24253jw = str;
            return this;
        }

        public Builder withBid(String str) {
            if (TextUtils.isEmpty(str)) {
                return this;
            }
            if (syc.sya()) {
                a.a(str);
            }
            this.xkz = str;
            return this;
        }
    }

    public static int getPosition(int i5) {
        if (i5 == 1) {
            return 2;
        }
        if (i5 != 2) {
            return (i5 == 3 || i5 == 4 || i5 == 7 || i5 == 8) ? 5 : 3;
        }
        return 4;
    }

    public static AdSlot getSlot(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        Builder builder = new Builder();
        try {
            int iOptInt = jSONObject.optInt("mImgAcceptedWidth", 640);
            int iOptInt2 = jSONObject.optInt("mImgAcceptedHeight", Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE);
            double dOptDouble = jSONObject.optDouble("mExpressViewAcceptedWidth", 0.0d);
            double dOptDouble2 = jSONObject.optDouble("mExpressViewAcceptedHeight", 0.0d);
            builder.setCodeId(jSONObject.optString("mCodeId", null));
            builder.setAdCount(jSONObject.optInt("mAdCount", 1));
            builder.setIsAutoPlay(jSONObject.optBoolean("mIsAutoPlay"));
            builder.setImageAcceptedSize(iOptInt, iOptInt2);
            builder.setExpressViewAcceptedSize(Double.valueOf(dOptDouble).floatValue(), Double.valueOf(dOptDouble2).floatValue());
            builder.setSupportDeepLink(jSONObject.optBoolean("mSupportDeepLink", false));
            builder.setRewardName(jSONObject.optString("mRewardName", null));
            builder.setRewardAmount(jSONObject.optInt("mRewardAmount"));
            builder.setMediaExtra(jSONObject.optString("mMediaExtra", null));
            builder.setUserID(jSONObject.optString("mUserID", null));
            builder.setNativeAdType(jSONObject.optInt("mNativeAdType"));
            builder.isExpressAd(jSONObject.optBoolean("mIsExpressAd"));
            builder.withBid(jSONObject.optString("mBidAdm"));
            builder.setAdId(jSONObject.optString("mAdId"));
            builder.setCreativeId(jSONObject.optString("mCreativeId"));
            builder.setExt(jSONObject.optString("mExt"));
            builder.setMediaExtra(jSONObject.optString("mMediaExtra"));
            builder.setBannerType(jSONObject.optInt("mBannerType"));
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07c", "euoemQyo", "XOs5pg+zfQ==", 377);
        }
        AdSlot adSlotBuild = builder.build();
        adSlotBuild.setDurationSlotType(jSONObject.optInt("mDurationSlotType"));
        return adSlotBuild;
    }

    public int getAdCount() {
        return this.f24242lt;
    }

    public String getAdId() {
        return this.f24237dy;
    }

    public int getBannerType() {
        return this.f24236dv;
    }

    public String getBidAdm() {
        return this.syc;
    }

    public int getCacheScene() {
        return this.f24239hf;
    }

    public long getCacheTime() {
        return this.tru;
    }

    public String getCodeId() {
        return this.ycx;
    }

    public String getCreativeId() {
        return this.wie;
    }

    public int getDurationSlotType() {
        return this.f24245tn;
    }

    public float getExpressViewAcceptedHeight() {
        return this.lud;
    }

    public float getExpressViewAcceptedWidth() {
        return this.f24235dj;
    }

    public String getExt() {
        return this.pmi;
    }

    public int getImgAcceptedHeight() {
        return this.sya;
    }

    public int getImgAcceptedWidth() {
        return this.f24248zb;
    }

    public int getIsRotateBanner() {
        return this.htf;
    }

    public String getMediaExtra() {
        return this.f24240jc;
    }

    public Map<String, Object> getRequestExtraMap() {
        return this.bhi;
    }

    public int getRewardAmount() {
        return this.f24241jw;
    }

    public String getRewardName() {
        return this.fby;
    }

    public int getRotateOrder() {
        return this.wwx;
    }

    public int getRotateTime() {
        return this.thx;
    }

    public String getUserData() {
        return this.f24246uh;
    }

    public String getUserID() {
        return this.f24238ea;
    }

    public boolean isAutoPlay() {
        return this.f24244ry;
    }

    public boolean isExpressAd() {
        return this.xkz;
    }

    public boolean isPreload() {
        return this.oty;
    }

    public boolean isSupportDeepLink() {
        return this.f24247ul;
    }

    public void setAdCount(int i5) {
        this.f24242lt = i5;
    }

    public void setCacheScene(int i5) {
        this.f24239hf = i5;
    }

    public void setCacheTime(long j11) {
        this.tru = j11;
    }

    public void setDurationSlotType(int i5) {
        this.f24245tn = i5;
    }

    public void setExpressViewAccepted(float f11, float f12) {
        this.f24235dj = f11;
        this.lud = f12;
    }

    public void setIsRotateBanner(int i5) {
        this.htf = i5;
    }

    public void setPreload(boolean z11) {
        this.oty = z11;
    }

    public void setRotateOrder(int i5) {
        this.wwx = i5;
    }

    public void setRotateTime(int i5) {
        this.thx = i5;
    }

    public void setUserData(String str) {
        this.f24246uh = str;
    }

    public JSONObject toJsonObj() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("mCodeId", this.ycx);
            jSONObject.put("mAdCount", this.f24242lt);
            jSONObject.put("mIsAutoPlay", this.f24244ry);
            jSONObject.put("mImgAcceptedWidth", this.f24248zb);
            jSONObject.put("mImgAcceptedHeight", this.sya);
            jSONObject.put("mExpressViewAcceptedWidth", this.f24235dj);
            jSONObject.put("mExpressViewAcceptedHeight", this.lud);
            jSONObject.put("mSupportDeepLink", this.f24247ul);
            jSONObject.put("mRewardName", this.fby);
            jSONObject.put("mRewardAmount", this.f24241jw);
            jSONObject.put("mMediaExtra", this.f24240jc);
            jSONObject.put("mUserID", this.f24238ea);
            jSONObject.put("mNativeAdType", this.f24243ok);
            jSONObject.put("mIsExpressAd", this.xkz);
            jSONObject.put("mAdId", this.f24237dy);
            jSONObject.put("mCreativeId", this.wie);
            jSONObject.put("mExt", this.pmi);
            jSONObject.put("mBidAdm", this.syc);
            jSONObject.put("mUserData", this.f24246uh);
            jSONObject.put("mDurationSlotType", this.f24245tn);
            jSONObject.put("mBannerType", this.f24236dv);
            return jSONObject;
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07c", "euoemQyo", "T+EHhgyyRsWK", 339);
            return jSONObject;
        }
    }

    public String toString() {
        return super.toString();
    }

    private AdSlot() {
        this.f24244ry = true;
        this.xkz = false;
        this.htf = 0;
        this.thx = 0;
        this.wwx = 0;
        this.f24236dv = 1;
    }
}
