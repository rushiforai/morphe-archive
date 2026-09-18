package com.dmoniak.patches.extension;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONObject;

/**
 * Extension helper for Hungry Shark World Morphe Patch.
 * 
 * Intercepts rewarded ads across AppLovin MAX, Unity Ads, IronSource, and Google AdMob
 * so that ads are always reported as ready/loaded, and rewards are granted immediately
 * upon show request without playing any video advertisements.
 * 
 * DISCLAIMER:
 * 100% AI Generated code for educational and research purposes only.
 * No liability accepted.
 */
public final class HungrySharkAdsRewardHelper {

    private static final String TAG = "D-moniakPatches";
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static volatile Object sSavedMaxUnityAdManager = null;
    private static volatile Object sSavedMaxListener = null;
    private static volatile Object sSavedIronSourceListener = null;
    private static volatile boolean sAdLoadedNotified = false;

    private HungrySharkAdsRewardHelper() {}

    /**
     * Always returns true for ad availability / readiness checks.
     * Also proactively signals to Unity that rewarded ads are loaded and ready.
     */
    public static boolean isAdReady() {
        Log.i(TAG, "Ad availability check intercepted: returning true");
        if (!sAdLoadedNotified) {
            sAdLoadedNotified = true;
            try {
                JSONObject loadedJson = new JSONObject();
                loadedJson.put("name", "OnRewardedAdLoadedEvent");
                loadedJson.put("adUnitId", "rewardedAd");
                loadedJson.put("adFormat", "rewarded");
                loadedJson.put("networkName", "AppLovin");
                sendMaxUnityEvent(loadedJson);
            } catch (Throwable ignored) {}

            Object mgr = getMaxUnityAdManagerInstance();
            if (mgr != null) {
                notifyMaxAdLoaded(mgr);
            }
            if (sSavedMaxListener != null && sSavedMaxListener != mgr) {
                notifyMaxAdLoaded(sSavedMaxListener);
            }
        }
        return true;
    }

    // =========================================================================
    // 1. AppLovin MAX Rewarded Ads
    // =========================================================================

    /**
     * Captured when MaxRewardedAd.setListener(...) is called by the game.
     */
    public static void registerMaxRewardedListener(Object listener) {
        Log.i(TAG, "registerMaxRewardedListener: " + listener);
        if (listener == null) return;
        sSavedMaxListener = listener;
        notifyMaxAdLoaded(listener);
    }

    /**
     * Captured when MaxUnityAdManager methods are called (passing instance as p0).
     */
    public static void registerMaxUnityAdManager(Object manager) {
        if (manager == null) return;
        Log.i(TAG, "registerMaxUnityAdManager: " + manager.getClass().getName());
        sSavedMaxUnityAdManager = manager;
        if (sSavedMaxListener == null) {
            sSavedMaxListener = manager;
        }
        notifyMaxAdLoaded(manager);
    }

    /**
     * Triggered when MaxRewardedAd.loadAd() is called by the game.
     */
    public static void onMaxRewardedAdLoad() {
        Log.i(TAG, "onMaxRewardedAdLoad called");
        Object target = sSavedMaxUnityAdManager != null ? sSavedMaxUnityAdManager : sSavedMaxListener;
        if (target != null) {
            notifyMaxAdLoaded(target);
        }
    }

    /**
     * Triggered when MaxUnityPlugin.loadRewardedAd or MaxUnityAdManager.loadRewardedAd is called.
     */
    public static void bypassMaxUnityPluginLoad(Object adUnitId) {
        final String unitId = (adUnitId != null && !adUnitId.toString().trim().isEmpty())
                ? adUnitId.toString().trim()
                : "rewardedAd";
        Log.i(TAG, "bypassMaxUnityPluginLoad called for adUnitId: " + unitId);

        try {
            JSONObject loadedJson = new JSONObject();
            loadedJson.put("name", "OnRewardedAdLoadedEvent");
            loadedJson.put("adUnitId", unitId);
            loadedJson.put("adFormat", "rewarded");
            loadedJson.put("networkName", "AppLovin");
            sendMaxUnityEvent(loadedJson);
        } catch (Throwable t) {
            Log.e(TAG, "Error in bypassMaxUnityPluginLoad", t);
        }

        Object mgr = getMaxUnityAdManagerInstance();
        if (mgr != null) {
            notifyMaxAdLoaded(mgr);
        }
        if (sSavedMaxListener != null && sSavedMaxListener != mgr) {
            notifyMaxAdLoaded(sSavedMaxListener);
        }
    }

