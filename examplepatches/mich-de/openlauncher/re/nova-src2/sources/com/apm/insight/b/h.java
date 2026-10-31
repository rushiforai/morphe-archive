package com.apm.insight.b;

import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Printer;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    private static volatile boolean f21510a;

    /* renamed from: b, reason: collision with root package name */
    private static Printer f21511b;

    /* renamed from: c, reason: collision with root package name */
    private static final CopyOnWriteArrayList<e> f21512c = new CopyOnWriteArrayList<>();

    /* renamed from: d, reason: collision with root package name */
    private static volatile boolean f21513d = false;

    /* loaded from: classes2.dex */
    public interface a {
        String a();

        String b();

        String c();
    }

    public static void a() throws NoSuchFieldException, SecurityException {
        if (f21510a) {
            return;
        }
        f21510a = true;
        f21511b = new Printer() { // from class: com.apm.insight.b.h.1
            @Override // android.util.Printer
            public final void println(String str) {
                if (TextUtils.isEmpty(str)) {
                    return;
                }
                if (str.charAt(0) == '>') {
                    h.a(true, str);
                } else if (str.charAt(0) == '<') {
                    h.a(false, str);
                }
            }
        };
        i.a();
        i.a(f21511b);
    }

    public static void a(e eVar) {
        CopyOnWriteArrayList<e> copyOnWriteArrayList = f21512c;
        synchronized (copyOnWriteArrayList) {
            copyOnWriteArrayList.add(eVar);
        }
    }

    public static void a(boolean z11, String str) {
        e.f21456a = System.nanoTime() / 1000000;
        e.f21457b = SystemClock.currentThreadTimeMillis();
        CopyOnWriteArrayList<e> copyOnWriteArrayList = f21512c;
        for (int i5 = 0; i5 < copyOnWriteArrayList.size(); i5++) {
            e eVar = copyOnWriteArrayList.get(i5);
            if (eVar == null || !eVar.a()) {
                if (!z11 && eVar.f21458c) {
                    eVar.b(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                }
            } else if (z11) {
                if (!eVar.f21458c) {
                    eVar.a(str);
                }
            } else if (eVar.f21458c) {
                eVar.b(str);
            }
        }
    }
}
