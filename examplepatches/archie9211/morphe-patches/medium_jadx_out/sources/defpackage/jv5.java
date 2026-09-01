package defpackage;

import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jv5 implements do4 {
    public static final jv5 b = new jv5(0);
    public static final jv5 c = new jv5(1);
    public final /* synthetic */ int a;

    public /* synthetic */ jv5(int i) {
        this.a = i;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                t10.k(((DarkMode) obj).getValue());
                break;
            default:
                break;
        }
        return c1eVar;
    }
}
