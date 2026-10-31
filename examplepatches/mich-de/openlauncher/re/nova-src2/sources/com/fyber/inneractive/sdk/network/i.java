package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.util.IAlog;
import java.io.BufferedInputStream;
import java.io.FilterInputStream;
import java.io.InputStream;
import java.util.Map;
import java.util.zip.GZIPInputStream;

/* loaded from: classes.dex */
public abstract class i {
    public static FilterInputStream a(InputStream inputStream, boolean z11) {
        try {
            if (z11) {
                IAlog.a("HttpExecutorBase: getInputStream found gzip encoding", new Object[0]);
                return new GZIPInputStream(inputStream);
            }
            IAlog.a("HttpExecutorBase: getInputStream no gzip encoding", new Object[0]);
            return new BufferedInputStream(inputStream);
        } catch (Exception unused) {
            return null;
        }
    }

    public static l a(FilterInputStream filterInputStream, int i5, String str, Map map, String str2) throws b, q1 {
        try {
            l lVar = new l(filterInputStream, i5, str, map, str2);
            if (lVar.f28733a / 100 != 5) {
                return lVar;
            }
            throw new b(String.format("server returned error %d", Integer.valueOf(lVar.f28733a)));
        } catch (b e3) {
            IAlog.a("failed executing network request msg: %s", e3.getMessage());
            throw new b(e3);
        } catch (Exception e11) {
            IAlog.a("failed reading network response msg: %s", e11.getMessage());
            throw new q1(e11);
        }
    }
}
