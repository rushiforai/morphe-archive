package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class tj2 {
    public static final x2b a = new x2b("^lo_.*");

    public static boolean a(String str) {
        return (str == null || muc.b0(str) || b(str)) ? false : true;
    }

    public static boolean b(String str) {
        return str != null && a.c(str);
    }
}
