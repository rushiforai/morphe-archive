package ads_mobile_sdk;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.view.View;
import b.x3;
import com.google.common.util.concurrent.ListenableFuture;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ExecutionException;

/* loaded from: classes.dex */
public final class q extends t93 {

    /* renamed from: f, reason: collision with root package name */
    public final Context f8433f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f8434g;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f8435l = 0;

    public q(x3 x3Var, rp1 rp1Var, View view, Activity activity, vi3 vi3Var) {
        super("YogFlZs1RNid8jXejn6sh6rwte9QKE4YgqGrhuNwxPzA3TxHPCNCCaIcAYI8Ditv", "75AF8KO808mso+ucw9eYaxGBzfCZKKkZyn5a9bWi1r0=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_ACTIVITY_SIGNALS_TASK));
        this.f8434g = view;
        this.f8433f = activity;
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x0051 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // ads_mobile_sdk.t93
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Method method, x3 x3Var) {
        pd pdVar;
        Long lValueOf;
        switch (this.f8435l) {
            case 0:
                Object[] objArr = (Object[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (View) this.f8434g, (Activity) this.f8433f);
                objArr.getClass();
                synchronized (x3Var) {
                    x3Var.g(((Long) objArr[0]).longValue());
                    x3Var.i(((Long) objArr[1]).longValue());
                    String str = (String) objArr[2];
                    x3Var.b();
                    ((pd) x3Var.f1095b).b(str);
                }
                return;
            default:
                Long l9 = -1L;
                try {
                } catch (InterruptedException unused) {
                    Thread.currentThread().interrupt();
                } catch (ExecutionException unused2) {
                }
                if (Build.VERSION.SDK_INT < 30) {
                    ListenableFuture listenableFuture = (ListenableFuture) ((Map) this.f8434g).get("gs");
                    if (listenableFuture != null && listenableFuture.isDone() && (pdVar = (pd) listenableFuture.get()) != null) {
                        lValueOf = Long.valueOf(pdVar.s());
                    }
                    synchronized (x3Var) {
                        x3Var.w(l9.longValue());
                    }
                    return;
                }
                lValueOf = (Long) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, this.f8433f);
                lValueOf.getClass();
                l9 = lValueOf;
                synchronized (x3Var) {
                }
                break;
        }
    }

    public q(x3 x3Var, rp1 rp1Var, Map map, Context context, vi3 vi3Var) {
        super("10DSDhAVErRfZUViHNZ7/Yd2azWfbszOmpJOzD8snScv3SJ7oCvr/zOn6iR/uXQN", "uNeEsVXjzuh0qdN4lD4MggDB7L9Y6WRajWnysv/LH4I=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_RECENT_FOREGROUND_TIME_SIGNALS_TASK));
        this.f8433f = context;
        this.f8434g = map;
    }
}
