package defpackage;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xof {
    public static final y70 a = new y70(0);
    public static final y70 b = new y70(0);

    public static void a(String str) {
        y70 y70Var = a;
        synchronized (y70Var) {
            if (y70Var.get(str) != null) {
                throw new ClassCastException();
            }
        }
        throw new IllegalStateException("Tried to get the emulator widget endpoint, but no emulator endpoint overrides found.");
    }

    public static void b(String str, bh4 bh4Var) {
        y70 y70Var = b;
        synchronized (y70Var) {
            try {
                if (y70Var.containsKey(str)) {
                    ((List) y70Var.get(str)).add(new WeakReference(bh4Var));
                } else {
                    ArrayList arrayList = new ArrayList();
                    arrayList.add(new WeakReference(bh4Var));
                    y70Var.put(str, arrayList);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static String c(String str) {
        y70 y70Var = a;
        synchronized (y70Var) {
            if (y70Var.get(str) != null) {
                throw new ClassCastException();
            }
        }
        return "https://".concat("www.googleapis.com/identitytoolkit/v3/relyingparty");
    }

    public static String d(String str) {
        y70 y70Var = a;
        synchronized (y70Var) {
            if (y70Var.get(str) != null) {
                throw new ClassCastException();
            }
        }
        return "https://".concat("identitytoolkit.googleapis.com/v2");
    }
}
