package sprig.c;

import defpackage.ajb;
import defpackage.bjb;
import defpackage.x45;
import java.lang.reflect.Field;
import java.util.Arrays;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\u001a\u0017\u0010\u0003\u001a\u0004\u0018\u00010\u0001*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u0001H\u0086\u0002\u001a<\u0010\u0003\u001a\u0004\u0018\u00010\u0001*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u00012\u0010\u0010\u0006\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00050\u00042\n\u0010\u0007\u001a\u0006\u0012\u0002\b\u00030\u0004H\u0086\u0002¢\u0006\u0004\b\u0003\u0010\b\u001a\u0017\u0010\u0003\u001a\u0004\u0018\u00010\u0001*\u00020\t2\u0006\u0010\u0002\u001a\u00020\u0001H\u0086\u0002¨\u0006\n"}, d2 = {"Lsprig/c/c;", "", "target", "invoke", "", "Ljava/lang/Class;", "parameterTypes", "parameters", "(Lsprig/c/c;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;", "Lsprig/c/b;", "userleap_release"}, k = 2, mv = {1, 8, 0})
public final class f {
    public static final Object invoke(c cVar, Object obj, Class<?>[] clsArr, Object[] objArr) {
        Object ajbVar;
        cVar.getClass();
        obj.getClass();
        clsArr.getClass();
        objArr.getClass();
        try {
            ajbVar = obj.getClass().getMethod(cVar.getName(), (Class[]) Arrays.copyOf(clsArr, clsArr.length)).invoke(obj, Arrays.copyOf(objArr, objArr.length));
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        x45 errorReporter = cVar.getErrorReporter();
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            errorReporter.invoke(thB);
        }
        if (ajbVar instanceof ajb) {
            return null;
        }
        return ajbVar;
    }

    public static final Object invoke(c cVar, Object obj) {
        Object ajbVar;
        cVar.getClass();
        obj.getClass();
        try {
            ajbVar = obj.getClass().getMethod(cVar.getName(), null).invoke(obj, null);
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        x45 errorReporter = cVar.getErrorReporter();
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            errorReporter.invoke(thB);
        }
        if (ajbVar instanceof ajb) {
            return null;
        }
        return ajbVar;
    }

    public static final Object invoke(b bVar, Object obj) {
        Object ajbVar;
        bVar.getClass();
        obj.getClass();
        try {
            Field declaredField = obj.getClass().getDeclaredField(bVar.getName());
            declaredField.setAccessible(true);
            ajbVar = declaredField.get(obj);
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        x45 errorReporter = bVar.getErrorReporter();
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            errorReporter.invoke(thB);
        }
        if (ajbVar instanceof ajb) {
            return null;
        }
        return ajbVar;
    }
}
