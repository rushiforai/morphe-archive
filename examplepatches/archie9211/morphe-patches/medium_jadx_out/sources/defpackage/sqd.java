package defpackage;

import android.content.Context;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sqd {
    public final Context a;
    public final q62 b;
    public final jq0 c;
    public final q62 d;
    public final q62 e;

    public sqd(Context context, q7f q7fVar) {
        q62 re8Var;
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        jq0 jq0Var = new jq0(applicationContext, q7fVar, 0);
        Context applicationContext2 = context.getApplicationContext();
        applicationContext2.getClass();
        jq0 jq0Var2 = new jq0(applicationContext2, q7fVar, 1);
        int i = Build.VERSION.SDK_INT;
        if (i < 28) {
            Context applicationContext3 = context.getApplicationContext();
            applicationContext3.getClass();
            String str = pe8.a;
            re8Var = i >= 24 ? new re8(applicationContext3, q7fVar) : new qe8(applicationContext3, q7fVar);
        } else {
            re8Var = null;
        }
        Context applicationContext4 = context.getApplicationContext();
        applicationContext4.getClass();
        jq0 jq0Var3 = new jq0(applicationContext4, q7fVar, 2);
        this.a = context;
        this.b = jq0Var;
        this.c = jq0Var2;
        this.d = re8Var;
        this.e = jq0Var3;
    }
}
