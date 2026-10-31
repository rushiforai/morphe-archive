package ya;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Point;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.ArraySet;
import android.view.Display;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import o9.g3;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final int f97114a;

    /* renamed from: b, reason: collision with root package name */
    public final int f97115b;

    /* renamed from: c, reason: collision with root package name */
    public final float f97116c;

    /* renamed from: d, reason: collision with root package name */
    public final int f97117d;

    /* renamed from: e, reason: collision with root package name */
    public final f f97118e;

    /* renamed from: f, reason: collision with root package name */
    public final Point f97119f;

    /* renamed from: g, reason: collision with root package name */
    public final String f97120g;

    /* renamed from: h, reason: collision with root package name */
    public final ArraySet f97121h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayMap f97122i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayMap f97123j;

    public e(Context context, Display display, ArrayMap arrayMap, Map map) {
        ArraySet arraySet = new ArraySet();
        this.f97121h = arraySet;
        ArrayMap arrayMap2 = new ArrayMap();
        this.f97122i = arrayMap2;
        this.f97123j = arrayMap;
        this.f97115b = display.getRotation();
        Configuration configuration = context.getResources().getConfiguration();
        this.f97116c = configuration.fontScale;
        this.f97117d = configuration.densityDpi;
        this.f97118e = new f(configuration.screenHeightDp, configuration.screenWidthDp);
        float refreshRate = display.getRefreshRate();
        this.f97114a = refreshRate > 0.0f ? (int) (1000.0f / refreshRate) : 16;
        Point point = new Point();
        this.f97119f = point;
        display.getRealSize(point);
        String string = Integer.toString(display.getDisplayId());
        this.f97120g = string;
        Point point2 = new Point();
        Point point3 = new Point();
        display.getCurrentSizeRange(point2, point3);
        int iMin = Math.min(point.x, point.y);
        int iMax = Math.max(point.x, point.y);
        ArraySet arraySet2 = new ArraySet();
        arraySet2.add(new q0(iMin, iMax, point2.x, point3.y));
        arraySet2.add(new q0(iMax, iMin, point3.x, point2.y));
        arrayMap2.put(string, arraySet2);
        arraySet.addAll((Collection) arraySet2);
        if (display.getDisplayId() != 0 || arrayMap.size() <= 1) {
            return;
        }
        int size = arrayMap.size();
        for (int i5 = 0; i5 < size; i5++) {
            String str = (String) arrayMap.keyAt(i5);
            if (!TextUtils.equals(this.f97120g, str)) {
                Set setK = (Set) map.get(str);
                setK = setK == null ? ps.k.k(context, (f) arrayMap.valueAt(i5), this.f97117d) : setK;
                this.f97121h.addAll(setK);
                this.f97122i.put(str, setK);
            }
        }
    }

    public final boolean a(q0 q0Var) {
        return g3.f((float) Math.min(q0Var.f97206a.width(), q0Var.f97206a.height()), this.f97117d) >= 600.0f;
    }
}
