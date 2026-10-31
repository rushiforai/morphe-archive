package com.vungle.ads.internal.persistence;

import com.vungle.ads.internal.executor.j;
import com.vungle.ads.internal.util.PathProvider;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {
    public final synchronized FilePreferences a(j ioExecutor, PathProvider pathProvider, String filename) {
        Object filePreferences;
        Object objPutIfAbsent;
        try {
            Intrinsics.g(ioExecutor, "ioExecutor");
            Intrinsics.g(pathProvider, "pathProvider");
            Intrinsics.g(filename, "filename");
            ConcurrentHashMap concurrentHashMap = FilePreferences.f47337e;
            filePreferences = concurrentHashMap.get(filename);
            if (filePreferences == null && (objPutIfAbsent = concurrentHashMap.putIfAbsent(filename, (filePreferences = new FilePreferences(ioExecutor, pathProvider, filename, 0)))) != null) {
                filePreferences = objPutIfAbsent;
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return (FilePreferences) filePreferences;
    }
}
