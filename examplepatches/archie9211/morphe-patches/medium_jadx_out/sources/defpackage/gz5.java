package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gz5 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ vz5 b;
    public final /* synthetic */ Context c;

    public /* synthetic */ gz5(vz5 vz5Var, Context context, int i) {
        this.a = i;
        this.b = vz5Var;
        this.c = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        Context context = this.c;
        vz5 vz5Var = this.b;
        switch (i) {
            case 0:
                if (!ec2.a.contains(hz5.class)) {
                    try {
                        hz5 hz5Var = hz5.a;
                        String packageName = context.getPackageName();
                        packageName.getClass();
                        hz5Var.a(vz5Var, packageName);
                    } catch (Throwable th) {
                        ec2.a(hz5.class, th);
                        return;
                    }
                    break;
                }
                break;
            default:
                if (!ec2.a.contains(hz5.class)) {
                    try {
                        hz5 hz5Var2 = hz5.a;
                        String packageName2 = context.getPackageName();
                        packageName2.getClass();
                        hz5Var2.a(vz5Var, packageName2);
                    } catch (Throwable th2) {
                        ec2.a(hz5.class, th2);
                    }
                    break;
                }
                break;
        }
    }
}
