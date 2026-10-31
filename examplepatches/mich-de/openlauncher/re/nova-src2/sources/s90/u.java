package s90;

import java.util.ArrayList;
import java.util.concurrent.Executor;
import org.chromium.net.ExperimentalCronetEngine;
import org.chromium.net.ExperimentalUrlRequest;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UrlRequest;

/* loaded from: classes5.dex */
public abstract class u extends ExperimentalCronetEngine {
    public abstract ExperimentalUrlRequest a(String str, UrlRequest.Callback callback, Executor executor, int i5, ArrayList arrayList, boolean z11, boolean z12, boolean z13, int i11, boolean z14, int i12, RequestFinishedInfo.Listener listener, long j11, String str2, ArrayList arrayList2, UploadDataProvider uploadDataProvider, Executor executor2);

    @Override // org.chromium.net.ExperimentalCronetEngine, org.chromium.net.CronetEngine
    public final ExperimentalUrlRequest.Builder newUrlRequestBuilder(String str, UrlRequest.Callback callback, Executor executor) {
        return new e1(str, callback, executor, this);
    }
}
