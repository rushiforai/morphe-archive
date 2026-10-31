package androidx.appcompat.view;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.util.Log;
import android.view.InflateException;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import b.u4;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import q.r;

/* loaded from: classes2.dex */
public final class h {
    public CharSequence A;
    public CharSequence B;
    public final /* synthetic */ i E;

    /* renamed from: a, reason: collision with root package name */
    public final Menu f13624a;

    /* renamed from: h, reason: collision with root package name */
    public boolean f13631h;

    /* renamed from: i, reason: collision with root package name */
    public int f13632i;

    /* renamed from: j, reason: collision with root package name */
    public int f13633j;

    /* renamed from: k, reason: collision with root package name */
    public CharSequence f13634k;

    /* renamed from: l, reason: collision with root package name */
    public CharSequence f13635l;

    /* renamed from: m, reason: collision with root package name */
    public int f13636m;
    public char n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public char f13637p;

    /* renamed from: q, reason: collision with root package name */
    public int f13638q;

    /* renamed from: r, reason: collision with root package name */
    public int f13639r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f13640s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f13641t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f13642u;

    /* renamed from: v, reason: collision with root package name */
    public int f13643v;

    /* renamed from: w, reason: collision with root package name */
    public int f13644w;

    /* renamed from: x, reason: collision with root package name */
    public String f13645x;

    /* renamed from: y, reason: collision with root package name */
    public String f13646y;

    /* renamed from: z, reason: collision with root package name */
    public q.n f13647z;
    public ColorStateList C = null;
    public PorterDuff.Mode D = null;

    /* renamed from: b, reason: collision with root package name */
    public int f13625b = 0;

    /* renamed from: c, reason: collision with root package name */
    public int f13626c = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f13627d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f13628e = 0;

    /* renamed from: f, reason: collision with root package name */
    public boolean f13629f = true;

    /* renamed from: g, reason: collision with root package name */
    public boolean f13630g = true;

    public h(i iVar, Menu menu) {
        this.E = iVar;
        this.f13624a = menu;
    }

    public final Object a(String str, Class[] clsArr, Object[] objArr) throws NoSuchMethodException, SecurityException {
        try {
            Constructor<?> constructor = Class.forName(str, false, this.E.f13652c.getClassLoader()).getConstructor(clsArr);
            constructor.setAccessible(true);
            return constructor.newInstance(objArr);
        } catch (Exception e3) {
            Log.w("SupportMenuInflater", "Cannot instantiate class: " + str, e3);
            return null;
        }
    }

    public final void b(MenuItem menuItem) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        i iVar = this.E;
        Context context = iVar.f13652c;
        boolean z11 = false;
        menuItem.setChecked(this.f13640s).setVisible(this.f13641t).setEnabled(this.f13642u).setCheckable(this.f13639r >= 1).setTitleCondensed(this.f13635l).setIcon(this.f13636m);
        int i5 = this.f13643v;
        if (i5 >= 0) {
            menuItem.setShowAsAction(i5);
        }
        if (this.f13646y != null) {
            if (context.isRestricted()) {
                throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
            }
            if (iVar.f13653d == null) {
                iVar.f13653d = i.a(context);
            }
            Object obj = iVar.f13653d;
            String str = this.f13646y;
            g gVar = new g();
            gVar.f13622a = obj;
            Class<?> cls = obj.getClass();
            try {
                gVar.f13623b = cls.getMethod(str, g.f13621c);
                menuItem.setOnMenuItemClickListener(gVar);
            } catch (Exception e3) {
                StringBuilder sbK = u4.k("Couldn't resolve menu item onClick handler ", str, " in class ");
                sbK.append(cls.getName());
                InflateException inflateException = new InflateException(sbK.toString());
                inflateException.initCause(e3);
                throw inflateException;
            }
        }
        if (this.f13639r >= 2) {
            if (menuItem instanceof q.m) {
                q.m mVar = (q.m) menuItem;
                mVar.f83278x = (mVar.f83278x & (-5)) | 4;
            } else if (menuItem instanceof r) {
                r rVar = (r) menuItem;
                t4.a aVar = rVar.f83289g;
                try {
                    if (rVar.f83290h == null) {
                        rVar.f83290h = aVar.getClass().getDeclaredMethod("setExclusiveCheckable", Boolean.TYPE);
                    }
                    rVar.f83290h.invoke(aVar, Boolean.TRUE);
                } catch (Exception e11) {
                    Log.w("MenuItemWrapper", "Error while calling setExclusiveCheckable", e11);
                }
            }
        }
        String str2 = this.f13645x;
        if (str2 != null) {
            menuItem.setActionView((View) a(str2, i.f13648e, iVar.f13650a));
            z11 = true;
        }
        int i11 = this.f13644w;
        if (i11 > 0) {
            if (z11) {
                Log.w("SupportMenuInflater", "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
            } else {
                menuItem.setActionView(i11);
            }
        }
        q.n nVar = this.f13647z;
        if (nVar != null) {
            if (menuItem instanceof t4.a) {
                ((t4.a) menuItem).c(nVar);
            } else {
                Log.w("MenuItemCompat", "setActionProvider: item does not implement SupportMenuItem; ignoring");
            }
        }
        CharSequence charSequence = this.A;
        boolean z12 = menuItem instanceof t4.a;
        if (z12) {
            ((t4.a) menuItem).setContentDescription(charSequence);
        } else {
            menuItem.setContentDescription(charSequence);
        }
        CharSequence charSequence2 = this.B;
        if (z12) {
            ((t4.a) menuItem).setTooltipText(charSequence2);
        } else {
            menuItem.setTooltipText(charSequence2);
        }
        char c11 = this.n;
        int i12 = this.o;
        if (z12) {
            ((t4.a) menuItem).setAlphabeticShortcut(c11, i12);
        } else {
            menuItem.setAlphabeticShortcut(c11, i12);
        }
        char c12 = this.f13637p;
        int i13 = this.f13638q;
        if (z12) {
            ((t4.a) menuItem).setNumericShortcut(c12, i13);
        } else {
            menuItem.setNumericShortcut(c12, i13);
        }
        PorterDuff.Mode mode = this.D;
        if (mode != null) {
            if (z12) {
                ((t4.a) menuItem).setIconTintMode(mode);
            } else {
                menuItem.setIconTintMode(mode);
            }
        }
        ColorStateList colorStateList = this.C;
        if (colorStateList != null) {
            if (z12) {
                ((t4.a) menuItem).setIconTintList(colorStateList);
            } else {
                menuItem.setIconTintList(colorStateList);
            }
        }
    }
}
