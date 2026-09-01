package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class jyd extends x55 implements x45 {
    public static final jyd a = new jyd(1, Class.class, "getComponentType", "getComponentType()Ljava/lang/Class;", 0);

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Class cls = (Class) obj;
        cls.getClass();
        return cls.getComponentType();
    }
}
