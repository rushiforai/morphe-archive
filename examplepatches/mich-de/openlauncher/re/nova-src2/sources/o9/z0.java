package o9;

import android.content.ComponentName;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.ArraySet;
import android.util.DisplayMetrics;
import android.util.Xml;
import android.view.Display;
import androidx.compose.ui.node.LayoutNode;
import com.android.launcher3.secondarydisplay.SecondaryDisplayLauncher;
import com.teslacoilsw.launcher.NovaApplication;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.dex */
public class z0 {

    /* renamed from: w, reason: collision with root package name */
    public static final x7.c f80267w = new x7.c(new ll.i(12));

    /* renamed from: a, reason: collision with root package name */
    public int f80268a;

    /* renamed from: b, reason: collision with root package name */
    public int f80269b;

    /* renamed from: c, reason: collision with root package name */
    public int f80270c;

    /* renamed from: d, reason: collision with root package name */
    public int f80271d;

    /* renamed from: e, reason: collision with root package name */
    public int f80272e;

    /* renamed from: f, reason: collision with root package name */
    public PointF[] f80273f;

    /* renamed from: g, reason: collision with root package name */
    public PointF[] f80274g;

    /* renamed from: h, reason: collision with root package name */
    public float f80275h;

    /* renamed from: i, reason: collision with root package name */
    public float[] f80276i;

    /* renamed from: j, reason: collision with root package name */
    public int f80277j;

    /* renamed from: k, reason: collision with root package name */
    public int f80278k;

    /* renamed from: l, reason: collision with root package name */
    public int f80279l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f80280m;
    public int n;
    public String o;

    /* renamed from: p, reason: collision with root package name */
    public int f80281p;

    /* renamed from: q, reason: collision with root package name */
    public int f80282q;

    /* renamed from: s, reason: collision with root package name */
    public io.sentry.g1 f80284s;

    /* renamed from: u, reason: collision with root package name */
    public Rect f80286u;

    /* renamed from: r, reason: collision with root package name */
    public List f80283r = Collections.EMPTY_LIST;

    /* renamed from: t, reason: collision with root package name */
    public Point f80285t = new Point();

    /* renamed from: v, reason: collision with root package name */
    public final ArrayList f80287v = new ArrayList();

    public z0(Context context) {
        String string = g3.l(context).getString("idp_grid_name", null);
        String strE = e(context, string);
        if (NovaApplication.f45638j) {
            if (!strE.equals(string)) {
                context.getApplicationContext().getSharedPreferences("com.android.launcher3.prefs", 0).edit().putString("idp_grid_name", strE).apply();
            }
            Locale locale = Locale.ENGLISH;
            String str = this.f80269b + "," + this.f80268a;
            context.getApplicationContext().getSharedPreferences("com.android.launcher3.prefs", 0).edit().putString("migration_src_workspace_size", str).putInt("migration_src_hotseat_count", this.f80278k).putInt("migration_src_device_type", this.f80272e).apply();
        }
        ((ya.g) ya.g.f97130h.h(context)).f97134d = new mx.y((mx.l0) this, 1);
    }

    public static int b(ya.e eVar) {
        if (eVar.f97121h.size() < 4 || !u9.b.f90705t.b()) {
            return eVar.f97121h.stream().allMatch(new aa.y(eVar, 3)) ? 2 : 0;
        }
        return 1;
    }

    public static int c(int i5) {
        int[] iArr = {120, 160, Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE, 240, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 480, 640};
        int i11 = 640;
        for (int i12 = 6; i12 >= 0; i12--) {
            int i13 = iArr[i12];
            if ((i13 * 48.0f) / 160.0f >= i5) {
                i11 = i13;
            }
        }
        return i11;
    }

