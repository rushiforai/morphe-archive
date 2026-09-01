package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jdd extends p4d implements c55 {
    public /* synthetic */ String b;
    public /* synthetic */ boolean c;

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        boolean zBooleanValue = ((Boolean) obj2).booleanValue();
        jdd jddVar = new jdd(3, (n92) obj3);
        jddVar.b = (String) obj;
        jddVar.c = zBooleanValue;
        return jddVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        String str = this.b;
        boolean z = this.c;
        br7.v(obj);
        return new f09(str, Boolean.valueOf(z));
    }
}
