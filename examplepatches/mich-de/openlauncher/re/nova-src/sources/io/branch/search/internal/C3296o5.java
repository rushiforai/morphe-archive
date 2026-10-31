package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: io.branch.search.internal.o5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3296o5 {

    /* renamed from: a, reason: collision with root package name */
    public static final a f65426a = new a();

    /* renamed from: b, reason: collision with root package name */
    public static final ArrayList f65427b = new ArrayList();

    /* renamed from: io.branch.search.internal.o5$a */
    public static class a {

        /* renamed from: a, reason: collision with root package name */
        public H f65428a;
    }

    public static void a(F6 f62) {
        M2 m22;
        B2.Companion.getClass();
        M2 m23 = null;
        if (B2.f62101g != null) {
            B2 b22 = B2.f62101g;
            if (b22 == null) {
                Intrinsics.m("instance");
                throw null;
            }
            m22 = b22.f62104b;
        } else {
            m22 = null;
        }
        if (m22 != null) {
            a debugLoggingData = f65426a;
            Intrinsics.g(debugLoggingData, "debugLoggingData");
            debugLoggingData.f65428a = m22.o;
        }
        a debugLoggingData2 = f65426a;
        H h5 = debugLoggingData2.f65428a;
        if (h5 != null) {
            h5.a(f62.f62447a, f62.f62448b, f62.f62449c, f62.f62450d);
            return;
        }
        ArrayList arrayList = f65427b;
        synchronized (arrayList) {
            try {
                if (B2.f62101g != null) {
                    B2 b23 = B2.f62101g;
                    if (b23 == null) {
                        Intrinsics.m("instance");
                        throw null;
                    }
                    m23 = b23.f62104b;
                }
                if (m23 != null) {
                    Intrinsics.g(debugLoggingData2, "debugLoggingData");
                    debugLoggingData2.f65428a = m23.o;
                }
                H h8 = debugLoggingData2.f65428a;
                if (h8 != null) {
                    h8.a(f62.f62447a, f62.f62448b, f62.f62449c, f62.f62450d);
                    return;
                }
                if (arrayList.size() > 100) {
                    arrayList.remove(0);
                }
                arrayList.add(f62);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static void a(String str, String str2) {
        a(new F6(str, str2, "failed to pass in timestamp", null));
    }

    public static void a(String str, Throwable th2, String str2) {
        a(new F6(str, str2, null, th2, null));
    }

    public static void a(I i5) {
        ArrayList arrayList = f65427b;
        synchronized (arrayList) {
            try {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    F6 f62 = (F6) it.next();
                    i5.a(UUID.randomUUID().toString(), f62.f62448b, f62.f62449c, f62.f62450d);
                }
                f65427b.clear();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
