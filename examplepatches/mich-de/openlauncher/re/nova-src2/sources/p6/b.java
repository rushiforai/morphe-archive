package p6;

import android.content.Context;
import android.content.ContextWrapper;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class b extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final b f82130k;

    /* renamed from: l, reason: collision with root package name */
    public static final b f82131l;

    /* renamed from: m, reason: collision with root package name */
    public static final b f82132m;
    public static final b n;
    public static final b o;

    /* renamed from: p, reason: collision with root package name */
    public static final b f82133p;

    /* renamed from: q, reason: collision with root package name */
    public static final b f82134q;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f82135j;

    static {
        int i5 = 1;
        f82130k = new b(i5, 0);
        f82131l = new b(i5, 1);
        f82132m = new b(i5, 2);
        n = new b(i5, 3);
        o = new b(i5, 4);
        f82133p = new b(i5, 5);
        f82134q = new b(i5, 6);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(int i5, int i11) {
        super(i5);
        this.f82135j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f82135j) {
            case 0:
                Context it = (Context) obj;
                Intrinsics.g(it, "it");
                if (it instanceof ContextWrapper) {
                    return ((ContextWrapper) it).getBaseContext();
                }
                return null;
            case 1:
                Context it2 = (Context) obj;
                Intrinsics.g(it2, "it");
                if (it2 instanceof ContextWrapper) {
                    return ((ContextWrapper) it2).getBaseContext();
                }
                return null;
            case 2:
                e0 destination = (e0) obj;
                Intrinsics.g(destination, "destination");
                h0 h0Var = destination.f82153b;
                if (h0Var == null || h0Var.f82178k != destination.f82157f) {
                    return null;
                }
                return h0Var;
            case 3:
                e0 destination2 = (e0) obj;
                Intrinsics.g(destination2, "destination");
                h0 h0Var2 = destination2.f82153b;
                if (h0Var2 == null || h0Var2.f82178k != destination2.f82157f) {
                    return null;
                }
                return h0Var2;
            case 4:
                e0 it3 = (e0) obj;
                Intrinsics.g(it3, "it");
                return Integer.valueOf(it3.f82157f);
            case 5:
                e0 it4 = (e0) obj;
                Intrinsics.g(it4, "it");
                return it4.f82153b;
            default:
                e0 it5 = (e0) obj;
                Intrinsics.g(it5, "it");
                if (!(it5 instanceof h0)) {
                    return null;
                }
                h0 h0Var3 = (h0) it5;
                return h0Var3.f(h0Var3.f82178k, h0Var3, false, null);
        }
    }
}
