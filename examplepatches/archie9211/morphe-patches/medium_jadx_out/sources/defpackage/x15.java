package defpackage;

import android.os.Bundle;
import android.util.Log;
import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x15 implements cy6 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public x15(k92 k92Var, ft ftVar, swa swaVar, rya ryaVar) {
        this.b = k92Var;
        this.c = ftVar;
        this.d = swaVar;
        this.e = ryaVar;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        Bundle bundle;
        switch (this.a) {
            case 0:
                f25 f25Var = (f25) this.e;
                Map map = f25Var.k;
                String str = (String) this.b;
                if (ux6Var == ux6.ON_START && (bundle = (Bundle) map.get(str)) != null) {
                    ((p25) this.c).a(str, bundle);
                    map.remove(str);
                    if (f25.I(2)) {
                        Log.v("FragmentManager", "Clearing fragment result with key ".concat(str));
                    }
                }
                if (ux6Var == ux6.ON_DESTROY) {
                    ((wx6) this.d).b(this);
                    f25Var.l.remove(str);
                    return;
                }
                return;
            default:
                switch (r5f.a[ux6Var.ordinal()]) {
                    case 1:
                        vx0.c0((k92) this.b, null, wb2.UNDISPATCHED, new gbd((rya) this.e, (swa) this.d, iy6Var, this, null, 20), 1);
                        return;
                    case 2:
                        ft ftVar = (ft) this.c;
                        if (ftVar != null) {
                            zf3 zf3Var = (zf3) ftVar.c;
                            synchronized (zf3Var.d) {
                                try {
                                    if (!zf3Var.j()) {
                                        ArrayList arrayList = (ArrayList) zf3Var.b;
                                        zf3Var.b = (ArrayList) zf3Var.e;
                                        zf3Var.e = arrayList;
                                        zf3Var.c = true;
                                        int size = arrayList.size();
                                        for (int i = 0; i < size; i++) {
                                            ((n92) arrayList.get(i)).resumeWith(c1e.a);
                                        }
                                        arrayList.clear();
                                    }
                                } catch (Throwable th) {
                                    throw th;
                                }
                                break;
                            }
                        }
                        ((swa) this.d).S();
                        return;
                    case 3:
                        ((swa) this.d).J();
                        return;
                    case 4:
                        ((swa) this.d).y();
                        return;
                    case 5:
                    case 6:
                    case 7:
                        return;
                    default:
                        ygf.a();
                        return;
                }
        }
    }

    public x15(f25 f25Var, String str, p25 p25Var, wx6 wx6Var) {
        this.e = f25Var;
        this.b = str;
        this.c = p25Var;
        this.d = wx6Var;
    }
}
