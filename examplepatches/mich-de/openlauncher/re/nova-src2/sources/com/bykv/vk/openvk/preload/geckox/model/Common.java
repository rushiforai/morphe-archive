package com.bykv.vk.openvk.preload.geckox.model;

import android.os.Build;
import com.amplitude.android.TrackingOptions;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class Common {
    public String ac;
    public long aid;
    public String appName;
    public String appVersion;
    public String deviceId;
    public String deviceModel;
    public String devicePlatform;

    /* renamed from: os, reason: collision with root package name */
    public int f22115os = 0;
    public String osVersion;
    public String region;
    public String sdkVersion;
    public String uid;

    public Common() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(Build.VERSION.SDK_INT);
        this.osVersion = sb2.toString();
        this.deviceModel = Build.MODEL;
        this.devicePlatform = "android";
        this.sdkVersion = "2.0.3-rc.9-pangle";
    }

    public JSONObject toJson() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("aid", this.aid);
            jSONObject.put("app_version", this.appVersion);
            jSONObject.put("os", this.f22115os);
            jSONObject.put("device_id", this.deviceId);
            jSONObject.put("app_name", this.appName);
            jSONObject.put("ac", this.ac);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, this.osVersion);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL, this.deviceModel);
            jSONObject.put("device_platform", this.devicePlatform);
            jSONObject.put("sdk_version", this.sdkVersion);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_REGION, this.region);
            jSONObject.put("uid", this.uid);
            return jSONObject;
        } catch (Throwable unused) {
            return null;
        }
    }

    public Common(long j11, String str, String str2, String str3, String str4) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(Build.VERSION.SDK_INT);
        this.osVersion = sb2.toString();
        this.deviceModel = Build.MODEL;
        this.devicePlatform = "android";
        this.sdkVersion = "2.0.3-rc.9-pangle";
        this.aid = j11;
        this.appVersion = str;
        this.deviceId = str2;
        this.appName = str3;
        this.ac = str4;
    }

    public Common(long j11, String str, String str2, String str3, String str4, String str5, String str6) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(Build.VERSION.SDK_INT);
        this.osVersion = sb2.toString();
        this.deviceModel = Build.MODEL;
        this.devicePlatform = "android";
        this.sdkVersion = "2.0.3-rc.9-pangle";
        this.aid = j11;
        this.appVersion = str;
        this.deviceId = str2;
        this.appName = str3;
        this.ac = str4;
        this.uid = str5;
        this.region = str6;
    }
}
