package com.tiktok.appevents;

import android.app.Application;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.util.IOUtils;
import com.tiktok.util.JSON;
import com.tiktok.util.TTLogger;
import com.tiktok.util.TTUtil;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes4.dex */
class TTAppEventStorage {
    private static final String EVENT_STORAGE_FILE = "events_cache";
    private static final int MAX_PERSIST_EVENTS_NUM = 500;
    private static final String TAG = "TTAppEventStorage";
    private static final TTLogger logger = new TTLogger(TAG, TikTokBusinessSdk.getLogLevel());

    public static synchronized void clearAll() {
        TTUtil.checkThread(TAG);
        try {
            deleteFile(new File(TikTokBusinessSdk.getApplicationContext().getFilesDir(), EVENT_STORAGE_FILE));
        } catch (Throwable unused) {
        }
        TikTokBusinessSdk.DiskStatusListener diskStatusListener = TikTokBusinessSdk.diskListener;
        if (diskStatusListener != null) {
            diskStatusListener.onDiskChange(0, true);
        }
    }

    private static void deleteFile(File file) {
        try {
            if (file.exists()) {
                file.delete();
            }
        } catch (Throwable unused) {
        }
    }

    private static void discardOldEvents(TTAppEventPersist tTAppEventPersist, int i5) {
        List<TTAppEvent> appEvents;
        int size;
        if (tTAppEventPersist == null || tTAppEventPersist.isEmpty() || (size = (appEvents = tTAppEventPersist.getAppEvents()).size()) <= i5) {
            return;
        }
        logger.debug("Way too many events(%d), slim it!", Integer.valueOf(size));
        int i11 = size - i5;
        TTAppEventLogger.totalDumped += i11;
        TikTokBusinessSdk.diskListener.onDumped(TTAppEventLogger.totalDumped);
        tTAppEventPersist.setAppEvents(new ArrayList(appEvents.subList(i11, size)));
    }

    public static synchronized void persist(List<TTAppEvent> list) {
        TTLogger tTLogger;
        TTUtil.checkThread(TAG);
        try {
            tTLogger = logger;
            tTLogger.debug("Tried to persist to disk", new Object[0]);
        } catch (Throwable unused) {
        }
        if (!TikTokBusinessSdk.isSystemActivated()) {
            tTLogger.debug("Quit persisting to disk because global switch is turned off", new Object[0]);
            return;
        }
        List<TTAppEvent> listExportAllEvents = TTAppEventsQueue.exportAllEvents();
        TTAppEventPersist fromDisk = readFromDisk();
        if (listExportAllEvents.isEmpty() && fromDisk.isEmpty() && (list == null || list.isEmpty())) {
            return;
        }
        TTAppEventPersist tTAppEventPersist = new TTAppEventPersist();
        if (list != null) {
            tTAppEventPersist.addEvents(list);
        }
        tTAppEventPersist.addEvents(fromDisk.getAppEvents());
        tTAppEventPersist.addEvents(listExportAllEvents);
        discardOldEvents(tTAppEventPersist, 500);
        saveToDisk(tTAppEventPersist);
    }

