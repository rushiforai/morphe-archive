package defpackage;

import android.R;
import android.app.Activity;
import android.app.Dialog;
import android.app.UiModeManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.location.LocationManager;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.AndroidRuntimeException;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import android.widget.TextView;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import androidx.appcompat.widget.ActionBarContextView;
import androidx.appcompat.widget.ActionBarOverlayLayout;
import androidx.appcompat.widget.ActionMenuView;
import androidx.appcompat.widget.AppCompatImageView;
import androidx.appcompat.widget.ContentFrameLayout;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.android.explore.ui.vAWg.OphtYB;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class f20 extends t10 implements jx7, LayoutInflater.Factory2 {
    public static final aec w0 = new aec(0);
    public static final int[] x0 = {R.attr.windowBackground};
    public static final boolean y0 = !"robolectric".equals(Build.FINGERPRINT);
    public ViewGroup A;
    public TextView B;
    public View C;
    public boolean D;
    public boolean E;
    public boolean F;
    public boolean G;
    public boolean H;
    public boolean I;
    public boolean J;
    public boolean K;
    public e20[] L;
    public e20 M;
    public boolean N;
    public boolean O;
    public boolean P;
    public boolean Q;
    public Configuration R;
    public final int S;
    public int X;
    public int Y;
    public boolean Z;
    public final Object j;
    public final Context k;
    public Window l;
    public c20 l0;
    public b20 m;
    public c20 m0;
    public v3f n;
    public boolean n0;
    public r2d o;
    public int o0;
    public CharSequence p;
    public ActionBarOverlayLayout q;
    public boolean q0;
    public v10 r;
    public Rect r0;
    public md5 s;
    public Rect s0;
    public l6 t;
    public a40 t0;
    public ActionBarContextView u;
    public OnBackInvokedDispatcher u0;
    public PopupWindow v;
    public OnBackInvokedCallback v0;
    public u10 w;
    public boolean z;
    public jve x = null;
    public final boolean y = true;
    public final u10 p0 = new u10(this, 0);

    public f20(Context context, Window window, l10 l10Var, Object obj) {
        i10 i10Var = null;
        this.S = -100;
        this.k = context;
        this.j = obj;
        if (obj instanceof Dialog) {
            while (true) {
                if (context != null) {
                    if (!(context instanceof i10)) {
                        if (!(context instanceof ContextWrapper)) {
                            break;
                        } else {
                            context = ((ContextWrapper) context).getBaseContext();
                        }
                    } else {
                        i10Var = (i10) context;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (i10Var != null) {
                this.S = ((f20) i10Var.o()).S;
            }
        }
        if (this.S == -100) {
            String name = this.j.getClass().getName();
            aec aecVar = w0;
            Integer num = (Integer) aecVar.get(name);
            if (num != null) {
                this.S = num.intValue();
                aecVar.remove(this.j.getClass().getName());
            }
        }
        if (window != null) {
            n(window);
        }
        j20.c();
    }

    public static i67 o(Context context) {
        i67 i67Var;
        i67 i67VarB;
        int i = Build.VERSION.SDK_INT;
        if (i >= 33 || (i67Var = t10.c) == null) {
            return null;
        }
        k67 k67Var = i67Var.a;
        i67 i67VarY = y(context.getApplicationContext().getResources().getConfiguration());
        int i2 = 0;
        if (i < 24) {
            i67VarB = k67Var.isEmpty() ? i67.b : i67.b(x10.b(k67Var.get(0)));
        } else if (k67Var.isEmpty()) {
            i67VarB = i67.b;
        } else {
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            while (i2 < i67VarY.a.size() + k67Var.size()) {
                Locale locale = i2 < k67Var.size() ? k67Var.get(i2) : i67VarY.a.get(i2 - k67Var.size());
                if (locale != null) {
                    linkedHashSet.add(locale);
                }
                i2++;
            }
            i67VarB = i67.a((Locale[]) linkedHashSet.toArray(new Locale[linkedHashSet.size()]));
        }
        return i67VarB.a.isEmpty() ? i67VarY : i67VarB;
    }

    public static Configuration s(Context context, int i, i67 i67Var, Configuration configuration, boolean z) {
        int i2 = i != 1 ? i != 2 ? z ? 0 : context.getApplicationContext().getResources().getConfiguration().uiMode & 48 : 32 : 16;
        Configuration configuration2 = new Configuration();
        configuration2.fontScale = 0.0f;
        if (configuration != null) {
            configuration2.setTo(configuration);
        }
        configuration2.uiMode = i2 | (configuration2.uiMode & (-49));
        if (i67Var != null) {
            k67 k67Var = i67Var.a;
            if (Build.VERSION.SDK_INT >= 24) {
                y10.d(configuration2, i67Var);
                return configuration2;
            }
            configuration2.setLocale(k67Var.get(0));
            configuration2.setLayoutDirection(k67Var.get(0));
        }
        return configuration2;
    }

    public static i67 y(Configuration configuration) {
        return Build.VERSION.SDK_INT >= 24 ? y10.b(configuration) : i67.b(x10.b(configuration.locale));
    }

    public final void A() {
        v3f v3fVar;
        v();
        if (this.F && (v3fVar = this.n) == null) {
            Object obj = this.j;
            if (obj instanceof Activity) {
                v3fVar = new v3f((Activity) obj, this.G);
                this.n = v3fVar;
            } else if (obj instanceof Dialog) {
                v3fVar = new v3f((Dialog) obj);
                this.n = v3fVar;
            }
            if (v3fVar != null) {
                v3fVar.d(this.q0);
            }
        }
    }

    public final void B(int i) {
        this.o0 = (1 << i) | this.o0;
        if (this.n0) {
            return;
        }
        View decorView = this.l.getDecorView();
        WeakHashMap weakHashMap = ute.a;
        decorView.postOnAnimation(this.p0);
        this.n0 = true;
    }

    public final int C(Context context, int i) {
        if (i != -100) {
            if (i != -1) {
                if (i != 0) {
                    if (i != 1 && i != 2) {
                        if (i != 3) {
                            ygf.f("Unknown value set for night mode. Please use one of the MODE_NIGHT values from AppCompatDelegate.");
                            return 0;
                        }
                        c20 c20Var = this.m0;
                        if (c20Var == null) {
                            c20Var = new c20(this, context);
                            this.m0 = c20Var;
                        }
                        return c20Var.g();
                    }
                } else if (((UiModeManager) context.getApplicationContext().getSystemService("uimode")).getNightMode() != 0) {
                    return x(context).g();
                }
            }
            return i;
        }
        return -1;
    }

    public final boolean D() {
        mw2 mw2Var;
        und undVar;
        boolean z = this.N;
        this.N = false;
        e20 e20VarZ = z(0);
        if (!e20VarZ.m) {
            l6 l6Var = this.t;
            if (l6Var != null) {
                l6Var.b();
                return true;
            }
            A();
            v3f v3fVar = this.n;
            if (v3fVar == null || (mw2Var = v3fVar.e) == null || (undVar = ((bod) mw2Var).a.L) == null || undVar.b == null) {
                return false;
            }
            und undVar2 = ((bod) mw2Var).a.L;
            sx7 sx7Var = undVar2 == null ? null : undVar2.b;
            if (sx7Var != null) {
                sx7Var.collapseActionView();
            }
        } else if (!z) {
            r(e20VarZ, true);
            return true;
        }
        return true;
    }

    public final boolean F(e20 e20Var, int i, KeyEvent keyEvent) {
        lx7 lx7Var;
        if (keyEvent.isSystem()) {
            return false;
        }
        if ((e20Var.k || G(e20Var, keyEvent)) && (lx7Var = e20Var.h) != null) {
            return lx7Var.performShortcut(i, keyEvent, 1);
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x00ce A[PHI: r6
      0x00ce: PHI (r6v2 lx7) = (r6v1 lx7), (r6v8 lx7) binds: [B:31:0x004c, B:57:0x00cb] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean G(defpackage.e20 r13, android.view.KeyEvent r14) {
        /*
            Method dump skipped, instruction units count: 348
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f20.G(e20, android.view.KeyEvent):boolean");
    }

    public final void H() {
        if (this.z) {
            throw new AndroidRuntimeException("Window feature must be requested before adding content");
        }
    }

    public final void I() {
        OnBackInvokedCallback onBackInvokedCallback;
        if (Build.VERSION.SDK_INT >= 33) {
            boolean z = false;
            if (this.u0 != null && (z(0).m || this.t != null)) {
                z = true;
            }
            if (z && this.v0 == null) {
                this.v0 = a20.b(this.u0, this);
            } else {
                if (z || (onBackInvokedCallback = this.v0) == null) {
                    return;
                }
                a20.c(this.u0, onBackInvokedCallback);
                this.v0 = null;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0044, code lost:
    
        if (r6.j() != false) goto L20;
     */
    @Override // defpackage.jx7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void Y(defpackage.lx7 r6) {
        /*
            Method dump skipped, instruction units count: 231
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f20.Y(lx7):void");
    }

    @Override // defpackage.t10
    public final void a() {
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(this.k);
        if (layoutInflaterFrom.getFactory() == null) {
            layoutInflaterFrom.setFactory2(this);
        } else {
            if (layoutInflaterFrom.getFactory2() instanceof f20) {
                return;
            }
            Log.i("AppCompatDelegate", "The Activity's LayoutInflater already has a Factory installed so we can not install AppCompat's");
        }
    }

    @Override // defpackage.t10
    public final void c() throws IllegalAccessException {
        String strC;
        this.O = true;
        m(false, true);
        w();
        Object obj = this.j;
        if (obj instanceof Activity) {
            try {
                Activity activity = (Activity) obj;
                try {
                    strC = hp7.C(activity, activity.getComponentName());
                } catch (PackageManager.NameNotFoundException e) {
                    throw new IllegalArgumentException(e);
                }
            } catch (IllegalArgumentException unused) {
                strC = null;
            }
            if (strC != null) {
                v3f v3fVar = this.n;
                if (v3fVar == null) {
                    this.q0 = true;
                } else {
                    v3fVar.d(true);
                }
            }
            synchronized (t10.h) {
                t10.f(this);
                t10.g.add(new WeakReference(this));
            }
        }
        this.R = new Configuration(this.k.getResources().getConfiguration());
        this.P = true;
    }

    @Override // defpackage.jx7
    public final boolean d(lx7 lx7Var, MenuItem menuItem) {
        e20 e20Var;
        Window.Callback callback = this.l.getCallback();
        if (callback != null && !this.Q) {
            lx7 lx7VarK = lx7Var.k();
            e20[] e20VarArr = this.L;
            int length = e20VarArr != null ? e20VarArr.length : 0;
            int i = 0;
            while (true) {
                if (i < length) {
                    e20Var = e20VarArr[i];
                    if (e20Var != null && e20Var.h == lx7VarK) {
                        break;
                    }
                    i++;
                } else {
                    e20Var = null;
                    break;
                }
            }
            if (e20Var != null) {
                return callback.onMenuItemSelected(e20Var.a, menuItem);
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x004d  */
    @Override // defpackage.t10
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e() {
        /*
            r3 = this;
            java.lang.Object r0 = r3.j
            boolean r0 = r0 instanceof android.app.Activity
            if (r0 == 0) goto L11
            java.lang.Object r0 = defpackage.t10.h
            monitor-enter(r0)
            defpackage.t10.f(r3)     // Catch: java.lang.Throwable -> Le
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Le
            goto L11
        Le:
            r3 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Le
            throw r3
        L11:
            boolean r0 = r3.n0
            if (r0 == 0) goto L20
            android.view.Window r0 = r3.l
            android.view.View r0 = r0.getDecorView()
            u10 r1 = r3.p0
            r0.removeCallbacks(r1)
        L20:
            r0 = 1
            r3.Q = r0
            int r0 = r3.S
            r1 = -100
            if (r0 == r1) goto L4d
            java.lang.Object r0 = r3.j
            boolean r1 = r0 instanceof android.app.Activity
            if (r1 == 0) goto L4d
            android.app.Activity r0 = (android.app.Activity) r0
            boolean r0 = r0.isChangingConfigurations()
            if (r0 == 0) goto L4d
            aec r0 = defpackage.f20.w0
            java.lang.Object r1 = r3.j
            java.lang.Class r1 = r1.getClass()
            java.lang.String r1 = r1.getName()
            int r2 = r3.S
            java.lang.Integer r2 = java.lang.Integer.valueOf(r2)
            r0.put(r1, r2)
            goto L5c
        L4d:
            aec r0 = defpackage.f20.w0
            java.lang.Object r1 = r3.j
            java.lang.Class r1 = r1.getClass()
            java.lang.String r1 = r1.getName()
            r0.remove(r1)
        L5c:
            c20 r0 = r3.l0
            if (r0 == 0) goto L63
            r0.c()
        L63:
            c20 r3 = r3.m0
            if (r3 == 0) goto L6a
            r3.c()
        L6a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f20.e():void");
    }

    @Override // defpackage.t10
    public final void h(int i) {
        v();
        ViewGroup viewGroup = (ViewGroup) this.A.findViewById(R.id.content);
        viewGroup.removeAllViews();
        LayoutInflater.from(this.k).inflate(i, viewGroup);
        this.m.a(this.l.getCallback());
    }

    @Override // defpackage.t10
    public final void i(View view) {
        v();
        ViewGroup viewGroup = (ViewGroup) this.A.findViewById(R.id.content);
        viewGroup.removeAllViews();
        viewGroup.addView(view);
        this.m.a(this.l.getCallback());
    }

    @Override // defpackage.t10
    public final void j(View view, ViewGroup.LayoutParams layoutParams) {
        v();
        ViewGroup viewGroup = (ViewGroup) this.A.findViewById(R.id.content);
        viewGroup.removeAllViews();
        viewGroup.addView(view, layoutParams);
        this.m.a(this.l.getCallback());
    }

    @Override // defpackage.t10
    public final void l(CharSequence charSequence) {
        this.p = charSequence;
        ActionBarOverlayLayout actionBarOverlayLayout = this.q;
        if (actionBarOverlayLayout != null) {
            actionBarOverlayLayout.setWindowTitle(charSequence);
            return;
        }
        v3f v3fVar = this.n;
        if (v3fVar == null) {
            TextView textView = this.B;
            if (textView != null) {
                textView.setText(charSequence);
                return;
            }
            return;
        }
        bod bodVar = (bod) v3fVar.e;
        if (bodVar.g) {
            return;
        }
        Toolbar toolbar = bodVar.a;
        bodVar.h = charSequence;
        if ((bodVar.b & 8) != 0) {
            toolbar.setTitle(charSequence);
            if (bodVar.g) {
                ute.p(toolbar.getRootView(), charSequence);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x0074  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void n(android.view.Window r8) {
        /*
            r7 = this;
            java.lang.String r0 = "AppCompat has already installed itself into the Window"
            android.view.Window r1 = r7.l
            if (r1 != 0) goto L7e
            android.view.Window$Callback r1 = r8.getCallback()
            boolean r2 = r1 instanceof defpackage.b20
            if (r2 != 0) goto L7a
            b20 r0 = new b20
            r0.<init>(r7, r1)
            r7.m = r0
            r8.setCallback(r0)
            android.content.Context r0 = r7.k
            int[] r1 = defpackage.f20.x0
            r2 = 0
            android.content.res.TypedArray r1 = r0.obtainStyledAttributes(r2, r1)
            r3 = 0
            boolean r4 = r1.hasValue(r3)
            if (r4 == 0) goto L3f
            int r3 = r1.getResourceId(r3, r3)
            if (r3 == 0) goto L3f
            j20 r4 = defpackage.j20.a()
            monitor-enter(r4)
            scb r5 = r4.a     // Catch: java.lang.Throwable -> L3c
            r6 = 1
            android.graphics.drawable.Drawable r0 = r5.g(r0, r3, r6)     // Catch: java.lang.Throwable -> L3c
            monitor-exit(r4)
            goto L40
        L3c:
            r7 = move-exception
            monitor-exit(r4)     // Catch: java.lang.Throwable -> L3c
            throw r7
        L3f:
            r0 = r2
        L40:
            if (r0 == 0) goto L45
            r8.setBackgroundDrawable(r0)
        L45:
            r1.recycle()
            r7.l = r8
            int r8 = android.os.Build.VERSION.SDK_INT
            r0 = 33
            if (r8 < r0) goto L79
            android.window.OnBackInvokedDispatcher r8 = r7.u0
            if (r8 != 0) goto L79
            java.lang.Object r0 = r7.j
            if (r8 == 0) goto L61
            android.window.OnBackInvokedCallback r1 = r7.v0
            if (r1 == 0) goto L61
            defpackage.a20.c(r8, r1)
            r7.v0 = r2
        L61:
            boolean r8 = r0 instanceof android.app.Activity
            if (r8 == 0) goto L74
            android.app.Activity r0 = (android.app.Activity) r0
            android.view.Window r8 = r0.getWindow()
            if (r8 == 0) goto L74
            android.window.OnBackInvokedDispatcher r8 = defpackage.a20.a(r0)
            r7.u0 = r8
            goto L76
        L74:
            r7.u0 = r2
        L76:
            r7.I()
        L79:
            return
        L7a:
            defpackage.ygf.f(r0)
            return
        L7e:
            defpackage.ygf.f(r0)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f20.n(android.view.Window):void");
    }

    @Override // android.view.LayoutInflater.Factory2
    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        a40 a40Var;
        Context l92Var;
        View r20Var;
        a40Var = this.t0;
        View view2 = null;
        if (a40Var == null) {
            int[] iArr = esa.j;
            Context context2 = this.k;
            TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(iArr);
            String string = typedArrayObtainStyledAttributes.getString(116);
            typedArrayObtainStyledAttributes.recycle();
            if (string == null) {
                a40Var = new a40();
                this.t0 = a40Var;
            } else {
                try {
                    a40Var = (a40) context2.getClassLoader().loadClass(string).getDeclaredConstructor(null).newInstance(null);
                    this.t0 = a40Var;
                } catch (Throwable th) {
                    Log.i("AppCompatDelegate", "Failed to instantiate custom view inflater " + string + ". Falling back to default.", th);
                    a40Var = new a40();
                    this.t0 = a40Var;
                }
            }
        }
        int i = dre.a;
        a40Var.getClass();
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, esa.x, 0, 0);
        int resourceId = typedArrayObtainStyledAttributes2.getResourceId(4, 0);
        if (resourceId != 0) {
            Log.i("AppCompatViewInflater", "app:theme is now deprecated. Please move to using android:theme instead.");
        }
        typedArrayObtainStyledAttributes2.recycle();
        l92Var = (resourceId == 0 || ((context instanceof l92) && ((l92) context).a == resourceId)) ? context : new l92(context, resourceId);
        str.getClass();
        switch (str) {
            case "RatingBar":
                r20Var = new r20(l92Var, attributeSet);
                break;
            case "CheckedTextView":
                r20Var = new n10(l92Var, attributeSet);
                break;
            case "MultiAutoCompleteTextView":
                r20Var = new o20(l92Var, attributeSet);
                break;
            case "TextView":
                r20Var = a40Var.e(l92Var, attributeSet);
                break;
            case "ImageButton":
                r20Var = new n20(l92Var, attributeSet, com.medium.reader.R.attr.imageButtonStyle);
                break;
            case "SeekBar":
                r20Var = new t20(l92Var, attributeSet);
                break;
            case "Spinner":
                r20Var = new f30(l92Var, attributeSet);
                break;
            case "RadioButton":
                r20Var = a40Var.d(l92Var, attributeSet);
                break;
            case "ToggleButton":
                r20Var = new x30(l92Var, attributeSet);
                break;
            case "ImageView":
                r20Var = new AppCompatImageView(l92Var, attributeSet);
                break;
            case "AutoCompleteTextView":
                r20Var = a40Var.a(l92Var, attributeSet);
                break;
            case "CheckBox":
                r20Var = a40Var.c(l92Var, attributeSet);
                break;
            case "EditText":
                r20Var = new l20(l92Var, attributeSet);
                break;
            case "Button":
                r20Var = a40Var.b(l92Var, attributeSet);
                break;
            default:
                r20Var = null;
                break;
        }
        if (r20Var == null && context != l92Var) {
            Object[] objArr = a40Var.a;
            if (str.equals("view")) {
                str = attributeSet.getAttributeValue(null, "class");
            }
            try {
                objArr[0] = l92Var;
                objArr[1] = attributeSet;
                if (-1 == str.indexOf(46)) {
                    int i2 = 0;
                    while (true) {
                        String[] strArr = a40.g;
                        if (i2 < 3) {
                            View viewF = a40Var.f(l92Var, str, strArr[i2]);
                            if (viewF != null) {
                                objArr[0] = null;
                                objArr[1] = null;
                                view2 = viewF;
                            } else {
                                i2++;
                            }
                        } else {
                            objArr[0] = null;
                            objArr[1] = null;
                        }
                    }
                } else {
                    View viewF2 = a40Var.f(l92Var, str, null);
                    objArr[0] = null;
                    objArr[1] = null;
                    view2 = viewF2;
                }
            } catch (Exception unused) {
                objArr[0] = null;
                objArr[1] = null;
            } catch (Throwable th2) {
                objArr[0] = null;
                objArr[1] = null;
                throw th2;
            }
            r20Var = view2;
        }
        if (r20Var != null) {
            Context context3 = r20Var.getContext();
            if ((context3 instanceof ContextWrapper) && r20Var.hasOnClickListeners()) {
                TypedArray typedArrayObtainStyledAttributes3 = context3.obtainStyledAttributes(attributeSet, a40.c);
                String string2 = typedArrayObtainStyledAttributes3.getString(0);
                if (string2 != null) {
                    r20Var.setOnClickListener(new z30(r20Var, string2));
                }
                typedArrayObtainStyledAttributes3.recycle();
            }
            if (Build.VERSION.SDK_INT <= 28) {
                TypedArray typedArrayObtainStyledAttributes4 = l92Var.obtainStyledAttributes(attributeSet, a40.d);
                if (typedArrayObtainStyledAttributes4.hasValue(0)) {
                    boolean z = typedArrayObtainStyledAttributes4.getBoolean(0, false);
                    WeakHashMap weakHashMap = ute.a;
                    new ite(com.medium.reader.R.id.tag_accessibility_heading, Boolean.class, 0, 28, 2).h(r20Var, Boolean.valueOf(z));
                }
                typedArrayObtainStyledAttributes4.recycle();
                TypedArray typedArrayObtainStyledAttributes5 = l92Var.obtainStyledAttributes(attributeSet, a40.e);
                if (typedArrayObtainStyledAttributes5.hasValue(0)) {
                    ute.p(r20Var, typedArrayObtainStyledAttributes5.getString(0));
                }
                typedArrayObtainStyledAttributes5.recycle();
                TypedArray typedArrayObtainStyledAttributes6 = l92Var.obtainStyledAttributes(attributeSet, a40.f);
                if (typedArrayObtainStyledAttributes6.hasValue(0)) {
                    boolean z2 = typedArrayObtainStyledAttributes6.getBoolean(0, false);
                    WeakHashMap weakHashMap2 = ute.a;
                    new ite(com.medium.reader.R.id.tag_screen_reader_focusable, Boolean.class, 0, 28, 0).h(r20Var, Boolean.valueOf(z2));
                }
                typedArrayObtainStyledAttributes6.recycle();
            }
        }
        return r20Var;
    }

    public final void p(int i, e20 e20Var, lx7 lx7Var) {
        if (lx7Var == null) {
            if (e20Var == null && i >= 0) {
                e20[] e20VarArr = this.L;
                if (i < e20VarArr.length) {
                    e20Var = e20VarArr[i];
                }
            }
            if (e20Var != null) {
                lx7Var = e20Var.h;
            }
        }
        if ((e20Var == null || e20Var.m) && !this.Q) {
            b20 b20Var = this.m;
            Window.Callback callback = this.l.getCallback();
            b20Var.getClass();
            try {
                b20Var.d = true;
                callback.onPanelClosed(i, lx7Var);
            } finally {
                b20Var.d = false;
            }
        }
    }

    public final void q(lx7 lx7Var) {
        h6 h6Var;
        if (this.K) {
            return;
        }
        this.K = true;
        ActionBarOverlayLayout actionBarOverlayLayout = this.q;
        actionBarOverlayLayout.e();
        ActionMenuView actionMenuView = ((bod) actionBarOverlayLayout.e).a.a;
        if (actionMenuView != null && (h6Var = actionMenuView.t) != null) {
            h6Var.e();
            e6 e6Var = h6Var.t;
            if (e6Var != null && e6Var.b()) {
                e6Var.i.dismiss();
            }
        }
        Window.Callback callback = this.l.getCallback();
        if (callback != null && !this.Q) {
            callback.onPanelClosed(108, lx7Var);
        }
        this.K = false;
    }

    public final void r(e20 e20Var, boolean z) {
        d20 d20Var;
        ActionBarOverlayLayout actionBarOverlayLayout;
        h6 h6Var;
        if (z && e20Var.a == 0 && (actionBarOverlayLayout = this.q) != null) {
            actionBarOverlayLayout.e();
            ActionMenuView actionMenuView = ((bod) actionBarOverlayLayout.e).a.a;
            if (actionMenuView != null && (h6Var = actionMenuView.t) != null && h6Var.j()) {
                q(e20Var.h);
                return;
            }
        }
        WindowManager windowManager = (WindowManager) this.k.getSystemService("window");
        if (windowManager != null && e20Var.m && (d20Var = e20Var.e) != null) {
            windowManager.removeView(d20Var);
            if (z) {
                p(e20Var.a, e20Var, null);
            }
        }
        e20Var.k = false;
        e20Var.l = false;
        e20Var.m = false;
        e20Var.f = null;
        e20Var.n = true;
        if (this.M == e20Var) {
            this.M = null;
        }
        if (e20Var.a == 0) {
            I();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x011b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean t(android.view.KeyEvent r7) {
        /*
            Method dump skipped, instruction units count: 327
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f20.t(android.view.KeyEvent):boolean");
    }

    public final void u(int i) {
        e20 e20VarZ = z(i);
        if (e20VarZ.h != null) {
            Bundle bundle = new Bundle();
            e20VarZ.h.t(bundle);
            if (bundle.size() > 0) {
                e20VarZ.p = bundle;
            }
            e20VarZ.h.w();
            e20VarZ.h.clear();
        }
        e20VarZ.o = true;
        e20VarZ.n = true;
        if ((i == 108 || i == 0) && this.q != null) {
            e20 e20VarZ2 = z(0);
            e20VarZ2.k = false;
            G(e20VarZ2, null);
        }
    }

    public final void v() {
        ViewGroup viewGroup;
        if (this.z) {
            return;
        }
        Context context = this.k;
        int[] iArr = esa.j;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(iArr);
        if (!typedArrayObtainStyledAttributes.hasValue(117)) {
            typedArrayObtainStyledAttributes.recycle();
            ygf.f("You need to use a Theme.AppCompat theme (or descendant) with this activity.");
            return;
        }
        if (typedArrayObtainStyledAttributes.getBoolean(ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, false)) {
            g(1);
        } else if (typedArrayObtainStyledAttributes.getBoolean(117, false)) {
            g(108);
        }
        if (typedArrayObtainStyledAttributes.getBoolean(118, false)) {
            g(109);
        }
        if (typedArrayObtainStyledAttributes.getBoolean(PanasonicMakernoteDirectory.TAG_BURST_SPEED, false)) {
            g(10);
        }
        this.I = typedArrayObtainStyledAttributes.getBoolean(0, false);
        typedArrayObtainStyledAttributes.recycle();
        w();
        this.l.getDecorView();
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        if (this.J) {
            viewGroup = this.H ? (ViewGroup) layoutInflaterFrom.inflate(com.medium.reader.R.layout.abc_screen_simple_overlay_action_mode, (ViewGroup) null) : (ViewGroup) layoutInflaterFrom.inflate(com.medium.reader.R.layout.abc_screen_simple, (ViewGroup) null);
        } else if (this.I) {
            viewGroup = (ViewGroup) layoutInflaterFrom.inflate(com.medium.reader.R.layout.abc_dialog_title_material, (ViewGroup) null);
            this.G = false;
            this.F = false;
        } else if (this.F) {
            TypedValue typedValue = new TypedValue();
            context.getTheme().resolveAttribute(com.medium.reader.R.attr.actionBarTheme, typedValue, true);
            viewGroup = (ViewGroup) LayoutInflater.from(typedValue.resourceId != 0 ? new l92(context, typedValue.resourceId) : context).inflate(com.medium.reader.R.layout.abc_screen_toolbar, (ViewGroup) null);
            ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) viewGroup.findViewById(com.medium.reader.R.id.decor_content_parent);
            this.q = actionBarOverlayLayout;
            actionBarOverlayLayout.setWindowCallback(this.l.getCallback());
            if (this.G) {
                this.q.d(109);
            }
            if (this.D) {
                this.q.d(2);
            }
            if (this.E) {
                this.q.d(5);
            }
        } else {
            viewGroup = null;
        }
        if (viewGroup == null) {
            StringBuilder sb = new StringBuilder("AppCompat does not support the current theme features: { windowActionBar: ");
            sb.append(this.F);
            sb.append(", windowActionBarOverlay: ");
            sb.append(this.G);
            sb.append(", android:windowIsFloating: ");
            sb.append(this.I);
            sb.append(", windowActionModeOverlay: ");
            sb.append(this.H);
            sb.append(", windowNoTitle: ");
            ay0.e(lv8.t(sb, this.J, " }"));
            return;
        }
        v10 v10Var = new v10(this);
        WeakHashMap weakHashMap = ute.a;
        mte.c(viewGroup, v10Var);
        if (this.q == null) {
            this.B = (TextView) viewGroup.findViewById(com.medium.reader.R.id.title);
        }
        boolean z = bwe.a;
        try {
            Method method = viewGroup.getClass().getMethod("makeOptionalFitsSystemWindows", null);
            if (!method.isAccessible()) {
                method.setAccessible(true);
            }
            method.invoke(viewGroup, null);
        } catch (IllegalAccessException e) {
            Log.d("ViewUtils", "Could not invoke makeOptionalFitsSystemWindows", e);
        } catch (NoSuchMethodException unused) {
            Log.d("ViewUtils", "Could not find method makeOptionalFitsSystemWindows. Oh well...");
        } catch (InvocationTargetException e2) {
            Log.d("ViewUtils", "Could not invoke makeOptionalFitsSystemWindows", e2);
        }
        ContentFrameLayout contentFrameLayout = (ContentFrameLayout) viewGroup.findViewById(com.medium.reader.R.id.action_bar_activity_content);
        ViewGroup viewGroup2 = (ViewGroup) this.l.findViewById(R.id.content);
        if (viewGroup2 != null) {
            while (viewGroup2.getChildCount() > 0) {
                View childAt = viewGroup2.getChildAt(0);
                viewGroup2.removeViewAt(0);
                contentFrameLayout.addView(childAt);
            }
            viewGroup2.setId(-1);
            contentFrameLayout.setId(R.id.content);
            if (viewGroup2 instanceof FrameLayout) {
                ((FrameLayout) viewGroup2).setForeground(null);
            }
        }
        this.l.setContentView(viewGroup);
        contentFrameLayout.setAttachListener(new olb(4, this));
        this.A = viewGroup;
        Object obj = this.j;
        CharSequence title = obj instanceof Activity ? ((Activity) obj).getTitle() : this.p;
        if (!TextUtils.isEmpty(title)) {
            ActionBarOverlayLayout actionBarOverlayLayout2 = this.q;
            if (actionBarOverlayLayout2 != null) {
                actionBarOverlayLayout2.setWindowTitle(title);
            } else {
                v3f v3fVar = this.n;
                if (v3fVar != null) {
                    bod bodVar = (bod) v3fVar.e;
                    if (!bodVar.g) {
                        Toolbar toolbar = bodVar.a;
                        bodVar.h = title;
                        if ((bodVar.b & 8) != 0) {
                            toolbar.setTitle(title);
                            if (bodVar.g) {
                                ute.p(toolbar.getRootView(), title);
                            }
                        }
                    }
                } else {
                    TextView textView = this.B;
                    if (textView != null) {
                        textView.setText(title);
                    }
                }
            }
        }
        ContentFrameLayout contentFrameLayout2 = (ContentFrameLayout) this.A.findViewById(R.id.content);
        View decorView = this.l.getDecorView();
        contentFrameLayout2.g.set(decorView.getPaddingLeft(), decorView.getPaddingTop(), decorView.getPaddingRight(), decorView.getPaddingBottom());
        if (contentFrameLayout2.isLaidOut()) {
            contentFrameLayout2.requestLayout();
        }
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(iArr);
        typedArrayObtainStyledAttributes2.getValue(PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH, contentFrameLayout2.getMinWidthMajor());
        typedArrayObtainStyledAttributes2.getValue(125, contentFrameLayout2.getMinWidthMinor());
        if (typedArrayObtainStyledAttributes2.hasValue(122)) {
            typedArrayObtainStyledAttributes2.getValue(122, contentFrameLayout2.getFixedWidthMajor());
        }
        if (typedArrayObtainStyledAttributes2.hasValue(123)) {
            typedArrayObtainStyledAttributes2.getValue(123, contentFrameLayout2.getFixedWidthMinor());
        }
        if (typedArrayObtainStyledAttributes2.hasValue(120)) {
            typedArrayObtainStyledAttributes2.getValue(120, contentFrameLayout2.getFixedHeightMajor());
        }
        if (typedArrayObtainStyledAttributes2.hasValue(PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE)) {
            typedArrayObtainStyledAttributes2.getValue(PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE, contentFrameLayout2.getFixedHeightMinor());
        }
        typedArrayObtainStyledAttributes2.recycle();
        contentFrameLayout2.requestLayout();
        this.z = true;
        e20 e20VarZ = z(0);
        if (this.Q || e20VarZ.h != null) {
            return;
        }
        B(108);
    }

    public final void w() {
        if (this.l == null) {
            Object obj = this.j;
            if (obj instanceof Activity) {
                n(((Activity) obj).getWindow());
            }
        }
        if (this.l != null) {
            return;
        }
        ygf.f("We have not been given a Window");
    }

    public final n4 x(Context context) {
        c20 c20Var = this.l0;
        if (c20Var == null) {
            vwa vwaVar = vwa.e;
            if (vwaVar == null) {
                Context applicationContext = context.getApplicationContext();
                vwaVar = new vwa(applicationContext, (LocationManager) applicationContext.getSystemService("location"));
                vwa.e = vwaVar;
            }
            c20Var = new c20(this, vwaVar);
            this.l0 = c20Var;
        }
        return c20Var;
    }

    public final e20 z(int i) {
        e20[] e20VarArr = this.L;
        if (e20VarArr == null || e20VarArr.length <= i) {
            e20[] e20VarArr2 = new e20[i + 1];
            if (e20VarArr != null) {
                System.arraycopy(e20VarArr, 0, e20VarArr2, 0, e20VarArr.length);
            }
            this.L = e20VarArr2;
            e20VarArr = e20VarArr2;
        }
        e20 e20Var = e20VarArr[i];
        if (e20Var != null) {
            return e20Var;
        }
        e20 e20Var2 = new e20();
        e20Var2.a = i;
        e20Var2.n = false;
        e20VarArr[i] = e20Var2;
        return e20Var2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:87:0x0171, code lost:
    
        if (r6.getCount() > 0) goto L88;
     */
    /* JADX WARN: Removed duplicated region for block: B:100:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:105:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void E(defpackage.e20 r18, android.view.KeyEvent r19) {
        /*
            Method dump skipped, instruction units count: 469
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f20.E(e20, android.view.KeyEvent):void");
    }

    @Override // defpackage.t10
    public final boolean g(int i) {
        String str = OphtYB.XSzJrbIqV;
        if (i == 8) {
            Log.i(str, "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR id when requesting this feature.");
            i = 108;
        } else if (i == 9) {
            Log.i(str, ZVsviyDAr.UuS);
            i = 109;
        }
        if (this.J && i == 108) {
            return false;
        }
        if (this.F && i == 1) {
            this.F = false;
        }
        if (i == 1) {
            H();
            this.J = true;
            return true;
        }
        if (i == 2) {
            H();
            this.D = true;
            return true;
        }
        if (i == 5) {
            H();
            this.E = true;
            return true;
        }
        if (i == 10) {
            H();
            this.H = true;
            return true;
        }
        if (i == 108) {
            H();
            this.F = true;
            return true;
        }
        if (i != 109) {
            return this.l.requestFeature(i);
        }
        H();
        this.G = true;
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0100  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean m(boolean r17, boolean r18) throws java.lang.IllegalAccessException {
        /*
            Method dump skipped, instruction units count: 624
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f20.m(boolean, boolean):boolean");
    }

    @Override // android.view.LayoutInflater.Factory
    public final View onCreateView(String str, Context context, AttributeSet attributeSet) {
        return onCreateView(null, str, context, attributeSet);
    }
}
