package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* renamed from: io.branch.search.internal.p9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3317p9 extends Lambda implements Function1<Map<String, Collection<Object>>, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f65479a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1<Object, Boolean> f65480b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3317p9(Ref.IntRef intRef, O o) {
        super(1);
        this.f65479a = intRef;
        this.f65480b = o;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Map restored = (Map) obj;
        Intrinsics.g(restored, "restored");
        Function1<Object, Boolean> function1 = this.f65480b;
        ArrayList arrayList = new ArrayList();
        for (Map.Entry entry : restored.entrySet()) {
            String str = (String) entry.getKey();
            Collection collection = (Collection) entry.getValue();
            ArrayList arrayList2 = new ArrayList();
            for (Object obj2 : collection) {
                if (((Boolean) function1.invoke(obj2)).booleanValue()) {
                    arrayList2.add(obj2);
                }
            }
            Pair pair = !arrayList2.isEmpty() ? new Pair(str, arrayList2) : null;
            if (pair != null) {
                arrayList.add(pair);
            }
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Pair pair2 = (Pair) it.next();
            String str2 = (String) pair2.f71683a;
            List list = (List) pair2.f71684b;
            Collection collection2 = (Collection) restored.get(str2);
            if (collection2 != null) {
                collection2.removeAll(b70.g.N1(list));
                Ref.IntRef intRef = this.f65479a;
                intRef.f71861a = list.size() + intRef.f71861a;
            }
        }
        return Unit.f71706a;
    }
}
