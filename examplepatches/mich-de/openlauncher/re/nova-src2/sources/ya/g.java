package ya;

import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.util.ArrayMap;
import android.util.ArraySet;
import android.util.Log;
import android.view.Display;
import java.util.ArrayList;
import java.util.Collections;
import o9.g3;

/* loaded from: classes.dex */
public final class g implements DisplayManager.DisplayListener, ComponentCallbacks, j0 {

    /* renamed from: h, reason: collision with root package name */
    public static final x7.c f97130h = new x7.c(new c(0));

    /* renamed from: a, reason: collision with root package name */
    public final Context f97131a;

    /* renamed from: b, reason: collision with root package name */
    public final DisplayManager f97132b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f97133c;

    /* renamed from: d, reason: collision with root package name */
    public mx.y f97134d;

    /* renamed from: f, reason: collision with root package name */
    public e f97136f;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f97135e = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public boolean f97137g = false;

    public g(Context context) {
        this.f97131a = context;
        DisplayManager displayManager = (DisplayManager) context.getSystemService(DisplayManager.class);
        this.f97132b = displayManager;
        Display display = displayManager.getDisplay(0);
        boolean z11 = g3.f79853h;
        if (z11) {
            Context contextCreateWindowContext = context.createWindowContext(display, 2, null);
            this.f97133c = contextCreateWindowContext;
            contextCreateWindowContext.registerComponentCallbacks(this);
        } else {
            this.f97133c = null;
            context.registerReceiver(new n10.a(new fa.f(this, 6)), new IntentFilter("android.intent.action.CONFIGURATION_CHANGED"));
        }
        this.f97136f = new e(z11 ? this.f97133c : context.createDisplayContext(display), display, a(displayManager), Collections.EMPTY_MAP);
        displayManager.registerDisplayListener(this, j.f97148c.f97215a);
    }

    public static ArrayMap a(DisplayManager displayManager) {
        Display[] displays = displayManager.getDisplays();
        ArrayMap arrayMap = new ArrayMap();
        for (Display display : displays) {
            if (display.getDisplayId() == 0) {
                Point point = new Point();
                display.getRealSize(point);
                arrayMap.put(Integer.toString(display.getDisplayId()), new f(point.x, point.y));
            }
        }
        return arrayMap;
    }

    public static int b(Context context) {
        return ((g) f97130h.h(context)).f97136f.f97114a;
    }

    public final void c(Display display) {
        e eVar = this.f97136f;
        Context contextCreateDisplayContext = g3.f79853h ? this.f97133c : this.f97131a.createDisplayContext(display);
        ArrayMap arrayMap = eVar.f97123j;
        float f11 = eVar.f97116c;
        ArraySet arraySet = eVar.f97121h;
        e eVar2 = new e(contextCreateDisplayContext, display, arrayMap, eVar.f97122i);
        int i5 = eVar.f97117d;
        if (eVar2.f97117d != i5 || eVar2.f97116c != f11) {
            eVar2 = new e(contextCreateDisplayContext, display, a(this.f97132b), Collections.EMPTY_MAP);
        }
        int i11 = !eVar2.f97120g.equals(eVar.f97120g) ? 1 : 0;
        if (eVar2.f97115b != eVar.f97115b) {
            i11 |= 2;
        }
        if (eVar2.f97114a != eVar.f97114a) {
            i11 |= 4;
        }
        if (eVar2.f97117d != i5 || eVar2.f97116c != f11) {
            i11 |= 8;
        }
        ArraySet arraySet2 = eVar2.f97121h;
        if (!arraySet2.equals(arraySet)) {
            i11 |= 16;
            Point point = eVar2.f97119f;
            f fVar = new f(point.x, point.y);
            f fVar2 = (f) eVar.f97123j.get(Integer.toString(display.getDisplayId()));
            if (arraySet2.size() != arraySet.size()) {
                Log.e("b/198965093", "Inconsistent number of displays\ndisplay state: " + display.getState() + "\noldInfo.supportedBounds: " + arraySet + "\nnewInfo.supportedBounds: " + arraySet2);
            }
            if (!fVar.equals(fVar2) && display.getState() == 1) {
                Log.e("b/198965093", "Display size changed while display is off, ignoring change");
                return;
            }
        }
        if (i11 != 0) {
            this.f97136f = eVar2;
            j.f97147b.execute(new com.instabridge.ai.chat.ui.c0(this, contextCreateDisplayContext, i11, 11));
        }
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        this.f97137g = true;
        Context context = this.f97133c;
        if (context != null) {
            context.unregisterComponentCallbacks(this);
        }
        this.f97132b.unregisterDisplayListener(this);
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        Display display = this.f97133c.getDisplay();
        int i5 = configuration.densityDpi;
        e eVar = this.f97136f;
        if (i5 == eVar.f97117d && configuration.fontScale == eVar.f97116c) {
            int rotation = display.getRotation();
            e eVar2 = this.f97136f;
            if (rotation == eVar2.f97115b && eVar2.f97118e.equals(new f(configuration.screenHeightDp, configuration.screenWidthDp))) {
                return;
            }
        }
        c(display);
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayAdded(int i5) {
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayChanged(int i5) {
        Display display;
        if (i5 == 0 && (display = this.f97132b.getDisplay(0)) != null) {
            if (g3.f79853h) {
                float refreshRate = display.getRefreshRate();
                if ((refreshRate > 0.0f ? (int) (1000.0f / refreshRate) : 16) == this.f97136f.f97114a) {
                    return;
                }
            }
            c(display);
        }
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayRemoved(int i5) {
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
    }
}
