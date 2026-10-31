package com.bykv.vk.openvk.preload.geckox.f;

import com.bykv.vk.openvk.preload.geckox.utils.FileLock;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    private static final Map<String, Lock> f22096a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    private FileLock f22097b;

    /* renamed from: c, reason: collision with root package name */
    private String f22098c;

    private a(String str, FileLock fileLock) {
        this.f22098c = str;
        this.f22097b = fileLock;
    }

    public static a a(String str) throws Exception {
        Map<String, Lock> map = f22096a;
        synchronized (map) {
            try {
                Lock reentrantLock = map.get(str);
                if (reentrantLock == null) {
                    reentrantLock = new ReentrantLock();
                    map.put(str, reentrantLock);
                }
                if (!reentrantLock.tryLock()) {
                    return null;
                }
                try {
                    FileLock fileLockC = FileLock.c(str);
                    if (fileLockC == null) {
                        reentrantLock.unlock();
                        return null;
                    }
                    return new a(str, fileLockC);
                } catch (Exception e3) {
                    reentrantLock.lock();
                    com.bykv.vk.openvk.preload.geckox.utils.a.a(new RuntimeException(e3));
                    return null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void a() {
        Map<String, Lock> map = f22096a;
        synchronized (map) {
            try {
                try {
                    this.f22097b.a();
                    this.f22097b.b();
                    map.get(this.f22098c).unlock();
                } catch (Throwable th2) {
                    f22096a.get(this.f22098c).unlock();
                    throw th2;
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }
}
