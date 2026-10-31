package h50;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class r0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59269a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function2 f59270b;

    public /* synthetic */ r0(Function2 function2, int i5) {
        this.f59269a = i5;
        this.f59270b = function2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        o50.m mVarA;
        Long lV0;
        y1.e eVar;
        int i5 = this.f59269a;
        Long lValueOf = null;
        Function2 function2 = this.f59270b;
        switch (i5) {
            case 0:
                y0 y0Var = (y0) obj;
                Integer num = (Integer) obj2;
                num.getClass();
                Intrinsics.g(y0Var, "<this>");
                l50.b bVar = y0Var.f59319a;
                if (bVar != null && (mVarA = bVar.a()) != null) {
                    List list = o50.p.f79582a;
                    String strD = mVarA.d("Retry-After");
                    if (strD != null && (lV0 = r70.i.v0(strD)) != null) {
                        lValueOf = Long.valueOf(lV0.longValue() * 1000);
                    }
                }
                return Long.valueOf(Math.max(((Number) function2.invoke(y0Var, num)).longValue(), lValueOf != null ? lValueOf.longValue() : 0L));
            default:
                y1.b bVar2 = (y1.b) obj;
                List list2 = (List) function2.invoke(bVar2, obj2);
                List list3 = list2;
                int size = list3.size();
                for (int i11 = 0; i11 < size; i11++) {
                    Object obj3 = list2.get(i11);
                    if (obj3 != null && (eVar = bVar2.f96556b) != null && !eVar.c(obj3)) {
                        throw new IllegalArgumentException(("item at index " + i11 + " can't be saved: " + obj3).toString());
                    }
                }
                if (list3.isEmpty()) {
                    return null;
                }
                return new ArrayList(list3);
        }
    }
}
