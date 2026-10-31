package com.apm.insight.runtime;

import android.os.SystemClock;
import android.util.Printer;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class i {

    /* renamed from: a, reason: collision with root package name */
    private static i f21889a;

    /* renamed from: b, reason: collision with root package name */
    private long f21890b = -1;

    /* renamed from: c, reason: collision with root package name */
    private final List<Printer> f21891c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    private final List<Printer> f21892d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    private boolean f21893e = false;

    static {
        new Printer() { // from class: com.apm.insight.runtime.i.1
            @Override // android.util.Printer
            public final void println(String str) {
                if (str == null) {
                    return;
                }
                if (str.charAt(0) == '>') {
                    i.a().a(str);
                } else if (str.charAt(0) == '<') {
                    i.a().b(str);
                }
                i.c();
            }
        };
    }

    private i() {
    }

    public static i a() {
        if (f21889a == null) {
            synchronized (i.class) {
                try {
                    if (f21889a == null) {
                        f21889a = new i();
                    }
                } finally {
                }
            }
        }
        return f21889a;
    }

    public static /* synthetic */ Printer c() {
        return null;
    }

    public final boolean b() {
        return this.f21890b != -1 && SystemClock.uptimeMillis() - this.f21890b > 5000;
    }

    public final void b(String str) {
        this.f21890b = SystemClock.uptimeMillis();
        try {
            a(this.f21892d, str);
        } catch (Exception e3) {
            com.apm.insight.a.b((Throwable) e3);
        }
    }

    public final void a(String str) {
        this.f21890b = -1L;
        try {
            a(this.f21891c, str);
        } catch (Exception e3) {
            com.apm.insight.a.a((Throwable) e3);
        }
    }

    private static void a(List<? extends Printer> list, String str) {
        if (list == null || list.isEmpty()) {
            return;
        }
        try {
            int size = list.size();
            for (int i5 = 0; i5 < size; i5++) {
                Printer printer = list.get(i5);
                if (printer == null) {
                    return;
                }
                printer.println(str);
            }
        } catch (Throwable th2) {
            com.apm.insight.a.a(th2);
        }
    }
}
