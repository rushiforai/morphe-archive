package m;

import a5.a1;
import a5.i1;
import android.app.Activity;
import android.app.Dialog;
import android.app.UiModeManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.location.LocationManager;
import android.media.AudioManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.LocaleList;
import android.text.TextUtils;
import android.util.AndroidRuntimeException;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import android.widget.TextView;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import androidx.appcompat.view.menu.ExpandedMenuView;
import androidx.appcompat.widget.ActionBarContextView;
import androidx.appcompat.widget.ActionBarOverlayLayout;
import androidx.appcompat.widget.ActionMenuView;
import androidx.appcompat.widget.AppCompatImageView;
import androidx.appcompat.widget.AppCompatSeekBar;
import androidx.appcompat.widget.ContentFrameLayout;
import androidx.appcompat.widget.Toolbar;
import androidx.appcompat.widget.ViewStubCompat;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.WeakHashMap;
import r.l2;
import r.n2;
import r.p2;
import r.w0;
import r.x0;
import r.z1;
import z.c1;

/* loaded from: classes2.dex */
public final class f0 extends s implements q.i, LayoutInflater.Factory2 {

    /* renamed from: h0, reason: collision with root package name */
    public static final c1 f75219h0 = new c1(0);

    /* renamed from: i0, reason: collision with root package name */
    public static final int[] f75220i0 = {16842836};

    /* renamed from: j0, reason: collision with root package name */
    public static final boolean f75221j0 = !"robolectric".equals(Build.FINGERPRINT);
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
    public e0[] L;
    public e0 M;
    public boolean N;
    public boolean O;
    public boolean P;
    public boolean Q;
    public Configuration R;
    public final int S;
    public int T;
    public int U;
    public boolean V;
    public c0 W;
    public c0 X;
    public boolean Y;
    public int Z;

    /* renamed from: a0, reason: collision with root package name */
    public final t f75222a0;

    /* renamed from: b0, reason: collision with root package name */
    public boolean f75223b0;

    /* renamed from: c0, reason: collision with root package name */
    public Rect f75224c0;

    /* renamed from: d0, reason: collision with root package name */
    public Rect f75225d0;

    /* renamed from: e0, reason: collision with root package name */
    public j0 f75226e0;

    /* renamed from: f0, reason: collision with root package name */
    public OnBackInvokedDispatcher f75227f0;

    /* renamed from: g0, reason: collision with root package name */
    public OnBackInvokedCallback f75228g0;

    /* renamed from: j, reason: collision with root package name */
    public final Object f75229j;

    /* renamed from: k, reason: collision with root package name */
    public final Context f75230k;

    /* renamed from: l, reason: collision with root package name */
    public Window f75231l;

    /* renamed from: m, reason: collision with root package name */
    public b0 f75232m;
    public final Object n;
    public b o;

    /* renamed from: p, reason: collision with root package name */
    public androidx.appcompat.view.i f75233p;

    /* renamed from: q, reason: collision with root package name */
    public CharSequence f75234q;

    /* renamed from: r, reason: collision with root package name */
    public x0 f75235r;

    /* renamed from: s, reason: collision with root package name */
    public u f75236s;

    /* renamed from: t, reason: collision with root package name */
    public u f75237t;

    /* renamed from: u, reason: collision with root package name */
    public androidx.appcompat.view.b f75238u;

    /* renamed from: v, reason: collision with root package name */
    public ActionBarContextView f75239v;

    /* renamed from: w, reason: collision with root package name */
    public PopupWindow f75240w;

    /* renamed from: x, reason: collision with root package name */
    public t f75241x;

    /* renamed from: y, reason: collision with root package name */
    public i1 f75242y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f75243z;

    public f0(m mVar, m mVar2) {
        this(mVar, null, mVar2, mVar);
    }

    public static w4.g G(Context context) {
        w4.g gVar;
        w4.g gVarF;
        if (Build.VERSION.SDK_INT >= 33 || (gVar = s.f75340c) == null) {
            return null;
        }
        w4.h hVar = gVar.f93751a;
        w4.g gVarB = y.b(context.getApplicationContext().getResources().getConfiguration());
        if (gVar.d()) {
            gVarF = w4.g.f93750b;
        } else {
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            int i5 = 0;
            while (i5 < gVarB.f93751a.f93752a.size() + hVar.f93752a.size()) {
                Locale localeB = i5 < hVar.f93752a.size() ? gVar.b(i5) : gVarB.b(i5 - hVar.f93752a.size());
                if (localeB != null) {
                    linkedHashSet.add(localeB);
                }
                i5++;
            }
            gVarF = w4.g.f(new LocaleList((Locale[]) linkedHashSet.toArray(new Locale[linkedHashSet.size()])));
        }
        return gVarF.d() ? gVarB : gVarF;
    }

    public static Configuration K(Context context, int i5, w4.g gVar, Configuration configuration, boolean z11) {
        int i11 = i5 != 1 ? i5 != 2 ? z11 ? 0 : context.getApplicationContext().getResources().getConfiguration().uiMode & 48 : 32 : 16;
        Configuration configuration2 = new Configuration();
        configuration2.fontScale = 0.0f;
        if (configuration != null) {
            configuration2.setTo(configuration);
        }
        configuration2.uiMode = i11 | (configuration2.uiMode & (-49));
        if (gVar != null) {
            y.d(configuration2, gVar);
        }
        return configuration2;
    }

