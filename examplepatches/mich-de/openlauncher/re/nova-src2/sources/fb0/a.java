package fb0;

import aq.h0;
import aq.t;
import eb0.l;
import eb0.m;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

/* loaded from: classes5.dex */
public final class a extends l {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f54586a;

    public a(h0 h0Var) {
        this.f54586a = h0Var;
    }

    public static Set c(Annotation[] annotationArr) {
        LinkedHashSet linkedHashSet = null;
        for (Annotation annotation : annotationArr) {
            if (annotation.annotationType().isAnnotationPresent(t.class)) {
                if (linkedHashSet == null) {
                    linkedHashSet = new LinkedHashSet();
                }
                linkedHashSet.add(annotation);
            }
        }
        return linkedHashSet != null ? Collections.unmodifiableSet(linkedHashSet) : Collections.EMPTY_SET;
    }

    @Override // eb0.l
    public final m a(Type type, Annotation[] annotationArr, Annotation[] annotationArr2, bm.t tVar) {
        return new b(this.f54586a.b(type, c(annotationArr), null));
    }

    @Override // eb0.l
    public final m b(Type type, Annotation[] annotationArr, bm.t tVar) {
        return new c(this.f54586a.b(type, c(annotationArr), null));
    }
}
