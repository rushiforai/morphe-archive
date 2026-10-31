package lm;

import android.content.Context;
import b.c0;
import cl.k0;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import v70.o;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: b, reason: collision with root package name */
    public static final y5.f f75049b = o.h("fire-global");

    /* renamed from: c, reason: collision with root package name */
    public static final y5.f f75050c = o.h("fire-count");

    /* renamed from: d, reason: collision with root package name */
    public static final y5.f f75051d = o.m("last-used-date");

    /* renamed from: a, reason: collision with root package name */
    public final dm.d f75052a;

    public j(Context context, String str) {
        this.f75052a = new dm.d(context, c0.k("FirebaseHeartBeat", str));
    }

    public static String b(long j11) {
        return new Date(j11).toInstant().atOffset(ZoneOffset.UTC).toLocalDateTime().format(DateTimeFormatter.ISO_LOCAL_DATE);
    }

    public static y5.f c(y5.b bVar, String str) {
        for (Map.Entry entry : bVar.a().entrySet()) {
            if (entry.getValue() instanceof Set) {
                Iterator it = ((Set) entry.getValue()).iterator();
                while (it.hasNext()) {
                    if (str.equals((String) it.next())) {
                        return o.n(((y5.f) entry.getKey()).f96729a);
                    }
                }
            }
        }
        return null;
    }

    public static void d(y5.b bVar, String str) {
        y5.f fVarC = c(bVar, str);
        if (fVarC == null) {
            return;
        }
        HashSet hashSet = new HashSet((Collection) k0.y(bVar, fVarC, new HashSet()));
        hashSet.remove(str);
        if (hashSet.isEmpty()) {
            bVar.c(fVarC);
        } else {
            bVar.e(fVarC, hashSet);
        }
    }

    public final synchronized ArrayList a() {
        try {
            ArrayList arrayList = new ArrayList();
            String strB = b(System.currentTimeMillis());
            for (Map.Entry entry : this.f75052a.b().entrySet()) {
                if (entry.getValue() instanceof Set) {
                    HashSet hashSet = new HashSet((Set) entry.getValue());
                    hashSet.remove(strB);
                    if (!hashSet.isEmpty()) {
                        arrayList.add(a.a(((y5.f) entry.getKey()).f96729a, new ArrayList(hashSet)));
                    }
                }
            }
            long jCurrentTimeMillis = System.currentTimeMillis();
            synchronized (this) {
                this.f75052a.a(new i(jCurrentTimeMillis, 0));
            }
            return arrayList;
        } catch (Throwable th2) {
            throw th2;
        }
        return arrayList;
    }

    public final synchronized boolean e(y5.f fVar, long j11) {
        if (b(((Long) this.f75052a.c(fVar, -1L)).longValue()).equals(b(j11))) {
            return false;
        }
        this.f75052a.d(fVar, Long.valueOf(j11));
        return true;
    }
}
