package defpackage;

import java.lang.ref.SoftReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k1b implements m45 {
    public static final tz7 c = new tz7(22, false);
    public final m45 a;
    public volatile SoftReference b;

    public k1b(Object obj, m45 m45Var) {
        if (m45Var == null) {
            ay0.e("Argument for @NotNull parameter 'initializer' of kotlin/reflect/jvm/internal/ReflectProperties$LazySoftVal.<init> must not be null");
            throw null;
        }
        this.b = null;
        this.a = m45Var;
        if (obj != null) {
            this.b = new SoftReference(obj);
        }
    }

    @Override // defpackage.m45
    public final Object invoke() {
        Object obj;
        Object obj2 = c;
        SoftReference softReference = this.b;
        if (softReference != null && (obj = softReference.get()) != null) {
            if (obj == obj2) {
                return null;
            }
            return obj;
        }
        Object objInvoke = this.a.invoke();
        if (objInvoke != null) {
            obj2 = objInvoke;
        }
        this.b = new SoftReference(obj2);
        return objInvoke;
    }
}
