package a5;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Objects;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public abstract class a1 {

    /* renamed from: a, reason: collision with root package name */
    public static WeakHashMap f250a = null;

    /* renamed from: b, reason: collision with root package name */
    public static Field f251b = null;

    /* renamed from: c, reason: collision with root package name */
    public static boolean f252c = false;

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f253d = {2131427347, 2131427348, 2131427359, 2131427370, 2131427373, 2131427374, 2131427375, 2131427376, 2131427377, 2131427378, 2131427349, 2131427350, 2131427351, 2131427352, 2131427353, 2131427354, 2131427355, 2131427356, 2131427357, 2131427358, 2131427360, 2131427361, 2131427362, 2131427363, 2131427364, 2131427365, 2131427366, 2131427367, 2131427368, 2131427369, 2131427371, 2131427372};

    /* renamed from: e, reason: collision with root package name */
    public static final n0 f254e = new n0();

    /* renamed from: f, reason: collision with root package name */
    public static final p0 f255f = new p0();

    public static i1 a(View view) {
        if (f250a == null) {
            f250a = new WeakHashMap();
        }
        i1 i1Var = (i1) f250a.get(view);
        if (i1Var != null) {
            return i1Var;
        }
        i1 i1Var2 = new i1(view);
        f250a.put(view, i1Var2);
        return i1Var2;
    }

    public static View.AccessibilityDelegate b(View view) {
        if (Build.VERSION.SDK_INT >= 29) {
            return w0.a(view);
        }
        if (f252c) {
            return null;
        }
        if (f251b == null) {
            try {
                Field declaredField = View.class.getDeclaredField("mAccessibilityDelegate");
                f251b = declaredField;
                declaredField.setAccessible(true);
            } catch (Throwable unused) {
                f252c = true;
                return null;
            }
        }
        try {
            Object obj = f251b.get(view);
            if (obj instanceof View.AccessibilityDelegate) {
                return (View.AccessibilityDelegate) obj;
            }
            return null;
        } catch (Throwable unused2) {
            f252c = true;
            return null;
        }
    }

    public static CharSequence c(View view) {
        return (CharSequence) new o0(1).a(view);
    }

    public static ArrayList d(View view) {
        ArrayList arrayList = (ArrayList) view.getTag(2131428975);
        if (arrayList != null) {
            return arrayList;
        }
        ArrayList arrayList2 = new ArrayList();
        view.setTag(2131428975, arrayList2);
        return arrayList2;
    }

    public static String[] e(r.q qVar) {
        return Build.VERSION.SDK_INT >= 31 ? y0.a(qVar) : (String[]) qVar.getTag(2131428983);
    }

    public static void f(int i5, View view) {
        AccessibilityManager accessibilityManager = (AccessibilityManager) view.getContext().getSystemService("accessibility");
        if (accessibilityManager.isEnabled()) {
            boolean z11 = c(view) != null && view.isShown() && view.getWindowVisibility() == 0;
            if (view.getAccessibilityLiveRegion() != 0 || z11) {
                AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain();
                accessibilityEventObtain.setEventType(z11 ? 32 : 2048);
                accessibilityEventObtain.setContentChangeTypes(i5);
                if (z11) {
                    accessibilityEventObtain.getText().add(c(view));
                    if (view.getImportantForAccessibility() == 0) {
                        view.setImportantForAccessibility(1);
                    }
                }
                view.sendAccessibilityEventUnchecked(accessibilityEventObtain);
                return;
            }
            if (i5 != 32) {
                if (view.getParent() != null) {
                    try {
                        view.getParent().notifySubtreeAccessibilityStateChanged(view, view, i5);
                        return;
                    } catch (AbstractMethodError e3) {
                        Log.e("ViewCompat", view.getParent().getClass().getSimpleName().concat(" does not fully implement ViewParent"), e3);
                        return;
                    }
                }
                return;
            }
            AccessibilityEvent accessibilityEventObtain2 = AccessibilityEvent.obtain();
            view.onInitializeAccessibilityEvent(accessibilityEventObtain2);
            accessibilityEventObtain2.setEventType(32);
            accessibilityEventObtain2.setContentChangeTypes(i5);
            accessibilityEventObtain2.setSource(view);
            view.onPopulateAccessibilityEvent(accessibilityEventObtain2);
            accessibilityEventObtain2.getText().add(c(view));
            accessibilityManager.sendAccessibilityEvent(accessibilityEventObtain2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static h g(View view, h hVar) {
        if (Log.isLoggable("ViewCompat", 3)) {
            Objects.toString(hVar);
            view.getClass();
            view.getId();
        }
        if (Build.VERSION.SDK_INT >= 31) {
            return y0.b(view, hVar);
        }
        e5.g gVar = (e5.g) view.getTag(2131428982);
        b0 b0Var = f254e;
        if (gVar == null) {
            if (view instanceof b0) {
                b0Var = (b0) view;
            }
            return b0Var.a(hVar);
        }
        h hVarA = e5.g.a(view, hVar);
        if (hVarA == null) {
            return null;
        }
        if (view instanceof b0) {
            b0Var = (b0) view;
        }
        return b0Var.a(hVarA);
    }

    public static void h(int i5, View view) {
        ArrayList arrayListD = d(view);
        for (int i11 = 0; i11 < arrayListD.size(); i11++) {
            if (((b5.d) arrayListD.get(i11)).b() == i5) {
                arrayListD.remove(i11);
                return;
            }
        }
    }

    public static void i(View view, b5.d dVar, b5.q qVar) {
        b5.d dVarA = dVar.a(qVar);
        View.AccessibilityDelegate accessibilityDelegateB = b(view);
        b bVar = accessibilityDelegateB == null ? null : accessibilityDelegateB instanceof a ? ((a) accessibilityDelegateB).f249a : new b(accessibilityDelegateB);
        if (bVar == null) {
            bVar = new b();
        }
        k(view, bVar);
        h(dVarA.b(), view);
        d(view).add(dVarA);
        f(0, view);
    }

    public static void j(View view, Context context, int[] iArr, AttributeSet attributeSet, TypedArray typedArray, int i5) {
        if (Build.VERSION.SDK_INT >= 29) {
            w0.b(view, context, iArr, attributeSet, typedArray, i5, 0);
        }
    }

    public static void k(View view, b bVar) {
        if (bVar == null && (b(view) instanceof a)) {
            bVar = new b();
        }
        if (view.getImportantForAccessibility() == 0) {
            view.setImportantForAccessibility(1);
        }
        view.setAccessibilityDelegate(bVar == null ? null : bVar.f259b);
    }

    public static void l(View view, CharSequence charSequence) {
        new o0(1).b(view, charSequence);
        p0 p0Var = f255f;
        if (charSequence == null) {
            p0Var.f341a.remove(view);
            view.removeOnAttachStateChangeListener(p0Var);
            view.getViewTreeObserver().removeOnGlobalLayoutListener(p0Var);
        } else {
            p0Var.f341a.put(view, Boolean.valueOf(view.isShown() && view.getWindowVisibility() == 0));
            view.addOnAttachStateChangeListener(p0Var);
            if (view.isAttachedToWindow()) {
                view.getViewTreeObserver().addOnGlobalLayoutListener(p0Var);
            }
        }
    }

    public static void m(View view, CharSequence charSequence) {
        new o0(2).b(view, charSequence);
    }

    public static void n(View view, l1 l1Var) {
        if (Build.VERSION.SDK_INT >= 30) {
            view.setWindowInsetsAnimationCallback(l1Var != null ? new q1(l1Var) : null);
        } else {
            p1.k(view, l1Var);
        }
    }
}
