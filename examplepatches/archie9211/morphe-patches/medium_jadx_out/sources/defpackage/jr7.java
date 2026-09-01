package defpackage;

import com.medium.android.core.push.MediumPushNotification;
import com.medium.android.donkey.push.gcm.MediumPushNotificationWorker;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jr7 extends p92 {
    public MediumPushNotification b;
    public /* synthetic */ Object c;
    public final /* synthetic */ MediumPushNotificationWorker d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jr7(MediumPushNotificationWorker mediumPushNotificationWorker, p92 p92Var) {
        super(p92Var);
        this.d = mediumPushNotificationWorker;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.b(null, this);
    }
}
