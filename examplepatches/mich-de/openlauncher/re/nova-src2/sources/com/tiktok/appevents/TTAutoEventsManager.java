package com.tiktok.appevents;

import android.text.TextUtils;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.util.JSON;
import com.tiktok.util.TTConst;
import com.tiktok.util.TTKeyValueStore;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import org.json.JSONObject;

/* loaded from: classes4.dex */
class TTAutoEventsManager {
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
    private static final SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.getDefault());
    private final TTAppEventLogger appEventLogger;
    private final TTKeyValueStore store = new TTKeyValueStore(TikTokBusinessSdk.getApplicationContext());

    public TTAutoEventsManager(TTAppEventLogger tTAppEventLogger) {
        this.appEventLogger = tTAppEventLogger;
    }

    private boolean isSatisfyRetention(Date date, Date date2) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(5, 1);
        SimpleDateFormat simpleDateFormat = dateFormat;
        return simpleDateFormat.format(calendar.getTime()).equals(simpleDateFormat.format(date2));
    }

    private void trackFirstInstallEvent() {
        try {
            if (this.store.get(TTConst.TTSDK_APP_FIRST_INSTALL) != null) {
                return;
            }
            Date date = new Date();
            HashMap<String, Object> map = new HashMap<>();
            map.put(TTConst.TTSDK_APP_FIRST_INSTALL, timeFormat.format(date));
            TTConst.AutoEvents autoEvents = TTConst.AutoEvents.InstallApp;
            if (shouldTrackAppLifecycleEvents(autoEvents).booleanValue()) {
                try {
                    JSONObject jSONObjectBuild = JSON.build();
                    JSON.putObject(jSONObjectBuild, TTConst.TRACK_TYPE, TTConst.TRACK_TYPE_AUTO);
                    this.appEventLogger.track(autoEvents.name, jSONObjectBuild);
                } catch (Throwable unused) {
                }
            }
            this.store.set(map);
        } catch (Throwable unused2) {
        }
    }

    private void trackLaunchEvent() {
        TTConst.AutoEvents autoEvents = TTConst.AutoEvents.LaunchAPP;
        if (shouldTrackAppLifecycleEvents(autoEvents).booleanValue()) {
            try {
                JSONObject jSONObjectBuild = JSON.build();
                JSON.putObject(jSONObjectBuild, TTConst.TRACK_TYPE, TTConst.TRACK_TYPE_AUTO);
                this.appEventLogger.track(autoEvents.name, jSONObjectBuild);
            } catch (Throwable unused) {
            }
            try {
                this.store.set(TTConst.TTSDK_APP_LAST_LAUNCH, timeFormat.format(new Date()));
            } catch (Throwable unused2) {
            }
        }
    }

    public Boolean shouldTrackAppLifecycleEvents(TTConst.AutoEvents autoEvents) {
        TTAppEventLogger tTAppEventLogger = this.appEventLogger;
        return Boolean.valueOf(tTAppEventLogger.lifecycleTrackEnable && !tTAppEventLogger.disabledEvents.contains(autoEvents));
    }

    public void track2DayRetentionEvent() {
        if (this.store.get(TTConst.TTSDK_APP_2DR_TIME) != null) {
            return;
        }
        String str = this.store.get(TTConst.TTSDK_APP_FIRST_INSTALL);
        if (TextUtils.isEmpty(str)) {
            return;
        }
        try {
            Date date = timeFormat.parse(str);
            Date date2 = new Date();
            TTConst.AutoEvents autoEvents = TTConst.AutoEvents.SecondDayRetention;
            if (shouldTrackAppLifecycleEvents(autoEvents).booleanValue() && isSatisfyRetention(date, date2) && TTAppEventLogger.autoTrackRetentionEnable) {
                try {
                    JSONObject jSONObjectBuild = JSON.build();
                    JSON.putObject(jSONObjectBuild, TTConst.TRACK_TYPE, TTConst.TRACK_TYPE_AUTO);
                    this.appEventLogger.track(autoEvents.name, jSONObjectBuild);
                } catch (Throwable unused) {
                }
                this.store.set(TTConst.TTSDK_APP_2DR_TIME, timeFormat.format(date2));
            }
        } catch (Throwable unused2) {
        }
    }

    public void trackOnAppOpenEvents() {
        trackFirstInstallEvent();
        track2DayRetentionEvent();
        trackLaunchEvent();
    }
}
