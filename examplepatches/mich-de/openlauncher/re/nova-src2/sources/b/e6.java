package b;

import ads_mobile_sdk.bn0;
import ads_mobile_sdk.ef1;
import ads_mobile_sdk.hs;
import ads_mobile_sdk.x22;
import ads_mobile_sdk.y11;
import java.net.URL;
import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.time.Duration;

/* loaded from: classes2.dex */
public interface e6 {
    static /* synthetic */ Object a(e6 e6Var, y11 y11Var, Duration duration, ContinuationImpl continuationImpl, int i5) {
        if ((i5 & 2) != 0) {
            duration = null;
        }
        return e6Var.a(y11Var, duration, null, (i5 & 8) == 0, (i5 & 16) != 0, continuationImpl);
    }

    static /* synthetic */ Object b(e6 e6Var, URL url, Map map, ContinuationImpl continuationImpl, int i5) {
        if ((i5 & 4) != 0) {
            map = null;
        }
        return e6Var.a(url, map, (i5 & 16) != 0, continuationImpl);
    }

    Object a(int i5, long j11, ads_mobile_sdk.l5 l5Var);

    Object a(ef1 ef1Var);

    Object a(y11 y11Var, Duration duration, x22 x22Var);

    Object a(y11 y11Var, Duration duration, Map map, boolean z11, boolean z12, ContinuationImpl continuationImpl);

    Object a(String str, Map map, Continuation continuation);

    Object a(URL url, bn0 bn0Var, Continuation continuation);

    Object a(URL url, Map map, boolean z11, ContinuationImpl continuationImpl);

    Object a(URL url, Continuation continuation);

    void a(hs hsVar);

    void a(xc xcVar);
}