    /**
     * Overloads for static MaxUnityPlugin.showRewardedAd calls.
     */
    public static void bypassMaxUnityShow(Object p0) {
        handleMaxUnityShow(p0, null, null);
    }

    public static void bypassMaxUnityShow(Object p0, Object p1) {
        handleMaxUnityShow(p0, p1, null);
    }

    public static void bypassMaxUnityShow(Object p0, Object p1, Object p2) {
        handleMaxUnityShow(p0, p1, p2);
    }

    /**
     * Overloads for instance MaxUnityAdManager.showRewardedAd calls.
     */
    public static void bypassMaxUnityManagerShow(Object manager, Object p1) {
        registerMaxUnityAdManager(manager);
        handleMaxUnityShow(p1, null, null);
    }

    public static void bypassMaxUnityManagerShow(Object manager, Object p1, Object p2) {
        registerMaxUnityAdManager(manager);
        handleMaxUnityShow(p1, p2, null);
    }

    public static void bypassMaxUnityManagerShow(Object manager, Object p1, Object p2, Object p3) {
        registerMaxUnityAdManager(manager);
        handleMaxUnityShow(p1, p2, p3);
    }

    private static void handleMaxUnityShow(Object p0, Object p1, Object p2) {
        final String adUnitId = (p0 != null && !p0.toString().trim().isEmpty()) ? p0.toString().trim() : "rewardedAd";
        final String placement = (p1 != null) ? p1.toString() : "";
        Log.i(TAG, "handleMaxUnityShow called for adUnitId: " + adUnitId + ", placement: " + placement);

        // Send MAX Unity lifecycle events synchronously
        try {
            // 1. Displayed event
            JSONObject displayJson = new JSONObject();
            displayJson.put("name", "OnRewardedAdDisplayedEvent");
            displayJson.put("adUnitId", adUnitId);
            displayJson.put("adFormat", "rewarded");
            displayJson.put("networkName", "AppLovin");
            displayJson.put("placement", placement);
            sendMaxUnityEvent(displayJson);

            // 2. Received Reward event
            JSONObject rewardJson = new JSONObject();
            rewardJson.put("name", "OnRewardedAdReceivedRewardEvent");
            rewardJson.put("adUnitId", adUnitId);
            rewardJson.put("adFormat", "rewarded");
            rewardJson.put("networkName", "AppLovin");
            rewardJson.put("placement", placement);
            rewardJson.put("rewardLabel", "reward");
            rewardJson.put("rewardAmount", "1");
            sendMaxUnityEvent(rewardJson);
            Log.i(TAG, "Sent OnRewardedAdReceivedRewardEvent to Unity!");

            // 3. Hidden event
            JSONObject hiddenJson = new JSONObject();
            hiddenJson.put("name", "OnRewardedAdHiddenEvent");
            hiddenJson.put("adUnitId", adUnitId);
            hiddenJson.put("adFormat", "rewarded");
            hiddenJson.put("networkName", "AppLovin");
            hiddenJson.put("placement", placement);
            sendMaxUnityEvent(hiddenJson);
            Log.i(TAG, "Sent OnRewardedAdHiddenEvent to Unity!");

        } catch (Throwable t) {
            Log.e(TAG, "Error in handleMaxUnityShow JSON dispatch", t);
        }

        // Direct Java listener invocation as additional guarantee
        Object listener = sSavedMaxUnityAdManager;
        if (listener == null) {
            listener = sSavedMaxListener;
        }
        if (listener == null) {
            listener = getMaxUnityAdManagerInstance();
        }
        if (listener != null) {
            bypassAppLovinMaxReward(listener, null);
        }
    }

