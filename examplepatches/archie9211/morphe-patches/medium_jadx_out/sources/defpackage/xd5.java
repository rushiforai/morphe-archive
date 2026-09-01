package defpackage;

import com.google.android.gms.internal.gtm.zzbu;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xd5 {
    public static ArrayList b = new ArrayList();
    public final zzbu a;

    public xd5(zzbu zzbuVar) {
        qjg qjgVarZzd = zzbuVar.zzd();
        cp1 cp1VarZzr = zzbuVar.zzr();
        vp7.p(qjgVarZzd);
        new ArrayList();
        vp7.p(cp1VarZzr);
        new HashMap();
        new ArrayList();
        this.a = zzbuVar;
        new HashSet();
    }

    public static void a() {
        synchronized (xd5.class) {
            try {
                ArrayList arrayList = b;
                if (arrayList != null) {
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        ((Runnable) it2.next()).run();
                    }
                    b = null;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
