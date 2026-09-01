package defpackage;

import com.medium.android.core.push.MediumPushNotification;
import com.medium.android.donkey.push.gcm.MediumPushNotificationWorker;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hr7 extends p92 {
    public MediumPushNotification b;
    public ti8 c;
    public /* synthetic */ Object d;
    public final /* synthetic */ MediumPushNotificationWorker e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hr7(MediumPushNotificationWorker mediumPushNotificationWorker, p92 p92Var) {
        super(p92Var);
        this.e = mediumPushNotificationWorker;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.a(null, this);
    }
}
