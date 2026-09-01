package defpackage;

import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class d49 extends x55 implements x45 {
    public static final d49 a = new d49(1, kyd.class, "typeToString", "typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;", 1);

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Type type = (Type) obj;
        type.getClass();
        return kyd.k0(type);
    }
}
