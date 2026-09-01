package defpackage;

import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wk1 {
    public static final Charset a;
    public static final Charset b;
    public static final Charset c;
    public static final Charset d;
    public static final Charset e;
    public static volatile Charset f;
    public static volatile Charset g;

    static {
        Charset charsetForName = Charset.forName("UTF-8");
        charsetForName.getClass();
        a = charsetForName;
        Charset.forName("UTF-16").getClass();
        Charset charsetForName2 = Charset.forName("UTF-16BE");
        charsetForName2.getClass();
        b = charsetForName2;
        Charset charsetForName3 = Charset.forName("UTF-16LE");
        charsetForName3.getClass();
        c = charsetForName3;
        Charset charsetForName4 = Charset.forName("US-ASCII");
        charsetForName4.getClass();
        d = charsetForName4;
        Charset charsetForName5 = Charset.forName("ISO-8859-1");
        charsetForName5.getClass();
        e = charsetForName5;
    }
}
