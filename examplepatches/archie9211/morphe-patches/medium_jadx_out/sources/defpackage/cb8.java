package defpackage;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@rc8("navigation")
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcb8;", "Lsc8;", "Lya8;", "navigation-common_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
public class cb8 extends sc8 {
    public final tc8 c;

    public cb8(tc8 tc8Var) {
        tc8Var.getClass();
        this.c = tc8Var;
    }

    @Override // defpackage.sc8
    public final void d(List list, ob8 ob8Var, w6 w6Var) {
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ba8 ba8Var = (ba8) it2.next();
            va8 va8Var = ba8Var.b;
            va8Var.getClass();
            ya8 ya8Var = (ya8) va8Var;
            rya ryaVar = new rya();
            ryaVar.a = ba8Var.h.a();
            jl1 jl1Var = ya8Var.g;
            int i = jl1Var.c;
            String str = (String) jl1Var.f;
            if (i == 0 && str == null) {
                ym6 ym6Var = ya8Var.b;
                String strValueOf = ym6Var.b;
                if (strValueOf == null) {
                    strValueOf = String.valueOf(ym6Var.c);
                }
                strValueOf.getClass();
                if (((ya8) jl1Var.d).b.c == 0) {
                    strValueOf = "the root navigation";
                }
                lg8.i("no start destination defined via app:startDestination for ".concat(strValueOf));
                return;
            }
            va8 va8VarT = str != null ? jl1Var.t(str, false) : (va8) s42.L((xkc) jl1Var.e, i);
            if (va8VarT == null) {
                String strValueOf2 = (String) jl1Var.b;
                if (strValueOf2 == null) {
                    strValueOf2 = (String) jl1Var.f;
                    if (strValueOf2 == null) {
                        strValueOf2 = String.valueOf(jl1Var.c);
                    }
                    jl1Var.b = strValueOf2;
                }
                strValueOf2.getClass();
                ay0.e(ev6.x("navigation destination ", strValueOf2, " is not a direct child of this NavGraph"));
                return;
            }
            ym6 ym6Var2 = va8VarT.b;
            if (str != null) {
                if (!str.equals((String) ym6Var2.g)) {
                    ua8 ua8VarA = ym6Var2.a(str);
                    Bundle bundle = ua8VarA != null ? ua8VarA.b : null;
                    if (bundle != null && !bundle.isEmpty()) {
                        Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
                        bundleE.putAll(bundle);
                        Bundle bundle2 = (Bundle) ryaVar.a;
                        if (bundle2 != null) {
                            bundleE.putAll(bundle2);
                        }
                        ryaVar.a = bundleE;
                    }
                }
                if (va8VarT.q().isEmpty()) {
                    continue;
                } else {
                    ArrayList arrayListN = fo7.N(va8VarT.q(), new bb8(ryaVar, 0));
                    if (!arrayListN.isEmpty()) {
                        rd6.e(93, "Cannot navigate to startDestination ", va8VarT, ". Missing required arguments [", arrayListN);
                        return;
                    }
                }
            }
            this.c.b(va8VarT.a).d(d46.Q(b().b(va8VarT, va8VarT.f((Bundle) ryaVar.a))), ob8Var, w6Var);
        }
    }

    @Override // defpackage.sc8
    /* JADX INFO: renamed from: k, reason: merged with bridge method [inline-methods] */
    public ya8 a() {
        return new ya8(this);
    }
}
