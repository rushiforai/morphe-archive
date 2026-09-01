package defpackage;

import android.os.DeadObjectException;
import android.os.RemoteException;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.ResolvableApiException;
import com.google.android.gms.common.api.Status;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kjf extends yif {
    public final wv0 b;
    public final wfd c;
    public final y3b d;

    public kjf(int i, wv0 wv0Var, wfd wfdVar, y3b y3bVar) {
        super(i);
        this.c = wfdVar;
        this.b = wv0Var;
        this.d = y3bVar;
        if (i == 2 && wv0Var.c) {
            ay0.e("Best-effort write calls cannot pass methods that should auto-resolve missing features.");
            throw null;
        }
    }

    @Override // defpackage.njf
    public final void a(Status status) {
        this.d.getClass();
        this.c.c(status.c != null ? new ResolvableApiException(status) : new ApiException(status));
    }

    @Override // defpackage.njf
    public final void b(Exception exc) {
        this.c.c(exc);
    }

    @Override // defpackage.njf
    public final void c(pif pifVar, boolean z) {
        Boolean boolValueOf = Boolean.valueOf(z);
        Map map = pifVar.b;
        wfd wfdVar = this.c;
        map.put(wfdVar, boolValueOf);
        wfdVar.a.a(new zjf(pifVar, wfdVar));
    }

    @Override // defpackage.njf
    public final void d(uif uifVar) throws DeadObjectException {
        wfd wfdVar = this.c;
        try {
            wv0 wv0Var = this.b;
            ((s3b) ((wv0) wv0Var.e).d).accept(uifVar.f, wfdVar);
        } catch (DeadObjectException e) {
            throw e;
        } catch (RemoteException e2) {
            a(njf.e(e2));
        } catch (RuntimeException e3) {
            wfdVar.c(e3);
        }
    }

    @Override // defpackage.yif
    public final da4[] f(uif uifVar) {
        return (da4[]) this.b.d;
    }

    @Override // defpackage.yif
    public final boolean g(uif uifVar) {
        return this.b.c;
    }

    @Override // defpackage.yif
    public final int h(uif uifVar) {
        return this.b.b;
    }
}
