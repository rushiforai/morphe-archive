package v20;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.os.SystemClock;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import java.util.ArrayList;
import java.util.Collection;
import p3.i;
import u20.p;
import u20.r;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public abstract class e {

    /* renamed from: d, reason: collision with root package name */
    public static final a f92028d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f92029e;

    /* renamed from: f, reason: collision with root package name */
    public static final d f92030f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ e[] f92031g;

    /* renamed from: a, reason: collision with root package name */
    public final String f92032a;

    /* renamed from: b, reason: collision with root package name */
    public final String f92033b;

    /* renamed from: c, reason: collision with root package name */
    public final String f92034c;

    static {
        a aVar = new a(NativeAdContent.ViewTag.AD_ICON, 0, "drawable", "drawable.xml", "icon_pack");
        f92028d = aVar;
        b bVar = new b("WALLPAPER", 1, "theme_wallpapers", null, "wallpaperlist");
        f92029e = bVar;
        c cVar = new c("DOCK", 2, null, null, "dock_backgroundlist");
        d dVar = new d("PATTERN", 3, "theme_patterns", null, null);
        f92030f = dVar;
        f92031g = new e[]{aVar, bVar, cVar, dVar};
    }

    public e(String str, int i5, String str2, String str3, String str4) {
        this.f92032a = str2;
        this.f92033b = str3;
        this.f92034c = str4;
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f92031g.clone();
    }

    public boolean a() {
        return !(this instanceof b);
    }

    public Collection b(Activity activity) {
        return null;
    }

    public Intent c() {
        return null;
    }

    public abstract int d(Resources resources);

    public int g() {
        return 0;
    }

    public final r h(Context context, Resources resources, String str, Bitmap bitmap) {
        boolean z11;
        r rVar = new r();
        rVar.f90502a = null;
        rVar.f90503b = new ex.a(7);
        rVar.f90504c = new ArrayList();
        rVar.f90505d = null;
        rVar.f90506e = false;
        if (bitmap != null) {
            p pVar = new p();
            pVar.f90497a = bitmap;
            rVar.add(pVar);
            z11 = true;
        } else {
            z11 = false;
        }
        int iG = g();
        d dVar = f92030f;
        if (iG == -1) {
            rVar.d(context.getResources().getString(2132020122));
            if (i.y(resources, str, dVar, rVar)) {
                z11 = true;
            } else {
                rVar.f90506e = false;
                ArrayList arrayList = rVar.f90502a;
                arrayList.remove(arrayList.size() - 1);
            }
        }
        if (z11) {
            rVar.d(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            rVar.f90506e = true;
        }
        if (br.c.f18432c == null) {
            br.c cVar = new br.c();
            SystemClock.uptimeMillis();
            br.c.f18432c = cVar;
        }
        br.c.f18432c.getClass();
        SystemClock.uptimeMillis();
        boolean zY = i.y(resources, str, this, rVar);
        if (br.c.f18432c == null) {
            br.c cVar2 = new br.c();
            SystemClock.uptimeMillis();
            br.c.f18432c = cVar2;
        }
        br.c.f18432c.getClass();
        SystemClock.uptimeMillis();
        SystemClock.uptimeMillis();
        if (g() == 1) {
            if (zY) {
                rVar.d(context.getResources().getString(2132020122));
            }
            if (!i.y(resources, str, dVar, rVar)) {
                rVar.f90506e = false;
                ArrayList arrayList2 = rVar.f90502a;
                arrayList2.remove(arrayList2.size() - 1);
            }
        }
        return rVar;
    }
}
