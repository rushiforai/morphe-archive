package defpackage;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jh5 implements kud {
    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        ch5Var.getClass();
        kxdVar.getClass();
        Type typeD = kxdVar.d();
        if (!g76.L(kxdVar.c(), List.class) || !(typeD instanceof ParameterizedType)) {
            return null;
        }
        Type type = ((ParameterizedType) typeD).getActualTypeArguments()[0];
        return new p04(ch5Var, type, ch5Var.d(kxd.b(type)));
    }
}
