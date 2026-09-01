package defpackage;

import android.content.Context;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mp implements rq7, xw3 {
    public final Context a;

    public mp(Context context, int i) {
        switch (i) {
            case 2:
                this.a = context.getApplicationContext();
                break;
            default:
                this.a = context.getApplicationContext();
                break;
        }
    }

    @Override // defpackage.xw3
    public void a(ht2 ht2Var) {
        g32 g32Var = new g32("EmojiCompatInitializer");
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, 1, 15L, TimeUnit.SECONDS, new LinkedBlockingDeque(), g32Var);
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        threadPoolExecutor.execute(new ss(this, ht2Var, threadPoolExecutor, 7));
    }

    public /* synthetic */ mp(Context context, byte b) {
        this.a = context;
    }
}
