package defpackage;

import java.lang.reflect.Constructor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class m0b extends x55 implements x45 {
    public static final m0b a = new m0b(1, t0b.class, "<init>", "<init>(Ljava/lang/reflect/Constructor;)V", 0);

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Constructor constructor = (Constructor) obj;
        constructor.getClass();
        return new t0b(constructor);
    }
}
