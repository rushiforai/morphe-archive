package defpackage;

import android.content.Context;
import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class r6 implements Runnable {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ long b;
    public final /* synthetic */ String c;
    public final /* synthetic */ Object d;

    public /* synthetic */ r6(long j, String str, Context context) {
        this.b = j;
        this.c = str;
        this.d = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        e8 e8Var;
        switch (this.a) {
            case 0:
                long j = this.b;
                String str = this.c;
                Context context = (Context) this.d;
                e8 e8Var2 = u6.g;
                Long l = e8Var2 != null ? (Long) e8Var2.c : null;
                if (u6.g == null) {
                    u6.g = new e8(Long.valueOf(j), null);
                    String str2 = u6.i;
                    context.getClass();
                    h1c.Z0(context, str, str2);
                } else if (l != null) {
                    long jLongValue = j - l.longValue();
                    String str3 = u6.a;
                    if (jLongValue > (af4.b(f94.b()) == null ? 60 : r3.b) * PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE) {
                        h1c.b1(str, u6.g, u6.i);
                        String str4 = u6.i;
                        context.getClass();
                        h1c.Z0(context, str, str4);
                        u6.g = new e8(Long.valueOf(j), null);
                    } else if (jLongValue > 1000 && (e8Var = u6.g) != null) {
                        e8Var.a++;
                    }
                }
                e8 e8Var3 = u6.g;
                if (e8Var3 != null) {
                    e8Var3.c = Long.valueOf(j);
                }
                e8 e8Var4 = u6.g;
                if (e8Var4 != null) {
                    e8Var4.v();
                }
                break;
            default:
                nc2 nc2Var = (nc2) this.d;
                long j2 = this.b;
                String str5 = this.c;
                jc2 jc2Var = nc2Var.g;
                td2 td2Var = jc2Var.n;
                if (td2Var == null || !td2Var.e.get()) {
                    ((pg4) jc2Var.i.c).n(j2, str5);
                }
                break;
        }
    }

    public /* synthetic */ r6(nc2 nc2Var, long j, String str) {
        this.d = nc2Var;
        this.b = j;
        this.c = str;
    }
}
