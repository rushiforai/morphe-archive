package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class qpa implements d7 {
    @Override // defpackage.d7
    public final void onActivityResult(Object obj) {
        Boolean bool = (Boolean) obj;
        bool.getClass();
        if (bool.booleanValue()) {
            wld.a.a("User granted permission for push notifications.", new Object[0]);
        } else {
            wld.a.m("User hasn't granted permission for push notifications.", new Object[0]);
        }
    }
}
