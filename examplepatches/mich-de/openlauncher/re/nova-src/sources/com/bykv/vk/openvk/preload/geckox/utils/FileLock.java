package com.bykv.vk.openvk.preload.geckox.utils;

import android.os.Process;
import b.u4;
import h6.c1;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class FileLock {

    /* renamed from: a, reason: collision with root package name */
    private static final Map<String, Integer> f22155a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    private final int f22156b;

    /* renamed from: c, reason: collision with root package name */
    private final String f22157c;

    static {
        System.loadLibrary("file_lock_pgl");
    }

    private FileLock(String str, int i5) {
        this.f22157c = str;
        this.f22156b = i5;
    }

    public static FileLock a(String str) {
        try {
            int iD = d(str);
            nLockFile(iD);
            return new FileLock(str, iD);
        } catch (Exception e3) {
            StringBuilder sbK = u4.k("lock failed, file:", str, ", pid:");
            sbK.append(Process.myPid());
            sbK.append(" caused by:");
            sbK.append(e3.getMessage());
            throw new RuntimeException(sbK.toString());
        }
    }

    public static FileLock b(String str) {
        try {
            int iD = d(str);
            if (nTryLock(iD)) {
                return new FileLock(str, iD);
            }
            return null;
        } catch (Exception e3) {
            throw new RuntimeException(c1.s(e3, u4.k("try lock failed, file:", str, " caused by:")));
        }
    }

    public static FileLock c(String str) throws Exception {
        try {
            int iD = d(str);
            if (nTryLock(iD)) {
                return new FileLock(str, iD);
            }
            new FileLock(str, iD).b();
            return null;
        } catch (Exception e3) {
            throw new RuntimeException(c1.s(e3, u4.k("try lock failed, file:", str, " caused by:")));
        }
    }

    private static int d(String str) throws Exception {
        Integer numValueOf;
        Map<String, Integer> map = f22155a;
        synchronized (map) {
            try {
                numValueOf = map.get(str);
                if (numValueOf == null) {
                    new File(str).getParentFile().mkdirs();
                    numValueOf = Integer.valueOf(nGetFD(str));
                    map.put(str, numValueOf);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return numValueOf.intValue();
    }

    private static native int nGetFD(String str) throws Exception;

    private static native void nLockFile(int i5) throws Exception;

    private static native void nLockFileSegment(int i5, int i11) throws Exception;

    private static native void nRelease(int i5) throws Exception;

    private static native boolean nTryLock(int i5) throws Exception;

    private static native void nUnlockFile(int i5) throws Exception;

    public static FileLock a(String str, int i5) {
        try {
            int iD = d(str);
            nLockFileSegment(iD, i5);
            return new FileLock(str, iD);
        } catch (Exception e3) {
            throw new RuntimeException(c1.s(e3, u4.k("lock segment failed, file:", str, " caused by:")));
        }
    }

    public final void b() {
        Integer numRemove;
        Map<String, Integer> map = f22155a;
        synchronized (map) {
            numRemove = map.remove(this.f22157c);
        }
        try {
            nRelease(numRemove.intValue());
        } catch (Exception e3) {
            throw new RuntimeException("release lock failed, file:" + this.f22157c + " caused by:" + e3.getMessage());
        }
    }

    public final void a() {
        try {
            nUnlockFile(this.f22156b);
        } catch (Exception unused) {
            throw new RuntimeException("release lock failed，path:" + this.f22157c);
        }
    }
}
