package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class p0b extends x55 implements x45 {
    public static final p0b a = new p0b(1, z0b.class, "<init>", "<init>(Ljava/lang/reflect/Method;)V", 0);

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Method method = (Method) obj;
        method.getClass();
        return new z0b(method);
    }
}
