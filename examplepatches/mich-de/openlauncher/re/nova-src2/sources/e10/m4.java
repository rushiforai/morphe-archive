package e10;

import com.teslacoilsw.launcher.search.BuiltinNovaSearchProvider;
import com.teslacoilsw.launcher.search.NovaSearchProvider;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function5;

/* loaded from: classes.dex */
public final class m4 extends SuspendLambda implements Function5 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Set f51665t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ List f51666u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ boolean f51667v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ boolean f51668w;

    @Override // kotlin.jvm.functions.Function5
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        boolean zBooleanValue2 = ((Boolean) obj4).booleanValue();
        m4 m4Var = new m4(5, (Continuation) obj5);
        m4Var.f51665t = (Set) obj;
        m4Var.f51666u = (List) obj2;
        m4Var.f51667v = zBooleanValue;
        m4Var.f51668w = zBooleanValue2;
        return m4Var.invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x004f A[PHI: r1
      0x004f: PHI (r1v17 java.lang.String) = (r1v16 java.lang.String), (r1v19 java.lang.String) binds: [B:15:0x005f, B:11:0x004b] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        String str;
        String strG;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        Set set = this.f51665t;
        List list = this.f51666u;
        boolean z11 = this.f51667v;
        boolean z12 = this.f51668w;
        boolean zContains = set.contains(r10.p0.f85204a);
        boolean zContains2 = set.contains(r10.p0.f85208e);
        Iterator it = set.iterator();
        do {
            str = null;
            if (!it.hasNext()) {
                break;
            }
            int iOrdinal = ((r10.p0) it.next()).ordinal();
            if (iOrdinal == 1) {
                r10.b1 b1Var = NovaSearchProvider.Companion;
                b1Var.getClass();
                BuiltinNovaSearchProvider builtinNovaSearchProvider = NovaSearchProvider.f46219j;
                b1Var.getClass();
                strG = r10.b1.g(builtinNovaSearchProvider);
                if (strG == null) {
                }
            } else if (iOrdinal == 2) {
                r10.b1 b1Var2 = NovaSearchProvider.Companion;
                b1Var2.getClass();
                BuiltinNovaSearchProvider builtinNovaSearchProvider2 = NovaSearchProvider.f46217h;
                b1Var2.getClass();
                strG = r10.b1.g(builtinNovaSearchProvider2);
                str = strG == null ? "Custom" : strG;
            }
        } while (str == null);
        List<NovaSearchProvider> list2 = list;
        String str2 = str;
        ArrayList arrayList = new ArrayList(b70.c.u0(list2, 10));
        for (NovaSearchProvider novaSearchProvider : list2) {
            NovaSearchProvider.Companion.getClass();
            String strG2 = r10.b1.g(novaSearchProvider);
            if (strG2 == null) {
                strG2 = "Custom";
            }
            arrayList.add(strG2);
        }
        return new op.m(zContains, zContains2, z11, z12, str2, arrayList);
    }
}
