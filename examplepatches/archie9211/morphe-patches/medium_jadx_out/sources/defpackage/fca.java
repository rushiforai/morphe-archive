package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fca extends p4d implements e55 {
    public /* synthetic */ Object b;
    public /* synthetic */ Integer c;
    public /* synthetic */ rba d;
    public /* synthetic */ String e;

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object obj2 = this.b;
        Integer num = this.c;
        rba rbaVar = this.d;
        String str = this.e;
        br7.v(obj);
        return new uba(obj2, num, rbaVar, str);
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        Object obj6 = ((bjb) obj).a;
        fca fcaVar = new fca(5, (n92) obj5);
        fcaVar.b = obj6;
        fcaVar.c = (Integer) obj2;
        fcaVar.d = (rba) obj3;
        fcaVar.e = (String) obj4;
        return fcaVar.invokeSuspend(c1e.a);
    }
}
