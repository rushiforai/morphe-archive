package com.pgl.ssdk;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.os.Handler;
import android.view.Display;

/* loaded from: classes.dex */
public class aa {

    /* renamed from: a, reason: collision with root package name */
    private static volatile DisplayManager.DisplayListener f42249a = null;

    /* renamed from: b, reason: collision with root package name */
    private static volatile boolean f42250b = false;

    /* renamed from: c, reason: collision with root package name */
    private static String f42251c = null;

    /* renamed from: d, reason: collision with root package name */
    private static String f42252d = null;

    /* renamed from: e, reason: collision with root package name */
    private static String f42253e = null;

    /* renamed from: f, reason: collision with root package name */
    private static volatile boolean f42254f = false;

    /* renamed from: g, reason: collision with root package name */
    private static volatile boolean f42255g = false;

    /* renamed from: h, reason: collision with root package name */
    private static DisplayManager f42256h;

    public static class a implements DisplayManager.DisplayListener {
        @Override // android.hardware.display.DisplayManager.DisplayListener
        public void onDisplayAdded(int i5) {
            aa.b(i5, 1);
        }

        @Override // android.hardware.display.DisplayManager.DisplayListener
        public void onDisplayChanged(int i5) {
            aa.b(i5, 3);
        }

        @Override // android.hardware.display.DisplayManager.DisplayListener
        public void onDisplayRemoved(int i5) {
            aa.b(i5, 2);
        }
    }

    private static String a(int i5) {
        Display display = f42256h.getDisplay(i5);
        return display != null ? a(display) : "pd";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void b(int i5, int i11) {
        if (i5 == 0) {
            return;
        }
        try {
            String strA = a(i5);
            if (i11 == 1) {
                if (strA.equals(f42251c)) {
                    return;
                }
                f42251c = strA;
            } else if (i11 == 2) {
                if (strA.equals(f42252d)) {
                    return;
                }
                f42252d = strA;
            } else {
                if (i11 != 3 || strA.equals(f42253e)) {
                    return;
                }
                f42253e = strA;
            }
        } catch (Throwable unused) {
        }
    }

    private static String a(Display display) {
        String name = display.getName();
        boolean z11 = false;
        Object objA = au.a(display, display.getClass(), "getType", new Class[0], new Object[0]);
        Object objA2 = au.a(display, display.getClass(), "getOwnerPackageName", new Class[0], new Object[0]);
        Object objA3 = au.a(null, display.getClass(), "TYPE_VIRTUAL", null);
        if (objA != null && objA3 != null && ((Integer) objA).intValue() == ((Integer) objA3).intValue()) {
            z11 = true;
        }
        return String.format("%s#%s#%b", objA2, name, Boolean.valueOf(z11));
    }

    public static void b(Context context) {
        Handler handlerB;
        if (f42250b) {
            return;
        }
        if (f42249a == null) {
            f42249a = new a();
        }
        if (f42256h == null) {
            f42256h = (DisplayManager) context.getSystemService("display");
        }
        if (f42256h == null || (handlerB = ar.b()) == null) {
            return;
        }
        try {
            f42256h.registerDisplayListener(f42249a, handlerB);
            f42250b = true;
        } catch (Exception unused) {
        }
    }

    public static boolean a(Context context) {
        Display[] displays;
        if (f42250b && (f42251c != null || f42252d != null || f42253e != null)) {
            return true;
        }
        if (f42250b && f42254f) {
            return f42255g;
        }
        int i5 = 0;
        if (context == null) {
            return false;
        }
        if (f42256h == null) {
            f42256h = (DisplayManager) context.getSystemService("display");
        }
        DisplayManager displayManager = f42256h;
        if (displayManager != null && (displays = displayManager.getDisplays()) != null) {
            int length = displays.length;
            while (true) {
                if (i5 < length) {
                    Display display = displays[i5];
                    if (display != null && display.getDisplayId() != 0) {
                        f42255g = true;
                        break;
                    }
                    i5++;
                } else {
                    break;
                }
            }
        }
        f42254f = true;
        return f42255g;
    }
}
