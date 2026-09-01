package defpackage;

import com.medium.android.graphql.GetSubscriberListQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pxc extends p4d implements c55 {
    public /* synthetic */ GetSubscriberListQuery.Subscriber b;

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        ((Number) obj).intValue();
        pxc pxcVar = new pxc(3, (n92) obj3);
        pxcVar.b = (GetSubscriberListQuery.Subscriber) obj2;
        return pxcVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        GetSubscriberListQuery.Subscriber subscriber = this.b;
        br7.v(obj);
        String id = subscriber.getId();
        String name = subscriber.getName();
        if (name == null) {
            return null;
        }
        long subscribedAt = subscriber.getSubscribedAt();
        String imageId = subscriber.getImageId();
        return new ixc(subscribedAt, id, name, imageId != null ? imageId : null);
    }
}
