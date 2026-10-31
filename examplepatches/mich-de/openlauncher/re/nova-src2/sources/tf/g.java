package tf;

import android.content.Context;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.os.Looper;
import android.text.TextUtils;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import android.view.Display;
import android.view.WindowManager;
import android.view.accessibility.CaptioningManager;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import xk.v0;

/* loaded from: classes3.dex */
public final class g extends t {
    public boolean A;
    public boolean B;
    public boolean C;
    public boolean D;
    public boolean E;
    public boolean F;
    public boolean G;
    public boolean H;
    public boolean I;
    public boolean J;
    public boolean K;
    public boolean L;
    public boolean M;
    public final SparseArray N;
    public final SparseBooleanArray O;

    /* JADX WARN: Removed duplicated region for block: B:54:0x00f1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public g(Context context) throws NumberFormatException {
        Point point;
        Point point2;
        DisplayManager displayManager;
        CaptioningManager captioningManager;
        int i5 = wf.v.f94376a;
        if (i5 >= 19 && ((i5 >= 23 || Looper.myLooper() != null) && (captioningManager = (CaptioningManager) context.getSystemService("captioning")) != null && captioningManager.isEnabled())) {
            this.f89146t = 1088;
            Locale locale = captioningManager.getLocale();
            if (locale != null) {
                this.f89145s = v0.s(i5 >= 21 ? locale.toLanguageTag() : locale.toString());
            }
        }
        Display display = (i5 < 17 || (displayManager = (DisplayManager) context.getSystemService("display")) == null) ? null : displayManager.getDisplay(0);
        if (display == null) {
            WindowManager windowManager = (WindowManager) context.getSystemService("window");
            windowManager.getClass();
            display = windowManager.getDefaultDisplay();
        }
        if (display.getDisplayId() == 0 && wf.v.x(context)) {
            String strS = i5 < 28 ? wf.v.s("sys.display-size") : wf.v.s("vendor.display-size");
            if (!TextUtils.isEmpty(strS)) {
                try {
                    String[] strArrSplit = strS.trim().split("x", -1);
                    if (strArrSplit.length == 2) {
                        int i11 = Integer.parseInt(strArrSplit[0]);
                        int i12 = Integer.parseInt(strArrSplit[1]);
                        point2 = (i11 > 0 && i12 > 0) ? new Point(i11, i12) : point2;
                    }
                } catch (NumberFormatException unused) {
                }
                wf.a.o("Util", "Invalid display size: " + strS);
            }
            if ("Sony".equals(wf.v.f94378c) && wf.v.f94379d.startsWith("BRAVIA") && context.getPackageManager().hasSystemFeature("com.sony.dtv.hardware.panel.qfhd")) {
                point = new Point(3840, 2160);
            }
            point2 = point;
        } else {
            point = new Point();
            if (i5 >= 23) {
                Display.Mode mode = display.getMode();
                point.x = mode.getPhysicalWidth();
                point.y = mode.getPhysicalHeight();
            } else if (i5 >= 17) {
                display.getRealSize(point);
            } else {
                display.getSize(point);
            }
            point2 = point;
        }
        c(point2.x, point2.y);
        this.N = new SparseArray();
        this.O = new SparseBooleanArray();
        d();
    }

    @Override // tf.t
    public final t c(int i5, int i11) {
        super.c(i5, i11);
        return this;
    }

    public final void d() {
        this.A = true;
        this.B = false;
        this.C = true;
        this.D = false;
        this.E = true;
        this.F = false;
        this.G = false;
        this.H = false;
        this.I = false;
        this.J = true;
        this.K = true;
        this.L = false;
        this.M = true;
    }

    public final void e(int i5) {
        this.f89152z.remove(Integer.valueOf(i5));
    }

    public g(h hVar) {
        b(hVar);
        this.A = hVar.A;
        this.B = hVar.B;
        this.C = hVar.C;
        this.D = hVar.D;
        this.E = hVar.E;
        this.F = hVar.F;
        this.G = hVar.G;
        this.H = hVar.H;
        this.I = hVar.I;
        this.J = hVar.J;
        this.K = hVar.K;
        this.L = hVar.L;
        this.M = hVar.M;
        SparseArray sparseArray = hVar.N;
        SparseArray sparseArray2 = new SparseArray();
        for (int i5 = 0; i5 < sparseArray.size(); i5++) {
            sparseArray2.put(sparseArray.keyAt(i5), new HashMap((Map) sparseArray.valueAt(i5)));
        }
        this.N = sparseArray2;
        this.O = hVar.O.clone();
    }

    public g() {
        this.N = new SparseArray();
        this.O = new SparseBooleanArray();
        d();
    }
}
