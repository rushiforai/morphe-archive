package defpackage;

import android.os.DeadObjectException;
import android.os.RemoteException;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ljf extends yif {
    public final wfd b;

    public ljf(wfd wfdVar) {
        super(4);
        this.b = wfdVar;
    }

    @Override // defpackage.njf
    public final void a(Status status) {
        this.b.c(new ApiException(status));
    }

    @Override // defpackage.njf
    public final void b(Exception exc) {
        this.b.c(exc);
    }

    @Override // defpackage.njf
    public final void d(uif uifVar) throws DeadObjectException {
        try {
            i(uifVar);
        } catch (DeadObjectException e) {
            a(njf.e(e));
            throw e;
        } catch (RemoteException e2) {
            a(njf.e(e2));
        } catch (RuntimeException e3) {
            this.b.c(e3);
        }
    }

    @Override // defpackage.yif
    public final da4[] f(uif uifVar) {
        if (uifVar.j.get(null) == null) {
            return null;
        }
        rd6.m();
        return null;
    }

    @Override // defpackage.yif
    public final boolean g(uif uifVar) {
        if (uifVar.j.get(null) == null) {
            return false;
        }
        rd6.m();
        return false;
    }

    @Override // defpackage.yif
    public final int h(uif uifVar) {
        if (uifVar.j.get(null) == null) {
            return -1;
        }
        rd6.m();
        return 0;
    }

    public final void i(uif uifVar) {
        if (uifVar.j.remove(null) == null) {
            this.b.d(Boolean.FALSE);
        } else {
            rd6.m();
        }
    }

    @Override // defpackage.njf
    public final /* bridge */ /* synthetic */ void c(pif pifVar, boolean z) {
    }
}
