package io.sentry.internal.modules;

import io.sentry.ILogger;
import io.sentry.g3;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes4.dex */
public abstract class d implements a {

    /* renamed from: c, reason: collision with root package name */
    public static final Charset f67338c = Charset.forName("UTF-8");

    /* renamed from: a, reason: collision with root package name */
    public final ILogger f67339a;

    /* renamed from: b, reason: collision with root package name */
    public Map f67340b = null;

    public d(ILogger iLogger) {
        this.f67339a = iLogger;
    }

    @Override // io.sentry.internal.modules.a
    public final Map a() {
        Map map = this.f67340b;
        if (map != null) {
            return map;
        }
        Map mapB = b();
        this.f67340b = mapB;
        return mapB;
    }

    public abstract Map b();

    public final TreeMap c(InputStream inputStream) throws IOException {
        ILogger iLogger = this.f67339a;
        TreeMap treeMap = new TreeMap();
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, f67338c));
            try {
                for (String line = bufferedReader.readLine(); line != null; line = bufferedReader.readLine()) {
                    int iLastIndexOf = line.lastIndexOf(58);
                    treeMap.put(line.substring(0, iLastIndexOf), line.substring(iLastIndexOf + 1));
                }
                iLogger.g(g3.DEBUG, "Extracted %d modules from resources.", Integer.valueOf(treeMap.size()));
                bufferedReader.close();
                return treeMap;
            } catch (Throwable th2) {
                try {
                    bufferedReader.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
                throw th2;
            }
        } catch (IOException e3) {
            iLogger.e(g3.ERROR, "Error extracting modules.", e3);
            return treeMap;
        } catch (RuntimeException e11) {
            iLogger.d(g3.ERROR, e11, "%s file is malformed.", "sentry-external-modules.txt");
            return treeMap;
        }
    }
}
