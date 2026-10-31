package p90;

import android.os.Trace;
import b.c0;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes5.dex */
public abstract class a implements AutoCloseable {
    public static void a(String str) {
        if (str.length() > 127) {
            str = c0.E(str.substring(0, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), "...");
        }
        Trace.beginSection(str);
    }
}
