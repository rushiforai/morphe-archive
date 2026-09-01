package defpackage;

import android.R;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyEvent;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import androidx.appcompat.widget.ActionBarContainer;
import androidx.appcompat.widget.ActionBarContextView;
import androidx.appcompat.widget.ActionBarOverlayLayout;
import androidx.appcompat.widget.Toolbar;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v3f implements x5 {
    public static final AccelerateInterpolator y = new AccelerateInterpolator();
    public static final DecelerateInterpolator z = new DecelerateInterpolator();
    public Context a;
    public Context b;
    public ActionBarOverlayLayout c;
    public ActionBarContainer d;
    public mw2 e;
    public ActionBarContextView f;
    public final View g;
    public boolean h;
    public u3f i;
    public u3f j;
    public lig k;
    public boolean l;
    public boolean p;
    public boolean q;
    public kve s;
    public boolean t;
    public boolean u;
    public final ArrayList m = wgd.v();
    public int n = 0;
    public boolean o = true;
    public boolean r = true;
    public final t3f v = new t3f(this, 0);
    public final t3f w = new t3f(this, 1);
    public final eoc x = new eoc(this);

    public v3f(Activity activity, boolean z2) {
        View decorView = activity.getWindow().getDecorView();
        c(decorView);
        if (z2) {
            return;
        }
        this.g = decorView.findViewById(R.id.content);
    }

    public final void a(boolean z2) {
        jve jveVarI;
        jve jveVarI2;
        boolean z3 = this.q;
        if (z2) {
            if (!z3) {
                this.q = true;
                ActionBarOverlayLayout actionBarOverlayLayout = this.c;
                if (actionBarOverlayLayout != null) {
                    actionBarOverlayLayout.setShowingForActionMode(true);
                }
                f(false);
            }
        } else if (z3) {
            this.q = false;
            ActionBarOverlayLayout actionBarOverlayLayout2 = this.c;
            if (actionBarOverlayLayout2 != null) {
                actionBarOverlayLayout2.setShowingForActionMode(false);
            }
            f(false);
        }
        boolean zIsLaidOut = this.d.isLaidOut();
        mw2 mw2Var = this.e;
        if (!zIsLaidOut) {
            if (z2) {
                ((bod) mw2Var).a.setVisibility(4);
                this.f.setVisibility(0);
                return;
            } else {
                ((bod) mw2Var).a.setVisibility(0);
                this.f.setVisibility(8);
                return;
            }
        }
        if (z2) {
            bod bodVar = (bod) mw2Var;
            jveVarI = ute.a(bodVar.a);
            jveVarI.a(0.0f);
            jveVarI.c(100L);
            jveVarI.d(new aod(bodVar, 4));
            jveVarI2 = this.f.i(0, 200L);
        } else {
            bod bodVar2 = (bod) mw2Var;
            jve jveVarA = ute.a(bodVar2.a);
            jveVarA.a(1.0f);
            jveVarA.c(200L);
            jveVarA.d(new aod(bodVar2, 0));
            jveVarI = this.f.i(8, 100L);
            jveVarI2 = jveVarA;
        }
        kve kveVar = new kve();
        ArrayList arrayList = kveVar.a;
        arrayList.add(jveVarI);
        View view = (View) jveVarI.a.get();
        long duration = view != null ? view.animate().getDuration() : 0L;
        View view2 = (View) jveVarI2.a.get();
        if (view2 != null) {
            view2.animate().setStartDelay(duration);
        }
        arrayList.add(jveVarI2);
        kveVar.b();
    }

    public final Context b() {
        Context context = this.b;
        if (context != null) {
            return context;
        }
        TypedValue typedValue = new TypedValue();
        this.a.getTheme().resolveAttribute(com.medium.reader.R.attr.actionBarWidgetTheme, typedValue, true);
        int i = typedValue.resourceId;
        if (i != 0) {
            ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(this.a, i);
            this.b = contextThemeWrapper;
            return contextThemeWrapper;
        }
        Context context2 = this.a;
        this.b = context2;
        return context2;
    }

    public final void c(View view) {
        mw2 wrapper;
        ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) view.findViewById(com.medium.reader.R.id.decor_content_parent);
        this.c = actionBarOverlayLayout;
        if (actionBarOverlayLayout != null) {
            actionBarOverlayLayout.setActionBarVisibilityCallback(this);
        }
        KeyEvent.Callback callbackFindViewById = view.findViewById(com.medium.reader.R.id.action_bar);
        if (callbackFindViewById instanceof mw2) {
            wrapper = (mw2) callbackFindViewById;
        } else {
            if (!(callbackFindViewById instanceof Toolbar)) {
                throw new IllegalStateException("Can't make a decor toolbar out of ".concat(callbackFindViewById != null ? callbackFindViewById.getClass().getSimpleName() : "null"));
            }
            wrapper = ((Toolbar) callbackFindViewById).getWrapper();
        }
        this.e = wrapper;
        this.f = (ActionBarContextView) view.findViewById(com.medium.reader.R.id.action_context_bar);
        ActionBarContainer actionBarContainer = (ActionBarContainer) view.findViewById(com.medium.reader.R.id.action_bar_container);
        this.d = actionBarContainer;
        mw2 mw2Var = this.e;
        if (mw2Var == null || this.f == null || actionBarContainer == null) {
            ygf.f(v3f.class.getSimpleName().concat(" can only be used with a compatible window decor layout"));
            return;
        }
        Context context = ((bod) mw2Var).a.getContext();
        this.a = context;
        if ((((bod) this.e).b & 4) != 0) {
            this.h = true;
        }
        int i = context.getApplicationInfo().targetSdkVersion;
        this.e.getClass();
        e(context.getResources().getBoolean(com.medium.reader.R.bool.abc_action_bar_embed_tabs));
        TypedArray typedArrayObtainStyledAttributes = this.a.obtainStyledAttributes(null, esa.a, com.medium.reader.R.attr.actionBarStyle, 0);
        if (typedArrayObtainStyledAttributes.getBoolean(14, false)) {
            ActionBarOverlayLayout actionBarOverlayLayout2 = this.c;
            if (!actionBarOverlayLayout2.g) {
                ygf.f("Action bar must be in overlay mode (Window.FEATURE_OVERLAY_ACTION_BAR) to enable hide on content scroll");
                return;
            } else {
                this.u = true;
                actionBarOverlayLayout2.setHideOnContentScrollEnabled(true);
            }
        }
        int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(12, 0);
        if (dimensionPixelSize != 0) {
            ActionBarContainer actionBarContainer2 = this.d;
            WeakHashMap weakHashMap = ute.a;
            actionBarContainer2.setElevation(dimensionPixelSize);
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    public final void d(boolean z2) {
        if (this.h) {
            return;
        }
        int i = z2 ? 4 : 0;
        bod bodVar = (bod) this.e;
        int i2 = bodVar.b;
        this.h = true;
        bodVar.a((i & 4) | (i2 & (-5)));
    }

    public final void e(boolean z2) {
        if (z2) {
            this.d.setTabContainer(null);
            ((bod) this.e).getClass();
        } else {
            ((bod) this.e).getClass();
            this.d.setTabContainer(null);
        }
        this.e.getClass();
        ((bod) this.e).a.setCollapsible(false);
        this.c.setHasNonEmbeddedTabs(false);
    }

    public final void f(boolean z2) {
        boolean z3 = this.q || !this.p;
        boolean z4 = this.r;
        eoc eocVar = this.x;
        View view = this.g;
        if (!z3) {
            if (z4) {
                this.r = false;
                kve kveVar = this.s;
                if (kveVar != null) {
                    kveVar.a();
                }
                int i = this.n;
                t3f t3fVar = this.v;
                if (i != 0 || (!this.t && !z2)) {
                    t3fVar.c();
                    return;
                }
                this.d.setAlpha(1.0f);
                this.d.setTransitioning(true);
                kve kveVar2 = new kve();
                float f = -this.d.getHeight();
                if (z2) {
                    this.d.getLocationInWindow(new int[]{0, 0});
                    f -= r12[1];
                }
                jve jveVarA = ute.a(this.d);
                jveVarA.e(f);
                View view2 = (View) jveVarA.a.get();
                if (view2 != null) {
                    view2.animate().setUpdateListener(eocVar != null ? new lc7(eocVar, view2) : null);
                }
                boolean z5 = kveVar2.e;
                ArrayList arrayList = kveVar2.a;
                if (!z5) {
                    arrayList.add(jveVarA);
                }
                if (this.o && view != null) {
                    jve jveVarA2 = ute.a(view);
                    jveVarA2.e(f);
                    if (!kveVar2.e) {
                        arrayList.add(jveVarA2);
                    }
                }
                boolean z6 = kveVar2.e;
                if (!z6) {
                    kveVar2.c = y;
                }
                if (!z6) {
                    kveVar2.b = 250L;
                }
                if (!z6) {
                    kveVar2.d = t3fVar;
                }
                this.s = kveVar2;
                kveVar2.b();
                return;
            }
            return;
        }
        if (z4) {
            return;
        }
        this.r = true;
        kve kveVar3 = this.s;
        if (kveVar3 != null) {
            kveVar3.a();
        }
        this.d.setVisibility(0);
        int i2 = this.n;
        t3f t3fVar2 = this.w;
        if (i2 == 0 && (this.t || z2)) {
            this.d.setTranslationY(0.0f);
            float f2 = -this.d.getHeight();
            if (z2) {
                this.d.getLocationInWindow(new int[]{0, 0});
                f2 -= r12[1];
            }
            this.d.setTranslationY(f2);
            kve kveVar4 = new kve();
            jve jveVarA3 = ute.a(this.d);
            jveVarA3.e(0.0f);
            View view3 = (View) jveVarA3.a.get();
            if (view3 != null) {
                view3.animate().setUpdateListener(eocVar != null ? new lc7(eocVar, view3) : null);
            }
            boolean z7 = kveVar4.e;
            ArrayList arrayList2 = kveVar4.a;
            if (!z7) {
                arrayList2.add(jveVarA3);
            }
            if (this.o && view != null) {
                view.setTranslationY(f2);
                jve jveVarA4 = ute.a(view);
                jveVarA4.e(0.0f);
                if (!kveVar4.e) {
                    arrayList2.add(jveVarA4);
                }
            }
            boolean z8 = kveVar4.e;
            if (!z8) {
                kveVar4.c = z;
            }
            if (!z8) {
                kveVar4.b = 250L;
            }
            if (!z8) {
                kveVar4.d = t3fVar2;
            }
            this.s = kveVar4;
            kveVar4.b();
        } else {
            this.d.setAlpha(1.0f);
            this.d.setTranslationY(0.0f);
            if (this.o && view != null) {
                view.setTranslationY(0.0f);
            }
            t3fVar2.c();
        }
        ActionBarOverlayLayout actionBarOverlayLayout = this.c;
        if (actionBarOverlayLayout != null) {
            WeakHashMap weakHashMap = ute.a;
            actionBarOverlayLayout.requestApplyInsets();
        }
    }

    public v3f(Dialog dialog) {
        c(dialog.getWindow().getDecorView());
    }
}
