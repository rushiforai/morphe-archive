package defpackage;

import android.os.AsyncTask;
import com.pairip.VMRunner;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yb3 extends AsyncTask {
    public final h30 a;
    public final WeakReference b;
    public final int c;
    public final WeakReference d;
    public Exception e = null;

    public yb3(u80 u80Var, h30 h30Var, int i, ug9 ug9Var) {
        this.a = h30Var;
        this.b = new WeakReference(u80Var);
        this.c = i;
        if (ug9Var != null) {
            this.d = new WeakReference(ug9Var);
        }
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        return VMRunner.invoke("gEdnwYsiLPwHO9Tu", new Object[]{this, objArr});
    }

    @Override // android.os.AsyncTask
    public final void onPostExecute(Object obj) {
        ac3 ac3Var = (ac3) obj;
        Exception exc = this.e;
        if (exc != null) {
            ik4.j(exc);
            return;
        }
        u80 u80Var = (u80) this.b.get();
        if (ac3Var == null || u80Var == null) {
            return;
        }
        rz2 rz2Var = u80Var.a;
        if (this.c == u80Var.b) {
            ((gy6) rz2Var.b).c(u80Var.c);
            ac3Var.a(rz2Var);
            WeakReference weakReference = this.d;
            if (weakReference == null || weakReference.get() == null) {
                return;
            }
            ((ug9) weakReference.get()).a();
        }
    }
}
