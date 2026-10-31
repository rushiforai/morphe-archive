package com.apm.insight.b;

import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.util.Printer;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    private static int f21514a = 5;

    /* renamed from: b, reason: collision with root package name */
    private static b f21515b;

    /* renamed from: c, reason: collision with root package name */
    private static boolean f21516c;

    /* renamed from: d, reason: collision with root package name */
    private static Printer f21517d;

    public interface a {
    }

    public static class b implements Printer {

        /* renamed from: a, reason: collision with root package name */
        List<Printer> f21518a = new ArrayList();

        /* renamed from: d, reason: collision with root package name */
        private List<Printer> f21521d = new ArrayList();

        /* renamed from: b, reason: collision with root package name */
        List<Printer> f21519b = new ArrayList();

        /* renamed from: e, reason: collision with root package name */
        private boolean f21522e = false;

        /* renamed from: c, reason: collision with root package name */
        boolean f21520c = false;

        @Override // android.util.Printer
        public final void println(String str) {
            if (TextUtils.isEmpty(str)) {
                return;
            }
            i.b();
            if (str.charAt(0) == '>' && this.f21520c) {
                for (Printer printer : this.f21519b) {
                    if (!this.f21518a.contains(printer)) {
                        this.f21518a.add(printer);
                    }
                }
                this.f21519b.clear();
                this.f21520c = false;
            }
            if (this.f21518a.size() > i.f21514a) {
                Log.e("LooperPrinterUtils", "wrapper contains too many printer,please check if the useless printer have been removed");
            }
            for (Printer printer2 : this.f21518a) {
                if (printer2 != null) {
                    printer2.println(str);
                }
            }
            i.b();
        }
    }

    public static void a() throws NoSuchFieldException, SecurityException {
        if (f21516c) {
            return;
        }
        f21516c = true;
        f21515b = new b();
        Printer printerD = d();
        f21517d = printerD;
        if (printerD != null) {
            f21515b.f21518a.add(printerD);
        }
        if (com.apm.insight.e.s()) {
            Looper.getMainLooper().setMessageLogging(f21515b);
        }
    }

    public static /* synthetic */ a b() {
        return null;
    }

    private static Printer d() throws NoSuchFieldException, SecurityException {
        try {
            Field declaredField = Class.forName("android.os.Looper").getDeclaredField("mLogging");
            declaredField.setAccessible(true);
            return (Printer) declaredField.get(Looper.getMainLooper());
        } catch (Exception unused) {
            return null;
        }
    }

    public static void a(Printer printer) {
        if (printer == null || f21515b.f21519b.contains(printer)) {
            return;
        }
        f21515b.f21519b.add(printer);
        f21515b.f21520c = true;
    }
}
