package io.sentry.internal.modules;

import io.sentry.ILogger;
import io.sentry.g3;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes4.dex */
public final class f extends d {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f67342d = 0;

    /* renamed from: e, reason: collision with root package name */
    public final Object f67343e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(ILogger iLogger) {
        super(iLogger);
        ClassLoader classLoader = f.class.getClassLoader();
        this.f67343e = classLoader == null ? ClassLoader.getSystemClassLoader() : classLoader;
    }

    @Override // io.sentry.internal.modules.d
    public final Map b() throws IOException {
        switch (this.f67342d) {
            case 0:
                ILogger iLogger = this.f67339a;
                TreeMap treeMap = new TreeMap();
                try {
                    InputStream resourceAsStream = ((ClassLoader) this.f67343e).getResourceAsStream("sentry-external-modules.txt");
                    try {
                        if (resourceAsStream == null) {
                            iLogger.g(g3.INFO, "%s file was not found.", "sentry-external-modules.txt");
                            if (resourceAsStream != null) {
                                resourceAsStream.close();
                            }
                        } else {
                            TreeMap treeMapC = c(resourceAsStream);
                            resourceAsStream.close();
                            treeMap = treeMapC;
                        }
                    } finally {
                    }
                } catch (IOException e3) {
                    iLogger.e(g3.INFO, "Access to resources failed.", e3);
                } catch (SecurityException e11) {
                    iLogger.e(g3.INFO, "Access to resources denied.", e11);
                }
                return treeMap;
            default:
                TreeMap treeMap2 = new TreeMap();
                Iterator it = ((List) this.f67343e).iterator();
                while (it.hasNext()) {
                    Map mapA = ((a) it.next()).a();
                    if (mapA != null) {
                        treeMap2.putAll(mapA);
                    }
                }
                return treeMap2;
        }
    }

    public f(List list, ILogger iLogger) {
        super(iLogger);
        this.f67343e = list;
    }
}
