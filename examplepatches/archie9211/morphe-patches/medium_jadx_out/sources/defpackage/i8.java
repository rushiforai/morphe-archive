package defpackage;

import com.medium.android.admin.stagebranch.StageBranchDataAdapter;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class i8 {
    public final Type a;
    public final Set b;
    public final StageBranchDataAdapter c;
    public final Method d;
    public final int e;
    public final jb6[] f;
    public final boolean g;

    public i8(Type type, Set set, StageBranchDataAdapter stageBranchDataAdapter, Method method, int i, int i2, boolean z) {
        this.a = yoe.a(type);
        this.b = set;
        this.c = stageBranchDataAdapter;
        this.d = method;
        this.e = i2;
        this.f = new jb6[i - i2];
        this.g = z;
    }

    public void a(x38 x38Var, j8 j8Var) {
        jb6[] jb6VarArr = this.f;
        if (jb6VarArr.length > 0) {
            Method method = this.d;
            Type[] genericParameterTypes = method.getGenericParameterTypes();
            Annotation[][] parameterAnnotations = method.getParameterAnnotations();
            int length = genericParameterTypes.length;
            int i = this.e;
            for (int i2 = i; i2 < length; i2++) {
                Type type = ((ParameterizedType) genericParameterTypes[i2]).getActualTypeArguments()[0];
                Set setF = yoe.f(parameterAnnotations[i2]);
                jb6VarArr[i2 - i] = (vn7.u(this.a, type) && this.b.equals(setF)) ? x38Var.c(j8Var, type, setF) : x38Var.a(type, setF, null);
            }
        }
    }

    public Object b(hd6 hd6Var) {
        throw new AssertionError();
    }

    public final Object c(Object obj) {
        jb6[] jb6VarArr = this.f;
        Object[] objArr = new Object[jb6VarArr.length + 1];
        objArr[0] = obj;
        System.arraycopy(jb6VarArr, 0, objArr, 1, jb6VarArr.length);
        try {
            return this.d.invoke(this.c, objArr);
        } catch (IllegalAccessException unused) {
            ywb.d();
            return null;
        }
    }

    public void d(zd6 zd6Var, Object obj) {
        throw new AssertionError();
    }
}
