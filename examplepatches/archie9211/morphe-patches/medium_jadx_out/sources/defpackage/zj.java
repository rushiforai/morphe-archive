package defpackage;

import android.preference.PreferenceManager;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zj {
    public static final ReentrantReadWriteLock a = new ReentrantReadWriteLock();
    public static String b;
    public static volatile boolean c;

    public static void a() {
        if (c) {
            return;
        }
        ReentrantReadWriteLock reentrantReadWriteLock = a;
        reentrantReadWriteLock.writeLock().lock();
        try {
            if (!c) {
                b = PreferenceManager.getDefaultSharedPreferences(f94.a()).getString("com.facebook.appevents.AnalyticsUserIDStore.userID", null);
                c = true;
            }
            reentrantReadWriteLock.writeLock().unlock();
        } catch (Throwable th) {
            a.writeLock().unlock();
            throw th;
        }
    }
}
