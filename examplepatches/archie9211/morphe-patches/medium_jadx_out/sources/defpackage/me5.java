package defpackage;

import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class me5 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ i40 c;

    public /* synthetic */ me5(String str, i40 i40Var, int i) {
        this.a = i;
        this.b = str;
        this.c = i40Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        i40 i40Var = this.c;
        String str = this.b;
        switch (i) {
            case 0:
                if (!ec2.a.contains(oe5.class)) {
                    try {
                        oe5.a.c(str, i40Var);
                    } catch (Throwable th) {
                        ec2.a(oe5.class, th);
                        return;
                    }
                    break;
                }
                break;
            default:
                Set set = ec2.a;
                if (!set.contains(ar8.class)) {
                    try {
                        List listQ = d46.Q(i40Var);
                        y3b y3bVar = y3b.b;
                        if (!set.contains(y3b.class)) {
                            try {
                                y3b.b.x(v3b.CUSTOM_APP_EVENTS, str, listQ);
                            } catch (Throwable th2) {
                                ec2.a(y3b.class, th2);
                            }
                        }
                    } catch (Throwable th3) {
                        ec2.a(ar8.class, th3);
                        return;
                    }
                    break;
                }
                break;
        }
    }
}