    /**
     * Forwards an event JSONObject to Unity via AppLovin MAX Unity Plugin internal mechanisms.
     */
    public static void sendMaxUnityEvent(JSONObject eventProps) {
        if (eventProps == null) return;
        final String jsonStr = eventProps.toString();
        final String eventName = eventProps.optString("name");
        Log.i(TAG, "sendMaxUnityEvent: " + eventName + " -> " + jsonStr);

        try {
            boolean sent = false;
            Object mgr = getMaxUnityAdManagerInstance();

            // Strategy 1: MaxUnityAdManager.forwardUnityEvent(JSONObject or String)
            try {
                Class<?> adManagerClass = (mgr != null) ? mgr.getClass() : Class.forName("com.applovin.mediation.unity.MaxUnityAdManager");
                for (Method m : adManagerClass.getDeclaredMethods()) {
                    if ("forwardUnityEvent".equals(m.getName()) && m.getParameterTypes().length == 1) {
                        m.setAccessible(true);
                        Class<?> paramType = m.getParameterTypes()[0];
                        Object target = java.lang.reflect.Modifier.isStatic(m.getModifiers()) ? null : mgr;
                        if (target != null || java.lang.reflect.Modifier.isStatic(m.getModifiers())) {
                            if (paramType == String.class) {
                                m.invoke(target, jsonStr);
                            } else {
                                m.invoke(target, eventProps);
                            }
                            sent = true;
                            Log.i(TAG, "Sent MAX event via forwardUnityEvent: " + eventName);
                            break;
                        }
                    }
                }
            } catch (Throwable t) {
                Log.d(TAG, "forwardUnityEvent attempt failed: " + t.getMessage());
            }

            // Strategy 2: MaxUnityPlugin.forwardUnityEvent
            if (!sent) {
                try {
                    Class<?> pluginClass = Class.forName("com.applovin.mediation.unity.MaxUnityPlugin");
                    for (Method m : pluginClass.getDeclaredMethods()) {
                        if ("forwardUnityEvent".equals(m.getName()) && m.getParameterTypes().length == 1) {
                            m.setAccessible(true);
                            Class<?> paramType = m.getParameterTypes()[0];
                            if (paramType == String.class) {
                                m.invoke(null, jsonStr);
                            } else {
                                m.invoke(null, eventProps);
                            }
                            sent = true;
                            Log.i(TAG, "Sent MAX event via MaxUnityPlugin.forwardUnityEvent: " + eventName);
                            break;
                        }
                    }
                } catch (Throwable ignored) {}
            }

            // Strategy 3: backgroundCallback.onEvent(String)
            if (!sent) {
                try {
                    Class<?> adManagerClass = (mgr != null) ? mgr.getClass() : Class.forName("com.applovin.mediation.unity.MaxUnityAdManager");
                    for (Field f : adManagerClass.getDeclaredFields()) {
                        if ("backgroundCallback".equals(f.getName())) {
                            f.setAccessible(true);
                            Object callback = java.lang.reflect.Modifier.isStatic(f.getModifiers()) ? f.get(null) : (mgr != null ? f.get(mgr) : null);
                            if (callback != null) {
                                for (Method m : callback.getClass().getMethods()) {
                                    if ("onEvent".equals(m.getName()) && m.getParameterTypes().length == 1) {
                                        m.invoke(callback, jsonStr);
                                        sent = true;
                                        Log.i(TAG, "Sent MAX event via backgroundCallback.onEvent: " + eventName);
                                        break;
                                    }
                                }
                            }
                            if (sent) break;
                        }
                    }
                } catch (Throwable t) {
                    Log.d(TAG, "backgroundCallback attempt failed: " + t.getMessage());
                }
            }

            // Strategy 4: UnityPlayer.UnitySendMessage targeting MaxSdkCallbacks.ForwardEvent
            try {
                Class<?> unityPlayerClass = Class.forName("com.unity3d.player.UnityPlayer");
                Method sendMessageMethod = unityPlayerClass.getMethod("UnitySendMessage", String.class, String.class, String.class);
                String[] gameObjects = {"MaxSdkCallbacks", "AppLovinMediationAdEvents", "AppLovinSdk", "MaxUnityAdManager"};
                for (String go : gameObjects) {
                    try {
                        // Standard AppLovin MAX Unity callback receiver method
                        sendMessageMethod.invoke(null, go, "ForwardEvent", jsonStr);
                        sendMessageMethod.invoke(null, go, "forwardUnityEvent", jsonStr);
                        sendMessageMethod.invoke(null, go, "onEvent", jsonStr);
                    } catch (Throwable ignored) {}
                }
                Log.i(TAG, "Dispatched MAX event via UnitySendMessage: " + eventName);
            } catch (Throwable t) {
                Log.d(TAG, "UnityPlayer.UnitySendMessage fallback failed: " + t.getMessage());
            }

        } catch (Throwable t) {
            Log.e(TAG, "Error in sendMaxUnityEvent", t);
        }
    }