    public static ArrayList d(Context context, String str, int i5, boolean z11) throws Resources.NotFoundException {
        ArrayList arrayList = new ArrayList();
        try {
            XmlResourceParser xml = context.getResources().getXml(2132213772);
            try {
                int depth = xml.getDepth();
                while (true) {
                    int next = xml.next();
                    if (next == 3 && xml.getDepth() <= depth) {
                        break;
                    }
                    if (next == 1) {
                        break;
                    }
                    if (next == 2 && "grid-option".equals(xml.getName())) {
                        x0 x0Var = new x0(context, Xml.asAttributeSet(xml), i5);
                        if (x0Var.f80232d || z11) {
                            int depth2 = xml.getDepth();
                            while (true) {
                                int next2 = xml.next();
                                if ((next2 != 3 || xml.getDepth() > depth2) && next2 != 1) {
                                    if (next2 == 2 && "display-option".equals(xml.getName())) {
                                        arrayList.add(new w0(x0Var, context, Xml.asAttributeSet(xml)));
                                    }
                                }
                            }
                        }
                    }
                }
                xml.close();
                ArrayList arrayList2 = new ArrayList();
                if (!TextUtils.isEmpty(str)) {
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        w0 w0Var = (w0) it.next();
                        if (str.equals(w0Var.f80208a.f80229a) && (w0Var.f80208a.f80232d || z11)) {
                            arrayList2.add(w0Var);
                        }
                    }
                }
                if (arrayList2.isEmpty()) {
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        w0 w0Var2 = (w0) it2.next();
                        if (w0Var2.f80211d) {
                            arrayList2.add(w0Var2);
                        }
                    }
                }
                if (arrayList2.isEmpty()) {
                    throw new RuntimeException("No display option with canBeDefault=true");
                }
                return arrayList2;
            } catch (Throwable th2) {
                if (xml != null) {
                    try {
                        xml.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                }
                throw th2;
            }
        } catch (IOException | XmlPullParserException e3) {
            throw new RuntimeException(e3);
        }
    }

    public static w0 g(ya.e eVar, ArrayList arrayList, int i5) {
        ArraySet arraySet = eVar.f97121h;
        int i11 = eVar.f97117d;
        Iterator it = arraySet.iterator();
        int iMin = LayoutNode.NotPlacedPlaceOrder;
        int iMin2 = Integer.MAX_VALUE;
        while (it.hasNext()) {
            ya.q0 q0Var = (ya.q0) it.next();
            boolean zA = eVar.a(q0Var);
            Point point = q0Var.f97208c;
            if (zA && i5 == 1) {
                iMin = Math.min(iMin, point.x / 2);
                iMin2 = Math.min(iMin2, point.y);
            } else {
                if (!zA) {
                    int i12 = point.x;
                    int i13 = point.y;
                    if (i12 > i13) {
                        iMin = Math.min(iMin, i13);
                        iMin2 = Math.min(iMin2, point.x);
                    }
                }
                iMin = Math.min(iMin, point.x);
                iMin2 = Math.min(iMin2, point.y);
            }
        }
        final float f11 = g3.f(iMin, i11);
        final float f12 = g3.f(iMin2, i11);
        Collections.sort(arrayList, new Comparator() { // from class: o9.v0
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                w0 w0Var = (w0) obj;
                w0 w0Var2 = (w0) obj2;
                float f13 = w0Var.f80209b;
                float f14 = w0Var.f80210c;
                double d5 = f13 - f11;
                float f15 = f12;
                return Float.compare((float) Math.hypot(d5, f14 - f15), (float) Math.hypot(w0Var2.f80209b - r1, w0Var2.f80210c - f15));
            }
        });
        w0 w0Var = (w0) arrayList.get(0);
        x0 x0Var = w0Var.f80208a;
        if (((float) Math.hypot(w0Var.f80209b - f11, w0Var.f80210c - f12)) == 0.0f) {
            return w0Var;
        }
        w0 w0Var2 = new w0(x0Var);
        float f13 = 0.0f;
        for (int i14 = 0; i14 < arrayList.size() && i14 < 3.0f; i14++) {
            w0 w0Var3 = (w0) arrayList.get(i14);
            float fHypot = (float) Math.hypot(w0Var3.f80209b - f11, w0Var3.f80210c - f12);
            float fPow = Float.compare(fHypot, 0.0f) == 0 ? Float.POSITIVE_INFINITY : (float) (100000.0d / Math.pow(fHypot, 5.0f));
            f13 += fPow;
            w0 w0Var4 = new w0(null);
            w0.a(w0Var4, w0Var3);
            w0.b(w0Var4, fPow);
            w0.a(w0Var2, w0Var4);
        }
        w0.b(w0Var2, 1.0f / f13);
        for (int i15 = 0; i15 < 5; i15++) {
            float[] fArr = w0Var2.f80216i;
            fArr[i15] = Math.min(fArr[i15], w0Var.f80216i[i15]);
        }
        return w0Var2;
    }

    public final mx.j0 a(Context context) {
        Resources resources = context.getResources();
        Configuration configuration = context.getResources().getConfiguration();
        float f11 = configuration.screenWidthDp * resources.getDisplayMetrics().density;
        float f12 = configuration.screenHeightDp * resources.getDisplayMetrics().density;
        mx.j0 j0Var = (mx.j0) this.f80283r.get(0);
        float f13 = Float.MAX_VALUE;
        for (mx.j0 j0Var2 : this.f80283r) {
            float fAbs = Math.abs(j0Var2.f77153l - f12) + Math.abs(j0Var2.f77151k - f11);
            if (fAbs < f13) {
                j0Var = j0Var2;
                f13 = fAbs;
            }
        }
        return j0Var;
    }

    public final String e(Context context, String str) {
        ya.e eVar = ((ya.g) ya.g.f97130h.h(context)).f97136f;
        int iB = b(eVar);
        Pattern pattern = g3.f79846a;
        w0 w0VarG = g(eVar, d(context, str, iB, context.getApplicationContext().getSharedPreferences("com.android.launcher3.prefs", 0).contains("restored_task_pending")), iB);
        f(context, eVar, w0VarG, iB);
        StringBuilder sb2 = new StringBuilder("Hotseat:");
        x0 x0Var = w0VarG.f80208a;
        sb2.append(x0Var.f80236h);
        sb2.append(", Workspace:");
        sb2.append(x0Var.f80230b);
        sb2.append("x");
        sb2.append(x0Var.f80231c);
        return sb2.toString();
    }

    public void f(Context context, ya.e eVar, w0 w0Var, int i5) {
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        x0 x0Var = w0Var.f80208a;
        this.f80268a = x0Var.f80230b;
        this.f80269b = x0Var.f80231c;
        this.o = x0Var.f80237i;
        this.f80281p = x0Var.f80238j;
        this.f80282q = x0Var.f80239k;
        this.f80280m = x0Var.f80240l;
        int i11 = x0Var.f80241m;
        this.n = i11;
        this.f80272e = i5;
        this.f80273f = w0Var.f80212e;
        this.f80274g = w0Var.f80214g;
        this.f80275h = w0Var.f80213f;
        this.f80276i = w0Var.f80215h;
        int i12 = x0Var.f80235g;
        this.f80277j = i12;
        if (i5 == 1) {
            i12 = x0Var.f80236h;
        }
        this.f80278k = i12;
        this.f80279l = i5 == 1 ? x0Var.f80234f : x0Var.f80233e;
        if (i11 != 0) {
            this.f80284s = new io.sentry.g1(context, this.n);
        }
        c10.a aVarO = c10.a.o(context.getPackageManager());
        if (aVarO != null) {
            aVarO.l(this, displayMetrics);
        }
        ArrayList arrayList = new ArrayList();
        Point point = this.f80285t;
        Point point2 = eVar.f97119f;
        int i13 = eVar.f97117d;
        point.set(point2.x, point2.y);
        Iterator it = eVar.f97121h.iterator();
        while (it.hasNext()) {
            ya.q0 q0Var = (ya.q0) it.next();
            if (q0Var == null) {
                throw new IllegalArgumentException("Window bounds not set");
            }
            Rect rect = q0Var.f97206a;
            int iHeight = rect.height();
            int iWidth = rect.width();
            if (iWidth > iHeight) {
                iHeight = iWidth;
                iWidth = iHeight;
            }
            float f11 = iWidth;
            arrayList.add(new mx.j0(context, this, eVar, q0Var, false, ((double) (((float) iHeight) / f11)) >= 1.25d && g3.f(f11, i13) < 720.0f));
            int iWidth2 = q0Var.f97206a.width();
            int iHeight2 = q0Var.f97206a.height();
            Point point3 = this.f80285t;
            point3.y = Math.max(point3.y, iHeight2);
            float f12 = g3.f((float) Math.min(iWidth2, iHeight2), i13) < 720.0f ? 2.0f : 1.0076923f + ((iWidth2 / iHeight2) * 0.30769226f);
            Point point4 = this.f80285t;
            point4.x = Math.max(point4.x, Math.round(f12 * iWidth2));
        }
        this.f80283r = Collections.unmodifiableList(arrayList);
        this.f80286u = p6.p0.h(context, new ComponentName(context.getPackageName(), getClass().getName()), null);
    }

    public final void h(Context context) {
        Object[] objArrI = i();
        e(context, g3.l(context).getString("idp_grid_name", null));
        boolean z11 = !Arrays.equals(objArrI, i());
        Iterator it = this.f80287v.iterator();
        while (it.hasNext()) {
            ((y0) it.next()).v(z11);
        }
    }

    public final Object[] i() {
        return new Object[]{Integer.valueOf(this.f80269b), Integer.valueOf(this.f80268a), Integer.valueOf(this.f80278k), Integer.valueOf(this.f80270c), Integer.valueOf(this.f80271d), Integer.valueOf(this.f80279l), this.o};
    }

    public z0(SecondaryDisplayLauncher secondaryDisplayLauncher, Display display) {
        f80267w.h(secondaryDisplayLauncher);
        Pattern pattern = g3.f79846a;
        String string = secondaryDisplayLauncher.getApplicationContext().getSharedPreferences("com.android.launcher3.prefs", 0).getString("idp_grid_name", null);
        ya.e eVar = ((ya.g) ya.g.f97130h.h(secondaryDisplayLauncher)).f97136f;
        int iB = b(eVar);
        w0 w0VarG = g(eVar, d(secondaryDisplayLauncher, string, iB, false), iB);
        ya.e eVar2 = new ya.e(secondaryDisplayLauncher, display, new ArrayMap(), Collections.EMPTY_MAP);
        int iB2 = b(eVar2);
        w0 w0VarG2 = g(eVar2, d(secondaryDisplayLauncher, string, iB2, false), iB2);
        w0 w0Var = new w0(w0VarG.f80208a);
        w0.a(w0Var, w0VarG2);
        float[] fArr = w0VarG.f80216i;
        float f11 = fArr[0];
        float[] fArr2 = w0Var.f80216i;
        fArr2[0] = f11;
        for (int i5 = 1; i5 < 5; i5++) {
            fArr2[i5] = Math.min(fArr[i5], w0VarG2.f80216i[i5]);
        }
        System.arraycopy(w0VarG.f80212e, 0, w0Var.f80212e, 0, 5);
        System.arraycopy(w0VarG.f80214g, 0, w0Var.f80214g, 0, 5);
        f(secondaryDisplayLauncher, eVar2, w0Var, iB2);
    }
}
