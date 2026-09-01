package defpackage;

import java.lang.reflect.Constructor;
import java.lang.reflect.Member;
import java.lang.reflect.Type;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w41 extends l51 implements tx0 {
    public final /* synthetic */ int e;
    public final Object f;

    /* JADX WARN: Illegal instructions before constructor call */
    public w41(Constructor constructor, Object obj, int i) {
        this.e = i;
        switch (i) {
            case 1:
                Class declaringClass = constructor.getDeclaringClass();
                declaringClass.getClass();
                Type[] genericParameterTypes = constructor.getGenericParameterTypes();
                genericParameterTypes.getClass();
                super(constructor, declaringClass, null, genericParameterTypes);
                this.f = obj;
                break;
            default:
                Class declaringClass2 = constructor.getDeclaringClass();
                declaringClass2.getClass();
                Type[] genericParameterTypes2 = constructor.getGenericParameterTypes();
                genericParameterTypes2.getClass();
                super(constructor, declaringClass2, null, (Type[]) (genericParameterTypes2.length <= 2 ? new Type[0] : k80.m0(1, genericParameterTypes2.length - 1, genericParameterTypes2)));
                this.f = obj;
                break;
        }
    }

    @Override // defpackage.v41
    public final Object call(Object[] objArr) {
        int i = this.e;
        Object obj = this.f;
        Member member = this.a;
        objArr.getClass();
        switch (i) {
            case 0:
                d(objArr);
                nec necVar = new nec(3);
                necVar.b(obj);
                necVar.e(objArr);
                necVar.b(null);
                ArrayList arrayList = (ArrayList) necVar.b;
                return ((Constructor) member).newInstance(arrayList.toArray(new Object[arrayList.size()]));
            default:
                d(objArr);
                nec necVar2 = new nec(2);
                necVar2.b(obj);
                necVar2.e(objArr);
                ArrayList arrayList2 = (ArrayList) necVar2.b;
                return ((Constructor) member).newInstance(arrayList2.toArray(new Object[arrayList2.size()]));
        }
    }
}
