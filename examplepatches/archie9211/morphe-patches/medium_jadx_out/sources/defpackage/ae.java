package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ae extends x55 implements b55 {
    public static final ae a = new ae(2, nk7.class, "max", "max(II)I", 1);

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return Integer.valueOf(Math.max(((Number) obj).intValue(), ((Number) obj2).intValue()));
    }
}
