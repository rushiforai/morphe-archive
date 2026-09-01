package defpackage;

import java.security.AccessControlException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gta implements gn6 {
    public static final boolean i;
    public static final HashMap j;
    public int[] a;
    public String b;
    public int c;
    public String[] d;
    public String[] e;
    public String[] f;
    public xm6 g;
    public String[] h;

    static {
        try {
            i = "true".equals(System.getProperty("kotlin.ignore.old.metadata"));
        } catch (AccessControlException unused) {
            i = false;
        }
        HashMap map = new HashMap();
        j = map;
        map.put(kng.P(new y05("kotlin.jvm.internal.KotlinClass")), xm6.CLASS);
        map.put(kng.P(new y05("kotlin.jvm.internal.KotlinFileFacade")), xm6.FILE_FACADE);
        map.put(kng.P(new y05("kotlin.jvm.internal.KotlinMultifileClass")), xm6.MULTIFILE_CLASS);
        map.put(kng.P(new y05("kotlin.jvm.internal.KotlinMultifileClassPart")), xm6.MULTIFILE_CLASS_PART);
        map.put(kng.P(new y05("kotlin.jvm.internal.KotlinSyntheticClass")), xm6.SYNTHETIC_CLASS);
    }

    @Override // defpackage.gn6
    public final en6 i(mn1 mn1Var, d0b d0bVar) {
        xm6 xm6Var;
        y05 y05VarA = mn1Var.a();
        if (y05VarA.equals(de6.a)) {
            return new eta(this, 0);
        }
        if (y05VarA.equals(de6.o)) {
            return new hha(this);
        }
        if (i || this.g != null || (xm6Var = (xm6) j.get(mn1Var)) == null) {
            return null;
        }
        this.g = xm6Var;
        return new eta(this, 1);
    }
}
