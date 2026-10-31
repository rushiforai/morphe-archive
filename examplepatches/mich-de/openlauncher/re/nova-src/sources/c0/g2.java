package c0;

import ads_mobile_sdk.pn;
import android.view.animation.Interpolator;
import b.ja;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class g2 implements ni.a {

    /* renamed from: a, reason: collision with root package name */
    public final Object f18817a;

    public g2(b.x0 flagValueProvider) {
        Intrinsics.g(flagValueProvider, "flagValueProvider");
        this.f18817a = flagValueProvider;
    }

    public Object a(String str, Object obj, Function1 converter) {
        Intrinsics.g(converter, "converter");
        Object objA = ((pn) ((b.x0) this.f18817a)).a(str, converter);
        return objA == null ? obj : objA;
    }

    public abstract n0.g0 b(int i5, int i11, int i12, long j11);

    public abstract Object c();

    public abstract float d(int i5);

    @Override // ni.a
    public void destroy() {
        a().destroy();
    }

    public List e(n0.f0 f0Var, int i5, long j11) {
        z.c0 c0Var = (z.c0) this.f18817a;
        List list = (List) c0Var.b(i5);
        if (list != null) {
            return list;
        }
        List listA = f0Var.a(i5);
        int size = listA.size();
        ArrayList arrayList = new ArrayList(size);
        for (int i11 = 0; i11 < size; i11++) {
            arrayList.add(((z2.q0) listA.get(i11)).H(j11));
        }
        c0Var.h(i5, arrayList);
        return arrayList;
    }

    public abstract Object f();

    public abstract void g(Object obj);

    public abstract void h(c2 c2Var);

    public abstract void i();

    public void setPlacementId(long j11) {
        a().c().f2863a.set(j11);
    }

    public g2(ja internalAd) {
        Intrinsics.g(internalAd, "internalAd");
        this.f18817a = internalAd;
    }

    public ja a() {
        return (ja) this.f18817a;
    }

    public g2(int i5) {
        switch (i5) {
            case 3:
                z.c0 c0Var = z.n.f97803a;
                this.f18817a = new z.c0();
                break;
            default:
                this.f18817a = androidx.compose.runtime.d.k(Boolean.FALSE);
                break;
        }
    }

    public g2(Interpolator interpolator) {
        this.f18817a = interpolator;
    }
}
