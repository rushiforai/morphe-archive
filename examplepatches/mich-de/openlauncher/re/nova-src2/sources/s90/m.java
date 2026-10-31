package s90;

import android.util.Log;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.RejectedExecutionException;
import org.chromium.net.CronetException;
import org.chromium.net.RequestFinishedInfo;

/* loaded from: classes5.dex */
public final class m extends d1 {

    /* renamed from: g, reason: collision with root package name */
    public static final String f86977g = d1.class.getSimpleName();

    /* renamed from: h, reason: collision with root package name */
    public static boolean f86978h;

    public static void a(h hVar, String str, Collection collection, h1 h1Var, int i5, s sVar, CronetException cronetException) {
        m mVar = new m(str, collection, new f0(), i5, sVar, cronetException);
        hVar.getClass();
        ArrayList arrayList = new ArrayList();
        synchronized (hVar.f86958b) {
            arrayList.addAll(hVar.f86958b.values());
        }
        if (h1Var != null) {
            arrayList.add(h1Var);
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            h1 h1Var2 = (h1) it.next();
            try {
                h1Var2.f86959a.getExecutor().execute(new kz.c(27, h1Var2, mVar));
            } catch (RejectedExecutionException e3) {
                Log.e("HttpEngineWrapper", "Exception posting task to executor", e3);
            }
        }
    }

    @Override // org.chromium.net.RequestFinishedInfo
    public final RequestFinishedInfo.Metrics getMetrics() {
        if (!f86978h) {
            Log.i(f86977g, "RequestFinishedInfo.getMetrics() is unsupported when HttpEngineNativeProvider is used. The Metrics object will return null values.");
            f86978h = true;
        }
        return this.f86901c;
    }
}
