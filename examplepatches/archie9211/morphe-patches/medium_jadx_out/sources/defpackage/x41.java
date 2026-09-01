package defpackage;

import java.lang.reflect.Constructor;
import java.lang.reflect.Member;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x41 extends l51 {
    public final /* synthetic */ int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x41(Member member, Type type, Class cls, Type[] typeArr, int i) {
        super(member, type, cls, typeArr);
        this.e = i;
    }

    @Override // defpackage.v41
    public final Object call(Object[] objArr) {
        int i = this.e;
        Member member = this.a;
        objArr.getClass();
        switch (i) {
            case 0:
                d(objArr);
                nec necVar = new nec(2);
                necVar.e(objArr);
                necVar.b(null);
                ArrayList arrayList = (ArrayList) necVar.b;
                return ((Constructor) member).newInstance(arrayList.toArray(new Object[arrayList.size()]));
            default:
                d(objArr);
                return ((Constructor) member).newInstance(Arrays.copyOf(objArr, objArr.length));
        }
    }
}
