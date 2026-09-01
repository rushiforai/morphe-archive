package defpackage;

import android.content.res.Resources;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mf3 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ nhc b;
    public final /* synthetic */ Resources c;

    public /* synthetic */ mf3(nhc nhcVar, Resources resources, int i) {
        this.a = i;
        this.b = nhcVar;
        this.c = resources;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Resources resources = this.c;
        switch (i) {
            case 0:
                if (((of3) obj) == null) {
                    ygf.a();
                    break;
                } else {
                    String string = resources.getString(R.string.discoverability_save_error);
                    string.getClass();
                    Object objC = nhc.c(this.b, string, null, bhc.Long, n92Var, 6);
                    if (objC != tb2.COROUTINE_SUSPENDED) {
                        break;
                    }
                }
                break;
            case 1:
                je7 je7Var = (je7) obj;
                boolean z = je7Var instanceof ge7;
                nhc nhcVar = this.b;
                if (!z) {
                    if (!(je7Var instanceof he7)) {
                        if (!(je7Var instanceof ie7)) {
                            ygf.a();
                            break;
                        } else {
                            Object objC2 = nhc.c(nhcVar, ((ie7) je7Var).a, null, bhc.Long, n92Var, 6);
                            if (objC2 == tb2.COROUTINE_SUSPENDED) {
                            }
                        }
                    } else {
                        String string2 = resources.getString(R.string.common_oops);
                        string2.getClass();
                        Object objC3 = nhc.c(nhcVar, string2, null, bhc.Long, n92Var, 6);
                        if (objC3 == tb2.COROUTINE_SUSPENDED) {
                        }
                    }
                } else {
                    String string3 = resources.getString(R.string.magic_link_resent);
                    string3.getClass();
                    Object objC4 = nhc.c(nhcVar, string3, null, bhc.Short, n92Var, 6);
                    if (objC4 == tb2.COROUTINE_SUSPENDED) {
                    }
                }
                break;
            case 2:
                w2c w2cVar = (w2c) obj;
                if (w2cVar == null) {
                    ygf.a();
                    break;
                } else {
                    String string4 = resources.getString(w2cVar.a);
                    string4.getClass();
                    Object objC5 = nhc.c(this.b, string4, null, bhc.Long, n92Var, 6);
                    if (objC5 != tb2.COROUTINE_SUSPENDED) {
                        break;
                    }
                }
                break;
            default:
                if (((moc) obj) == null) {
                    ygf.a();
                    break;
                } else {
                    String string5 = resources.getString(R.string.onboarding_starter_pack_detail_follow_all_error);
                    string5.getClass();
                    Object objC6 = nhc.c(this.b, string5, null, bhc.Long, n92Var, 6);
                    if (objC6 != tb2.COROUTINE_SUSPENDED) {
                        break;
                    }
                }
                break;
        }
        return null;
    }
}
