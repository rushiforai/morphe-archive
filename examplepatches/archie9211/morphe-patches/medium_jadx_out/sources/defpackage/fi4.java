package defpackage;

import com.medium.proto.event.FindYourFriendsPermissionRequested;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fi4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ hi4 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fi4(hi4 hi4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = hi4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        hi4 hi4Var = this.c;
        switch (i) {
            case 0:
                return new fi4(hi4Var, n92Var, 0);
            default:
                return new fi4(hi4Var, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((fi4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((fi4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        hi4 hi4Var = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                fj4 fj4Var = hi4Var.b;
                if (!fj4Var.C) {
                    fj4Var.C = true;
                    cx2 cx2Var = fj4Var.j;
                    String string = Locale.getDefault().toString();
                    string.getClass();
                    String str = fj4Var.b;
                    String str2 = fj4Var.A;
                    String str3 = fj4Var.y;
                    cx2Var.getClass();
                    str.getClass();
                    str2.getClass();
                    str3.getClass();
                    rqd.a(cx2Var.a, new FindYourFriendsPermissionRequested(null, string, null, null, 13, null), str, str2, false, null, str3, 24);
                }
                break;
            default:
                br7.v(obj);
                fj4 fj4Var2 = hi4Var.b;
                if (!fj4Var2.B) {
                    fj4Var2.B = true;
                    fj4Var2.i.j(fj4Var2.b, fj4Var2.A, fj4Var2.y);
                }
                break;
        }
        return c1eVar;
    }
}
