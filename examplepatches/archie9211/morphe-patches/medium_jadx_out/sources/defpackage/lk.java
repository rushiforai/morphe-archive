package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lk implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ol b;
    public final /* synthetic */ oya c;

    public /* synthetic */ lk(ol olVar, oya oyaVar, int i) {
        this.a = i;
        this.b = olVar;
        this.c = oyaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        oya oyaVar = this.c;
        ol olVar = this.b;
        float fFloatValue = ((Float) obj).floatValue();
        float fFloatValue2 = ((Float) obj2).floatValue();
        switch (i) {
            case 0:
                tl tlVar = olVar.a;
                ((g49) tlVar.k).h(fFloatValue);
                ((g49) tlVar.l).h(fFloatValue2);
                oyaVar.a = fFloatValue;
                break;
            default:
                tl tlVar2 = olVar.a;
                ((g49) tlVar2.k).h(fFloatValue);
                ((g49) tlVar2.l).h(fFloatValue2);
                oyaVar.a = fFloatValue;
                break;
        }
        return c1eVar;
    }
}
