package uy;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.text.TextUtils;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import java.util.LinkedHashMap;
import java.util.Map;
import o9.t1;

/* loaded from: classes.dex */
public class o {

    /* renamed from: a, reason: collision with root package name */
    public String f91734a = null;

    /* renamed from: b, reason: collision with root package name */
    public Boolean f91735b = null;

    /* renamed from: c, reason: collision with root package name */
    public Integer f91736c = null;

    /* renamed from: d, reason: collision with root package name */
    public Bitmap f91737d = null;

    /* renamed from: e, reason: collision with root package name */
    public NovaIconSource f91738e = null;

    /* renamed from: f, reason: collision with root package name */
    public iz.c f91739f = null;

    /* renamed from: g, reason: collision with root package name */
    public n0 f91740g = null;

    /* renamed from: h, reason: collision with root package name */
    public final LinkedHashMap f91741h = new LinkedHashMap();

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ s f91742i;

    public o(s sVar) {
        this.f91742i = sVar;
    }

    public o a(ComponentKey componentKey) {
        if (componentKey == null) {
            throw new IllegalArgumentException("ComponentKey must not be null");
        }
        LinkedHashMap linkedHashMap = this.f91741h;
        linkedHashMap.remove(componentKey);
        if (!this.f91742i.f91757i.c(componentKey)) {
            linkedHashMap.put(componentKey, Boolean.TRUE);
        }
        return this;
    }

    public o b(ComponentKey componentKey) {
        if (componentKey == null) {
            throw new IllegalArgumentException("ComponentKey must not be null");
        }
        LinkedHashMap linkedHashMap = this.f91741h;
        linkedHashMap.remove(componentKey);
        if (this.f91742i.f91757i.c(componentKey)) {
            linkedHashMap.put(componentKey, Boolean.FALSE);
        }
        return this;
    }

    public boolean c(ContentResolver contentResolver, boolean z11) {
        String str;
        Integer num;
        boolean z12;
        Boolean bool = this.f91735b;
        s sVar = this.f91742i;
        if ((bool == null || sVar.f91750b == bool.booleanValue()) && (((str = this.f91734a) == null || TextUtils.equals(sVar.f91749a, str)) && (((num = this.f91736c) == null || sVar.f91755g == num.intValue()) && this.f91739f == null && this.f91740g == null && this.f91737d == null))) {
            z12 = false;
        } else {
            String str2 = this.f91734a;
            if (str2 != null) {
                sVar.f91749a = str2;
            }
            Boolean bool2 = this.f91735b;
            if (bool2 != null) {
                sVar.f91750b = bool2.booleanValue();
            }
            Integer num2 = this.f91736c;
            if (num2 != null) {
                sVar.f91755g = num2.intValue();
            }
            iz.c cVar = this.f91739f;
            if (cVar != null) {
                sVar.f91756h = cVar;
            }
            n0 n0Var = this.f91740g;
            if (n0Var != null) {
                sVar.f91751c = n0Var;
            }
            Context context = mx.g0.f77088a;
            String strH = mx.g0.h();
            Bitmap bitmap = this.f91737d;
            if (bitmap != null && (sVar instanceof q)) {
                q qVar = (q) sVar;
                if (bitmap == BitmapInfo.f21149c) {
                    qVar.f91746j = null;
                    qVar.f91747k = null;
                } else {
                    qVar.f91746j = new BitmapInfo(bitmap, 0);
                    qVar.f91747k = this.f91738e;
                }
            }
            d0.u(contentResolver, sVar.f91753e, sVar.f91749a, Boolean.valueOf(sVar.f91750b), sVar.f91755g, this.f91737d, this.f91738e, strH, sVar.f91756h, sVar.f91751c);
            z12 = true;
        }
        for (Map.Entry entry : this.f91741h.entrySet()) {
            ComponentKey componentKey = (ComponentKey) entry.getKey();
            if (entry.getValue() == Boolean.TRUE) {
                if (sVar.f91757i.a(componentKey)) {
                    g(contentResolver, componentKey, sVar.f91753e, true);
                    z12 = true;
                }
            } else if (sVar.f91757i.f(componentKey)) {
                g(contentResolver, componentKey, sVar.f91753e, false);
                z12 = true;
            }
        }
        if (z12 && z11) {
            d0.f91699e.q();
        }
        return z12;
    }

    public boolean d(ComponentKey componentKey) {
        LinkedHashMap linkedHashMap = this.f91741h;
        return linkedHashMap.containsKey(componentKey) ? ((Boolean) linkedHashMap.get(componentKey)).booleanValue() : this.f91742i.f91757i.c(componentKey);
    }

    public void e(ComponentKey componentKey) {
        b(componentKey);
    }

    public final void f(iz.c cVar) {
        this.f91739f = cVar;
        boolean zI = x7.f.I(cVar.f68417a, 128);
        iz.c cVar2 = this.f91742i.f91756h;
        cVar2.f68417a = cVar2.g(128, zI);
    }

    public void g(ContentResolver contentResolver, ComponentKey componentKey, int i5, boolean z11) {
        t1.d().f80133b.c(new n(this, z11, i5, ab.e0.C(componentKey, t1.d().f80132a), contentResolver, componentKey));
    }

    public String toString() {
        return "DrawerGroup.Editor{" + this.f91742i + "}";
    }
}
