package defpackage;

import j$.util.DesugarCollections;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gh5 extends x92 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ gh5(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public static Set c(Annotation[] annotationArr) {
        LinkedHashSet linkedHashSet = null;
        for (Annotation annotation : annotationArr) {
            if (annotation.annotationType().isAnnotationPresent(bd6.class)) {
                if (linkedHashSet == null) {
                    linkedHashSet = new LinkedHashSet();
                }
                linkedHashSet.add(annotation);
            }
        }
        return linkedHashSet != null ? DesugarCollections.unmodifiableSet(linkedHashSet) : Collections.EMPTY_SET;
    }

    @Override // defpackage.x92
    public final y92 a(Type type, Annotation[] annotationArr) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ch5 ch5Var = (ch5) obj;
                return new lh5(ch5Var, ch5Var.d(kxd.b(type)));
            default:
                return new y38(((x38) obj).a(type, c(annotationArr), null));
        }
    }

    @Override // defpackage.x92
    public final y92 b(Type type, Annotation[] annotationArr, kjb kjbVar) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ch5 ch5Var = (ch5) obj;
                return new olb(ch5Var, 15, ch5Var.d(kxd.b(type)));
            default:
                return new z38(((x38) obj).a(type, c(annotationArr), null));
        }
    }
}
