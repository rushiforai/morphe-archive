package com.bykv.vk.openvk.preload.geckox.f;

import com.bykv.vk.openvk.preload.geckox.utils.FileLock;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    private static final Map<String, Lock> f22099a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    private static ReentrantLock f22100b = new ReentrantLock();

    /* renamed from: c, reason: collision with root package name */
    private String f22101c;

    /* renamed from: d, reason: collision with root package name */
    private FileLock f22102d;

    private b(String str, FileLock fileLock) {
        this.f22101c = str;
        this.f22102d = fileLock;
    }

    public static b a(String str) throws Exception {
        f22100b.lock();
        try {
            FileLock fileLockA = FileLock.a(str);
            Map<String, Lock> map = f22099a;
            Lock reentrantLock = map.get(str);
            if (reentrantLock == null) {
                reentrantLock = new ReentrantLock();
                map.put(str, reentrantLock);
            }
            reentrantLock.lock();
            return new b(str, fileLockA);
        } catch (Exception e3) {
            f22100b.unlock();
            throw e3;
        }
    }

    public final void a() {
        try {
            this.f22102d.a();
            this.f22102d.b();
            Lock lock = f22099a.get(this.f22101c);
            if (lock != null) {
                lock.unlock();
            }
        } finally {
            f22100b.unlock();
        }
    }
}
