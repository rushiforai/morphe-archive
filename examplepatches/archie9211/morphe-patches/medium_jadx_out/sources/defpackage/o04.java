package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class o04 implements kud {
    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        Class clsC = kxdVar.c();
        if (!Enum.class.isAssignableFrom(clsC) || clsC == Enum.class) {
            return null;
        }
        if (!clsC.isEnum()) {
            clsC = clsC.getSuperclass();
        }
        return new q04(clsC);
    }
}
