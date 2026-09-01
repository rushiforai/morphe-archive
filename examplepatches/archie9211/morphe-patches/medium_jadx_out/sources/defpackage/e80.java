package defpackage;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class e80 implements kud {
    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        Type typeD = kxdVar.d();
        boolean z = typeD instanceof GenericArrayType;
        if (!z && (!(typeD instanceof Class) || !((Class) typeD).isArray())) {
            return null;
        }
        Type genericComponentType = z ? ((GenericArrayType) typeD).getGenericComponentType() : ((Class) typeD).getComponentType();
        return new f80(ch5Var, ch5Var.d(kxd.b(genericComponentType)), d46.M(genericComponentType));
    }
}
