package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.os.Build;
import android.util.Log;
import android.view.InflateException;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import com.medium.android.data.notification.YMl.DtuT;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class q2d {
    public CharSequence A;
    public CharSequence B;
    public final /* synthetic */ r2d E;
    public final Menu a;
    public boolean h;
    public int i;
    public int j;
    public CharSequence k;
    public CharSequence l;
    public int m;
    public char n;
    public int o;
    public char p;
    public int q;
    public int r;
    public boolean s;
    public boolean t;
    public boolean u;
    public int v;
    public int w;
    public String x;
    public String y;
    public tx7 z;
    public ColorStateList C = null;
    public PorterDuff.Mode D = null;
    public int b = 0;
    public int c = 0;
    public int d = 0;
    public int e = 0;
    public boolean f = true;
    public boolean g = true;

    public q2d(r2d r2dVar, Menu menu) {
        this.E = r2dVar;
        this.a = menu;
    }

    public final Object a(String str, Class[] clsArr, Object[] objArr) {
        try {
            Constructor<?> constructor = Class.forName(str, false, this.E.c.getClassLoader()).getConstructor(clsArr);
            constructor.setAccessible(true);
            return constructor.newInstance(objArr);
        } catch (Exception e) {
            Log.w("SupportMenuInflater", "Cannot instantiate class: " + str, e);
            return null;
        }
    }

    public final void b(MenuItem menuItem) {
        r2d r2dVar = this.E;
        Context context = r2dVar.c;
        boolean z = false;
        menuItem.setChecked(this.s).setVisible(this.t).setEnabled(this.u).setCheckable(this.r >= 1).setTitleCondensed(this.l).setIcon(this.m);
        int i = this.v;
        if (i >= 0) {
            menuItem.setShowAsAction(i);
        }
        if (this.y != null) {
            if (context.isRestricted()) {
                ygf.f(DtuT.Jflm);
                return;
            }
            Object objA = r2dVar.d;
            if (objA == null) {
                objA = r2d.a(context);
                r2dVar.d = objA;
            }
            String str = this.y;
            p2d p2dVar = new p2d();
            p2dVar.b = objA;
            Class<?> cls = objA.getClass();
            try {
                p2dVar.c = cls.getMethod(str, p2d.d);
                menuItem.setOnMenuItemClickListener(p2dVar);
            } catch (Exception e) {
                StringBuilder sbU = lv8.u("Couldn't resolve menu item onClick handler ", str, " in class ");
                sbU.append(cls.getName());
                InflateException inflateException = new InflateException(sbU.toString());
                inflateException.initCause(e);
                throw inflateException;
            }
        }
        if (this.r >= 2) {
            if (menuItem instanceof sx7) {
                sx7 sx7Var = (sx7) menuItem;
                sx7Var.x = (sx7Var.x & (-5)) | 4;
            } else if (menuItem instanceof wx7) {
                wx7 wx7Var = (wx7) menuItem;
                s2d s2dVar = wx7Var.c;
                try {
                    Method declaredMethod = wx7Var.d;
                    if (declaredMethod == null) {
                        declaredMethod = s2dVar.getClass().getDeclaredMethod("setExclusiveCheckable", Boolean.TYPE);
                        wx7Var.d = declaredMethod;
                    }
                    declaredMethod.invoke(s2dVar, Boolean.TRUE);
                } catch (Exception e2) {
                    Log.w("MenuItemWrapper", "Error while calling setExclusiveCheckable", e2);
                }
            }
        }
        String str2 = this.x;
        if (str2 != null) {
            menuItem.setActionView((View) a(str2, r2d.e, r2dVar.a));
            z = true;
        }
        int i2 = this.w;
        if (i2 > 0) {
            if (z) {
                Log.w("SupportMenuInflater", "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
            } else {
                menuItem.setActionView(i2);
            }
        }
        tx7 tx7Var = this.z;
        if (tx7Var != null) {
            if (menuItem instanceof s2d) {
                ((s2d) menuItem).a(tx7Var);
            } else {
                Log.w("MenuItemCompat", "setActionProvider: item does not implement SupportMenuItem; ignoring");
            }
        }
        CharSequence charSequence = this.A;
        boolean z2 = menuItem instanceof s2d;
        if (z2) {
            ((s2d) menuItem).setContentDescription(charSequence);
        } else if (Build.VERSION.SDK_INT >= 26) {
            epe.X(menuItem, charSequence);
        }
        CharSequence charSequence2 = this.B;
        if (z2) {
            ((s2d) menuItem).setTooltipText(charSequence2);
        } else if (Build.VERSION.SDK_INT >= 26) {
            epe.c0(menuItem, charSequence2);
        }
        char c = this.n;
        int i3 = this.o;
        if (z2) {
            ((s2d) menuItem).setAlphabeticShortcut(c, i3);
        } else if (Build.VERSION.SDK_INT >= 26) {
            epe.V(menuItem, c, i3);
        }
        char c2 = this.p;
        int i4 = this.q;
        if (z2) {
            ((s2d) menuItem).setNumericShortcut(c2, i4);
        } else if (Build.VERSION.SDK_INT >= 26) {
            epe.b0(menuItem, c2, i4);
        }
        PorterDuff.Mode mode = this.D;
        if (mode != null) {
            if (z2) {
                ((s2d) menuItem).setIconTintMode(mode);
            } else if (Build.VERSION.SDK_INT >= 26) {
                epe.Z(menuItem, mode);
            }
        }
        ColorStateList colorStateList = this.C;
        if (colorStateList != null) {
            if (z2) {
                ((s2d) menuItem).setIconTintList(colorStateList);
            } else if (Build.VERSION.SDK_INT >= 26) {
                epe.Y(menuItem, colorStateList);
            }
        }
    }
}
