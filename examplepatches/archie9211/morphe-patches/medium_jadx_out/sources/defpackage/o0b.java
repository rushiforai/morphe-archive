package defpackage;

import java.lang.reflect.Field;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class o0b extends x55 implements x45 {
    public static final o0b a = new o0b(1, w0b.class, "<init>", "<init>(Ljava/lang/reflect/Field;)V", 0);

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Field field = (Field) obj;
        field.getClass();
        return new w0b(field);
    }
}
