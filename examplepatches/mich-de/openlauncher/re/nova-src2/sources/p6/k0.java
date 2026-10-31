package p6;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import z.d1;
import z.e1;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lp6/k0;", "Lp6/z0;", "Lp6/h0;", "navigation-common_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
@y0("navigation")
/* loaded from: classes2.dex */
public class k0 extends z0 {

    /* renamed from: c, reason: collision with root package name */
    public final b1 f82186c;

    public k0(b1 navigatorProvider) {
        Intrinsics.g(navigatorProvider, "navigatorProvider");
        this.f82186c = navigatorProvider;
    }

    @Override // p6.z0
    public final void d(List list, n0 n0Var) {
        e0 e0VarE;
        Iterator it = list.iterator();
        while (it.hasNext()) {
            n nVar = (n) it.next();
            e0 e0Var = nVar.f82192b;
            Intrinsics.e(e0Var, "null cannot be cast to non-null type androidx.navigation.NavGraph");
            h0 h0Var = (h0) e0Var;
            Ref.ObjectRef objectRef = new Ref.ObjectRef();
            objectRef.f71863a = nVar.a();
            int i5 = h0Var.f82178k;
            String str = h0Var.f82180m;
            if (i5 == 0 && str == null) {
                StringBuilder sb2 = new StringBuilder("no start destination defined via app:startDestination for ");
                int i11 = h0Var.f82157f;
                sb2.append(i11 != 0 ? String.valueOf(i11) : "the root navigation");
                throw new IllegalStateException(sb2.toString().toString());
            }
            if (str != null) {
                e0VarE = h0Var.e(str, false);
            } else {
                d1 d1Var = h0Var.f82177j;
                d1Var.getClass();
                e0VarE = (e0) e1.b(d1Var, i5);
            }
            if (e0VarE == null) {
                if (h0Var.f82179l == null) {
                    String strValueOf = h0Var.f82180m;
                    if (strValueOf == null) {
                        strValueOf = String.valueOf(h0Var.f82178k);
                    }
                    h0Var.f82179l = strValueOf;
                }
                String str2 = h0Var.f82179l;
                Intrinsics.d(str2);
                throw new IllegalArgumentException(b.c0.l("navigation destination ", str2, " is not a direct child of this NavGraph"));
            }
            LinkedHashMap linkedHashMap = e0VarE.f82156e;
            if (str != null) {
                if (!str.equals(e0VarE.f82158g)) {
                    b0 b0VarD = e0VarE.d(str);
                    Bundle bundle = b0VarD != null ? b0VarD.f82137b : null;
                    if (bundle != null && !bundle.isEmpty()) {
                        Bundle bundle2 = new Bundle();
                        bundle2.putAll(bundle);
                        Bundle bundle3 = (Bundle) objectRef.f71863a;
                        if (bundle3 != null) {
                            bundle2.putAll(bundle3);
                        }
                        objectRef.f71863a = bundle2;
                    }
                }
                if (MapsKt.s0(linkedHashMap).isEmpty()) {
                    continue;
                } else {
                    ArrayList arrayListR = j.r(MapsKt.s0(linkedHashMap), new j0(objectRef));
                    if (!arrayListR.isEmpty()) {
                        throw new IllegalArgumentException(("Cannot navigate to startDestination " + e0VarE + ". Missing required arguments [" + arrayListR + AbstractJsonLexerKt.END_LIST).toString());
                    }
                }
            }
            z0 z0VarB = this.f82186c.b(e0VarE.f82152a);
            o oVarB = b();
            Bundle bundleB = e0VarE.b((Bundle) objectRef.f71863a);
            t tVar = oVarB.f82218h;
            z0VarB.d(ul.b.P(b50.d.l(tVar.f82252a, e0VarE, bundleB, tVar.i(), tVar.f82265p)), n0Var);
        }
    }

    @Override // p6.z0
    /* renamed from: g, reason: merged with bridge method [inline-methods] */
    public h0 a() {
        return new h0(this);
    }
}
