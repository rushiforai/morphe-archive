package defpackage;

import android.content.Context;
import android.os.Build;
import j$.time.ZoneOffset;
import j$.time.format.DateTimeFormatter;
import j$.util.DateRetargetClass;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dj5 {
    public static final ny9 b = new ny9("fire-global");
    public static final ny9 c = new ny9("fire-count");
    public static final ny9 d = new ny9("last-used-date");
    public final x86 a;

    public dj5(Context context, String str) {
        this.a = new x86(context, "FirebaseHeartBeat".concat(str));
    }

    public final synchronized long a(b78 b78Var) {
        long j;
        try {
            long jLongValue = ((Long) w2g.v(b78Var, c, 0L)).longValue();
            String str = "";
            Set hashSet = new HashSet();
            String str2 = null;
            for (Map.Entry entry : b78Var.a().entrySet()) {
                if (entry.getValue() instanceof Set) {
                    Set<String> set = (Set) entry.getValue();
                    for (String str3 : set) {
                        if (str2 == null || str2.compareTo(str3) > 0) {
                            str = ((ny9) entry.getKey()).a;
                            hashSet = set;
                            str2 = str3;
                        }
                    }
                }
            }
            HashSet hashSet2 = new HashSet(hashSet);
            hashSet2.remove(str2);
            str.getClass();
            b78Var.d(new ny9(str), hashSet2);
            j = jLongValue - 1;
            b78Var.c(c, Long.valueOf(j));
        } catch (Throwable th) {
            throw th;
        }
        return j;
    }

    public final synchronized void b() {
        this.a.a(new ff4(12, this));
    }

    public final synchronized ArrayList c() {
        ArrayList arrayList;
        try {
            arrayList = new ArrayList();
            String strD = d(System.currentTimeMillis());
            for (Map.Entry entry : ((Map) g01.U(zx3.a, new m1(this.a, null, 24))).entrySet()) {
                if (entry.getValue() instanceof Set) {
                    HashSet hashSet = new HashSet((Set) entry.getValue());
                    hashSet.remove(strD);
                    if (!hashSet.isEmpty()) {
                        arrayList.add(new nj0(((ny9) entry.getKey()).a, new ArrayList(hashSet)));
                    }
                }
            }
            l(System.currentTimeMillis());
        } catch (Throwable th) {
            throw th;
        }
        return arrayList;
    }

    public final synchronized String d(long j) {
        if (Build.VERSION.SDK_INT >= 26) {
            return DateRetargetClass.toInstant(new Date(j)).atOffset(ZoneOffset.UTC).toLocalDateTime().format(DateTimeFormatter.ISO_LOCAL_DATE);
        }
        return new SimpleDateFormat("yyyy-MM-dd", Locale.UK).format(new Date(j));
    }

    public final synchronized ny9 e(b78 b78Var, String str) {
        for (Map.Entry entry : b78Var.a().entrySet()) {
            if (entry.getValue() instanceof Set) {
                Iterator it2 = ((Set) entry.getValue()).iterator();
                while (it2.hasNext()) {
                    if (str.equals((String) it2.next())) {
                        String str2 = ((ny9) entry.getKey()).a;
                        str2.getClass();
                        return new ny9(str2);
                    }
                }
            }
        }
        return null;
    }

    public final synchronized boolean f(long j, long j2) {
        return d(j).equals(d(j2));
    }

    public final synchronized void g() {
        this.a.a(new si3(this, 15, d(System.currentTimeMillis())));
    }

    public final synchronized void h(b78 b78Var, String str) {
        ny9 ny9VarE = e(b78Var, str);
        if (ny9VarE == null) {
            return;
        }
        HashSet hashSet = new HashSet((Collection) w2g.v(b78Var, ny9VarE, new HashSet()));
        hashSet.remove(str);
        if (hashSet.isEmpty()) {
            b78Var.b();
            b78Var.a.remove(ny9VarE);
        } else {
            b78Var.d(ny9VarE, hashSet);
        }
    }

    public final synchronized boolean i(long j) {
        return j(b, j);
    }

    public final synchronized boolean j(ny9 ny9Var, long j) {
        x86 x86Var = this.a;
        ny9Var.getClass();
        n92 n92Var = null;
        xs3 xs3Var = new xs3(x86Var, ny9Var, n92Var, 22);
        zx3 zx3Var = zx3.a;
        if (f(((Long) g01.U(zx3Var, xs3Var)).longValue(), j)) {
            return false;
        }
        return true;
    }

    public final synchronized void k(long j, String str) throws Throwable {
        try {
            try {
                String strD = d(j);
                str.getClass();
                ny9 ny9Var = new ny9(str);
                this.a.a(new iu(this, strD, str, ny9Var, 8));
            } catch (Throwable th) {
                th = th;
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    public final synchronized void l(long j) {
        this.a.a(new ro(4, j));
    }
}