    /**
     * Resolves the MaxUnityAdManager instance via reflection if not already captured.
     */
    public static Object getMaxUnityAdManagerInstance() {
        if (sSavedMaxUnityAdManager != null) {
            return sSavedMaxUnityAdManager;
        }
        try {
            Class<?> pluginClass = Class.forName("com.applovin.mediation.unity.MaxUnityPlugin");
            for (Field f : pluginClass.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) {
                    f.setAccessible(true);
                    Object val = f.get(null);
                    if (val != null && val.getClass().getName().contains("MaxUnityAdManager")) {
                        sSavedMaxUnityAdManager = val;
                        return val;
                    }
                }
            }
            for (Method m : pluginClass.getDeclaredMethods()) {
                if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) && m.getParameterTypes().length == 0) {
                    if (m.getReturnType().getName().contains("MaxUnityAdManager")) {
                        m.setAccessible(true);
                        Object val = m.invoke(null);
                        if (val != null) {
                            sSavedMaxUnityAdManager = val;
                            return val;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}

        try {
            Class<?> mgrClass = Class.forName("com.applovin.mediation.unity.MaxUnityAdManager");
            for (Field f : mgrClass.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) {
                    f.setAccessible(true);
                    Object val = f.get(null);
                    if (val != null && mgrClass.isInstance(val)) {
                        sSavedMaxUnityAdManager = val;
                        return val;
                    }
                }
            }
            for (Method m : mgrClass.getDeclaredMethods()) {
                if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) && m.getParameterTypes().length == 0) {
                    if ("getInstance".equals(m.getName()) || "shared".equals(m.getName())) {
                        m.setAccessible(true);
                        Object val = m.invoke(null);
                        if (val != null) {
                            sSavedMaxUnityAdManager = val;
                            return val;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}

        return sSavedMaxListener;
    }

    /**
     * Notifies MaxRewardedAdListener that the ad has loaded.
     */
    private static void notifyMaxAdLoaded(Object listenerObj) {
        if (listenerObj == null) return;
        try {
            for (Method m : listenerObj.getClass().getMethods()) {
                if ("onAdLoaded".equals(m.getName()) && m.getParameterTypes().length == 1) {
                    Class<?> paramType = m.getParameterTypes()[0];
                    Object dummyAd = createDummyMaxAdProxy(paramType);
                    m.invoke(listenerObj, dummyAd);
                    Log.i(TAG, "Successfully invoked onAdLoaded on MaxRewardedAdListener!");
                    break;
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error invoking onAdLoaded on MaxRewardedAdListener", t);
        }
    }

    /**
     * Intercepts AppLovin MaxRewardedAd.showAd(...) calls.
     */
    public static void bypassMaxRewardedAd(Object maxRewardedAdInstance) {
        Log.i(TAG, "Bypassing AppLovin MaxRewardedAd.showAd...");
        Object listener = sSavedMaxListener;
        if (listener == null && maxRewardedAdInstance != null) {
            listener = findListenerInObject(maxRewardedAdInstance, "MaxRewardedAdListener");
            if (listener == null) {
                listener = findListenerByMethod(maxRewardedAdInstance, "onUserRewarded");
            }
        }

        if (listener != null) {
            bypassAppLovinMaxReward(listener, maxRewardedAdInstance);
        } else {
            Log.w(TAG, "MaxRewardedAdListener not found on instance or saved listener");
        }
    }

    /**
     * Dispatches the full AppLovin MAX rewarded ad lifecycle:
     * 1. onAdDisplayed(MaxAd)
     * 2. onUserRewarded(MaxAd, MaxReward)
     * 3. onAdHidden(MaxAd)
     */
    public static void bypassAppLovinMaxReward(Object listenerObj, Object maxAdObj) {
        if (listenerObj == null) return;

        MAIN_HANDLER.post(() -> {
            try {
                Object effectiveMaxAd = maxAdObj;

                // 1. onAdDisplayed(MaxAd)
                for (Method m : listenerObj.getClass().getMethods()) {
                    if ("onAdDisplayed".equals(m.getName()) && m.getParameterTypes().length == 1) {
                        Class<?> paramType = m.getParameterTypes()[0];
                        if (effectiveMaxAd == null || !paramType.isInstance(effectiveMaxAd)) {
                            effectiveMaxAd = createDummyMaxAdProxy(paramType);
                        }
                        try {
                            m.invoke(listenerObj, effectiveMaxAd);
                            Log.i(TAG, "Invoked AppLovin onAdDisplayed!");
                        } catch (Throwable t) {
                            Log.e(TAG, "Error invoking onAdDisplayed", t);
                        }
                        break;
                    }
                }

                final Object finalMaxAd = effectiveMaxAd;

                // 2. onUserRewarded(MaxAd, MaxReward) after 50ms
                MAIN_HANDLER.postDelayed(() -> {
                    try {
                        for (Method m : listenerObj.getClass().getMethods()) {
                            if ("onUserRewarded".equals(m.getName()) && m.getParameterTypes().length == 2) {
                                Class<?>[] params = m.getParameterTypes();
                                Object dummyReward = createDummyMaxRewardProxy(params[1]);
                                m.invoke(listenerObj, finalMaxAd, dummyReward);
                                Log.i(TAG, "Invoked AppLovin onUserRewarded!");
                                break;
                            }
                        }

                        // 3. onAdHidden(MaxAd) after another 50ms
                        MAIN_HANDLER.postDelayed(() -> {
                            try {
                                for (Method m : listenerObj.getClass().getMethods()) {
                                    if ("onAdHidden".equals(m.getName()) && m.getParameterTypes().length == 1) {
                                        m.invoke(listenerObj, finalMaxAd);
                                        Log.i(TAG, "Invoked AppLovin onAdHidden!");
                                        break;
                                    }
                                }
                            } catch (Throwable t) {
                                Log.e(TAG, "Error invoking onAdHidden", t);
                            }
                        }, 50);

                    } catch (Throwable t) {
                        Log.e(TAG, "Error invoking onUserRewarded", t);
                    }
                }, 50);

            } catch (Throwable t) {
                Log.e(TAG, "Error triggering AppLovin MAX callbacks", t);
            }
        });
    }

    // =========================================================================
    // 2. Unity Ads
    // =========================================================================

    /**
     * Intercepts UnityAds.load(placementId, loadListener).
     * Immediately notifies the listener that the ad is loaded.
     */
    public static void bypassUnityAdsLoad(Object placementIdObj, Object loadListenerObj) {
        final String placementId = placementIdObj != null ? placementIdObj.toString() : "rewardedVideo";
        Log.i(TAG, "bypassUnityAdsLoad for placement: " + placementId);
        if (loadListenerObj == null) return;

        MAIN_HANDLER.post(() -> {
            try {
                for (Method m : loadListenerObj.getClass().getMethods()) {
                    if ("onUnityAdsAdLoaded".equals(m.getName()) && m.getParameterTypes().length == 1) {
                        m.invoke(loadListenerObj, placementId);
                        Log.i(TAG, "Invoked onUnityAdsAdLoaded for " + placementId);
                        return;
                    }
                }
            } catch (Throwable t) {
                Log.e(TAG, "Error in bypassUnityAdsLoad", t);
            }
        });
    }

    public static void bypassUnityAdsShow(Object p1, Object p2) {
        handleUnityAdsShow(new Object[]{p1, p2});
    }

    public static void bypassUnityAdsShow(Object p1, Object p2, Object p3) {
        handleUnityAdsShow(new Object[]{p1, p2, p3});
    }

    public static void bypassUnityAdsShow(Object p1, Object p2, Object p3, Object p4) {
        handleUnityAdsShow(new Object[]{p1, p2, p3, p4});
    }

    private static void handleUnityAdsShow(Object[] params) {
        Log.i(TAG, "handleUnityAdsShow called with " + params.length + " args");
        Object listener = null;
        String placementId = "rewardedVideo";

        for (Object p : params) {
            if (p == null) continue;
            if (p instanceof String) {
                placementId = (String) p;
            } else {
                for (Method m : p.getClass().getMethods()) {
                    if ("onUnityAdsShowComplete".equals(m.getName())) {
                        listener = p;
                        break;
                    }
                }
            }
        }

        final Object finalListener = listener;
        final String finalPlacementId = placementId;
        if (finalListener == null) {
            Log.w(TAG, "UnityAds showListener not found in arguments");
            return;
        }

        MAIN_HANDLER.post(() -> {
            try {
                Class<?> listenerClass = finalListener.getClass();

                // 1. onUnityAdsShowStart
                for (Method m : listenerClass.getMethods()) {
                    if ("onUnityAdsShowStart".equals(m.getName()) && m.getParameterTypes().length == 1) {
                        try {
                            m.invoke(finalListener, finalPlacementId);
                        } catch (Throwable ignored) {}
                        break;
                    }
                }

                // 2. onUnityAdsShowComplete(placementId, COMPLETED)
                MAIN_HANDLER.postDelayed(() -> {
                    try {
                        for (Method m : listenerClass.getMethods()) {
                            if ("onUnityAdsShowComplete".equals(m.getName()) && m.getParameterTypes().length == 2) {
                                Class<?> enumType = m.getParameterTypes()[1];
                                Object completedEnum = null;
                                if (enumType.isEnum()) {
                                    for (Object constant : enumType.getEnumConstants()) {
                                        if ("COMPLETED".equalsIgnoreCase(constant.toString())) {
                                            completedEnum = constant;
                                            break;
                                        }
                                    }
                                }
                                m.invoke(finalListener, finalPlacementId, completedEnum);
                                Log.i(TAG, "Invoked UnityAds onUnityAdsShowComplete with COMPLETED");
                                return;
                            }
                        }
                    } catch (Throwable t) {
                        Log.e(TAG, "Error invoking onUnityAdsShowComplete", t);
                    }
                }, 50);

            } catch (Throwable t) {
                Log.e(TAG, "Error in handleUnityAdsShow", t);
            }
        });
    }

    // =========================================================================
    // 3. IronSource
    // =========================================================================

    public static void registerIronSourceListener(Object listenerObj) {
        Log.i(TAG, "registerIronSourceListener: " + listenerObj);
        sSavedIronSourceListener = listenerObj;
        if (listenerObj != null) {
            MAIN_HANDLER.post(() -> {
                try {
                    for (Method m : listenerObj.getClass().getMethods()) {
                        if ("onRewardedVideoAvailabilityChanged".equals(m.getName()) && m.getParameterTypes().length == 1) {
                            m.invoke(listenerObj, true);
                            Log.i(TAG, "Invoked onRewardedVideoAvailabilityChanged(true)");
                            break;
                        }
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "Error in registerIronSourceListener", t);
                }
            });
        }
    }

    public static void bypassIronSourceReward(Object placementObj) {
        Log.i(TAG, "bypassIronSourceReward called");
        Object listener = sSavedIronSourceListener;
        if (listener == null) return;

        MAIN_HANDLER.post(() -> {
            try {
                // onRewardedVideoAdOpened
                for (Method m : listener.getClass().getMethods()) {
                    if ("onRewardedVideoAdOpened".equals(m.getName()) && m.getParameterTypes().length == 0) {
                        try { m.invoke(listener); } catch (Throwable ignored) {}
                        break;
                    }
                }

                MAIN_HANDLER.postDelayed(() -> {
                    try {
                        // onRewardedVideoAdRewarded
                        for (Method m : listener.getClass().getMethods()) {
                            if ("onRewardedVideoAdRewarded".equals(m.getName())) {
                                m.invoke(listener, placementObj);
                                Log.i(TAG, "Invoked IronSource onRewardedVideoAdRewarded!");
                                break;
                            }
                        }

                        // onRewardedVideoAdClosed
                        MAIN_HANDLER.postDelayed(() -> {
                            try {
                                for (Method m : listener.getClass().getMethods()) {
                                    if ("onRewardedVideoAdClosed".equals(m.getName()) && m.getParameterTypes().length == 0) {
                                        m.invoke(listener);
                                        Log.i(TAG, "Invoked IronSource onRewardedVideoAdClosed!");
                                        break;
                                    }
                                }
                            } catch (Throwable t) {
                                Log.e(TAG, "Error in onRewardedVideoAdClosed", t);
                            }
                        }, 50);

                    } catch (Throwable t) {
                        Log.e(TAG, "Error in onRewardedVideoAdRewarded", t);
                    }
                }, 50);

            } catch (Throwable t) {
                Log.e(TAG, "Error in bypassIronSourceReward", t);
            }
        });
    }

    // =========================================================================
    // 4. Google Mobile Ads (AdMob)
    // =========================================================================

    public static void bypassGoogleRewardedAd(Object activityObj, Object listenerObj) {
        Log.i(TAG, "Bypassing Google Mobile Ads RewardedAd.show...");
        if (listenerObj == null) {
            Log.w(TAG, "OnUserEarnedRewardListener is null");
            return;
        }

        MAIN_HANDLER.post(() -> {
            try {
                for (Method m : listenerObj.getClass().getMethods()) {
                    if ("onUserEarnedReward".equals(m.getName()) && m.getParameterTypes().length == 1) {
                        Class<?> paramType = m.getParameterTypes()[0];
                        Object rewardProxy = createDummyRewardItemProxy(paramType);
                        m.invoke(listenerObj, rewardProxy);
                        Log.i(TAG, "Successfully invoked onUserEarnedReward!");
                        return;
                    }
                }
                Log.w(TAG, "Could not find onUserEarnedReward method on listener");
            } catch (Throwable t) {
                Log.e(TAG, "Error invoking onUserEarnedReward", t);
            }
        });
    }

    public static void bypassUnityRewardedAdCallback(Object callbackObj) {
        Log.i(TAG, "Bypassing Google UnityRewardedAd callback...");
        if (callbackObj == null) return;

        MAIN_HANDLER.post(() -> {
            try {
                // 1. onUserEarnedReward(String, float)
                try {
                    Method onReward = callbackObj.getClass().getMethod("onUserEarnedReward", String.class, float.class);
                    onReward.invoke(callbackObj, "reward", 1.0f);
                    Log.i(TAG, "Invoked UnityRewardedAdCallback.onUserEarnedReward");
                } catch (NoSuchMethodException ignored) {
                    for (Method m : callbackObj.getClass().getMethods()) {
                        if ("onUserEarnedReward".equals(m.getName())) {
                            m.invoke(callbackObj, "reward", 1.0f);
                            break;
                        }
                    }
                }

                // 2. onAdDismissedFullScreenContent()
                try {
                    Method onDismiss = callbackObj.getClass().getMethod("onAdDismissedFullScreenContent");
                    onDismiss.invoke(callbackObj);
                    Log.i(TAG, "Invoked UnityRewardedAdCallback.onAdDismissedFullScreenContent");
                } catch (Throwable ignored) {}
            } catch (Throwable t) {
                Log.e(TAG, "Error bypassing UnityRewardedAdCallback", t);
            }
        });
    }

    // =========================================================================
    // Reflection & Proxy Helpers
    // =========================================================================

    private static Object createDummyMaxAdProxy(Class<?> interfaceClass) {
        if (interfaceClass == null || !interfaceClass.isInterface()) return null;
        return Proxy.newProxyInstance(
            interfaceClass.getClassLoader(),
            new Class<?>[]{interfaceClass},
            (proxy, method, args) -> {
                String name = method.getName();
                if ("getAdUnitId".equals(name)) return "rewardedAd";
                if ("getPlacement".equals(name)) return "default";
                if ("getNetworkName".equals(name)) return "AppLovin";
                if ("getFormat".equals(name)) return null;
                if ("getSize".equals(name)) return null;
                if ("getRevenue".equals(name)) return 0.0;
                if ("toString".equals(name)) return "DummyMaxAd";
                if ("hashCode".equals(name)) return 1;
                if ("equals".equals(name)) return args != null && args.length > 0 && args[0] == proxy;
                return null;
            }
        );
    }

    private static Object createDummyMaxRewardProxy(Class<?> interfaceClass) {
        if (interfaceClass == null || !interfaceClass.isInterface()) return null;
        return Proxy.newProxyInstance(
            interfaceClass.getClassLoader(),
            new Class<?>[]{interfaceClass},
            (proxy, method, args) -> {
                String name = method.getName();
                if ("getAmount".equals(name)) return 1;
                if ("getLabel".equals(name)) return "reward";
                return null;
            }
        );
    }

    private static Object createDummyRewardItemProxy(Class<?> interfaceClass) {
        if (interfaceClass == null || !interfaceClass.isInterface()) return null;
        return Proxy.newProxyInstance(
            interfaceClass.getClassLoader(),
            new Class<?>[]{interfaceClass},
            (proxy, method, args) -> {
                String name = method.getName();
                if ("getAmount".equals(name)) return 1;
                if ("getType".equals(name)) return "reward";
                return null;
            }
        );
    }

    private static Object findListenerInObject(Object root, String targetInterfaceName) {
        if (root == null) return null;
        Set<Object> visited = new HashSet<>();
        return searchFieldRecursive(root, targetInterfaceName, visited, 0);
    }

    private static Object searchFieldRecursive(Object current, String interfaceName, Set<Object> visited, int depth) {
        if (current == null || depth > 3 || !visited.add(current)) return null;

        for (Class<?> iface : current.getClass().getInterfaces()) {
            if (iface.getName().contains(interfaceName)) {
                return current;
            }
        }

        Class<?> clazz = current.getClass();
        while (clazz != null && clazz != Object.class) {
            for (Field field : clazz.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object val = field.get(current);
                    if (val != null) {
                        for (Class<?> iface : val.getClass().getInterfaces()) {
                            if (iface.getName().contains(interfaceName)) {
                                return val;
                            }
                        }
                        if (depth < 2 && !isPrimitiveOrWrapper(val.getClass())) {
                            Object found = searchFieldRecursive(val, interfaceName, visited, depth + 1);
                            if (found != null) return found;
                        }
                    }
                } catch (Throwable ignored) {}
            }
            clazz = clazz.getSuperclass();
        }
        return null;
    }

    private static Object findListenerByMethod(Object root, String methodName) {
        if (root == null) return null;
        Class<?> clazz = root.getClass();
        while (clazz != null && clazz != Object.class) {
            for (Field field : clazz.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object val = field.get(root);
                    if (val != null) {
                        for (Method m : val.getClass().getMethods()) {
                            if (m.getName().equals(methodName)) {
                                return val;
                            }
                        }
                    }
                } catch (Throwable ignored) {}
            }
            clazz = clazz.getSuperclass();
        }
        return null;
    }

    private static boolean isPrimitiveOrWrapper(Class<?> type) {
        return type.isPrimitive() ||
               type == String.class ||
               type == Integer.class ||
               type == Long.class ||
               type == Boolean.class ||
               type == Float.class ||
               type == Double.class;
    }
}
