package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xxf {
    public final Object a;
    public final Object b;
    public final Object c;

    public xxf(Object obj, Object obj2, Object obj3) {
        this.a = obj;
        this.b = obj2;
        this.c = obj3;
    }

    public final IllegalArgumentException a() {
        Object obj = this.a;
        String strValueOf = String.valueOf(obj);
        String strValueOf2 = String.valueOf(this.b);
        return new IllegalArgumentException(y30.s(y30.u("Multiple entries with same key: ", strValueOf, "=", strValueOf2, " and "), String.valueOf(obj), "=", String.valueOf(this.c)));
    }
}