    @Override // m.s
    public final void A(Toolbar toolbar) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        Object obj = this.f75229j;
        if (obj instanceof Activity) {
            R();
            b bVar = this.o;
            if (bVar instanceof s0) {
                throw new IllegalStateException("This Activity already has an action bar supplied by the window decor. Do not request Window.FEATURE_SUPPORT_ACTION_BAR and set windowActionBar to false in your theme to use a Toolbar instead.");
            }
            this.f75233p = null;
            if (bVar != null) {
                bVar.i();
            }
            this.o = null;
            if (toolbar != null) {
                n0 n0Var = new n0(toolbar, obj instanceof Activity ? ((Activity) obj).getTitle() : this.f75234q, this.f75232m);
                this.o = n0Var;
                this.f75232m.f75188a = n0Var.f75312c;
                if (!toolbar.R) {
                    toolbar.R = true;
                    toolbar.D();
                }
            } else {
                this.f75232m.f75188a = null;
            }
            m();
        }
    }

    @Override // m.s
    public final void B(int i5) {
        this.T = i5;
    }

    @Override // m.s
    public final void C(CharSequence charSequence) {
        this.f75234q = charSequence;
        x0 x0Var = this.f75235r;
        if (x0Var == null) {
            b bVar = this.o;
            if (bVar != null) {
                bVar.y(charSequence);
                return;
            }
            TextView textView = this.B;
            if (textView != null) {
                textView.setText(charSequence);
                return;
            }
            return;
        }
        ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) x0Var;
        actionBarOverlayLayout.k();
        l2 l2Var = actionBarOverlayLayout.f13722e;
        if (l2Var.f84795g) {
            return;
        }
        Toolbar toolbar = l2Var.f84789a;
        l2Var.f84796h = charSequence;
        if ((l2Var.f84790b & 8) != 0) {
            toolbar.A(charSequence);
            if (l2Var.f84795g) {
                a1.l(toolbar.getRootView(), charSequence);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x004a  */
    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, m.n] */
    @Override // m.s
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final androidx.appcompat.view.b D(androidx.appcompat.view.a aVar) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        androidx.appcompat.view.b bVarOnWindowStartingSupportActionMode;
        ViewGroup viewGroup;
        androidx.appcompat.view.b bVar;
        if (aVar == null) {
            throw new IllegalArgumentException("ActionMode callback can not be null.");
        }
        androidx.appcompat.view.b bVar2 = this.f75238u;
        if (bVar2 != null) {
            bVar2.b();
        }
        w wVar = new w(0, this, aVar);
        R();
        b bVar3 = this.o;
        ?? r22 = this.n;
        if (bVar3 != null) {
            androidx.appcompat.view.b bVarZ = bVar3.z(wVar);
            this.f75238u = bVarZ;
            if (bVarZ != null && r22 != 0) {
                r22.onSupportActionModeStarted(bVarZ);
            }
        }
        if (this.f75238u == null) {
            i1 i1Var = this.f75242y;
            if (i1Var != null) {
                i1Var.b();
            }
            androidx.appcompat.view.b bVar4 = this.f75238u;
            if (bVar4 != null) {
                bVar4.b();
            }
            if (r22 == 0 || this.Q) {
                bVarOnWindowStartingSupportActionMode = null;
                if (bVarOnWindowStartingSupportActionMode == null) {
                    this.f75238u = bVarOnWindowStartingSupportActionMode;
                } else {
                    int i5 = 1;
                    if (this.f75239v == null) {
                        boolean z11 = this.I;
                        Context context = this.f75230k;
                        if (z11) {
                            TypedValue typedValue = new TypedValue();
                            Resources.Theme theme = context.getTheme();
                            theme.resolveAttribute(2130968589, typedValue, true);
                            if (typedValue.resourceId != 0) {
                                Resources.Theme themeNewTheme = context.getResources().newTheme();
                                themeNewTheme.setTo(theme);
                                themeNewTheme.applyStyle(typedValue.resourceId, true);
                                androidx.appcompat.view.d dVar = new androidx.appcompat.view.d(context, 0);
                                dVar.getTheme().setTo(themeNewTheme);
                                context = dVar;
                            }
                            this.f75239v = new ActionBarContextView(context, null);
                            PopupWindow popupWindow = new PopupWindow(context, (AttributeSet) null, 2130968604);
                            this.f75240w = popupWindow;
                            popupWindow.setWindowLayoutType(2);
                            this.f75240w.setContentView(this.f75239v);
                            this.f75240w.setWidth(-1);
                            context.getTheme().resolveAttribute(2130968583, typedValue, true);
                            this.f75239v.f13704e = TypedValue.complexToDimensionPixelSize(typedValue.data, context.getResources().getDisplayMetrics());
                            this.f75240w.setHeight(-2);
                            this.f75241x = new t(this, i5);
                        } else {
                            ViewStubCompat viewStubCompat = (ViewStubCompat) this.A.findViewById(2131427420);
                            if (viewStubCompat != null) {
                                R();
                                b bVar5 = this.o;
                                Context contextE = bVar5 != null ? bVar5.e() : null;
                                if (contextE != null) {
                                    context = contextE;
                                }
                                viewStubCompat.f13829d = LayoutInflater.from(context);
                                this.f75239v = (ActionBarContextView) viewStubCompat.a();
                            }
                        }
                    }
                    if (this.f75239v != null) {
                        i1 i1Var2 = this.f75242y;
                        if (i1Var2 != null) {
                            i1Var2.b();
                        }
                        this.f75239v.e();
                        Context context2 = this.f75239v.getContext();
                        ActionBarContextView actionBarContextView = this.f75239v;
                        androidx.appcompat.view.e eVar = new androidx.appcompat.view.e();
                        eVar.f13613c = context2;
                        eVar.f13614d = actionBarContextView;
                        eVar.f13615e = wVar;
                        q.k kVar = new q.k(actionBarContextView.getContext());
                        kVar.f83243l = 1;
                        eVar.f13618h = kVar;
                        kVar.f83236e = eVar;
                        if (((androidx.appcompat.view.a) wVar.f75378b).k(eVar, kVar)) {
                            eVar.i();
                            this.f75239v.c(eVar);
                            this.f75238u = eVar;
                            if (this.f75243z && (viewGroup = this.A) != null && viewGroup.isLaidOut()) {
                                this.f75239v.setAlpha(0.0f);
                                i1 i1VarA = a1.a(this.f75239v);
                                i1VarA.a(1.0f);
                                this.f75242y = i1VarA;
                                i1VarA.d(new v(this, i5));
                            } else {
                                this.f75239v.setAlpha(1.0f);
                                this.f75239v.setVisibility(0);
                                if (this.f75239v.getParent() instanceof View) {
                                    View view = (View) this.f75239v.getParent();
                                    WeakHashMap weakHashMap = a1.f250a;
                                    a5.q0.c(view);
                                }
                            }
                            if (this.f75240w != null) {
                                this.f75231l.getDecorView().post(this.f75241x);
                            }
                        } else {
                            this.f75238u = null;
                        }
                    }
                }
                bVar = this.f75238u;
                if (bVar != null && r22 != 0) {
                    r22.onSupportActionModeStarted(bVar);
                }
                Z();
                this.f75238u = this.f75238u;
            } else {
                try {
                    bVarOnWindowStartingSupportActionMode = r22.onWindowStartingSupportActionMode(wVar);
                } catch (AbstractMethodError unused) {
                }
                if (bVarOnWindowStartingSupportActionMode == null) {
                }
                bVar = this.f75238u;
                if (bVar != null) {
                    r22.onSupportActionModeStarted(bVar);
                }
                Z();
                this.f75238u = this.f75238u;
            }
        }
        Z();
        return this.f75238u;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00f3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean E(boolean z11, boolean z12) throws PackageManager.NameNotFoundException {
        int i5;
        boolean z13;
        if (this.Q) {
            return false;
        }
        int i11 = this.S;
        if (i11 == -100) {
            i11 = s.f75339b;
        }
        Context context = this.f75230k;
        int iT = T(context, i11);
        int i12 = Build.VERSION.SDK_INT;
        w4.g gVarG = i12 < 33 ? G(context) : null;
        if (!z12 && gVarG != null) {
            gVarG = y.b(context.getResources().getConfiguration());
        }
        Configuration configurationK = K(context, iT, gVarG, null, false);
        boolean z14 = this.V;
        boolean z15 = true;
        Object obj = this.f75229j;
        if (z14 || !(obj instanceof Activity)) {
            this.V = true;
            i5 = this.U;
        } else {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null) {
                i5 = 0;
            } else {
                try {
                    ActivityInfo activityInfo = packageManager.getActivityInfo(new ComponentName(context, obj.getClass()), i12 >= 29 ? 269221888 : 786432);
                    if (activityInfo != null) {
                        this.U = activityInfo.configChanges;
                    }
                } catch (PackageManager.NameNotFoundException unused) {
                    this.U = 0;
                }
                this.V = true;
                i5 = this.U;
            }
        }
        Configuration configuration = this.R;
        if (configuration == null) {
            configuration = context.getResources().getConfiguration();
        }
        int i13 = configuration.uiMode & 48;
        int i14 = configurationK.uiMode & 48;
        w4.g gVarB = y.b(configuration);
        w4.g gVarB2 = gVarG == null ? null : y.b(configurationK);
        int i15 = i13 != i14 ? EventBridgeChannel.QUEUE_CAPACITY : 0;
        if (gVarB2 != null && !gVarB.equals(gVarB2)) {
            i15 |= 8196;
        }
        if (((~i5) & i15) != 0 && z11 && this.O && ((f75221j0 || this.P) && (obj instanceof Activity))) {
            Activity activity = (Activity) obj;
            if (!activity.isChild()) {
                int i16 = Build.VERSION.SDK_INT;
                if (i16 >= 31 && (i15 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                    activity.getWindow().getDecorView().setLayoutDirection(configurationK.getLayoutDirection());
                }
                if (i16 >= 28) {
                    activity.recreate();
                } else {
                    new Handler(activity.getMainLooper()).post(new g.p(activity, 21));
                }
                z13 = true;
            }
        } else {
            z13 = false;
        }
        if (z13 || i15 == 0) {
            z15 = z13;
        } else {
            boolean z16 = (i15 & i5) == i15;
            Resources resources = context.getResources();
            Configuration configuration2 = new Configuration(resources.getConfiguration());
            configuration2.uiMode = (resources.getConfiguration().uiMode & (-49)) | i14;
            if (gVarB2 != null) {
                y.d(configuration2, gVarB2);
            }
            resources.updateConfiguration(configuration2, null);
            int i17 = this.T;
            if (i17 != 0) {
                context.setTheme(i17);
                context.getTheme().applyStyle(this.T, true);
            }
            if (z16 && (obj instanceof Activity)) {
                Activity activity2 = (Activity) obj;
                if (activity2 instanceof h6.a0) {
                    if (((h6.a0) activity2).getLifecycle().b().compareTo(h6.t.f59442c) >= 0) {
                        activity2.onConfigurationChanged(configuration2);
                    }
                } else if (this.P && !this.Q) {
                    activity2.onConfigurationChanged(configuration2);
                }
            }
        }
        if (z15 && (obj instanceof m)) {
            if ((i15 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
                ((m) obj).onNightModeChanged(iT);
            }
            if ((i15 & 4) != 0) {
                ((m) obj).onLocalesChanged(gVarG);
            }
        }
        if (gVarB2 != null) {
            y.c(y.b(context.getResources().getConfiguration()));
        }
        if (i11 == 0) {
            P(context).B();
        } else {
            c0 c0Var = this.W;
            if (c0Var != null) {
                c0Var.h();
            }
        }
        if (i11 == 3) {
            if (this.X == null) {
                this.X = new c0(this, context);
            }
            this.X.B();
        } else {
            c0 c0Var2 = this.X;
            if (c0Var2 != null) {
                c0Var2.h();
            }
        }
        return z15;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x006c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void F(Window window) {
        OnBackInvokedDispatcher onBackInvokedDispatcher;
        OnBackInvokedCallback onBackInvokedCallback;
        int resourceId;
        if (this.f75231l != null) {
            throw new IllegalStateException("AppCompat has already installed itself into the Window");
        }
        Window.Callback callback = window.getCallback();
        if (callback instanceof b0) {
            throw new IllegalStateException("AppCompat has already installed itself into the Window");
        }
        b0 b0Var = new b0(this, callback);
        this.f75232m = b0Var;
        window.setCallback(b0Var);
        int[] iArr = f75220i0;
        Context context = this.f75230k;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes((AttributeSet) null, iArr);
        Drawable drawableC = (!typedArrayObtainStyledAttributes.hasValue(0) || (resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0)) == 0) ? null : r.p.a().c(context, resourceId);
        if (drawableC != null) {
            window.setBackgroundDrawable(drawableC);
        }
        typedArrayObtainStyledAttributes.recycle();
        this.f75231l = window;
        if (Build.VERSION.SDK_INT < 33 || (onBackInvokedDispatcher = this.f75227f0) != null) {
            return;
        }
        if (onBackInvokedDispatcher != null && (onBackInvokedCallback = this.f75228g0) != null) {
            a0.c(onBackInvokedDispatcher, onBackInvokedCallback);
            this.f75228g0 = null;
        }
        Object obj = this.f75229j;
        if (obj instanceof Activity) {
            Activity activity = (Activity) obj;
            if (activity.getWindow() != null) {
                this.f75227f0 = a0.a(activity);
            } else {
                this.f75227f0 = null;
            }
        }
        Z();
    }

    public final void H(int i5, e0 e0Var, q.k kVar) {
        if (kVar == null) {
            if (e0Var == null && i5 >= 0) {
                e0[] e0VarArr = this.L;
                if (i5 < e0VarArr.length) {
                    e0Var = e0VarArr[i5];
                }
            }
            if (e0Var != null) {
                kVar = e0Var.f75209h;
            }
        }
        if ((e0Var == null || e0Var.f75214m) && !this.Q) {
            b0 b0Var = this.f75232m;
            Window.Callback callback = this.f75231l.getCallback();
            b0Var.getClass();
            try {
                b0Var.f75191d = true;
                callback.onPanelClosed(i5, kVar);
            } finally {
                b0Var.f75191d = false;
            }
        }
    }

    public final void I(q.k kVar) {
        r.i iVar;
        if (this.K) {
            return;
        }
        this.K = true;
        ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) this.f75235r;
        actionBarOverlayLayout.k();
        ActionMenuView actionMenuView = actionBarOverlayLayout.f13722e.f84789a.f13800a;
        if (actionMenuView != null && (iVar = actionMenuView.f13746t) != null) {
            iVar.j();
            r.e eVar = iVar.f84740r;
            if (eVar != null && eVar.b()) {
                eVar.f83302i.dismiss();
            }
        }
        Window.Callback callback = this.f75231l.getCallback();
        if (callback != null && !this.Q) {
            callback.onPanelClosed(108, kVar);
        }
        this.K = false;
    }

    public final void J(e0 e0Var, boolean z11) {
        d0 d0Var;
        x0 x0Var;
        if (z11 && e0Var.f75202a == 0 && (x0Var = this.f75235r) != null) {
            ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) x0Var;
            actionBarOverlayLayout.k();
            if (actionBarOverlayLayout.f13722e.f84789a.q()) {
                I(e0Var.f75209h);
                return;
            }
        }
        WindowManager windowManager = (WindowManager) this.f75230k.getSystemService("window");
        if (windowManager != null && e0Var.f75214m && (d0Var = e0Var.f75206e) != null) {
            windowManager.removeView(d0Var);
            if (z11) {
                H(e0Var.f75202a, e0Var, null);
            }
        }
        e0Var.f75212k = false;
        e0Var.f75213l = false;
        e0Var.f75214m = false;
        e0Var.f75207f = null;
        e0Var.n = true;
        if (this.M == e0Var) {
            this.M = null;
        }
        if (e0Var.f75202a == 0) {
            Z();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0113  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean L(KeyEvent keyEvent) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        View decorView;
        boolean zC;
        boolean zX;
        ActionMenuView actionMenuView;
        r.i iVar;
        Object obj = this.f75229j;
        if ((!(obj instanceof a5.o) && !(obj instanceof h0)) || (decorView = this.f75231l.getDecorView()) == null || !g90.k.K(decorView, keyEvent)) {
            if (keyEvent.getKeyCode() == 82) {
                b0 b0Var = this.f75232m;
                Window.Callback callback = this.f75231l.getCallback();
                b0Var.getClass();
                try {
                    b0Var.f75190c = true;
                    if (!callback.dispatchKeyEvent(keyEvent)) {
                        int keyCode = keyEvent.getKeyCode();
                        if (keyEvent.getAction() == 0) {
                            if (keyCode == 4) {
                                this.N = (keyEvent.getFlags() & 128) != 0;
                                return false;
                            }
                            if (keyCode == 82) {
                                if (keyEvent.getRepeatCount() == 0) {
                                    e0 e0VarQ = Q(0);
                                    if (!e0VarQ.f75214m) {
                                        X(e0VarQ, keyEvent);
                                        return true;
                                    }
                                }
                            }
                            return false;
                        }
                        if (keyCode != 4) {
                            if (keyCode == 82) {
                                if (this.f75238u == null) {
                                    e0 e0VarQ2 = Q(0);
                                    x0 x0Var = this.f75235r;
                                    Context context = this.f75230k;
                                    if (x0Var != null) {
                                        ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) x0Var;
                                        actionBarOverlayLayout.k();
                                        Toolbar toolbar = actionBarOverlayLayout.f13722e.f84789a;
                                        if (toolbar.getVisibility() != 0 || (actionMenuView = toolbar.f13800a) == null || !actionMenuView.f13745s || ViewConfiguration.get(context).hasPermanentMenuKey()) {
                                            boolean z11 = e0VarQ2.f75214m;
                                            if (z11 || e0VarQ2.f75213l) {
                                                J(e0VarQ2, true);
                                                zC = z11;
                                                if (zC) {
                                                    AudioManager audioManager = (AudioManager) context.getApplicationContext().getSystemService("audio");
                                                    if (audioManager != null) {
                                                        audioManager.playSoundEffect(0);
                                                        return true;
                                                    }
                                                    Log.w("AppCompatDelegate", "Couldn't get audio manager");
                                                    return true;
                                                }
                                            } else {
                                                if (e0VarQ2.f75212k) {
                                                    if (e0VarQ2.o) {
                                                        e0VarQ2.f75212k = false;
                                                        zX = X(e0VarQ2, keyEvent);
                                                    } else {
                                                        zX = true;
                                                    }
                                                    if (zX) {
                                                        V(e0VarQ2, keyEvent);
                                                        zC = true;
                                                        if (zC) {
                                                        }
                                                    }
                                                }
                                                zC = false;
                                                if (zC) {
                                                }
                                            }
                                        } else {
                                            ActionBarOverlayLayout actionBarOverlayLayout2 = (ActionBarOverlayLayout) this.f75235r;
                                            actionBarOverlayLayout2.k();
                                            if (actionBarOverlayLayout2.f13722e.f84789a.q()) {
                                                ActionBarOverlayLayout actionBarOverlayLayout3 = (ActionBarOverlayLayout) this.f75235r;
                                                actionBarOverlayLayout3.k();
                                                ActionMenuView actionMenuView2 = actionBarOverlayLayout3.f13722e.f84789a.f13800a;
                                                if (actionMenuView2 != null && (iVar = actionMenuView2.f13746t) != null && iVar.j()) {
                                                    zC = true;
                                                }
                                                if (zC) {
                                                }
                                            } else {
                                                if (!this.Q && X(e0VarQ2, keyEvent)) {
                                                    ActionBarOverlayLayout actionBarOverlayLayout4 = (ActionBarOverlayLayout) this.f75235r;
                                                    actionBarOverlayLayout4.k();
                                                    zC = actionBarOverlayLayout4.f13722e.f84789a.C();
                                                }
                                                if (zC) {
                                                }
                                            }
                                            zC = false;
                                            if (zC) {
                                            }
                                        }
                                    }
                                }
                            }
                            return false;
                        }
                        if (!U()) {
                            return false;
                        }
                    }
                } finally {
                    b0Var.f75190c = false;
                }
            }
        }
        return true;
    }

    public final void M(int i5) {
        e0 e0VarQ = Q(i5);
        if (e0VarQ.f75209h != null) {
            Bundle bundle = new Bundle();
            e0VarQ.f75209h.t(bundle);
            if (bundle.size() > 0) {
                e0VarQ.f75215p = bundle;
            }
            e0VarQ.f75209h.w();
            e0VarQ.f75209h.clear();
        }
        e0VarQ.o = true;
        e0VarQ.n = true;
        if ((i5 == 108 || i5 == 0) && this.f75235r != null) {
            e0 e0VarQ2 = Q(0);
            e0VarQ2.f75212k = false;
            X(e0VarQ2, null);
        }
    }

    public final void N() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        ViewGroup viewGroup;
        if (this.f75243z) {
            return;
        }
        Context context = this.f75230k;
        int[] iArr = l.a.f72897j;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(iArr);
        if (!typedArrayObtainStyledAttributes.hasValue(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE)) {
            typedArrayObtainStyledAttributes.recycle();
            throw new IllegalStateException("You need to use a Theme.AppCompat theme (or descendant) with this activity.");
        }
        int i5 = 0;
        int i11 = 1;
        if (typedArrayObtainStyledAttributes.getBoolean(Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, false)) {
            w(1);
        } else if (typedArrayObtainStyledAttributes.getBoolean(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, false)) {
            w(108);
        }
        if (typedArrayObtainStyledAttributes.getBoolean(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, false)) {
            w(109);
        }
        if (typedArrayObtainStyledAttributes.getBoolean(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, false)) {
            w(10);
        }
        this.I = typedArrayObtainStyledAttributes.getBoolean(0, false);
        typedArrayObtainStyledAttributes.recycle();
        O();
        this.f75231l.getDecorView();
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        if (this.J) {
            viewGroup = this.H ? (ViewGroup) layoutInflaterFrom.inflate(2131623958, (ViewGroup) null) : (ViewGroup) layoutInflaterFrom.inflate(2131623957, (ViewGroup) null);
        } else if (this.I) {
            viewGroup = (ViewGroup) layoutInflaterFrom.inflate(2131623948, (ViewGroup) null);
            this.G = false;
            this.F = false;
        } else if (this.F) {
            TypedValue typedValue = new TypedValue();
            context.getTheme().resolveAttribute(2130968589, typedValue, true);
            viewGroup = (ViewGroup) LayoutInflater.from(typedValue.resourceId != 0 ? new androidx.appcompat.view.d(context, typedValue.resourceId) : context).inflate(2131623959, (ViewGroup) null);
            x0 x0Var = (x0) viewGroup.findViewById(2131427841);
            this.f75235r = x0Var;
            Window.Callback callback = this.f75231l.getCallback();
            ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) x0Var;
            actionBarOverlayLayout.k();
            actionBarOverlayLayout.f13722e.f84799k = callback;
            if (this.G) {
                ((ActionBarOverlayLayout) this.f75235r).j(109);
            }
            if (this.D) {
                ((ActionBarOverlayLayout) this.f75235r).j(2);
            }
            if (this.E) {
                ((ActionBarOverlayLayout) this.f75235r).j(5);
            }
        } else {
            viewGroup = null;
        }
        if (viewGroup == null) {
            StringBuilder sb2 = new StringBuilder("AppCompat does not support the current theme features: { windowActionBar: ");
            sb2.append(this.F);
            sb2.append(", windowActionBarOverlay: ");
            sb2.append(this.G);
            sb2.append(", android:windowIsFloating: ");
            sb2.append(this.I);
            sb2.append(", windowActionModeOverlay: ");
            sb2.append(this.H);
            sb2.append(", windowNoTitle: ");
            throw new IllegalArgumentException(a80.m.k(sb2, this.J, " }"));
        }
        u uVar = new u(this, i5);
        WeakHashMap weakHashMap = a1.f250a;
        a5.s0.l(viewGroup, uVar);
        if (this.f75235r == null) {
            this.B = (TextView) viewGroup.findViewById(2131429031);
        }
        boolean z11 = p2.f84838a;
        try {
            Method method = viewGroup.getClass().getMethod("makeOptionalFitsSystemWindows", null);
            if (!method.isAccessible()) {
                method.setAccessible(true);
            }
            method.invoke(viewGroup, null);
        } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException unused) {
        }
        ContentFrameLayout contentFrameLayout = (ContentFrameLayout) viewGroup.findViewById(2131427398);
        ViewGroup viewGroup2 = (ViewGroup) this.f75231l.findViewById(16908290);
        if (viewGroup2 != null) {
            while (viewGroup2.getChildCount() > 0) {
                View childAt = viewGroup2.getChildAt(0);
                viewGroup2.removeViewAt(0);
                contentFrameLayout.addView(childAt);
            }
            viewGroup2.setId(-1);
            contentFrameLayout.setId(16908290);
            if (viewGroup2 instanceof FrameLayout) {
                ((FrameLayout) viewGroup2).setForeground(null);
            }
        }
        this.f75231l.setContentView(viewGroup);
        contentFrameLayout.f13772h = new u(this, i11);
        this.A = viewGroup;
        Object obj = this.f75229j;
        CharSequence title = obj instanceof Activity ? ((Activity) obj).getTitle() : this.f75234q;
        if (!TextUtils.isEmpty(title)) {
            x0 x0Var2 = this.f75235r;
            if (x0Var2 != null) {
                ActionBarOverlayLayout actionBarOverlayLayout2 = (ActionBarOverlayLayout) x0Var2;
                actionBarOverlayLayout2.k();
                l2 l2Var = actionBarOverlayLayout2.f13722e;
                if (!l2Var.f84795g) {
                    Toolbar toolbar = l2Var.f84789a;
                    l2Var.f84796h = title;
                    if ((l2Var.f84790b & 8) != 0) {
                        toolbar.A(title);
                        if (l2Var.f84795g) {
                            a1.l(toolbar.getRootView(), title);
                        }
                    }
                }
            } else {
                b bVar = this.o;
                if (bVar != null) {
                    bVar.y(title);
                } else {
                    TextView textView = this.B;
                    if (textView != null) {
                        textView.setText(title);
                    }
                }
            }
        }
        ContentFrameLayout contentFrameLayout2 = (ContentFrameLayout) this.A.findViewById(16908290);
        View decorView = this.f75231l.getDecorView();
        contentFrameLayout2.f13771g.set(decorView.getPaddingLeft(), decorView.getPaddingTop(), decorView.getPaddingRight(), decorView.getPaddingBottom());
        if (contentFrameLayout2.isLaidOut()) {
            contentFrameLayout2.requestLayout();
        }
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(iArr);
        if (contentFrameLayout2.f13765a == null) {
            contentFrameLayout2.f13765a = new TypedValue();
        }
        typedArrayObtainStyledAttributes2.getValue(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, contentFrameLayout2.f13765a);
        if (contentFrameLayout2.f13766b == null) {
            contentFrameLayout2.f13766b = new TypedValue();
        }
        typedArrayObtainStyledAttributes2.getValue(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, contentFrameLayout2.f13766b);
        if (typedArrayObtainStyledAttributes2.hasValue(Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)) {
            if (contentFrameLayout2.f13767c == null) {
                contentFrameLayout2.f13767c = new TypedValue();
            }
            typedArrayObtainStyledAttributes2.getValue(Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, contentFrameLayout2.f13767c);
        }
        if (typedArrayObtainStyledAttributes2.hasValue(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE)) {
            if (contentFrameLayout2.f13768d == null) {
                contentFrameLayout2.f13768d = new TypedValue();
            }
            typedArrayObtainStyledAttributes2.getValue(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, contentFrameLayout2.f13768d);
        }
        if (typedArrayObtainStyledAttributes2.hasValue(120)) {
            if (contentFrameLayout2.f13769e == null) {
                contentFrameLayout2.f13769e = new TypedValue();
            }
            typedArrayObtainStyledAttributes2.getValue(120, contentFrameLayout2.f13769e);
        }
        if (typedArrayObtainStyledAttributes2.hasValue(Sdk.SDKError.Reason.TPAT_ERROR_VALUE)) {
            if (contentFrameLayout2.f13770f == null) {
                contentFrameLayout2.f13770f = new TypedValue();
            }
            typedArrayObtainStyledAttributes2.getValue(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, contentFrameLayout2.f13770f);
        }
        typedArrayObtainStyledAttributes2.recycle();
        contentFrameLayout2.requestLayout();
        this.f75243z = true;
        e0 e0VarQ = Q(0);
        if (this.Q || e0VarQ.f75209h != null) {
            return;
        }
        S(108);
    }

    public final void O() {
        if (this.f75231l == null) {
            Object obj = this.f75229j;
            if (obj instanceof Activity) {
                F(((Activity) obj).getWindow());
            }
        }
        if (this.f75231l == null) {
            throw new IllegalStateException("We have not been given a Window");
        }
    }

    public final c3.b P(Context context) {
        if (this.W == null) {
            if (fl.l.f55372e == null) {
                Context applicationContext = context.getApplicationContext();
                fl.l.f55372e = new fl.l(applicationContext, (LocationManager) applicationContext.getSystemService("location"));
            }
            this.W = new c0(this, fl.l.f55372e);
        }
        return this.W;
    }

    public final e0 Q(int i5) {
        e0[] e0VarArr = this.L;
        if (e0VarArr == null || e0VarArr.length <= i5) {
            e0[] e0VarArr2 = new e0[i5 + 1];
            if (e0VarArr != null) {
                System.arraycopy(e0VarArr, 0, e0VarArr2, 0, e0VarArr.length);
            }
            this.L = e0VarArr2;
            e0VarArr = e0VarArr2;
        }
        e0 e0Var = e0VarArr[i5];
        if (e0Var != null) {
            return e0Var;
        }
        e0 e0Var2 = new e0();
        e0Var2.f75202a = i5;
        e0Var2.n = false;
        e0VarArr[i5] = e0Var2;
        return e0Var2;
    }

    public final void R() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        N();
        if (this.F && this.o == null) {
            Object obj = this.f75229j;
            if (obj instanceof Activity) {
                this.o = new s0((Activity) obj, this.G);
            } else if (obj instanceof Dialog) {
                this.o = new s0((Dialog) obj);
            }
            b bVar = this.o;
            if (bVar != null) {
                bVar.p(this.f75223b0);
            }
        }
    }

    public final void S(int i5) {
        this.Z = (1 << i5) | this.Z;
        if (this.Y) {
            return;
        }
        View decorView = this.f75231l.getDecorView();
        WeakHashMap weakHashMap = a1.f250a;
        decorView.postOnAnimation(this.f75222a0);
        this.Y = true;
    }

    public final int T(Context context, int i5) {
        if (i5 != -100) {
            if (i5 != -1) {
                if (i5 != 0) {
                    if (i5 != 1 && i5 != 2) {
                        if (i5 != 3) {
                            throw new IllegalStateException("Unknown value set for night mode. Please use one of the MODE_NIGHT values from AppCompatDelegate.");
                        }
                        if (this.X == null) {
                            this.X = new c0(this, context);
                        }
                        return this.X.l();
                    }
                } else if (((UiModeManager) context.getApplicationContext().getSystemService("uimode")).getNightMode() != 0) {
                    return P(context).l();
                }
            }
            return i5;
        }
        return -1;
    }

    public final boolean U() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        boolean z11 = this.N;
        this.N = false;
        e0 e0VarQ = Q(0);
        if (!e0VarQ.f75214m) {
            androidx.appcompat.view.b bVar = this.f75238u;
            if (bVar != null) {
                bVar.b();
                return true;
            }
            R();
            b bVar2 = this.o;
            if (bVar2 == null || !bVar2.b()) {
                return false;
            }
        } else if (!z11) {
            J(e0VarQ, true);
            return true;
        }
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:87:0x0176, code lost:
    
        if (r2.f83224f.getCount() > 0) goto L88;
     */
    /* JADX WARN: Removed duplicated region for block: B:100:0x01d3  */
    /* JADX WARN: Removed duplicated region for block: B:105:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void V(e0 e0Var, KeyEvent keyEvent) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        int i5;
        ViewGroup.LayoutParams layoutParams;
        boolean z11 = e0Var.f75214m;
        int i11 = e0Var.f75202a;
        if (z11 || this.Q) {
            return;
        }
        Context context = this.f75230k;
        if (i11 == 0 && (context.getResources().getConfiguration().screenLayout & 15) == 4) {
            return;
        }
        Window.Callback callback = this.f75231l.getCallback();
        if (callback != null && !callback.onMenuOpened(i11, e0Var.f75209h)) {
            J(e0Var, true);
            return;
        }
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        if (windowManager == null || !X(e0Var, keyEvent)) {
            return;
        }
        d0 d0Var = e0Var.f75206e;
        if (d0Var != null && !e0Var.n) {
            View view = e0Var.f75208g;
            if (view != null && (layoutParams = view.getLayoutParams()) != null && layoutParams.width == -1) {
                i5 = -1;
            }
            e0Var.f75213l = false;
            WindowManager.LayoutParams layoutParams2 = new WindowManager.LayoutParams(i5, -2, 0, 0, 1002, 8519680, -3);
            layoutParams2.gravity = e0Var.f75204c;
            layoutParams2.windowAnimations = e0Var.f75205d;
            windowManager.addView(e0Var.f75206e, layoutParams2);
            e0Var.f75214m = true;
            if (i11 != 0) {
                Z();
                return;
            }
            return;
        }
        if (d0Var == null) {
            R();
            b bVar = this.o;
            Context contextE = bVar != null ? bVar.e() : null;
            if (contextE != null) {
                context = contextE;
            }
            TypedValue typedValue = new TypedValue();
            Resources.Theme themeNewTheme = context.getResources().newTheme();
            themeNewTheme.setTo(context.getTheme());
            themeNewTheme.resolveAttribute(2130968582, typedValue, true);
            int i12 = typedValue.resourceId;
            if (i12 != 0) {
                themeNewTheme.applyStyle(i12, true);
            }
            themeNewTheme.resolveAttribute(2130969790, typedValue, true);
            int i13 = typedValue.resourceId;
            if (i13 != 0) {
                themeNewTheme.applyStyle(i13, true);
            } else {
                themeNewTheme.applyStyle(2132083445, true);
            }
            androidx.appcompat.view.d dVar = new androidx.appcompat.view.d(context, 0);
            dVar.getTheme().setTo(themeNewTheme);
            e0Var.f75211j = dVar;
            TypedArray typedArrayObtainStyledAttributes = dVar.obtainStyledAttributes(l.a.f72897j);
            e0Var.f75203b = typedArrayObtainStyledAttributes.getResourceId(86, 0);
            e0Var.f75205d = typedArrayObtainStyledAttributes.getResourceId(1, 0);
            typedArrayObtainStyledAttributes.recycle();
            e0Var.f75206e = new d0(this, e0Var.f75211j);
            e0Var.f75204c = 81;
        } else if (e0Var.n && d0Var.getChildCount() > 0) {
            e0Var.f75206e.removeAllViews();
        }
        View view2 = e0Var.f75208g;
        if (view2 == null) {
            if (e0Var.f75209h != null) {
                if (this.f75237t == null) {
                    this.f75237t = new u(this, 3);
                }
                u uVar = this.f75237t;
                if (e0Var.f75210i == null) {
                    q.g gVar = new q.g(e0Var.f75211j);
                    e0Var.f75210i = gVar;
                    gVar.f83223e = uVar;
                    q.k kVar = e0Var.f75209h;
                    kVar.b(gVar, kVar.f83232a);
                }
                q.g gVar2 = e0Var.f75210i;
                d0 d0Var2 = e0Var.f75206e;
                if (gVar2.f83222d == null) {
                    gVar2.f83222d = (ExpandedMenuView) gVar2.f83220b.inflate(2131623949, (ViewGroup) d0Var2, false);
                    if (gVar2.f83224f == null) {
                        gVar2.f83224f = new q.f(gVar2);
                    }
                    gVar2.f83222d.setAdapter((ListAdapter) gVar2.f83224f);
                    gVar2.f83222d.setOnItemClickListener(gVar2);
                }
                ExpandedMenuView expandedMenuView = gVar2.f83222d;
                e0Var.f75207f = expandedMenuView;
                if (expandedMenuView != null) {
                }
            }
            e0Var.n = true;
            return;
        }
        e0Var.f75207f = view2;
        if (e0Var.f75207f != null) {
            if (e0Var.f75208g == null) {
                q.g gVar3 = e0Var.f75210i;
                if (gVar3.f83224f == null) {
                    gVar3.f83224f = new q.f(gVar3);
                }
            }
            ViewGroup.LayoutParams layoutParams3 = e0Var.f75207f.getLayoutParams();
            if (layoutParams3 == null) {
                layoutParams3 = new ViewGroup.LayoutParams(-2, -2);
            }
            e0Var.f75206e.setBackgroundResource(e0Var.f75203b);
            ViewParent parent = e0Var.f75207f.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(e0Var.f75207f);
            }
            e0Var.f75206e.addView(e0Var.f75207f, layoutParams3);
            if (!e0Var.f75207f.hasFocus()) {
                e0Var.f75207f.requestFocus();
            }
        }
        e0Var.n = true;
        return;
        i5 = -2;
        e0Var.f75213l = false;
        WindowManager.LayoutParams layoutParams22 = new WindowManager.LayoutParams(i5, -2, 0, 0, 1002, 8519680, -3);
        layoutParams22.gravity = e0Var.f75204c;
        layoutParams22.windowAnimations = e0Var.f75205d;
        windowManager.addView(e0Var.f75206e, layoutParams22);
        e0Var.f75214m = true;
        if (i11 != 0) {
        }
    }

    public final boolean W(e0 e0Var, int i5, KeyEvent keyEvent) {
        q.k kVar;
        if (keyEvent.isSystem()) {
            return false;
        }
        if ((e0Var.f75212k || X(e0Var, keyEvent)) && (kVar = e0Var.f75209h) != null) {
            return kVar.performShortcut(i5, keyEvent, 1);
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x00d6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean X(e0 e0Var, KeyEvent keyEvent) {
        x0 x0Var;
        x0 x0Var2;
        Resources.Theme themeNewTheme;
        x0 x0Var3;
        x0 x0Var4;
        if (!this.Q) {
            boolean z11 = e0Var.f75212k;
            int i5 = e0Var.f75202a;
            if (z11) {
                return true;
            }
            e0 e0Var2 = this.M;
            if (e0Var2 != null && e0Var2 != e0Var) {
                J(e0Var2, false);
            }
            Window.Callback callback = this.f75231l.getCallback();
            if (callback != null) {
                e0Var.f75208g = callback.onCreatePanelView(i5);
            }
            boolean z12 = i5 == 0 || i5 == 108;
            if (z12 && (x0Var4 = this.f75235r) != null) {
                ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) x0Var4;
                actionBarOverlayLayout.k();
                actionBarOverlayLayout.f13722e.f84800l = true;
            }
            if (e0Var.f75208g == null && (!z12 || !(this.o instanceof n0))) {
                q.k kVar = e0Var.f75209h;
                if (kVar == null || e0Var.o) {
                    if (kVar == null) {
                        Context context = this.f75230k;
                        if ((i5 == 0 || i5 == 108) && this.f75235r != null) {
                            TypedValue typedValue = new TypedValue();
                            Resources.Theme theme = context.getTheme();
                            theme.resolveAttribute(2130968589, typedValue, true);
                            if (typedValue.resourceId != 0) {
                                themeNewTheme = context.getResources().newTheme();
                                themeNewTheme.setTo(theme);
                                themeNewTheme.applyStyle(typedValue.resourceId, true);
                                themeNewTheme.resolveAttribute(2130968590, typedValue, true);
                            } else {
                                theme.resolveAttribute(2130968590, typedValue, true);
                                themeNewTheme = null;
                            }
                            if (typedValue.resourceId != 0) {
                                if (themeNewTheme == null) {
                                    themeNewTheme = context.getResources().newTheme();
                                    themeNewTheme.setTo(theme);
                                }
                                themeNewTheme.applyStyle(typedValue.resourceId, true);
                            }
                            if (themeNewTheme != null) {
                                androidx.appcompat.view.d dVar = new androidx.appcompat.view.d(context, 0);
                                dVar.getTheme().setTo(themeNewTheme);
                                context = dVar;
                            }
                        }
                        q.k kVar2 = new q.k(context);
                        kVar2.f83236e = this;
                        q.k kVar3 = e0Var.f75209h;
                        if (kVar2 != kVar3) {
                            if (kVar3 != null) {
                                kVar3.r(e0Var.f75210i);
                            }
                            e0Var.f75209h = kVar2;
                            q.g gVar = e0Var.f75210i;
                            if (gVar != null) {
                                kVar2.b(gVar, kVar2.f83232a);
                            }
                        }
                        if (e0Var.f75209h != null) {
                            if (z12 && (x0Var2 = this.f75235r) != null) {
                                if (this.f75236s == null) {
                                    this.f75236s = new u(this, 2);
                                }
                                ((ActionBarOverlayLayout) x0Var2).m(e0Var.f75209h, this.f75236s);
                            }
                            e0Var.f75209h.w();
                            if (callback.onCreatePanelMenu(i5, e0Var.f75209h)) {
                                e0Var.o = false;
                            } else {
                                q.k kVar4 = e0Var.f75209h;
                                if (kVar4 != null) {
                                    if (kVar4 != null) {
                                        kVar4.r(e0Var.f75210i);
                                    }
                                    e0Var.f75209h = null;
                                }
                                if (z12 && (x0Var = this.f75235r) != null) {
                                    ((ActionBarOverlayLayout) x0Var).m(null, this.f75236s);
                                }
                            }
                        }
                    }
                }
                e0Var.f75209h.w();
                Bundle bundle = e0Var.f75215p;
                if (bundle != null) {
                    e0Var.f75209h.s(bundle);
                    e0Var.f75215p = null;
                }
                if (!callback.onPreparePanel(0, e0Var.f75208g, e0Var.f75209h)) {
                    if (z12 && (x0Var3 = this.f75235r) != null) {
                        ((ActionBarOverlayLayout) x0Var3).m(null, this.f75236s);
                    }
                    e0Var.f75209h.v();
                    return false;
                }
                e0Var.f75209h.setQwertyMode(KeyCharacterMap.load(keyEvent != null ? keyEvent.getDeviceId() : -1).getKeyboardType() != 1);
                e0Var.f75209h.v();
            }
            e0Var.f75212k = true;
            e0Var.f75213l = false;
            this.M = e0Var;
            return true;
        }
        return false;
    }

    public final void Y() {
        if (this.f75243z) {
            throw new AndroidRuntimeException("Window feature must be requested before adding content");
        }
    }

    public final void Z() {
        OnBackInvokedCallback onBackInvokedCallback;
        if (Build.VERSION.SDK_INT >= 33) {
            boolean z11 = false;
            if (this.f75227f0 != null && (Q(0).f75214m || this.f75238u != null)) {
                z11 = true;
            }
            if (z11 && this.f75228g0 == null) {
                this.f75228g0 = a0.b(this.f75227f0, this);
            } else {
                if (z11 || (onBackInvokedCallback = this.f75228g0) == null) {
                    return;
                }
                a0.c(this.f75227f0, onBackInvokedCallback);
                this.f75228g0 = null;
            }
        }
    }

    @Override // q.i
    public final boolean a(q.k kVar, MenuItem menuItem) {
        e0 e0Var;
        Window.Callback callback = this.f75231l.getCallback();
        if (callback != null && !this.Q) {
            q.k kVarK = kVar.k();
            e0[] e0VarArr = this.L;
            int length = e0VarArr != null ? e0VarArr.length : 0;
            int i5 = 0;
            while (true) {
                if (i5 < length) {
                    e0Var = e0VarArr[i5];
                    if (e0Var != null && e0Var.f75209h == kVarK) {
                        break;
                    }
                    i5++;
                } else {
                    e0Var = null;
                    break;
                }
            }
            if (e0Var != null) {
                return callback.onMenuItemSelected(e0Var.f75202a, menuItem);
            }
        }
        return false;
    }

    @Override // m.s
    public final void b(View view, ViewGroup.LayoutParams layoutParams) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        N();
        ((ViewGroup) this.A.findViewById(16908290)).addView(view, layoutParams);
        this.f75232m.b(this.f75231l.getCallback());
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0044, code lost:
    
        if (r6.k() != false) goto L20;
     */
    @Override // q.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(q.k kVar) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        ActionMenuView actionMenuView;
        r.i iVar;
        x0 x0Var = this.f75235r;
        if (x0Var != null) {
            ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) x0Var;
            actionBarOverlayLayout.k();
            Toolbar toolbar = actionBarOverlayLayout.f13722e.f84789a;
            if (toolbar.getVisibility() == 0 && (actionMenuView = toolbar.f13800a) != null && actionMenuView.f13745s) {
                if (ViewConfiguration.get(this.f75230k).hasPermanentMenuKey()) {
                    ActionBarOverlayLayout actionBarOverlayLayout2 = (ActionBarOverlayLayout) this.f75235r;
                    actionBarOverlayLayout2.k();
                    ActionMenuView actionMenuView2 = actionBarOverlayLayout2.f13722e.f84789a.f13800a;
                    if (actionMenuView2 != null) {
                        r.i iVar2 = actionMenuView2.f13746t;
                        if (iVar2 != null) {
                            if (iVar2.f84741s == null) {
                            }
                        }
                    }
                }
                Window.Callback callback = this.f75231l.getCallback();
                ActionBarOverlayLayout actionBarOverlayLayout3 = (ActionBarOverlayLayout) this.f75235r;
                actionBarOverlayLayout3.k();
                if (actionBarOverlayLayout3.f13722e.f84789a.q()) {
                    ActionBarOverlayLayout actionBarOverlayLayout4 = (ActionBarOverlayLayout) this.f75235r;
                    actionBarOverlayLayout4.k();
                    ActionMenuView actionMenuView3 = actionBarOverlayLayout4.f13722e.f84789a.f13800a;
                    if (actionMenuView3 != null && (iVar = actionMenuView3.f13746t) != null) {
                        iVar.j();
                    }
                    if (this.Q) {
                        return;
                    }
                    callback.onPanelClosed(108, Q(0).f75209h);
                    return;
                }
                if (callback == null || this.Q) {
                    return;
                }
                if (this.Y && (1 & this.Z) != 0) {
                    View decorView = this.f75231l.getDecorView();
                    t tVar = this.f75222a0;
                    decorView.removeCallbacks(tVar);
                    tVar.run();
                }
                e0 e0VarQ = Q(0);
                q.k kVar2 = e0VarQ.f75209h;
                if (kVar2 == null || e0VarQ.o || !callback.onPreparePanel(0, e0VarQ.f75208g, kVar2)) {
                    return;
                }
                callback.onMenuOpened(108, e0VarQ.f75209h);
                ActionBarOverlayLayout actionBarOverlayLayout5 = (ActionBarOverlayLayout) this.f75235r;
                actionBarOverlayLayout5.k();
                actionBarOverlayLayout5.f13722e.f84789a.C();
                return;
            }
        }
        e0 e0VarQ2 = Q(0);
        e0VarQ2.n = true;
        J(e0VarQ2, false);
        V(e0VarQ2, null);
    }

    @Override // m.s
    public final boolean d() {
        return E(true, true);
    }

    @Override // m.s
    public final Context e(Context context) {
        Configuration configuration;
        int i5 = 1;
        this.O = true;
        int i11 = this.S;
        if (i11 == -100) {
            i11 = s.f75339b;
        }
        int iT = T(context, i11);
        if (s.n(context) && s.n(context)) {
            if (Build.VERSION.SDK_INT < 33) {
                synchronized (s.f75346i) {
                    try {
                        w4.g gVar = s.f75340c;
                        if (gVar == null) {
                            if (s.f75341d == null) {
                                s.f75341d = w4.g.a(n4.f.g(context));
                            }
                            if (!s.f75341d.d()) {
                                s.f75340c = s.f75341d;
                            }
                        } else if (!gVar.equals(s.f75341d)) {
                            w4.g gVar2 = s.f75340c;
                            s.f75341d = gVar2;
                            n4.f.f(context, gVar2.e());
                        }
                    } finally {
                    }
                }
            } else if (!s.f75343f) {
                s.f75338a.execute(new com.tiktok.appevents.d(context, i5));
            }
        }
        w4.g gVarG = G(context);
        if (context instanceof ContextThemeWrapper) {
            try {
                ((ContextThemeWrapper) context).applyOverrideConfiguration(K(context, iT, gVarG, null, false));
                return context;
            } catch (IllegalStateException unused) {
            }
        }
        if (context instanceof androidx.appcompat.view.d) {
            try {
                ((androidx.appcompat.view.d) context).a(K(context, iT, gVarG, null, false));
                return context;
            } catch (IllegalStateException unused2) {
            }
        }
        if (!f75221j0) {
            return context;
        }
        Configuration configuration2 = new Configuration();
        configuration2.uiMode = -1;
        configuration2.fontScale = 0.0f;
        Configuration configuration3 = context.createConfigurationContext(configuration2).getResources().getConfiguration();
        Configuration configuration4 = context.getResources().getConfiguration();
        configuration3.uiMode = configuration4.uiMode;
        if (configuration3.equals(configuration4)) {
            configuration = null;
        } else {
            configuration = new Configuration();
            configuration.fontScale = 0.0f;
            if (configuration3.diff(configuration4) != 0) {
                float f11 = configuration3.fontScale;
                float f12 = configuration4.fontScale;
                if (f11 != f12) {
                    configuration.fontScale = f12;
                }
                int i12 = configuration3.mcc;
                int i13 = configuration4.mcc;
                if (i12 != i13) {
                    configuration.mcc = i13;
                }
                int i14 = configuration3.mnc;
                int i15 = configuration4.mnc;
                if (i14 != i15) {
                    configuration.mnc = i15;
                }
                y.a(configuration3, configuration4, configuration);
                int i16 = configuration3.touchscreen;
                int i17 = configuration4.touchscreen;
                if (i16 != i17) {
                    configuration.touchscreen = i17;
                }
                int i18 = configuration3.keyboard;
                int i19 = configuration4.keyboard;
                if (i18 != i19) {
                    configuration.keyboard = i19;
                }
                int i21 = configuration3.keyboardHidden;
                int i22 = configuration4.keyboardHidden;
                if (i21 != i22) {
                    configuration.keyboardHidden = i22;
                }
                int i23 = configuration3.navigation;
                int i24 = configuration4.navigation;
                if (i23 != i24) {
                    configuration.navigation = i24;
                }
                int i25 = configuration3.navigationHidden;
                int i26 = configuration4.navigationHidden;
                if (i25 != i26) {
                    configuration.navigationHidden = i26;
                }
                int i27 = configuration3.orientation;
                int i28 = configuration4.orientation;
                if (i27 != i28) {
                    configuration.orientation = i28;
                }
                int i29 = configuration3.screenLayout & 15;
                int i31 = configuration4.screenLayout & 15;
                if (i29 != i31) {
                    configuration.screenLayout |= i31;
                }
                int i32 = configuration3.screenLayout & 192;
                int i33 = configuration4.screenLayout & 192;
                if (i32 != i33) {
                    configuration.screenLayout |= i33;
                }
                int i34 = configuration3.screenLayout & 48;
                int i35 = configuration4.screenLayout & 48;
                if (i34 != i35) {
                    configuration.screenLayout |= i35;
                }
                int i36 = configuration3.screenLayout & 768;
                int i37 = configuration4.screenLayout & 768;
                if (i36 != i37) {
                    configuration.screenLayout |= i37;
                }
                int i38 = configuration3.colorMode & 3;
                int i39 = configuration4.colorMode & 3;
                if (i38 != i39) {
                    configuration.colorMode |= i39;
                }
                int i40 = configuration3.colorMode & 12;
                int i41 = configuration4.colorMode & 12;
                if (i40 != i41) {
                    configuration.colorMode |= i41;
                }
                int i42 = configuration3.uiMode & 15;
                int i43 = configuration4.uiMode & 15;
                if (i42 != i43) {
                    configuration.uiMode |= i43;
                }
                int i44 = configuration3.uiMode & 48;
                int i45 = configuration4.uiMode & 48;
                if (i44 != i45) {
                    configuration.uiMode |= i45;
                }
                int i46 = configuration3.screenWidthDp;
                int i47 = configuration4.screenWidthDp;
                if (i46 != i47) {
                    configuration.screenWidthDp = i47;
                }
                int i48 = configuration3.screenHeightDp;
                int i49 = configuration4.screenHeightDp;
                if (i48 != i49) {
                    configuration.screenHeightDp = i49;
                }
                int i51 = configuration3.smallestScreenWidthDp;
                int i52 = configuration4.smallestScreenWidthDp;
                if (i51 != i52) {
                    configuration.smallestScreenWidthDp = i52;
                }
                int i53 = configuration3.densityDpi;
                int i54 = configuration4.densityDpi;
                if (i53 != i54) {
                    configuration.densityDpi = i54;
                }
            }
        }
        Configuration configurationK = K(context, iT, gVarG, configuration, true);
        androidx.appcompat.view.d dVar = new androidx.appcompat.view.d(context, 2132083457);
        dVar.a(configurationK);
        try {
            if (context.getTheme() != null) {
                Resources.Theme theme = dVar.getTheme();
                if (Build.VERSION.SDK_INT >= 29) {
                    q4.h.b(theme);
                } else {
                    synchronized (q4.b.f83617e) {
                        if (!q4.b.f83619g) {
                            try {
                                Method declaredMethod = Resources.Theme.class.getDeclaredMethod("rebase", null);
                                q4.b.f83618f = declaredMethod;
                                declaredMethod.setAccessible(true);
                            } catch (NoSuchMethodException e3) {
                                Log.i("ResourcesCompat", "Failed to retrieve rebase() method", e3);
                            }
                            q4.b.f83619g = true;
                        }
                        Method method = q4.b.f83618f;
                        if (method != null) {
                            try {
                                method.invoke(theme, null);
                            } catch (IllegalAccessException | InvocationTargetException e11) {
                                Log.i("ResourcesCompat", "Failed to invoke rebase() method via reflection", e11);
                                q4.b.f83618f = null;
                            }
                        }
                    }
                }
            }
        } catch (NullPointerException unused3) {
        }
        return dVar;
    }

    @Override // m.s
    public final View f(int i5) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        N();
        return this.f75231l.findViewById(i5);
    }

    @Override // m.s
    public final Context h() {
        return this.f75230k;
    }

    @Override // m.s
    public final br.a i() {
        return new br.a(14);
    }

    @Override // m.s
    public final MenuInflater j() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        if (this.f75233p == null) {
            R();
            b bVar = this.o;
            this.f75233p = new androidx.appcompat.view.i(bVar != null ? bVar.e() : this.f75230k);
        }
        return this.f75233p;
    }

    @Override // m.s
    public final b k() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        R();
        return this.o;
    }

    @Override // m.s
    public final void l() {
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(this.f75230k);
        if (layoutInflaterFrom.getFactory() == null) {
            layoutInflaterFrom.setFactory2(this);
        } else {
            if (layoutInflaterFrom.getFactory2() instanceof f0) {
                return;
            }
            Log.i("AppCompatDelegate", "The Activity's LayoutInflater already has a Factory installed so we can not install AppCompat's");
        }
    }

    @Override // m.s
    public final void m() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        if (this.o != null) {
            R();
            if (this.o.g()) {
                return;
            }
            S(0);
        }
    }

    @Override // m.s
    public final void o(Configuration configuration) throws IllegalAccessException, NoSuchMethodException, PackageManager.NameNotFoundException, SecurityException, IllegalArgumentException, InvocationTargetException {
        if (this.F && this.f75243z) {
            R();
            b bVar = this.o;
            if (bVar != null) {
                bVar.h();
            }
        }
        r.p pVarA = r.p.a();
        Context context = this.f75230k;
        synchronized (pVarA) {
            z1 z1Var = pVarA.f84834a;
            synchronized (z1Var) {
                z.v vVar = (z.v) z1Var.f84927b.get(context);
                if (vVar != null) {
                    vVar.a();
                }
            }
        }
        this.R = new Configuration(this.f75230k.getResources().getConfiguration());
        E(false, false);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0095  */
    @Override // android.view.LayoutInflater.Factory2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        View xVar;
        View view2 = null;
        if (this.f75226e0 == null) {
            int[] iArr = l.a.f72897j;
            Context context2 = this.f75230k;
            TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(iArr);
            String string = typedArrayObtainStyledAttributes.getString(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
            typedArrayObtainStyledAttributes.recycle();
            if (string == null) {
                this.f75226e0 = new j0();
            } else {
                try {
                    this.f75226e0 = (j0) context2.getClassLoader().loadClass(string).getDeclaredConstructor(null).newInstance(null);
                } catch (Throwable th2) {
                    Log.i("AppCompatDelegate", "Failed to instantiate custom view inflater " + string + ". Falling back to default.", th2);
                    this.f75226e0 = new j0();
                }
            }
        }
        j0 j0Var = this.f75226e0;
        int i5 = n2.f84827a;
        j0Var.getClass();
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, l.a.f72910y, 0, 0);
        char c11 = 4;
        int resourceId = typedArrayObtainStyledAttributes2.getResourceId(4, 0);
        if (resourceId != 0) {
            Log.i("AppCompatViewInflater", "app:theme is now deprecated. Please move to using android:theme instead.");
        }
        typedArrayObtainStyledAttributes2.recycle();
        Context dVar = (resourceId == 0 || ((context instanceof androidx.appcompat.view.d) && ((androidx.appcompat.view.d) context).f13608a == resourceId)) ? context : new androidx.appcompat.view.d(context, resourceId);
        str.getClass();
        switch (str.hashCode()) {
            case -1946472170:
                if (!str.equals("RatingBar")) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case -1455429095:
                if (str.equals("CheckedTextView")) {
                    c11 = 1;
                    break;
                }
                break;
            case -1346021293:
                if (str.equals("MultiAutoCompleteTextView")) {
                    c11 = 2;
                    break;
                }
                break;
            case -938935918:
                if (str.equals("TextView")) {
                    c11 = 3;
                    break;
                }
                break;
            case -937446323:
                if (!str.equals("ImageButton")) {
                }
                break;
            case -658531749:
                if (str.equals("SeekBar")) {
                    c11 = 5;
                    break;
                }
                break;
            case -339785223:
                if (str.equals("Spinner")) {
                    c11 = 6;
                    break;
                }
                break;
            case 776382189:
                if (str.equals("RadioButton")) {
                    c11 = 7;
                    break;
                }
                break;
            case 799298502:
                if (str.equals("ToggleButton")) {
                    c11 = '\b';
                    break;
                }
                break;
            case 1125864064:
                if (str.equals("ImageView")) {
                    c11 = '\t';
                    break;
                }
                break;
            case 1413872058:
                if (str.equals("AutoCompleteTextView")) {
                    c11 = '\n';
                    break;
                }
                break;
            case 1601505219:
                if (str.equals("CheckBox")) {
                    c11 = 11;
                    break;
                }
                break;
            case 1666676343:
                if (str.equals("EditText")) {
                    c11 = '\f';
                    break;
                }
                break;
            case 2001146706:
                if (str.equals("Button")) {
                    c11 = '\r';
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                xVar = new r.x(dVar, attributeSet);
                break;
            case 1:
                xVar = new r.o(dVar, attributeSet);
                break;
            case 2:
                xVar = new r.t(dVar, attributeSet);
                break;
            case 3:
                xVar = j0Var.e(dVar, attributeSet);
                break;
            case 4:
                xVar = new r.s(dVar, attributeSet, 2130969348);
                break;
            case 5:
                xVar = new AppCompatSeekBar(dVar, attributeSet);
                break;
            case 6:
                xVar = new androidx.appcompat.widget.b(dVar, attributeSet);
                break;
            case 7:
                xVar = j0Var.d(dVar, attributeSet);
                break;
            case '\b':
                xVar = new w0(dVar, attributeSet);
                break;
            case '\t':
                xVar = new AppCompatImageView(dVar, attributeSet);
                break;
            case '\n':
                xVar = j0Var.a(dVar, attributeSet);
                break;
            case 11:
                xVar = j0Var.c(dVar, attributeSet);
                break;
            case '\f':
                xVar = new r.q(dVar, attributeSet, 2130969140);
                break;
            case '\r':
                xVar = j0Var.b(dVar, attributeSet);
                break;
            default:
                xVar = null;
                break;
        }
        if (xVar == null && context != dVar) {
            Object[] objArr = j0Var.f75306a;
            if (str.equals("view")) {
                str = attributeSet.getAttributeValue(null, "class");
            }
            try {
                objArr[0] = dVar;
                objArr[1] = attributeSet;
                if (-1 == str.indexOf(46)) {
                    int i11 = 0;
                    while (true) {
                        String[] strArr = j0.f75304g;
                        if (i11 < 3) {
                            View viewF = j0Var.f(dVar, str, strArr[i11]);
                            if (viewF != null) {
                                objArr[0] = null;
                                objArr[1] = null;
                                view2 = viewF;
                            } else {
                                i11++;
                            }
                        }
                    }
                } else {
                    View viewF2 = j0Var.f(dVar, str, null);
                    objArr[0] = null;
                    objArr[1] = null;
                    view2 = viewF2;
                }
            } catch (Exception unused) {
            } finally {
                objArr[0] = null;
                objArr[1] = null;
            }
            xVar = view2;
        }
        if (xVar != null) {
            Context context3 = xVar.getContext();
            if ((context3 instanceof ContextWrapper) && xVar.hasOnClickListeners()) {
                TypedArray typedArrayObtainStyledAttributes3 = context3.obtainStyledAttributes(attributeSet, j0.f75300c);
                String string2 = typedArrayObtainStyledAttributes3.getString(0);
                if (string2 != null) {
                    xVar.setOnClickListener(new i0(xVar, string2));
                }
                typedArrayObtainStyledAttributes3.recycle();
            }
            if (Build.VERSION.SDK_INT <= 28) {
                TypedArray typedArrayObtainStyledAttributes4 = dVar.obtainStyledAttributes(attributeSet, j0.f75301d);
                if (typedArrayObtainStyledAttributes4.hasValue(0)) {
                    boolean z11 = typedArrayObtainStyledAttributes4.getBoolean(0, false);
                    WeakHashMap weakHashMap = a1.f250a;
                    new a5.o0(3).b(xVar, Boolean.valueOf(z11));
                }
                typedArrayObtainStyledAttributes4.recycle();
                TypedArray typedArrayObtainStyledAttributes5 = dVar.obtainStyledAttributes(attributeSet, j0.f75302e);
                if (typedArrayObtainStyledAttributes5.hasValue(0)) {
                    a1.l(xVar, typedArrayObtainStyledAttributes5.getString(0));
                }
                typedArrayObtainStyledAttributes5.recycle();
                TypedArray typedArrayObtainStyledAttributes6 = dVar.obtainStyledAttributes(attributeSet, j0.f75303f);
                if (typedArrayObtainStyledAttributes6.hasValue(0)) {
                    boolean z12 = typedArrayObtainStyledAttributes6.getBoolean(0, false);
                    WeakHashMap weakHashMap2 = a1.f250a;
                    new a5.o0(0).b(xVar, Boolean.valueOf(z12));
                }
                typedArrayObtainStyledAttributes6.recycle();
            }
        }
        return xVar;
    }

    @Override // m.s
    public final void p() throws PackageManager.NameNotFoundException {
        String strD;
        this.O = true;
        E(false, true);
        O();
        Object obj = this.f75229j;
        if (obj instanceof Activity) {
            try {
                Activity activity = (Activity) obj;
                try {
                    strD = n4.f.d(activity, activity.getComponentName());
                } catch (PackageManager.NameNotFoundException e3) {
                    throw new IllegalArgumentException(e3);
                }
            } catch (IllegalArgumentException unused) {
                strD = null;
            }
            if (strD != null) {
                b bVar = this.o;
                if (bVar == null) {
                    this.f75223b0 = true;
                } else {
                    bVar.p(true);
                }
            }
            synchronized (s.f75345h) {
                s.v(this);
                s.f75344g.add(new WeakReference(this));
            }
        }
        this.R = new Configuration(this.f75230k.getResources().getConfiguration());
        this.P = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x004d  */
    @Override // m.s
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void q() {
        if (this.f75229j instanceof Activity) {
            synchronized (s.f75345h) {
                s.v(this);
            }
        }
        if (this.Y) {
            this.f75231l.getDecorView().removeCallbacks(this.f75222a0);
        }
        this.Q = true;
        if (this.S != -100) {
            Object obj = this.f75229j;
            if ((obj instanceof Activity) && ((Activity) obj).isChangingConfigurations()) {
                f75219h0.put(this.f75229j.getClass().getName(), Integer.valueOf(this.S));
            } else {
                f75219h0.remove(this.f75229j.getClass().getName());
            }
        }
        b bVar = this.o;
        if (bVar != null) {
            bVar.i();
        }
        c0 c0Var = this.W;
        if (c0Var != null) {
            c0Var.h();
        }
        c0 c0Var2 = this.X;
        if (c0Var2 != null) {
            c0Var2.h();
        }
    }

    @Override // m.s
    public final void r() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        N();
    }

    @Override // m.s
    public final void s() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        R();
        b bVar = this.o;
        if (bVar != null) {
            bVar.u(true);
        }
    }

    @Override // m.s
    public final void t() throws PackageManager.NameNotFoundException {
        E(true, false);
    }

    @Override // m.s
    public final void u() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        R();
        b bVar = this.o;
        if (bVar != null) {
            bVar.u(false);
        }
    }

    @Override // m.s
    public final boolean w(int i5) {
        if (i5 == 8) {
            Log.i("AppCompatDelegate", "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR id when requesting this feature.");
            i5 = 108;
        } else if (i5 == 9) {
            Log.i("AppCompatDelegate", "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR_OVERLAY id when requesting this feature.");
            i5 = 109;
        }
        if (this.J && i5 == 108) {
            return false;
        }
        if (this.F && i5 == 1) {
            this.F = false;
        }
        if (i5 == 1) {
            Y();
            this.J = true;
            return true;
        }
        if (i5 == 2) {
            Y();
            this.D = true;
            return true;
        }
        if (i5 == 5) {
            Y();
            this.E = true;
            return true;
        }
        if (i5 == 10) {
            Y();
            this.H = true;
            return true;
        }
        if (i5 == 108) {
            Y();
            this.F = true;
            return true;
        }
        if (i5 != 109) {
            return this.f75231l.requestFeature(i5);
        }
        Y();
        this.G = true;
        return true;
    }

    @Override // m.s
    public final void x(int i5) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        N();
        ViewGroup viewGroup = (ViewGroup) this.A.findViewById(16908290);
        viewGroup.removeAllViews();
        LayoutInflater.from(this.f75230k).inflate(i5, viewGroup);
        this.f75232m.b(this.f75231l.getCallback());
    }

    @Override // m.s
    public final void y(View view) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        N();
        ViewGroup viewGroup = (ViewGroup) this.A.findViewById(16908290);
        viewGroup.removeAllViews();
        viewGroup.addView(view);
        this.f75232m.b(this.f75231l.getCallback());
    }

    @Override // m.s
    public final void z(View view, ViewGroup.LayoutParams layoutParams) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        N();
        ViewGroup viewGroup = (ViewGroup) this.A.findViewById(16908290);
        viewGroup.removeAllViews();
        viewGroup.addView(view, layoutParams);
        this.f75232m.b(this.f75231l.getCallback());
    }

    public f0(Context context, Window window, n nVar, Object obj) {
        m mVar = null;
        this.f75242y = null;
        this.S = -100;
        this.f75222a0 = new t(this, 0);
        this.f75230k = context;
        this.n = nVar;
        this.f75229j = obj;
        if (obj instanceof Dialog) {
            while (true) {
                if (context != null) {
                    if (!(context instanceof m)) {
                        if (!(context instanceof ContextWrapper)) {
                            break;
                        } else {
                            context = ((ContextWrapper) context).getBaseContext();
                        }
                    } else {
                        mVar = (m) context;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (mVar != null) {
                this.S = ((f0) mVar.getDelegate()).S;
            }
        }
        if (this.S == -100) {
            String name = this.f75229j.getClass().getName();
            c1 c1Var = f75219h0;
            Integer num = (Integer) c1Var.get(name);
            if (num != null) {
                this.S = num.intValue();
                c1Var.remove(this.f75229j.getClass().getName());
            }
        }
        if (window != null) {
            F(window);
        }
        r.p.e();
    }

    @Override // android.view.LayoutInflater.Factory
    public final View onCreateView(String str, Context context, AttributeSet attributeSet) {
        return onCreateView(null, str, context, attributeSet);
    }
}
