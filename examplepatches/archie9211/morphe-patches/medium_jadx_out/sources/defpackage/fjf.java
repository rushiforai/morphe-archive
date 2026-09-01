package defpackage;

import android.os.DeadObjectException;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.Status;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fjf extends njf {
    public final nkf b;

    public fjf(nkf nkfVar) {
        super(1);
        this.b = nkfVar;
    }

    @Override // defpackage.njf
    public final void a(Status status) {
        try {
            this.b.c(status);
        } catch (IllegalStateException e) {
            Log.w("ApiCallRunner", "Exception reporting failure", e);
        }
    }

    @Override // defpackage.njf
    public final void b(Exception exc) {
        String simpleName = exc.getClass().getSimpleName();
        String localizedMessage = exc.getLocalizedMessage();
        try {
            this.b.c(new Status(10, y30.s(new StringBuilder(simpleName.length() + 2 + String.valueOf(localizedMessage).length()), simpleName, ": ", localizedMessage), null, null));
        } catch (IllegalStateException e) {
            Log.w("ApiCallRunner", "Exception reporting failure", e);
        }
    }

    @Override // defpackage.njf
    public final void c(pif pifVar, boolean z) {
        Boolean boolValueOf = Boolean.valueOf(z);
        Map map = pifVar.a;
        nkf nkfVar = this.b;
        map.put(nkfVar, boolValueOf);
        nkfVar.addStatusListener(new vjf(pifVar, nkfVar));
    }

    @Override // defpackage.njf
    public final void d(uif uifVar) throws DeadObjectException {
        try {
            nkf nkfVar = this.b;
            try {
                try {
                    nkfVar.b(uifVar.f);
                } catch (DeadObjectException e) {
                    nkfVar.c(new Status(8, e.getLocalizedMessage(), null, null));
                    throw e;
                }
            } catch (RemoteException e2) {
                nkfVar.c(new Status(8, e2.getLocalizedMessage(), null, null));
            }
        } catch (RuntimeException e3) {
            b(e3);
        }
    }
}
