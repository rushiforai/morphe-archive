package defpackage;

import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vx implements v41 {
    public final Class a;
    public final ArrayList b;
    public final tx c;
    public final List d;
    public final ArrayList e;
    public final ArrayList f;
    public final ArrayList g;

    public vx(Class cls, ArrayList arrayList, tx txVar, ux uxVar, List list) {
        cls.getClass();
        txVar.getClass();
        uxVar.getClass();
        this.a = cls;
        this.b = arrayList;
        this.c = txVar;
        this.d = list;
        ArrayList arrayList2 = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((Method) it2.next()).getGenericReturnType());
        }
        this.e = arrayList2;
        List list2 = this.d;
        ArrayList arrayList3 = new ArrayList(cu1.k0(list2, 10));
        Iterator it3 = list2.iterator();
        while (it3.hasNext()) {
            Class<?> returnType = ((Method) it3.next()).getReturnType();
            returnType.getClass();
            Class<?> cls2 = (Class) e0b.c.get(returnType);
            if (cls2 != null) {
                returnType = cls2;
            }
            arrayList3.add(returnType);
        }
        this.f = arrayList3;
        List list3 = this.d;
        ArrayList arrayList4 = new ArrayList(cu1.k0(list3, 10));
        Iterator it4 = list3.iterator();
        while (it4.hasNext()) {
            arrayList4.add(((Method) it4.next()).getDefaultValue());
        }
        this.g = arrayList4;
        if (this.c == tx.POSITIONAL_CALL && uxVar == ux.JAVA && !bu1.N0(this.b, "value").isEmpty()) {
            ik4.k("Positional call of a Java annotation constructor is allowed only if there are no parameters or one parameter named \"value\". This restriction exists because Java annotations (in contrast to Kotlin)do not impose any order on their arguments. Use KCallable#callBy instead.");
            throw null;
        }
    }

    @Override // defpackage.v41
    public final List a() {
        return this.e;
    }

    @Override // defpackage.v41
    public final Member b() {
        return null;
    }

    @Override // defpackage.v41
    public final boolean c() {
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x013d A[LOOP:0: B:5:0x001a->B:52:0x013d, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x008f A[SYNTHETIC] */
    @Override // defpackage.v41
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object call(java.lang.Object[] r20) {
        /*
            Method dump skipped, instruction units count: 374
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx.call(java.lang.Object[]):java.lang.Object");
    }

    @Override // defpackage.v41
    public final Type getReturnType() {
        return this.a;
    }

    public /* synthetic */ vx(Class cls, ArrayList arrayList, tx txVar, ux uxVar) {
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(cls.getDeclaredMethod((String) it2.next(), null));
        }
        this(cls, arrayList, txVar, uxVar, arrayList2);
    }
}
