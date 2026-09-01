package defpackage;

import android.content.Context;
import androidx.work.WorkerParameters;
import com.medium.android.data.offline.DownloadCatalogWorker;
import com.medium.android.domain.push.workers.LinkPushNotificationWorker;
import com.medium.android.donkey.push.gcm.MediumPushNotificationWorker;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class im5 extends k8f {
    public final Map a;

    public im5(Map map) {
        this.a = map;
    }

    @Override // defpackage.k8f
    public final k37 a(Context context, String str, WorkerParameters workerParameters) {
        g8a g8aVar = (g8a) this.a.get(str);
        if (g8aVar == null) {
            return null;
        }
        io2 io2Var = (io2) g8aVar.get();
        switch (io2Var.a) {
            case 0:
                ko2 ko2Var = io2Var.b.a;
                return new DownloadCatalogWorker(context, workerParameters, ko2Var.n(), (zk2) ko2Var.r.get(), new mp(ko2Var.a.a, (byte) 0));
            case 1:
                ko2 ko2Var2 = io2Var.b.a;
                return new LinkPushNotificationWorker(context, workerParameters, new l07((zpa) ko2Var2.z.get(), (zk2) ko2Var2.r.get()));
            default:
                ko2 ko2Var3 = io2Var.b.a;
                return new MediumPushNotificationWorker(context, workerParameters, ko2Var3.q(), new yx2(ko2Var3.x()), true);
        }
    }
}
