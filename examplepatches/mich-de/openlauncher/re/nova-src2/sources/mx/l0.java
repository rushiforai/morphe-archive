package mx;

import android.appwidget.AppWidgetHostView;
import android.content.ComponentName;
import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import com.teslacoilsw.launcher.NovaApplication;
import e10.y2;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import o9.g3;

/* loaded from: classes.dex */
public final class l0 extends o9.z0 {

    /* renamed from: x, reason: collision with root package name */
    public boolean f77203x;

    @Override // o9.z0
    public final void f(Context context, ya.e eVar, o9.w0 w0Var, int i5) {
        Point point;
        ya.e eVar2 = eVar;
        o9.x0 x0Var = w0Var.f80208a;
        y2 y2Var = y2.f51877a;
        this.f80268a = ((e10.t0) y2Var.u().l()).f51821a;
        this.f80269b = ((e10.t0) y2Var.u().l()).f51822b;
        int iIntValue = ((Number) y2.D().l()).intValue();
        this.f80277j = iIntValue;
        this.f80278k = iIntValue;
        int iD0 = y2Var.D0(context.getResources());
        this.f80270c = iD0;
        this.f80271d = o9.z0.c(iD0);
        this.o = "nova.db";
        this.f80281p = x0Var.f80238j;
        this.f80282q = x0Var.f80239k;
        int iD02 = y2Var.D0(context.getResources());
        this.f80270c = iD02;
        this.f80271d = o9.z0.c(iD02);
        Point point2 = eVar2.f97119f;
        int i11 = eVar2.f97117d;
        Point point3 = new Point(point2);
        int iMin = Math.min(point3.x, point3.y);
        int iMax = Math.max(point3.x, point3.y);
        Context applicationContext = context.getApplicationContext();
        Intrinsics.e(applicationContext, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaApplication");
        NovaApplication novaApplication = (NovaApplication) applicationContext;
        if (novaApplication.f45639a == null) {
            novaApplication.f45639a = ab.e0.b(novaApplication);
        }
        ComponentName componentName = k0.f77184z;
        fz.u uVar = novaApplication.f45639a;
        if (uVar == null) {
            Intrinsics.m("iconConfig");
            throw null;
        }
        this.f77203x = ul.b.q(context, uVar);
        ArrayList arrayList = new ArrayList();
        Iterator it = eVar2.f97121h.iterator();
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
            arrayList.add(new j0(context, this, eVar2, q0Var, false, ((double) (((float) iHeight) / f11)) >= 1.25d && g3.f(f11, i11) < 720.0f));
            int iWidth2 = q0Var.f97206a.width();
            int iHeight2 = q0Var.f97206a.height();
            Point point4 = this.f80285t;
            int i12 = point4.y;
            if (i12 < iHeight2) {
                i12 = iHeight2;
            }
            point4.y = i12;
            float f12 = g3.f((float) Math.min(iWidth2, iHeight2), i11) < 720.0f ? 2.0f : ((iWidth2 / iHeight2) * 0.30769226f) + 1.0076923f;
            Point point5 = this.f80285t;
            point5.x = Math.max(point5.x, Math.round(f12 * iWidth2));
            eVar2 = eVar;
        }
        if (context.getResources().getConfiguration().smallestScreenWidthDp >= 720) {
            float f13 = iMax;
            point = new Point((int) ((((f13 / iMin) * 0.30769226f) + 1.0076923f) * f13), iMax);
        } else {
            point = new Point(Math.max(iMin * 2, iMax), iMax);
        }
        this.f80285t = point;
        this.f80286u = AppWidgetHostView.getDefaultPaddingForWidget(context, new ComponentName(context.getPackageName(), l0.class.getName()), null);
        this.f80283r = Collections.unmodifiableList(arrayList);
    }

    public final String j() {
        return this.f80271d + " " + ((fz.d) y2.f51877a.i().l()).b();
    }
}
