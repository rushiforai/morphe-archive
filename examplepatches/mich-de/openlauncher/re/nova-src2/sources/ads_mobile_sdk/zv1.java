package ads_mobile_sdk;

import android.app.Activity;
import android.app.KeyguardManager;
import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AbsListView;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.ScrollView;
import android.widget.TextView;
import androidx.core.view.ScrollingView;
import b.d0;
import com.google.android.libraries.ads.mobile.sdk.nativead.NativeAdAssetNames;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* loaded from: classes.dex */
public final class zv1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f12686a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f12687b;

    /* renamed from: c, reason: collision with root package name */
    public final ci3 f12688c;

    public zv1(Context context, jr0 flags, ci3 traceLogger) {
        Intrinsics.g(context, "context");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f12686a = context;
        this.f12687b = flags;
        this.f12688c = traceLogger;
    }

    public final com.google.gson.r a(String str, Point startingPoint, Point currentPoint) {
        Intrinsics.g(startingPoint, "startingPoint");
        Intrinsics.g(currentPoint, "currentPoint");
        com.google.gson.r rVar = new com.google.gson.r();
        int i5 = currentPoint.x;
        Context context = this.f12686a;
        rVar.q(Integer.valueOf(d0.p(context, i5)), "x");
        rVar.q(Integer.valueOf(d0.p(context, currentPoint.y)), "y");
        rVar.q(Integer.valueOf(d0.p(context, startingPoint.x)), "start_x");
        rVar.q(Integer.valueOf(d0.p(context, startingPoint.y)), "start_y");
        com.google.gson.r rVar2 = new com.google.gson.r();
        rVar2.p("click_point", rVar);
        rVar2.s("asset_id", str);
        return rVar2;
    }

    public final com.google.gson.r b(FrameLayout frameLayout) {
        jr0 jr0Var;
        xv1 xv1Var;
        jn jnVar = jn.a$10;
        if (frameLayout == null) {
            return new com.google.gson.r();
        }
        ViewParent parent = frameLayout.getParent();
        loop0: while (true) {
            jr0Var = this.f12687b;
            if (parent == null) {
                xv1Var = xv1.f11858b;
                break;
            }
            if (parent instanceof ScrollView) {
                xv1Var = xv1.f11859c;
                break;
            }
            if (parent instanceof AbsListView) {
                xv1Var = xv1.f11860d;
                break;
            }
            if (parent instanceof HorizontalScrollView) {
                xv1Var = xv1.f11861e;
                break;
            }
            if (parent instanceof ScrollingView) {
                xv1Var = xv1.f11862f;
                break;
            }
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:native:enable_scroll_view_type_by_keyword", Boolean.FALSE, jnVar)).booleanValue()) {
                List defaultValue = ul.b.Q("recycler", "viewflipper");
                Intrinsics.g(defaultValue, "defaultValue");
                for (String str : (List) jr0Var.a("gads:native:scrollable_container_keywords", defaultValue, jn.a$20)) {
                    String lowerCase = parent.getClass().getName().toLowerCase(Locale.ROOT);
                    Intrinsics.f(lowerCase, "toLowerCase(...)");
                    if (r70.k.K0(lowerCase, str, false)) {
                        xv1Var = xv1.f11863g;
                        break loop0;
                    }
                }
            }
            parent = parent.getParent();
        }
        com.google.gson.r rVar = new com.google.gson.r();
        jr0Var.getClass();
        Boolean bool = Boolean.TRUE;
        if (((Boolean) jr0Var.a("gads:native:enable_contained_in_scroll_view_signal", bool, jnVar)).booleanValue()) {
            rVar.r("contained_in_scroll_view", Boolean.valueOf(xv1Var != xv1.f11858b));
        }
        if (((Boolean) jr0Var.a("gads:native:enable_scroll_view_type_signal", bool, jnVar)).booleanValue()) {
            rVar.q(Integer.valueOf(xv1Var.f11865a), "scroll_view_type");
        }
        return rVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x015f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final com.google.gson.r c(FrameLayout frameLayout) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        com.google.gson.r rVarA;
        Object objInvoke;
        ViewGroup.LayoutParams layoutParams;
        com.google.gson.r rVar = new com.google.gson.r();
        if (frameLayout != null) {
            int[] iArr = new int[2];
            frameLayout.getLocationOnScreen(iArr);
            int[] iArr2 = {frameLayout.getMeasuredWidth(), frameLayout.getMeasuredHeight()};
            ViewParent parent = frameLayout.getParent();
            while (parent instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) parent;
                int measuredWidth = viewGroup.getMeasuredWidth();
                int i5 = iArr2[0];
                if (measuredWidth > i5) {
                    measuredWidth = i5;
                }
                iArr2[0] = measuredWidth;
                int measuredHeight = viewGroup.getMeasuredHeight();
                int i11 = iArr2[1];
                if (measuredHeight > i11) {
                    measuredHeight = i11;
                }
                iArr2[1] = measuredHeight;
                parent = viewGroup.getParent();
            }
            com.google.gson.r rVar2 = new com.google.gson.r();
            int measuredWidth2 = frameLayout.getMeasuredWidth();
            Context context = this.f12686a;
            rVar2.q(Integer.valueOf(d0.p(context, measuredWidth2)), "width");
            rVar2.q(Integer.valueOf(d0.p(context, frameLayout.getMeasuredHeight())), "height");
            rVar2.q(Integer.valueOf(d0.p(context, iArr[0])), "x");
            rVar2.q(Integer.valueOf(d0.p(context, iArr[1])), "y");
            rVar2.q(Integer.valueOf(d0.p(context, iArr2[0])), "maximum_visible_width");
            rVar2.q(Integer.valueOf(d0.p(context, iArr2[1])), "maximum_visible_height");
            rVar2.s("relative_to", "window");
            rVar.p("frame", rVar2);
            Rect rect = new Rect();
            if (frameLayout.getGlobalVisibleRect(rect)) {
                rVarA = a(context, rect);
            } else {
                com.google.gson.r rVar3 = new com.google.gson.r();
                rVar3.q(0, "width");
                rVar3.q(0, "height");
                rVar3.q(Integer.valueOf(d0.p(context, iArr[0])), "x");
                rVar3.q(Integer.valueOf(d0.p(context, iArr[1])), "y");
                rVar3.s("relative_to", "window");
                rVarA = rVar3;
            }
            rVar.p("visible_bounds", rVarA);
            ViewParent parent2 = frameLayout.getParent();
            if (parent2 != null) {
                try {
                    Method method = parent2.getClass().getMethod("getTemplateTypeName", null);
                    Intrinsics.f(method, "getMethod(...)");
                    objInvoke = method.invoke(parent2, null);
                } catch (IllegalAccessException e3) {
                    cz.b bVar = mu0.f7335a;
                    mu0.b("Cannot access method getTemplateTypeName: " + e3, null);
                } catch (NoSuchMethodException unused) {
                } catch (SecurityException e11) {
                    cz.b bVar2 = mu0.f7335a;
                    mu0.b("Cannot access method getTemplateTypeName: " + e11, null);
                } catch (InvocationTargetException e12) {
                    cz.b bVar3 = mu0.f7335a;
                    mu0.b("Cannot access method getTemplateTypeName: " + e12, null);
                }
                if (objInvoke != null) {
                    String string = objInvoke.toString();
                    if (string == null) {
                        string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    if (string.equals("small_template")) {
                        wv1[] wv1VarArr = wv1.f11487a;
                        rVar.q(1, "native_template_type");
                    } else if (string.equals("medium_template")) {
                        wv1[] wv1VarArr2 = wv1.f11487a;
                        rVar.q(2, "native_template_type");
                    } else {
                        wv1[] wv1VarArr3 = wv1.f11487a;
                        rVar.q(0, "native_template_type");
                    }
                    Boolean bool = Boolean.FALSE;
                    jn jnVar = jn.a$10;
                    jr0 jr0Var = this.f12687b;
                    if (((Boolean) jr0Var.a("gads:nas_collect_layout_params:enabled", bool, jnVar)).booleanValue() && (layoutParams = frameLayout.getLayoutParams()) != null) {
                        rVar.q(Integer.valueOf(a(layoutParams.width).ordinal()), "view_width_layout_type");
                        rVar.q(Integer.valueOf(a(layoutParams.height).ordinal()), "view_height_layout_type");
                    }
                    if (((Boolean) jr0Var.a("gads:nas_collect_alpha:enabled", Boolean.TRUE, jnVar)).booleanValue()) {
                        rVar.q(Float.valueOf(frameLayout.getAlpha()), "alpha");
                    }
                }
            }
        }
        return rVar;
    }

    public static yv1 a(int i5) {
        if (i5 == -2) {
            return yv1.f12299c;
        }
        if (i5 != -1) {
            return yv1.f12297a;
        }
        return yv1.f12298b;
    }

    public final com.google.gson.r a(FrameLayout frameLayout, ImageView.ScaleType mediaViewScaleType, Map assetViews) {
        ViewGroup.LayoutParams layoutParams;
        jn jnVar = jn.a$10;
        boolean z11 = false;
        Intrinsics.g(assetViews, "assetViews");
        Intrinsics.g(mediaViewScaleType, "mediaViewScaleType");
        if (frameLayout == null) {
            return new com.google.gson.r();
        }
        com.google.gson.r rVar = new com.google.gson.r();
        int i5 = 2;
        int[] iArr = new int[2];
        frameLayout.getLocationOnScreen(iArr);
        Iterator it = assetViews.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String str = (String) entry.getKey();
            View view = (View) ((WeakReference) entry.getValue()).get();
            if (view != null) {
                int[] iArr2 = new int[i5];
                view.getLocationOnScreen(iArr2);
                com.google.gson.r rVar2 = new com.google.gson.r();
                com.google.gson.r rVar3 = new com.google.gson.r();
                int measuredWidth = view.getMeasuredWidth();
                Context context = this.f12686a;
                boolean z12 = z11;
                rVar3.q(Integer.valueOf(d0.p(context, measuredWidth)), "width");
                rVar3.q(Integer.valueOf(d0.p(context, view.getMeasuredHeight())), "height");
                Iterator it2 = it;
                rVar3.q(Integer.valueOf(d0.p(context, iArr2[z12 ? 1 : 0] - iArr[z12 ? 1 : 0])), "x");
                rVar3.q(Integer.valueOf(d0.p(context, iArr2[1] - iArr[1])), "y");
                int[] iArr3 = iArr;
                rVar3.s("relative_to", "ad_view");
                rVar2.p("frame", rVar3);
                com.google.gson.r rVar4 = new com.google.gson.r();
                Rect rect = new Rect();
                if (view.getLocalVisibleRect(rect)) {
                    rVar4 = a(context, rect);
                } else {
                    rVar4.q(0, "width");
                    rVar4.q(0, "height");
                    rVar4.q(Integer.valueOf(d0.p(context, iArr2[z12 ? 1 : 0] - iArr3[z12 ? 1 : 0])), "x");
                    rVar4.q(Integer.valueOf(d0.p(context, iArr2[1] - iArr3[1])), "y");
                    rVar4.s("relative_to", "ad_view");
                }
                rVar2.p("visible_bounds", rVar4);
                boolean zB = Intrinsics.b(str, NativeAdAssetNames.ASSET_MEDIA_CONTENT);
                jr0 jr0Var = this.f12687b;
                if (zB) {
                    rVar2.s("mediaview_graphics_matrix", view.getMatrix().toShortString());
                    Boolean bool = Boolean.FALSE;
                    if (((Boolean) jr0Var.a("gads:nas_collect_layout_params:enabled", bool, jnVar)).booleanValue() && (layoutParams = view.getLayoutParams()) != null) {
                        rVar2.q(Integer.valueOf(a(layoutParams.width).ordinal()), "view_width_layout_type");
                        rVar2.q(Integer.valueOf(a(layoutParams.height).ordinal()), "view_height_layout_type");
                    }
                    if (((Boolean) jr0Var.a("gads:nas_collect_view_path:enabled", bool, jnVar)).booleanValue()) {
                        ArrayList arrayList = new ArrayList();
                        arrayList.add(Integer.valueOf(view.getId()));
                        for (ViewParent parent = view.getParent(); parent instanceof View; parent = parent.getParent()) {
                            arrayList.add(Integer.valueOf(((View) parent).getId()));
                        }
                        rVar2.s("view_path", b70.g.f1(arrayList, "/", null, null, 0, null, 62));
                    }
                    rVar2.q(Integer.valueOf(mediaViewScaleType.ordinal()), "mediaview_scale_type");
                }
                if (view instanceof TextView) {
                    TextView textView = (TextView) view;
                    rVar2.q(Integer.valueOf(textView.getCurrentTextColor()), "text_color");
                    rVar2.q(Float.valueOf(textView.getTextSize()), "font_size");
                    rVar2.s("text", textView.getText().toString());
                }
                rVar2.r("is_clickable", Boolean.valueOf(view.isClickable()));
                if (((Boolean) jr0Var.a("gads:nas_collect_alpha:enabled", Boolean.TRUE, jnVar)).booleanValue()) {
                    rVar2.q(Float.valueOf(view.getAlpha()), "alpha");
                }
                rVar.p(str, rVar2);
                it = it2;
                z11 = z12 ? 1 : 0;
                iArr = iArr3;
                i5 = 2;
            }
        }
        return rVar;
    }

    public final com.google.gson.r a(FrameLayout frameLayout) {
        Window window;
        if (frameLayout != null) {
            com.google.gson.r rVar = new com.google.gson.r();
            View rootView = frameLayout.getRootView();
            Context context = rootView != null ? rootView.getContext() : null;
            Activity activity = context instanceof Activity ? (Activity) context : null;
            WindowManager.LayoutParams attributes = (activity == null || (window = activity.getWindow()) == null) ? null : window.getAttributes();
            rVar.r("can_show_on_lock_screen", Boolean.valueOf((attributes == null || (attributes.flags & 524288) == 0) ? false : true));
            KeyguardManager keyguardManager = (KeyguardManager) this.f12686a.getSystemService(KeyguardManager.class);
            rVar.r("is_keyguard_locked", keyguardManager != null ? Boolean.valueOf(keyguardManager.isKeyguardLocked()) : null);
            return rVar;
        }
        return new com.google.gson.r();
    }

    public final com.google.gson.r a() {
        com.google.gson.r rVar = new com.google.gson.r();
        Context context = this.f12686a;
        Intrinsics.g(context, "<this>");
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        float f11 = displayMetrics.widthPixels;
        DisplayMetrics displayMetrics2 = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics2, "getDisplayMetrics(...)");
        rVar.q(Integer.valueOf(MathKt.b(f11 / displayMetrics2.density)), "width");
        Intrinsics.g(context, "<this>");
        DisplayMetrics displayMetrics3 = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics3, "getDisplayMetrics(...)");
        float f12 = displayMetrics3.heightPixels;
        DisplayMetrics displayMetrics4 = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics4, "getDisplayMetrics(...)");
        rVar.q(Integer.valueOf(MathKt.b(f12 / displayMetrics4.density)), "height");
        return rVar;
    }

    public static com.google.gson.r a(Context context, Rect rect) {
        com.google.gson.r rVar = new com.google.gson.r();
        int i5 = rect.right - rect.left;
        Intrinsics.g(context, "<this>");
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        rVar.q(Integer.valueOf(MathKt.b(i5 / displayMetrics.density)), "width");
        float f11 = rect.bottom - rect.top;
        DisplayMetrics displayMetrics2 = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics2, "getDisplayMetrics(...)");
        rVar.q(Integer.valueOf(MathKt.b(f11 / displayMetrics2.density)), "height");
        float f12 = rect.left;
        DisplayMetrics displayMetrics3 = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics3, "getDisplayMetrics(...)");
        rVar.q(Integer.valueOf(MathKt.b(f12 / displayMetrics3.density)), "x");
        float f13 = rect.top;
        DisplayMetrics displayMetrics4 = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics4, "getDisplayMetrics(...)");
        rVar.q(Integer.valueOf(MathKt.b(f13 / displayMetrics4.density)), "y");
        rVar.s("relative_to", "self");
        return rVar;
    }
}
