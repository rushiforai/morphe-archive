package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xa8 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;

    public /* synthetic */ xa8(String str, int i) {
        this.a = i;
        this.b = str;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        String str = this.b;
        switch (i) {
            case 0:
                return new qa8(str, null, null);
            default:
                return str.length() > 280 ? muc.x0(280, str).concat("...") : str;
        }
    }
}
