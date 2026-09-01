package defpackage;

import java.lang.reflect.Member;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class l51 implements v41 {
    public final Member a;
    public final Type b;
    public final Class c;
    public final List d;

    public l51(Member member, Type type, Class cls, Type[] typeArr) {
        List listQ0;
        this.a = member;
        this.b = type;
        this.c = cls;
        if (cls != null) {
            nec necVar = new nec(2);
            ArrayList arrayList = (ArrayList) necVar.b;
            necVar.b(cls);
            necVar.e(typeArr);
            listQ0 = d46.R(arrayList.toArray(new Type[arrayList.size()]));
        } else {
            listQ0 = k80.Q0(typeArr);
        }
        this.d = listQ0;
    }

    @Override // defpackage.v41
    public final List a() {
        return this.d;
    }

    @Override // defpackage.v41
    public final Member b() {
        return this.a;
    }

    @Override // defpackage.v41
    public final boolean c() {
        return false;
    }

    public void d(Object[] objArr) {
        objArr.getClass();
        List list = this.d;
        if (list.size() == objArr.length) {
            return;
        }
        StringBuilder sb = new StringBuilder("Callable expects ");
        sb.append(list.size());
        sb.append(" arguments, but ");
        ay0.e(ho2.H(sb, objArr.length, " were provided."));
    }

    public final void e(Object obj) {
        if (obj == null || !this.a.getDeclaringClass().isInstance(obj)) {
            ay0.e("An object member requires the object instance passed as the first argument.");
        }
    }

    @Override // defpackage.v41
    public final Type getReturnType() {
        return this.b;
    }
}
