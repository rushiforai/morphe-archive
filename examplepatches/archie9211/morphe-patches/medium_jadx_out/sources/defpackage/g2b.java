package defpackage;

import com.google.gson.JsonIOException;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Modifier;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g2b implements kud {
    public final o72 a;
    public final rf4 b;
    public final i44 c;
    public final mb6 d;
    public final List e;

    public g2b(o72 o72Var, rf4 rf4Var, i44 i44Var, mb6 mb6Var, List list) {
        this.a = o72Var;
        this.b = rf4Var;
        this.c = i44Var;
        this.d = mb6Var;
        this.e = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void b(Object obj, AccessibleObject accessibleObject) {
        if (Modifier.isStatic(((Member) accessibleObject).getModifiers())) {
            obj = null;
        }
        if (!r1b.a.a(obj, accessibleObject)) {
            throw new JsonIOException(w1b.d(accessibleObject, true).concat(" is not accessible and ReflectionAccessFilter does not permit making it accessible. Register a TypeAdapter for the declaring type, adjust the access filter or increase the visibility of the element and its declaring type."));
        }
    }

    public static void c(Class cls, String str, Field field, Field field2) {
        throw new IllegalArgumentException("Class " + cls.getName() + " declares multiple JSON fields named '" + str + "'; conflict is caused by fields " + w1b.c(field) + " and " + w1b.c(field2) + "\nSee " + "https://github.com/google/gson/blob/main/Troubleshooting.md#".concat("duplicate-fields"));
    }

    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        Class clsC = kxdVar.c();
        if (!Object.class.isAssignableFrom(clsC)) {
            return null;
        }
        to7 to7Var = w1b.a;
        if (!Modifier.isStatic(clsC.getModifiers()) && (clsC.isAnonymousClass() || clsC.isLocalClass())) {
            return new a2b();
        }
        o1b o1bVarP = qo7.p(this.e);
        if (o1bVarP != o1b.BLOCK_ALL) {
            boolean z = o1bVarP == o1b.BLOCK_INACCESSIBLE;
            return w1b.a.o(clsC) ? new f2b(clsC, d(ch5Var, kxdVar, clsC, z, true), z) : new d2b(this.a.c(kxdVar, true), d(ch5Var, kxdVar, clsC, z, false));
        }
        throw new JsonIOException("ReflectionAccessFilter does not permit using reflection for " + clsC + ". Register a TypeAdapter for this type or adjust the access filter.");
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0134  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0156  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0171  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0177  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x017d  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0192  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01a4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.e2b d(defpackage.ch5 r29, defpackage.kxd r30, java.lang.Class r31, boolean r32, boolean r33) {
        /*
            Method dump skipped, instruction units count: 523
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g2b.d(ch5, kxd, java.lang.Class, boolean, boolean):e2b");
    }

    public final boolean e(Field field, boolean z) {
        boolean z2;
        i44 i44Var = this.c;
        i44Var.getClass();
        if ((136 & field.getModifiers()) != 0 || field.isSynthetic() || i44Var.b(field.getType(), z)) {
            z2 = true;
        } else {
            List list = z ? i44Var.a : i44Var.b;
            if (!list.isEmpty()) {
                Iterator it2 = list.iterator();
                if (it2.hasNext()) {
                    throw ev6.q(it2);
                }
            }
            z2 = false;
        }
        return !z2;
    }
}
