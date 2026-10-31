package com.tiktok.appevents;

import com.tiktok.TikTokBusinessSdk;
import com.tiktok.util.TTUtil;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes4.dex */
class TTAppEventsQueue {
    private static final String TAG = "TTAppEventsQueue";
    private static volatile List<TTAppEvent> memory = new CopyOnWriteArrayList();

    private TTAppEventsQueue() {
    }

    public static synchronized void addEvent(TTAppEvent tTAppEvent) {
        TTUtil.checkThread(TAG);
        memory.add(tTAppEvent);
        notifyChange();
    }

    public static synchronized void clearAll() {
        TTUtil.checkThread(TAG);
        memory = new CopyOnWriteArrayList();
        notifyChange();
    }

    public static synchronized List<TTAppEvent> exportAllEvents() {
        List<TTAppEvent> list;
        list = memory;
        memory = new CopyOnWriteArrayList();
        notifyChange();
        return list;
    }

    private static void notifyChange() {
        TikTokBusinessSdk.MemoryListener memoryListener = TikTokBusinessSdk.memoryListener;
        if (memoryListener != null) {
            memoryListener.onMemoryChange(memory.size());
        }
        if (TikTokBusinessSdk.nextTimeFlushListener != null) {
            TikTokBusinessSdk.nextTimeFlushListener.thresholdLeft(100, Math.max(100 - size(), 0));
        }
    }

    public static synchronized int size() {
        return memory.size();
    }
}
