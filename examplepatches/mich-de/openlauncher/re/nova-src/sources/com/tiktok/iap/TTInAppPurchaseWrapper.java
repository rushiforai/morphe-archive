package com.tiktok.iap;

import android.app.Activity;
import com.tiktok.iap.billing.client.IBillingProxy;
import com.tiktok.iap.billing.client.TTBillingFactory;
import com.tiktok.util.JSON;
import com.tiktok.util.TTSafeRunnable;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTInAppPurchaseWrapper {
    private static final String ACT_BILLING = "ProxyBillingActivity";
    private static volatile IBillingProxy sBillingProxy;
    private static volatile String sPreviousActivity;
    public static final ExecutorService sExecutor = Executors.newSingleThreadExecutor();
    public static volatile int devAutoTrack = 0;
    public static volatile boolean hasReportedHistoryInLife = false;
    public static volatile boolean autoTrackPaymentEnable = true;
    public static Set<Integer> autoTrackPaymentTypes = new CopyOnWriteArraySet();
    public static volatile boolean autoTrackPaymentJson = true;
    public static volatile boolean autoTrackPaymentHistory = true;
    public static volatile int autoTrackPaymentHistoryINAPP = 200;
    public static volatile int autoTrackPaymentHistorySUBS = 20;

    static {
        autoTrackPaymentTypes.add(1);
        autoTrackPaymentTypes.add(2);
    }

    public static boolean canTrackINAPP() {
        return autoTrackPaymentEnable && autoTrackPaymentTypes.contains(1);
    }

    public static boolean canTrackSUBS() {
        return autoTrackPaymentEnable && autoTrackPaymentTypes.contains(2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static IBillingProxy getBillingProxy() {
        if (sBillingProxy == null) {
            synchronized (TTInAppPurchaseWrapper.class) {
                try {
                    if (sBillingProxy == null) {
                        sBillingProxy = TTBillingFactory.createBillingProxy();
                    }
                } finally {
                }
            }
        }
        return sBillingProxy;
    }

    public static void registerIapTrack() {
        try {
            if (autoTrackPaymentEnable) {
                sExecutor.submit(new TTSafeRunnable() { // from class: com.tiktok.iap.TTInAppPurchaseWrapper.1
                    @Override // com.tiktok.util.TTSafeRunnable
                    public void doSafeRun() {
                        IBillingProxy billingProxy = TTInAppPurchaseWrapper.getBillingProxy();
                        if (billingProxy != null) {
                            billingProxy.init();
                        }
                    }
                });
            }
        } catch (Throwable unused) {
        }
    }

    public static void tryReportIapEvent(Activity activity) {
        if (activity == null) {
            return;
        }
        try {
            if (autoTrackPaymentEnable && autoTrackPaymentHistory) {
                String simpleName = activity.getClass().getSimpleName();
                boolean z11 = (sPreviousActivity == null || !sPreviousActivity.contains(ACT_BILLING) || simpleName.contains(ACT_BILLING)) ? false : true;
                if (!hasReportedHistoryInLife || z11) {
                    sExecutor.submit(new TTSafeRunnable() { // from class: com.tiktok.iap.TTInAppPurchaseWrapper.2
                        @Override // com.tiktok.util.TTSafeRunnable
                        public void doSafeRun() {
                            IBillingProxy billingProxy = TTInAppPurchaseWrapper.getBillingProxy();
                            if (billingProxy != null) {
                                billingProxy.queryPurchaseHistory();
                            }
                        }
                    });
                }
                sPreviousActivity = simpleName;
            }
        } catch (Throwable unused) {
        }
    }

    public static void updateConfig(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            boolean z11 = true;
            autoTrackPaymentEnable = JSON.getBoolean(jSONObject, "auto_track_Payment_enable", true);
            autoTrackPaymentJson = autoTrackPaymentEnable && JSON.getInt(jSONObject, "auto_track_Payment_json", 1) == 1;
            if (!autoTrackPaymentEnable || JSON.getInt(jSONObject, "auto_track_Payment_history_enable", 1) != 1) {
                z11 = false;
            }
            autoTrackPaymentHistory = z11;
            autoTrackPaymentHistoryINAPP = JSON.getInt(jSONObject, "auto_track_Payment_history_inapp_size", 200);
            autoTrackPaymentHistorySUBS = JSON.getInt(jSONObject, "auto_track_Payment_history_subs_size", 20);
            JSONArray jsonArray = JSON.getJsonArray(jSONObject, "auto_track_Payment_types");
            if (jsonArray != null) {
                autoTrackPaymentTypes.clear();
                int length = jsonArray.length();
                for (int i5 = 0; i5 < length; i5++) {
                    try {
                        int iOptInt = jsonArray.optInt(i5, -2);
                        if (iOptInt > 0) {
                            autoTrackPaymentTypes.add(Integer.valueOf(iOptInt));
                        }
                    } catch (Throwable unused) {
                    }
                }
            }
        } catch (Throwable unused2) {
        }
        registerIapTrack();
    }
}
