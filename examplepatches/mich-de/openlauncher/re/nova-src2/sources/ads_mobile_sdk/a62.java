package ads_mobile_sdk;

import android.os.AsyncTask;
import java.util.ArrayDeque;
import java.util.concurrent.ThreadPoolExecutor;

/* loaded from: classes2.dex */
public abstract class a62 extends AsyncTask {

    /* renamed from: a, reason: collision with root package name */
    public mg.l f862a;

    /* renamed from: b, reason: collision with root package name */
    public final io.sentry.e3 f863b;

    public a62(io.sentry.e3 e3Var) {
        this.f863b = e3Var;
    }

    @Override // android.os.AsyncTask
    public void onPostExecute(String str) {
        mg.l lVar = this.f862a;
        if (lVar != null) {
            lVar.f76311d = null;
            a62 a62Var = (a62) ((ArrayDeque) lVar.f76310c).poll();
            lVar.f76311d = a62Var;
            if (a62Var != null) {
                a62Var.executeOnExecutor((ThreadPoolExecutor) lVar.f76309b, new Object[0]);
            }
        }
    }
}