    public static synchronized TTAppEventPersist readFromDisk() {
        FileInputStream fileInputStreamOpenFileInput;
        long jCurrentTimeMillis = System.currentTimeMillis();
        TTUtil.checkThread(TAG);
        Application applicationContext = TikTokBusinessSdk.getApplicationContext();
        File file = new File(applicationContext.getFilesDir(), EVENT_STORAGE_FILE);
        if (!file.exists()) {
            return new TTAppEventPersist();
        }
        TTAppEventPersist tTAppEventPersist = new TTAppEventPersist();
        try {
            fileInputStreamOpenFileInput = applicationContext.openFileInput(EVENT_STORAGE_FILE);
            try {
                tTAppEventPersist = TTSafeReadObjectUtil.safeReadTTAppEventPersist(fileInputStreamOpenFileInput);
                logger.debug("disk read data: %s", tTAppEventPersist);
                deleteFile(file);
                TikTokBusinessSdk.DiskStatusListener diskStatusListener = TikTokBusinessSdk.diskListener;
                if (diskStatusListener != null) {
                    diskStatusListener.onDiskChange(0, true);
                }
                IOUtils.close(fileInputStreamOpenFileInput);
            } catch (Throwable th2) {
                th = th2;
                try {
                    deleteFile(file);
                    TTCrashHandler.handleCrash(TAG, th, 2);
                    IOUtils.close(fileInputStreamOpenFileInput);
                    long jCurrentTimeMillis2 = System.currentTimeMillis();
                    JSONObject metaWithTS = TTUtil.getMetaWithTS(Long.valueOf(jCurrentTimeMillis2));
                    JSON.putLong(metaWithTS, "latency", jCurrentTimeMillis2 - jCurrentTimeMillis);
                    JSON.putInt(metaWithTS, "size", tTAppEventPersist.getAppEvents().size());
                    TikTokBusinessSdk.getAppEventLogger().monitorMetric("file_r", metaWithTS, null);
                    return tTAppEventPersist;
                } catch (Throwable th3) {
                    IOUtils.close(fileInputStreamOpenFileInput);
                    throw th3;
                }
            }
        } catch (Throwable th4) {
            th = th4;
            fileInputStreamOpenFileInput = null;
        }
        try {
            long jCurrentTimeMillis22 = System.currentTimeMillis();
            JSONObject metaWithTS2 = TTUtil.getMetaWithTS(Long.valueOf(jCurrentTimeMillis22));
            JSON.putLong(metaWithTS2, "latency", jCurrentTimeMillis22 - jCurrentTimeMillis);
            JSON.putInt(metaWithTS2, "size", tTAppEventPersist.getAppEvents().size());
            TikTokBusinessSdk.getAppEventLogger().monitorMetric("file_r", metaWithTS2, null);
        } catch (Throwable unused) {
        }
        return tTAppEventPersist;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(6:5|(2:28|6)|(4:30|7|(1:9)|13)|24|18|19) */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static boolean saveToDisk(TTAppEventPersist tTAppEventPersist) {
        ObjectOutputStream objectOutputStream;
        boolean z11 = false;
        if (tTAppEventPersist.isEmpty()) {
            return false;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        try {
            objectOutputStream = new ObjectOutputStream(new BufferedOutputStream(TikTokBusinessSdk.getApplicationContext().openFileOutput(EVENT_STORAGE_FILE, 0)));
        } catch (Throwable th2) {
            th = th2;
            objectOutputStream = null;
        }
        try {
            objectOutputStream.writeObject(tTAppEventPersist);
            logger.debug("Saving %d events to disk", Integer.valueOf(tTAppEventPersist.getAppEvents().size()));
            TikTokBusinessSdk.DiskStatusListener diskStatusListener = TikTokBusinessSdk.diskListener;
            if (diskStatusListener != null) {
                diskStatusListener.onDiskChange(tTAppEventPersist.getAppEvents().size(), false);
            }
            IOUtils.close(objectOutputStream);
            z11 = true;
        } catch (Throwable th3) {
            th = th3;
            try {
                TTCrashHandler.handleCrash(TAG, th, 2);
                IOUtils.close(objectOutputStream);
                long jCurrentTimeMillis2 = System.currentTimeMillis();
                JSONObject metaWithTS = TTUtil.getMetaWithTS(Long.valueOf(jCurrentTimeMillis));
                JSON.putLong(metaWithTS, "latency", jCurrentTimeMillis2 - jCurrentTimeMillis);
                JSON.putBoolean(metaWithTS, "success", z11);
                JSON.putInt(metaWithTS, "size", tTAppEventPersist.getAppEvents().size());
                TikTokBusinessSdk.getAppEventLogger().monitorMetric("file_w", metaWithTS, null);
                return z11;
            } catch (Throwable th4) {
                IOUtils.close(objectOutputStream);
                throw th4;
            }
        }
        long jCurrentTimeMillis22 = System.currentTimeMillis();
        JSONObject metaWithTS2 = TTUtil.getMetaWithTS(Long.valueOf(jCurrentTimeMillis));
        JSON.putLong(metaWithTS2, "latency", jCurrentTimeMillis22 - jCurrentTimeMillis);
        JSON.putBoolean(metaWithTS2, "success", z11);
        JSON.putInt(metaWithTS2, "size", tTAppEventPersist.getAppEvents().size());
        TikTokBusinessSdk.getAppEventLogger().monitorMetric("file_w", metaWithTS2, null);
        return z11;
    }
}
