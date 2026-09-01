package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import com.drew.lang.RandomAccessStreamReader;
import com.medium.reader.R;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ute {
    public static WeakHashMap a = null;
    public static Field b = null;
    public static boolean c = false;
    public static final int[] d = {R.id.accessibility_custom_action_0, R.id.accessibility_custom_action_1, R.id.accessibility_custom_action_2, R.id.accessibility_custom_action_3, R.id.accessibility_custom_action_4, R.id.accessibility_custom_action_5, R.id.accessibility_custom_action_6, R.id.accessibility_custom_action_7, R.id.accessibility_custom_action_8, R.id.accessibility_custom_action_9, R.id.accessibility_custom_action_10, R.id.accessibility_custom_action_11, R.id.accessibility_custom_action_12, R.id.accessibility_custom_action_13, R.id.accessibility_custom_action_14, R.id.accessibility_custom_action_15, R.id.accessibility_custom_action_16, R.id.accessibility_custom_action_17, R.id.accessibility_custom_action_18, R.id.accessibility_custom_action_19, R.id.accessibility_custom_action_20, R.id.accessibility_custom_action_21, R.id.accessibility_custom_action_22, R.id.accessibility_custom_action_23, R.id.accessibility_custom_action_24, R.id.accessibility_custom_action_25, R.id.accessibility_custom_action_26, R.id.accessibility_custom_action_27, R.id.accessibility_custom_action_28, R.id.accessibility_custom_action_29, R.id.accessibility_custom_action_30, R.id.accessibility_custom_action_31};
    public static final hte e = new hte();
    public static final jte f = new jte();

    public static jve a(View view) {
        WeakHashMap weakHashMap = a;
        if (weakHashMap == null) {
            weakHashMap = new WeakHashMap();
            a = weakHashMap;
        }
        jve jveVar = (jve) weakHashMap.get(view);
        if (jveVar != null) {
            return jveVar;
        }
        jve jveVar2 = new jve(view);
        a.put(view, jveVar2);
        return jveVar2;
    }

    public static z4f b(View view, z4f z4fVar) {
        WindowInsets windowInsetsG = z4fVar.g();
        if (windowInsetsG != null) {
            WindowInsets windowInsetsA = Build.VERSION.SDK_INT >= 30 ? rte.a(view, windowInsetsG) : kte.a(view, windowInsetsG);
            if (!windowInsetsA.equals(windowInsetsG)) {
                return z4f.h(windowInsetsA, view);
            }
        }
        return z4fVar;
    }

    public static boolean c(View view, KeyEvent keyEvent) {
        if (Build.VERSION.SDK_INT >= 28) {
            return false;
        }
        ArrayList arrayList = tte.d;
        tte tteVar = (tte) view.getTag(R.id.tag_unhandled_key_event_manager);
        if (tteVar == null) {
            tteVar = new tte();
            tteVar.a = null;
            tteVar.b = null;
            tteVar.c = null;
            view.setTag(R.id.tag_unhandled_key_event_manager, tteVar);
        }
        if (keyEvent.getAction() == 0) {
            WeakHashMap weakHashMap = tteVar.a;
            if (weakHashMap != null) {
                weakHashMap.clear();
            }
            ArrayList arrayList2 = tte.d;
            if (!arrayList2.isEmpty()) {
                synchronized (arrayList2) {
                    try {
                        if (tteVar.a == null) {
                            tteVar.a = new WeakHashMap();
                        }
                        for (int size = arrayList2.size() - 1; size >= 0; size--) {
                            ArrayList arrayList3 = tte.d;
                            View view2 = (View) ((WeakReference) arrayList3.get(size)).get();
                            if (view2 == null) {
                                arrayList3.remove(size);
                            } else {
                                tteVar.a.put(view2, Boolean.TRUE);
                                for (ViewParent parent = view2.getParent(); parent instanceof View; parent = parent.getParent()) {
                                    tteVar.a.put((View) parent, Boolean.TRUE);
                                }
                            }
                        }
                    } finally {
                    }
                }
            }
        }
        View viewA = tteVar.a(view);
        if (keyEvent.getAction() == 0) {
            int keyCode = keyEvent.getKeyCode();
            if (viewA != null && !KeyEvent.isModifierKey(keyCode)) {
                SparseArray sparseArray = tteVar.b;
                if (sparseArray == null) {
                    sparseArray = new SparseArray();
                    tteVar.b = sparseArray;
                }
                sparseArray.put(keyCode, new WeakReference(viewA));
            }
        }
        return viewA != null;
    }

    public static boolean d(View view, KeyEvent keyEvent) {
        ArrayList arrayList;
        int size;
        int iIndexOfKey;
        if (Build.VERSION.SDK_INT < 28) {
            ArrayList arrayList2 = tte.d;
            tte tteVar = (tte) view.getTag(R.id.tag_unhandled_key_event_manager);
            WeakReference weakReference = null;
            if (tteVar == null) {
                tteVar = new tte();
                tteVar.a = null;
                tteVar.b = null;
                tteVar.c = null;
                view.setTag(R.id.tag_unhandled_key_event_manager, tteVar);
            }
            WeakReference weakReference2 = tteVar.c;
            if (weakReference2 == null || weakReference2.get() != keyEvent) {
                tteVar.c = new WeakReference(keyEvent);
                SparseArray sparseArray = tteVar.b;
                if (sparseArray == null) {
                    sparseArray = new SparseArray();
                    tteVar.b = sparseArray;
                }
                if (keyEvent.getAction() == 1 && (iIndexOfKey = sparseArray.indexOfKey(keyEvent.getKeyCode())) >= 0) {
                    weakReference = (WeakReference) sparseArray.valueAt(iIndexOfKey);
                    sparseArray.removeAt(iIndexOfKey);
                }
                if (weakReference == null) {
                    weakReference = (WeakReference) sparseArray.get(keyEvent.getKeyCode());
                }
                if (weakReference != null) {
                    View view2 = (View) weakReference.get();
                    if (view2 == null || !view2.isAttachedToWindow() || (arrayList = (ArrayList) view2.getTag(R.id.tag_unhandled_key_listeners)) == null || (size = arrayList.size() - 1) < 0) {
                        return true;
                    }
                    arrayList.get(size).getClass();
                    rd6.m();
                    return false;
                }
            }
        }
        return false;
    }

    public static View.AccessibilityDelegate e(View view) {
        if (Build.VERSION.SDK_INT >= 29) {
            return qte.a(view);
        }
        if (c) {
            return null;
        }
        if (b == null) {
            try {
                Field declaredField = View.class.getDeclaredField("mAccessibilityDelegate");
                b = declaredField;
                declaredField.setAccessible(true);
            } catch (Throwable unused) {
                c = true;
                return null;
            }
        }
        try {
            Object obj = b.get(view);
            if (obj instanceof View.AccessibilityDelegate) {
                return (View.AccessibilityDelegate) obj;
            }
            return null;
        } catch (Throwable unused2) {
            c = true;
            return null;
        }
    }

    public static CharSequence f(View view) {
        Object tag;
        if (Build.VERSION.SDK_INT >= 28) {
            tag = pte.a(view);
        } else {
            tag = view.getTag(R.id.tag_accessibility_pane_title);
            if (!CharSequence.class.isInstance(tag)) {
                tag = null;
            }
        }
        return (CharSequence) tag;
    }

    public static ArrayList g(View view) {
        ArrayList arrayList = (ArrayList) view.getTag(R.id.tag_accessibility_actions);
        if (arrayList != null) {
            return arrayList;
        }
        ArrayList arrayList2 = new ArrayList();
        view.setTag(R.id.tag_accessibility_actions, arrayList2);
        return arrayList2;
    }

    public static String[] h(l20 l20Var) {
        return Build.VERSION.SDK_INT >= 31 ? ste.a(l20Var) : (String[]) l20Var.getTag(R.id.tag_on_receive_content_mime_types);
    }

    public static void i(View view, int i) {
        AccessibilityManager accessibilityManager = (AccessibilityManager) view.getContext().getSystemService("accessibility");
        if (accessibilityManager.isEnabled()) {
            boolean z = f(view) != null && view.isShown() && view.getWindowVisibility() == 0;
            if (view.getAccessibilityLiveRegion() != 0 || z) {
                AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain();
                accessibilityEventObtain.setEventType(z ? 32 : RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH);
                accessibilityEventObtain.setContentChangeTypes(i);
                if (z) {
                    accessibilityEventObtain.getText().add(f(view));
                    if (view.getImportantForAccessibility() == 0) {
                        view.setImportantForAccessibility(1);
                    }
                }
                view.sendAccessibilityEventUnchecked(accessibilityEventObtain);
                return;
            }
            if (i != 32) {
                if (view.getParent() != null) {
                    try {
                        view.getParent().notifySubtreeAccessibilityStateChanged(view, view, i);
                        return;
                    } catch (AbstractMethodError e2) {
                        Log.e("ViewCompat", view.getParent().getClass().getSimpleName().concat(" does not fully implement ViewParent"), e2);
                        return;
                    }
                }
                return;
            }
            AccessibilityEvent accessibilityEventObtain2 = AccessibilityEvent.obtain();
            view.onInitializeAccessibilityEvent(accessibilityEventObtain2);
            accessibilityEventObtain2.setEventType(32);
            accessibilityEventObtain2.setContentChangeTypes(i);
            accessibilityEventObtain2.setSource(view);
            view.onPopulateAccessibilityEvent(accessibilityEventObtain2);
            accessibilityEventObtain2.getText().add(f(view));
            accessibilityManager.sendAccessibilityEvent(accessibilityEventObtain2);
        }
    }

    public static z4f j(View view, z4f z4fVar) {
        WindowInsets windowInsetsG = z4fVar.g();
        if (windowInsetsG != null) {
            WindowInsets windowInsetsOnApplyWindowInsets = view.onApplyWindowInsets(windowInsetsG);
            if (!windowInsetsOnApplyWindowInsets.equals(windowInsetsG)) {
                return z4f.h(windowInsetsOnApplyWindowInsets, view);
            }
        }
        return z4fVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static p82 k(View view, p82 p82Var) {
        if (Log.isLoggable("ViewCompat", 3)) {
            Log.d("ViewCompat", "performReceiveContent: " + p82Var + ", view=" + view.getClass().getSimpleName() + "[" + view.getId() + "]");
        }
        if (Build.VERSION.SDK_INT >= 31) {
            return ste.b(view, p82Var);
        }
        tkd tkdVar = (tkd) view.getTag(R.id.tag_on_receive_content_listener);
        hr8 hr8Var = e;
        if (tkdVar == null) {
            if (view instanceof hr8) {
                hr8Var = (hr8) view;
            }
            return hr8Var.a(p82Var);
        }
        p82 p82VarA = tkd.a(view, p82Var);
        if (p82VarA == null) {
            return null;
        }
        if (view instanceof hr8) {
            hr8Var = (hr8) view;
        }
        return hr8Var.a(p82VarA);
    }

    public static void l(View view, int i) {
        ArrayList arrayListG = g(view);
        for (int i2 = 0; i2 < arrayListG.size(); i2++) {
            if (((t4) arrayListG.get(i2)).a() == i) {
                arrayListG.remove(i2);
                return;
            }
        }
    }

    public static void m(View view, t4 t4Var, l5 l5Var) {
        t4 t4Var2 = new t4(null, t4Var.b, null, l5Var, t4Var.c);
        View.AccessibilityDelegate accessibilityDelegateE = e(view);
        l4 l4Var = accessibilityDelegateE == null ? null : accessibilityDelegateE instanceof k4 ? ((k4) accessibilityDelegateE).a : new l4(accessibilityDelegateE);
        if (l4Var == null) {
            l4Var = new l4();
        }
        o(view, l4Var);
        l(view, t4Var2.a());
        g(view).add(t4Var2);
        i(view, 0);
    }

    public static void n(View view, Context context, int[] iArr, AttributeSet attributeSet, TypedArray typedArray, int i) {
        if (Build.VERSION.SDK_INT >= 29) {
            qte.b(view, context, iArr, attributeSet, typedArray, i, 0);
        }
    }

    public static void o(View view, l4 l4Var) {
        if (l4Var == null && (e(view) instanceof k4)) {
            l4Var = new l4();
        }
        if (view.getImportantForAccessibility() == 0) {
            view.setImportantForAccessibility(1);
        }
        view.setAccessibilityDelegate(l4Var == null ? null : l4Var.b);
    }

    public static void p(View view, CharSequence charSequence) {
        new ite(R.id.tag_accessibility_pane_title, CharSequence.class, 8, 28, 1).h(view, charSequence);
        jte jteVar = f;
        if (charSequence == null) {
            jteVar.a.remove(view);
            view.removeOnAttachStateChangeListener(jteVar);
            view.getViewTreeObserver().removeOnGlobalLayoutListener(jteVar);
        } else {
            jteVar.a.put(view, Boolean.valueOf(view.isShown() && view.getWindowVisibility() == 0));
            view.addOnAttachStateChangeListener(jteVar);
            if (view.isAttachedToWindow()) {
                view.getViewTreeObserver().addOnGlobalLayoutListener(jteVar);
            }
        }
    }
}
