package com.tiktok.appevents;

import android.content.Context;
import com.tiktok.util.DecryptUtil;
import com.tiktok.util.JSON;
import com.tiktok.util.TTUtil;
import java.io.Serializable;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTUserInfo implements Cloneable, Serializable {
    static final String TAG = "TTUserInfo";
    public static final TTUserInfo sharedInstance = new TTUserInfo();
    String anonymousId;
    String email;
    String externalId;
    String externalUserName;
    transient boolean isIdentified = false;
    String phoneNumber;

    public static void reset(Context context, boolean z11) {
        TTUserInfo tTUserInfo = sharedInstance;
        tTUserInfo.anonymousId = TTUtil.getOrGenAnoId(context, z11);
        tTUserInfo.externalId = null;
        tTUserInfo.externalUserName = null;
        tTUserInfo.phoneNumber = null;
        tTUserInfo.email = null;
        tTUserInfo.isIdentified = false;
    }

    public boolean isIdentified() {
        return this.isIdentified;
    }

    public void setEmail(String str) {
        if (DecryptUtil.isSHA256(str)) {
            this.email = str;
        } else {
            this.email = DecryptUtil.toSha256(str);
        }
    }

    public void setExternalId(String str) {
        if (DecryptUtil.isSHA256(str)) {
            this.externalId = str;
        } else {
            this.externalId = DecryptUtil.toSha256(str);
        }
    }

    public void setExternalUserName(String str) {
        if (DecryptUtil.isSHA256(str)) {
            this.externalUserName = str;
        } else {
            this.externalUserName = DecryptUtil.toSha256(str);
        }
    }

    public void setIdentified() {
        this.isIdentified = true;
    }

    public void setPhoneNumber(String str) {
        if (DecryptUtil.isSHA256(str)) {
            this.phoneNumber = str;
        } else {
            this.phoneNumber = DecryptUtil.toSha256(str);
        }
    }

    public JSONObject toJsonObject() {
        JSONObject jSONObjectBuild = JSON.build();
        try {
            String str = this.externalId;
            if (str != null) {
                JSON.putObject(jSONObjectBuild, "external_id", str);
            }
            String str2 = this.externalUserName;
            if (str2 != null) {
                JSON.putObject(jSONObjectBuild, "external_username", str2);
            }
            String str3 = this.phoneNumber;
            if (str3 != null) {
                JSON.putObject(jSONObjectBuild, "phone_number", str3);
            }
            String str4 = this.email;
            if (str4 != null) {
                JSON.putObject(jSONObjectBuild, ActionCategory.EMAIL, str4);
            }
            return jSONObjectBuild;
        } catch (Throwable th2) {
            TTCrashHandler.handleCrash(TAG, th2, 2);
            return jSONObjectBuild;
        }
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public TTUserInfo m268clone() {
        try {
            return (TTUserInfo) super.clone();
        } catch (Throwable unused) {
            return new TTUserInfo();
        }
    }
}
