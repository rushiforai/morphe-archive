package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class hhf {
    public static final HashMap a;
    public static final HashMap b;

    static {
        HashMap map = new HashMap();
        a = map;
        HashMap map2 = new HashMap();
        b = map2;
        map.put(-1, "Standard Integrity API is not available.\nStandard Integrity API is not enabled, or the Play Store version might be old.\nRecommended actions:\n1) Make sure to be allowlisted to use Standard Integrity API.\n2) Make sure that Integrity API is enabled in Google Play Console.\n3) Ask the user to update Play Store.\n");
        map.put(-2, "The Play Store app is either not installed or not the official version.\nAsk the user to install an official and recent version of Play Store.\n");
        map.put(-3, "Network error: unable to obtain integrity details.\nAsk the user to check for a connection.\n");
        map.put(-5, "PackageManager could not find this app.\nSomething is wrong (possibly an attack). Non-actionable.\n");
        map.put(-6, "Google Play Services is not available or version is too old.\nAsk the user to Install or Update Play Services.\n");
        map.put(-7, "The calling app UID (user id) does not match the one from Package Manager.\nSomething is wrong (possibly an attack). Non-actionable.\n");
        map.put(-8, "The calling app is making too many requests to the API and hence is throttled.\nRetry with an exponential backoff.\n");
        map.put(-9, "Binding to the service in the Play Store has failed. This can be due to having an old Play Store version installed on the device.\nAsk the user to update Play Store.\n");
        map.put(-12, "Unknown internal Google server error.\nRetry with an exponential backoff. Consider filing a bug if fails consistently.\n");
        map.put(-14, "The Play Store needs to be updated.\nAsk the user to update the Google Play Store.\n");
        map.put(-15, "Play Services needs to be updated.\nAsk the user to update Google Play Services.\n");
        map.put(-16, "The provided cloud project number is invalid.\nUse the cloud project number which can be found in Project info in your Google Cloud Console for the cloud project where Play Integrity API is enabled.\n");
        map.put(-17, "The provided request hash is too long. The request hash length must be less than 500 bytes.\nRetry with a shorter request hash.");
        map.put(-18, "There is a transient error on the calling device.\nRetry with an exponential backoff.\n");
        map.put(-19, "The StandardIntegrityTokenProvider is invalid (e.g. it is outdated).\nRequest a new integrity token provider by calling StandardIntegrityManager#prepareIntegrityToken.");
        map.put(-100, "Unknown error processing integrity request.\nRetry with an exponential backoff. Consider filing a bug if fails consistently.\n");
        map2.put(-1, "API_NOT_AVAILABLE");
        map2.put(-3, "NETWORK_ERROR");
        map2.put(-2, "PLAY_STORE_NOT_FOUND");
        map2.put(-14, "PLAY_STORE_VERSION_OUTDATED");
        map2.put(-5, "APP_NOT_INSTALLED");
        map2.put(-6, "PLAY_SERVICES_NOT_FOUND");
        map2.put(-15, "PLAY_SERVICES_VERSION_OUTDATED");
        map2.put(-7, "APP_UID_MISMATCH");
        map2.put(-8, "TOO_MANY_REQUESTS");
        map2.put(-9, "CANNOT_BIND_TO_SERVICE");
        map2.put(-16, "CLOUD_PROJECT_NUMBER_IS_INVALID");
        map2.put(-17, "REQUEST_HASH_TOO_LONG");
        map2.put(-12, "GOOGLE_SERVER_UNAVAILABLE");
        map2.put(-18, "CLIENT_TRANSIENT_ERROR");
        map2.put(-19, "INTEGRITY_TOKEN_PROVIDER_INVALID");
        map2.put(-100, "INTERNAL_ERROR");
    }
}
