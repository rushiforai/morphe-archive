package defpackage;

/* JADX INFO: loaded from: classes.dex */
public final class x1b implements m45 {
    public final /* synthetic */ int a;
    public final String b;

    public /* synthetic */ x1b(String str, int i) {
        this.a = i;
        this.b = str;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        String str;
        int i = this.a;
        String str2 = this.b;
        switch (i) {
            case 0:
                String strZ = ev6.z(new StringBuilder(), mnc.m.a.a, '.');
                str = tuc.N(str2, strZ, false) ? strZ : null;
                if (str != null) {
                    break;
                }
                break;
            default:
                String strZ2 = ev6.z(new StringBuilder(), mnc.k.a.a, '.');
                str = tuc.N(str2, strZ2, false) ? strZ2 : null;
                if (str != null) {
                    break;
                }
                break;
        }
        return str;
    }
}
