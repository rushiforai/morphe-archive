package defpackage;

import android.os.AsyncTask;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import com.pairip.VMRunner;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class gf5 extends AsyncTask {
    public final hf5 a;
    public Exception b;

    public gf5(hf5 hf5Var) {
        this.a = hf5Var;
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        return VMRunner.invoke("57rdZjI0EQpj5pfl", new Object[]{this, objArr});
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v3, types: [f94] */
    @Override // android.os.AsyncTask
    public final void onPostExecute(Object obj) {
        List list;
        Set set = ec2.a;
        if (set.contains(this)) {
            return;
        }
        try {
            list = (List) obj;
        } catch (Throwable th) {
            ec2.a(this, th);
        }
        if (set.contains(this)) {
            return;
        }
        try {
            list.getClass();
            super.onPostExecute(list);
            Exception exc = this.b;
            if (exc != null) {
                String.format("onPostExecute: exception encountered during request: %s", Arrays.copyOf(new Object[]{exc.getMessage()}, 1));
                this = f94.a;
                return;
            }
            return;
        } catch (Throwable th2) {
            ec2.a(this, th2);
            return;
        }
        ec2.a(this, th);
    }

    @Override // android.os.AsyncTask
    public final void onPreExecute() {
        hf5 hf5Var = this.a;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            super.onPreExecute();
            f94 f94Var = f94.a;
            if (hf5Var.a == null) {
                hf5Var.a = Thread.currentThread() instanceof HandlerThread ? new Handler() : new Handler(Looper.getMainLooper());
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final String toString() {
        return "{RequestAsyncTask:  connection: null, requests: " + this.a + "}";
    }
}
