package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class t10 {
    public static final s10 a = new s10(new bf3(4));
    public static int b = -100;
    public static i67 c = null;
    public static i67 d = null;
    public static Boolean e = null;
    public static boolean f = false;
    public static final d80 g = new d80(0);
    public static final Object h = new Object();
    public static final Object i = new Object();

    public static boolean b(Context context) {
        if (e == null) {
            try {
                int i2 = z50.a;
                Bundle bundle = context.getPackageManager().getServiceInfo(new ComponentName(context, (Class<?>) z50.class), Build.VERSION.SDK_INT >= 24 ? y50.a() | 128 : OlympusMakernoteDirectory.TAG_PREVIEW_IMAGE).metaData;
                if (bundle != null) {
                    e = Boolean.valueOf(bundle.getBoolean("autoStoreLocales"));
                }
            } catch (PackageManager.NameNotFoundException unused) {
                Log.d("AppCompatDelegate", "Checking for metadata for AppLocalesMetadataHolderService : Service not found");
                e = Boolean.FALSE;
            }
        }
        return e.booleanValue();
    }

    public static void f(f20 f20Var) {
        synchronized (h) {
            try {
                d80 d80Var = g;
                d80Var.getClass();
                t70 t70Var = new t70(d80Var);
                while (t70Var.hasNext()) {
                    t10 t10Var = (t10) ((WeakReference) t70Var.next()).get();
                    if (t10Var == f20Var || t10Var == null) {
                        t70Var.remove();
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static void k(int i2) {
        if (i2 != -1 && i2 != 0 && i2 != 1 && i2 != 2 && i2 != 3) {
            Log.d("AppCompatDelegate", "setDefaultNightMode() called with an unknown mode");
            return;
        }
        if (b != i2) {
            b = i2;
            synchronized (h) {
                try {
                    d80 d80Var = g;
                    d80Var.getClass();
                    t70 t70Var = new t70(d80Var);
                    while (t70Var.hasNext()) {
                        t10 t10Var = (t10) ((WeakReference) t70Var.next()).get();
                        if (t10Var != null) {
                            ((f20) t10Var).m(true, true);
                        }
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
        }
    }

    public abstract void a();

    public abstract void c();

    public abstract void e();

    public abstract boolean g(int i2);

    public abstract void h(int i2);

    public abstract void i(View view);

    public abstract void j(View view, ViewGroup.LayoutParams layoutParams);

    public abstract void l(CharSequence charSequence);
}
