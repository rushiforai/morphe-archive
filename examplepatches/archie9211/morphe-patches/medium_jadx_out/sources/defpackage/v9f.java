package defpackage;

import com.adobe.internal.xmp.XMPException;
import java.util.HashMap;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class v9f {
    public static final o2b a;
    public static e1g b;

    static {
        o2b o2bVar = new o2b(17, false);
        o2bVar.b = new HashMap();
        o2bVar.c = new HashMap();
        o2bVar.d = new HashMap();
        o2bVar.e = Pattern.compile("[/*?\\[\\]]");
        try {
            o2bVar.G();
            o2bVar.F();
            a = o2bVar;
            b = null;
        } catch (XMPException unused) {
            ygf.i("The XMPSchemaRegistry cannot be initialized!");
        }
    }
}
