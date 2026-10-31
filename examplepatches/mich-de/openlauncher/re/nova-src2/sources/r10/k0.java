package r10;

import android.content.Intent;
import android.net.Uri;
import com.teslacoilsw.launcher.search.NovaSearchProvider;
import cw.l2;
import java.util.ArrayList;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes4.dex */
public final class k0 implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public final x80.e0 f85157a;

    /* renamed from: b, reason: collision with root package name */
    public final String f85158b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f85159c;

    /* renamed from: d, reason: collision with root package name */
    public final int f85160d;

    public k0() {
        x80.d0 d0Var = new x80.d0();
        d0Var.a(w20.n.f93704a);
        this.f85157a = new x80.e0(d0Var);
        this.f85158b = "DDGAutoSuggest";
        this.f85159c = true;
        this.f85160d = 102;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Override // r10.q0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, Continuation continuation) throws JSONException {
        j0 j0Var;
        String strString;
        if (continuation instanceof j0) {
            j0Var = (j0) continuation;
            int i5 = j0Var.f85154w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j0Var.f85154w = i5 - Integer.MIN_VALUE;
            } else {
                j0Var = new j0(this, (ContinuationImpl) continuation);
            }
        }
        Object objN = j0Var.f85152u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = j0Var.f85154w;
        try {
            if (i11 == 0) {
                ResultKt.b(objN);
                String strEncode = Uri.encode(str);
                x80.g0 g0Var = new x80.g0();
                g0Var.k("https://duckduckgo.com/ac/?q=" + strEncode + "&type=list");
                b90.j jVarC = this.f85157a.c(g0Var.b());
                j0Var.f85151t = str;
                j0Var.f85154w = 1;
                objN = l2.n(jVarC, j0Var);
                if (objN == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                str = j0Var.f85151t;
                ResultKt.b(objN);
            }
            x80.p0 p0Var = ((x80.m0) objN).f95559g;
            if (p0Var != null && (strString = p0Var.string()) != null) {
                JSONArray jSONArray = new JSONArray(strString);
                if (jSONArray.length() != 2) {
                    return EmptyList.f71733a;
                }
                Object obj = jSONArray.get(1);
                Intrinsics.e(obj, "null cannot be cast to non-null type org.json.JSONArray");
                JSONArray jSONArray2 = (JSONArray) obj;
                ArrayList arrayList = new ArrayList();
                int length = jSONArray2.length();
                for (int i12 = 0; i12 < length; i12++) {
                    String str2 = (String) jSONArray2.get(i12);
                    if (str2 != null && !r70.k.U0(str2) && !str2.equalsIgnoreCase(str)) {
                        NovaSearchProvider.Companion.getClass();
                        arrayList.add(p1.b((Intent) NovaSearchProvider.f46219j.e().invoke(str2), str2));
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
        return this.f85160d;
    }

    @Override // r10.q0
    public final String getName() {
        return this.f85158b;
    }

    @Override // r10.q0
    public final boolean isReady() {
        return this.f85159c;
    }
}
