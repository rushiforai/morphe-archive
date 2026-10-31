package r10;

import android.content.Intent;
import android.net.Uri;
import com.teslacoilsw.launcher.search.NovaSearchProvider;
import cw.l2;
import java.util.ArrayList;
import java.util.Arrays;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes.dex */
public final class m0 implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f85170a = t3.c.f88513a.p().c().f88509a.toLanguageTag();

    /* renamed from: b, reason: collision with root package name */
    public final x80.e0 f85171b;

    /* renamed from: c, reason: collision with root package name */
    public final String f85172c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f85173d;

    /* renamed from: e, reason: collision with root package name */
    public final int f85174e;

    public m0() {
        x80.d0 d0Var = new x80.d0();
        d0Var.a(w20.n.f93704a);
        this.f85171b = new x80.e0(d0Var);
        this.f85172c = "GoogleAutocompleteSuggestion";
        this.f85173d = true;
        this.f85174e = 102;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // r10.q0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, Continuation continuation) throws JSONException {
        l0 l0Var;
        String strString;
        if (continuation instanceof l0) {
            l0Var = (l0) continuation;
            int i5 = l0Var.f85168w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l0Var.f85168w = i5 - Integer.MIN_VALUE;
            } else {
                l0Var = new l0(this, (ContinuationImpl) continuation);
            }
        }
        Object objN = l0Var.f85166u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l0Var.f85168w;
        try {
            if (i11 == 0) {
                ResultKt.b(objN);
                String strEncode = Uri.encode(str);
                x80.g0 g0Var = new x80.g0();
                g0Var.k(String.format("https://www.google.com/complete/search?q=%s&client=chrome&hl=%s", Arrays.copyOf(new Object[]{strEncode, this.f85170a}, 2)));
                b90.j jVarC = this.f85171b.c(g0Var.b());
                l0Var.f85165t = str;
                l0Var.f85168w = 1;
                objN = l2.n(jVarC, l0Var);
                if (objN == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                str = l0Var.f85165t;
                ResultKt.b(objN);
            }
            x80.m0 m0Var = (x80.m0) objN;
            if (!m0Var.c()) {
                return EmptyList.f71733a;
            }
            x80.p0 p0Var = m0Var.f95559g;
            if (p0Var != null && (strString = p0Var.string()) != null) {
                Object obj = new JSONArray(strString).get(1);
                Intrinsics.e(obj, "null cannot be cast to non-null type org.json.JSONArray");
                JSONArray jSONArray = (JSONArray) obj;
                ArrayList arrayList = new ArrayList();
                int length = jSONArray.length();
                for (int i12 = 0; i12 < length; i12++) {
                    String str2 = (String) jSONArray.get(i12);
                    if (str2 != null && !r70.k.U0(str2) && !str2.equalsIgnoreCase(str)) {
                        NovaSearchProvider.Companion.getClass();
                        arrayList.add(p1.b((Intent) NovaSearchProvider.f46217h.e().invoke(str2), str2));
                    }
                }
                return b70.g.E1(arrayList, 5);
            }
            return EmptyList.f71733a;
        } catch (Exception unused) {
            return EmptyList.f71733a;
        }
    }

    @Override // r10.q0
    public final Object c(a7.f fVar, Continuation continuation) {
        return Unit.f71706a;
    }

    @Override // r10.q0
    public final boolean d() {
        return false;
    }

    @Override // r10.q0
    public final boolean e() {
        return false;
    }

    @Override // r10.q0
    public final int f() {
        return this.f85174e;
    }

    @Override // r10.q0
    public final String getName() {
        return this.f85172c;
    }

    @Override // r10.q0
    public final boolean isReady() {
        return this.f85173d;
    }
}
