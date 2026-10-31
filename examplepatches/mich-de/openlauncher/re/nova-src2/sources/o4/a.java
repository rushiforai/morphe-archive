package o4;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.os.Build;
import android.os.Process;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import android.util.TypedValue;
import com.google.android.gms.internal.consent_sdk.e0;
import com.google.android.gms.internal.consent_sdk.k0;
import java.util.WeakHashMap;
import n4.n0;
import q4.i;
import q4.j;
import q4.k;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f79514a = null;

    public static int a(Context context, String str) {
        if (str != null) {
            return (Build.VERSION.SDK_INT >= 33 || !TextUtils.equals("android.permission.POST_NOTIFICATIONS", str)) ? context.checkPermission(str, Process.myPid(), Process.myUid()) : n0.c(context).a() ? 0 : -1;
        }
        throw new NullPointerException("permission must be non-null");
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0047, code lost:
    
        if (r5.f83635c == r8.hashCode()) goto L21;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ColorStateList b(Context context, int i5) {
        ColorStateList colorStateListA;
        ColorStateList colorStateList;
        i iVar;
        Resources resources = context.getResources();
        Resources.Theme theme = context.getTheme();
        j jVar = new j(resources, theme);
        synchronized (k.f83640c) {
            try {
                SparseArray sparseArray = (SparseArray) k.f83639b.get(jVar);
                colorStateListA = null;
                if (sparseArray == null || sparseArray.size() <= 0 || (iVar = (i) sparseArray.get(i5)) == null) {
                    colorStateList = null;
                } else {
                    if (iVar.f83634b.equals(resources.getConfiguration())) {
                        if (theme != null || iVar.f83635c != 0) {
                            if (theme != null) {
                            }
                        }
                        colorStateList = iVar.f83633a;
                    }
                    sparseArray.remove(i5);
                    colorStateList = null;
                }
            } finally {
            }
        }
        if (colorStateList != null) {
            return colorStateList;
        }
        ThreadLocal threadLocal = k.f83638a;
        TypedValue typedValue = (TypedValue) threadLocal.get();
        if (typedValue == null) {
            typedValue = new TypedValue();
            threadLocal.set(typedValue);
        }
        resources.getValue(i5, typedValue, true);
        int i11 = typedValue.type;
        if (i11 < 28 || i11 > 31) {
            try {
                colorStateListA = q4.c.a(resources, resources.getXml(i5), theme);
            } catch (Exception e3) {
                Log.w("ResourcesCompat", "Failed to inflate ColorStateList, leaving it to the framework", e3);
            }
        }
        if (colorStateListA == null) {
            return resources.getColorStateList(i5, theme);
        }
        synchronized (k.f83640c) {
            try {
                WeakHashMap weakHashMap = k.f83639b;
                SparseArray sparseArray2 = (SparseArray) weakHashMap.get(jVar);
                if (sparseArray2 == null) {
                    sparseArray2 = new SparseArray();
                    weakHashMap.put(jVar, sparseArray2);
                }
                sparseArray2.append(i5, new i(colorStateListA, jVar.f83636a.getConfiguration(), theme));
            } finally {
            }
        }
        return colorStateListA;
    }

    public static Intent c(Context context, BroadcastReceiver broadcastReceiver, IntentFilter intentFilter, String str, int i5) {
        int i11 = i5 & 2;
        if (i11 == 0 && (i5 & 4) == 0) {
            throw new IllegalArgumentException("One of either RECEIVER_EXPORTED or RECEIVER_NOT_EXPORTED is required");
        }
        if (i11 == 0 || (i5 & 4) == 0) {
            return Build.VERSION.SDK_INT >= 33 ? k0.A(context, broadcastReceiver, intentFilter, str, i5) : e0.X(context, broadcastReceiver, intentFilter, str, i5);
        }
        throw new IllegalArgumentException("Cannot specify both RECEIVER_EXPORTED and RECEIVER_NOT_EXPORTED");
    }
}
