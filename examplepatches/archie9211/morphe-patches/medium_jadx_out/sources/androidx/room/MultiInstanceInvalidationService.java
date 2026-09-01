package androidx.room;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import defpackage.c58;
import defpackage.d58;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class MultiInstanceInvalidationService extends Service {
    public int a;
    public final LinkedHashMap b = new LinkedHashMap();
    public final d58 c = new d58(this);
    public final c58 d = new c58(this);

    @Override // android.app.Service
    public final IBinder onBind(Intent intent) {
        intent.getClass();
        return this.d;
    }
}
