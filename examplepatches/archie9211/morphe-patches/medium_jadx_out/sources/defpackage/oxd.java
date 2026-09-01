package defpackage;

import java.lang.reflect.GenericDeclaration;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class oxd implements TypeVariable, Type {
    public final xj6 a;

    public oxd(xj6 xj6Var) {
        this.a = xj6Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof TypeVariable) || !getName().equals(((TypeVariable) obj).getName())) {
            return false;
        }
        getGenericDeclaration();
        throw null;
    }

    @Override // java.lang.reflect.TypeVariable
    public final Type[] getBounds() {
        k1b k1bVar = this.a.b;
        fj6 fj6Var = xj6.d[0];
        Object objInvoke = k1bVar.invoke();
        objInvoke.getClass();
        List list = (List) objInvoke;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(kyd.K((qj6) it2.next(), true));
        }
        return (Type[]) arrayList.toArray(new Type[0]);
    }

    @Override // java.lang.reflect.TypeVariable
    public final GenericDeclaration getGenericDeclaration() {
        throw new ei8("An operation is not implemented: ".concat("getGenericDeclaration() is not yet supported for type variables created from KType: " + this.a));
    }

    @Override // java.lang.reflect.TypeVariable
    public final String getName() {
        return this.a.b();
    }

    @Override // java.lang.reflect.Type
    public final String getTypeName() {
        return getName();
    }

    public final int hashCode() {
        getName();
        getGenericDeclaration();
        throw null;
    }

    public final String toString() {
        return getName();
    }
}
