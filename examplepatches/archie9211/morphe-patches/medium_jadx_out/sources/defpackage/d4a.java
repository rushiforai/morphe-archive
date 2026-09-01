package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class d4a implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ long b;
    public final /* synthetic */ long c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ d4a(tla tlaVar, long j, long j2, v08 v08Var, r28 r28Var, int i) {
        this.f = tlaVar;
        this.b = j;
        this.c = j2;
        this.g = v08Var;
        this.d = r28Var;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        Object obj3 = this.g;
        Object obj4 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                kk7.k((tla) obj4, this.b, this.c, (v08) obj3, this.d, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                en7.a((String) obj4, (String) obj3, this.b, this.c, this.d, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ d4a(String str, String str2, long j, long j2, r28 r28Var, int i) {
        this.f = str;
        this.g = str2;
        this.b = j;
        this.c = j2;
        this.d = r28Var;
        this.e = i;
    }
}
