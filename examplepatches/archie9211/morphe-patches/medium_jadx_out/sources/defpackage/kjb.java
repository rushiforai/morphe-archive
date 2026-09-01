package defpackage;

import j$.util.Objects;
import j$.util.concurrent.ConcurrentHashMap;
import java.lang.annotation.Annotation;
import java.lang.reflect.Proxy;
import java.lang.reflect.Type;
import java.util.ArrayDeque;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kjb {
    public final ConcurrentHashMap a = new ConcurrentHashMap();
    public final u31 b;
    public final qt5 c;
    public final List d;
    public final List e;
    public final Executor f;

    public kjb(u31 u31Var, qt5 qt5Var, List list, List list2, Executor executor) {
        this.b = u31Var;
        this.c = qt5Var;
        this.d = list;
        this.e = list2;
        this.f = executor;
    }

    public final x31 a(Type type, Annotation[] annotationArr) {
        Objects.requireNonNull(type, "returnType == null");
        Objects.requireNonNull(annotationArr, "annotations == null");
        List list = this.e;
        int iIndexOf = list.indexOf(null) + 1;
        int size = list.size();
        for (int i = iIndexOf; i < size; i++) {
            x31 x31VarA = ((w31) list.get(i)).a(type, annotationArr, this);
            if (x31VarA != null) {
                return x31VarA;
            }
        }
        StringBuilder sb = new StringBuilder("Could not locate call adapter for ");
        sb.append(type);
        sb.append(".\n  Tried:");
        int size2 = list.size();
        while (iIndexOf < size2) {
            sb.append("\n   * ");
            sb.append(((w31) list.get(iIndexOf)).getClass().getName());
            iIndexOf++;
        }
        throw new IllegalArgumentException(sb.toString());
    }

    public final Object b(Class cls) {
        if (!cls.isInterface()) {
            ay0.e("API declarations must be interfaces.");
            return null;
        }
        ArrayDeque arrayDeque = new ArrayDeque(1);
        arrayDeque.add(cls);
        while (!arrayDeque.isEmpty()) {
            Class cls2 = (Class) arrayDeque.removeFirst();
            if (cls2.getTypeParameters().length != 0) {
                StringBuilder sb = new StringBuilder("Type parameters are unsupported on ");
                sb.append(cls2.getName());
                if (cls2 != cls) {
                    sb.append(" which is an interface of ");
                    sb.append(cls.getName());
                }
                throw new IllegalArgumentException(sb.toString());
            }
            Collections.addAll(arrayDeque, cls2.getInterfaces());
        }
        return Proxy.newProxyInstance(cls.getClassLoader(), new Class[]{cls}, new kz5(this, cls));
    }

    public final y92 c(Type type, Annotation[] annotationArr, Annotation[] annotationArr2) {
        Objects.requireNonNull(type, "type == null");
        Objects.requireNonNull(annotationArr2, "methodAnnotations == null");
        List list = this.d;
        int iIndexOf = list.indexOf(null) + 1;
        int size = list.size();
        for (int i = iIndexOf; i < size; i++) {
            y92 y92VarA = ((x92) list.get(i)).a(type, annotationArr);
            if (y92VarA != null) {
                return y92VarA;
            }
        }
        StringBuilder sb = new StringBuilder("Could not locate RequestBody converter for ");
        sb.append(type);
        sb.append(".\n  Tried:");
        int size2 = list.size();
        while (iIndexOf < size2) {
            sb.append("\n   * ");
            sb.append(((x92) list.get(iIndexOf)).getClass().getName());
            iIndexOf++;
        }
        throw new IllegalArgumentException(sb.toString());
    }

    public final y92 d(Type type, Annotation[] annotationArr) {
        Objects.requireNonNull(type, "type == null");
        Objects.requireNonNull(annotationArr, "annotations == null");
        List list = this.d;
        int iIndexOf = list.indexOf(null) + 1;
        int size = list.size();
        for (int i = iIndexOf; i < size; i++) {
            y92 y92VarB = ((x92) list.get(i)).b(type, annotationArr, this);
            if (y92VarB != null) {
                return y92VarB;
            }
        }
        StringBuilder sb = new StringBuilder("Could not locate ResponseBody converter for ");
        sb.append(type);
        sb.append(".\n  Tried:");
        int size2 = list.size();
        while (iIndexOf < size2) {
            sb.append("\n   * ");
            sb.append(((x92) list.get(iIndexOf)).getClass().getName());
            iIndexOf++;
        }
        throw new IllegalArgumentException(sb.toString());
    }

    public final void e(Type type, Annotation[] annotationArr) {
        Objects.requireNonNull(type, "type == null");
        List list = this.d;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            ((x92) list.get(i)).getClass();
        }
    }
}
