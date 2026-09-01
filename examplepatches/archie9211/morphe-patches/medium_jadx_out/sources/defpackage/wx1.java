package defpackage;

import android.content.Context;
import android.os.Build;
import android.os.StatFs;
import retrofit2.HttpException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wx1 implements i41 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ wx1(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public long a() {
        Context context = (Context) this.b;
        try {
            return Math.max(0L, (Build.VERSION.SDK_INT >= 24 ? new StatFs(context.getDataDir().getAbsolutePath()) : new StatFs(context.getFilesDir().getAbsolutePath())).getAvailableBytes());
        } catch (Exception e) {
            wld.a.e(e, "An error occurred while retrieving the available size", new Object[0]);
            return 0L;
        }
    }

    @Override // defpackage.i41
    public void f(v31 v31Var, zcb zcbVar) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                xx1 xx1Var = (xx1) obj;
                if (!zcbVar.a.q) {
                    xx1Var.completeExceptionally(new HttpException(zcbVar));
                } else {
                    xx1Var.complete(zcbVar.b);
                }
                break;
            default:
                ((xx1) obj).complete(zcbVar);
                break;
        }
    }

    @Override // defpackage.i41
    public void w(v31 v31Var, Throwable th) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((xx1) obj).completeExceptionally(th);
                break;
            default:
                ((xx1) obj).completeExceptionally(th);
                break;
        }
    }
}
