package com.facebook.ads;

import android.content.Context;
import androidx.annotation.Keep;
import com.facebook.ads.internal.settings.AdInternalSettings;
import com.facebook.ads.internal.settings.MultithreadedBundleWrapper;
import com.facebook.infer.annotation.Nullsafe;
import java.io.Serializable;
import java.util.Collection;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public class AdSettings {
    public static final boolean DEBUG = false;

    @Keep
    /* loaded from: classes2.dex */
    public enum IntegrationErrorMode {
        INTEGRATION_ERROR_CRASH_DEBUG_MODE,
        INTEGRATION_ERROR_CALLBACK_MODE;

        public static final long serialVersionUID = 1;
    }

    @Keep
    public enum TestAdType implements Serializable {
        DEFAULT("DEFAULT", "Default"),
        IMG_16_9_APP_INSTALL("IMG_16_9_APP_INSTALL", "Image App install"),
        IMG_16_9_LINK("IMG_16_9_LINK", "Image link"),
        VIDEO_HD_16_9_46S_APP_INSTALL("VID_HD_16_9_46S_APP_INSTALL", "Video 46 sec App install"),
        VIDEO_HD_16_9_46S_LINK("VID_HD_16_9_46S_LINK", "Video 46 sec link"),
        VIDEO_HD_16_9_15S_APP_INSTALL("VID_HD_16_9_15S_APP_INSTALL", "Video 15 sec App install"),
        VIDEO_HD_16_9_15S_LINK("VID_HD_16_9_15S_LINK", "Video 15 sec link"),
        VIDEO_HD_9_16_39S_APP_INSTALL("VID_HD_9_16_39S_APP_INSTALL", "Video 39 sec App install"),
        VIDEO_HD_9_16_39S_LINK("VID_HD_9_16_39S_LINK", "Video 39 sec link"),
        CAROUSEL_IMG_SQUARE_APP_INSTALL("CAROUSEL_IMG_SQUARE_APP_INSTALL", "Carousel App install"),
        CAROUSEL_IMG_SQUARE_LINK("CAROUSEL_IMG_SQUARE_LINK", "Carousel link"),
        PLAYABLE("PLAYABLE", "Playable ad");

        public static final long serialVersionUID = 1;
        private final String adTypeString;
        private final String humanReadable;

        TestAdType(String str, String str2) {
            this.adTypeString = str;
            this.humanReadable = str2;
        }

        public String getAdTypeString() {
            return this.adTypeString;
        }

        public String getHumanReadable() {
            return this.humanReadable;
        }
    }

    public static void addTestDevice(String str) {
        AdInternalSettings.addTestDevice(str);
    }

    public static void addTestDevices(Collection<String> collection) {
        AdInternalSettings.addTestDevices(collection);
    }

    public static void clearTestDevices() {
        AdInternalSettings.clearTestDevices();
    }

    public static String getMediationService() {
        return AdInternalSettings.getMediationService();
    }

    public static TestAdType getTestAdType() {
        MultithreadedBundleWrapper multithreadedBundleWrapper = AdInternalSettings.sSettingsBundle;
        Serializable serializable = multithreadedBundleWrapper.getSerializable(AdInternalSettings.TEST_AD_TYPE_KEY);
        if (serializable instanceof TestAdType) {
            return (TestAdType) serializable;
        }
        TestAdType testAdType = TestAdType.DEFAULT;
        multithreadedBundleWrapper.putSerializable(AdInternalSettings.TEST_AD_TYPE_KEY, testAdType);
        return testAdType;
    }

    public static String getUrlPrefix() {
        return AdInternalSettings.getUrlPrefix();
    }

    public static boolean isMixedAudience() {
        return AdInternalSettings.sSettingsBundle.getBoolean(AdInternalSettings.BOOL_MIXED_AUDIENCE_KEY, false);
    }

    public static boolean isTestMode(Context context) {
        return AdInternalSettings.isTestMode(context);
    }

    public static boolean isVideoAutoplay() {
        return AdInternalSettings.isVideoAutoplay();
    }

    public static boolean isVideoAutoplayOnMobile() {
        return AdInternalSettings.isVideoAutoplayOnMobile();
    }

    public static void setDataProcessingOptions(String[] strArr) {
        AdInternalSettings.setDataProcessingOptions(strArr, null, null);
    }

    public static void setDebugBuild(boolean z11) {
        AdInternalSettings.setDebugBuild(z11);
    }

    public static void setIntegrationErrorMode(IntegrationErrorMode integrationErrorMode) {
        AdInternalSettings.sSettingsBundle.putSerializable(AdInternalSettings.SRL_INTEGRATION_ERROR_MODE_KEY, integrationErrorMode);
    }

    public static void setMediationService(String str) {
        AdInternalSettings.setMediationService(str);
    }

    public static void setMixedAudience(boolean z11) {
        AdInternalSettings.sSettingsBundle.putBoolean(AdInternalSettings.BOOL_MIXED_AUDIENCE_KEY, z11);
    }

    public static void setTestAdType(TestAdType testAdType) {
        AdInternalSettings.sSettingsBundle.putSerializable(AdInternalSettings.TEST_AD_TYPE_KEY, testAdType);
    }

    public static void setTestMode(boolean z11) {
        AdInternalSettings.setTestMode(z11);
    }

    public static void setUrlPrefix(String str) {
        AdInternalSettings.setUrlPrefix(str);
    }

    public static void setVideoAutoplay(boolean z11) {
        AdInternalSettings.setVideoAutoplay(z11);
    }

    public static void setVideoAutoplayOnMobile(boolean z11) {
        AdInternalSettings.setVideoAutoplayOnMobile(z11);
    }

    public static void setVisibleAnimation(boolean z11) {
        AdInternalSettings.setVisibleAnimation(z11);
    }

    public static void turnOnSDKDebugger(Context context) {
        AdInternalSettings.turnOnSDKDebugger(context);
    }

    public static void setDataProcessingOptions(String[] strArr, int i5, int i11) {
        AdInternalSettings.setDataProcessingOptions(strArr, Integer.valueOf(i5), Integer.valueOf(i11));
    }
}
