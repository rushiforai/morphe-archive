package e10;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public final class g2 implements SharedPreferences.OnSharedPreferenceChangeListener {

    /* renamed from: p, reason: collision with root package name */
    public static String f51544p;

    /* renamed from: a, reason: collision with root package name */
    public SharedPreferences f51545a;

    /* renamed from: b, reason: collision with root package name */
    public Map f51546b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f51547c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f51548d;

    /* renamed from: e, reason: collision with root package name */
    public EnumSet f51549e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f51550f;

    /* renamed from: g, reason: collision with root package name */
    public int f51551g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f51552h;

    /* renamed from: i, reason: collision with root package name */
    public f2 f51553i;

    /* renamed from: j, reason: collision with root package name */
    public r1 f51554j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f51555k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f51556l;

    /* renamed from: m, reason: collision with root package name */
    public p4 f51557m;
    public mz.o n;
    public boolean o;

    /* JADX WARN: Removed duplicated region for block: B:22:0x005c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(SharedPreferences sharedPreferences) {
        String str;
        Method methodH;
        SharedPreferences sharedPreferences2 = this.f51545a;
        if (sharedPreferences2 != null) {
            sharedPreferences2.unregisterOnSharedPreferenceChangeListener(this);
        }
        this.f51545a = sharedPreferences;
        int i5 = sharedPreferences.getInt("1", 0);
        if (this.f51545a.getBoolean("widget_reset_ids", false)) {
            this.f51545a.edit().remove("widget_reset_ids").apply();
        }
        if (w20.m.f93694d) {
            Context context = mx.g0.f77088a;
            if (!mx.g0.o() || (methodH = v30.e.h("android.os.SystemProperties", "get", String.class)) == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } else {
                try {
                    str = (String) methodH.invoke(null, "ro.razer.internal.api");
                } catch (IllegalAccessException e3) {
                    e3.printStackTrace();
                } catch (InvocationTargetException e11) {
                    e11.printStackTrace();
                }
            }
        }
        if (TextUtils.isEmpty(str)) {
            this.f51552h = i5 != 0;
        } else {
            this.f51552h = true;
            f51544p = "com.teslacoilsw.launcher";
        }
        this.f51545a.registerOnSharedPreferenceChangeListener(this);
        this.f51552h = (i5 == 0 && TextUtils.isEmpty(f51544p)) ? false : true;
        this.f51547c = i5 == 512;
        onSharedPreferenceChanged(this.f51545a, "_all");
        this.f51545a.getInt("1", 0);
    }

    public final void b(int i5) {
        this.f51545a.edit().putInt("1", i5).apply();
    }

    @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
    public final void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
        EnumSet enumSetNoneOf;
        boolean zEquals = "_all".equals(str);
        if (zEquals) {
            Set<String> stringSet = sharedPreferences.getStringSet("countless_blacklist", null);
            if (stringSet == null || stringSet.size() == 0) {
                new z.f(0);
            } else {
                new z.f(stringSet);
            }
        }
        if ("drawer_folders_before_apps".equals(str) || zEquals) {
            this.f51548d = this.f51545a.getBoolean("drawer_folders_before_apps", true);
        }
        if ("drawer_menu_action_set".equals(str) || zEquals) {
            Set<String> stringSet2 = this.f51545a.getStringSet("drawer_menu_action_set", null);
            if (stringSet2 == null) {
                enumSetNoneOf = EnumSet.noneOf(t1.class);
            } else {
                EnumSet enumSetNoneOf2 = EnumSet.noneOf(t1.class);
                enumSetNoneOf2.clear();
                Iterator<String> it = stringSet2.iterator();
                while (it.hasNext()) {
                    try {
                        enumSetNoneOf2.add(Enum.valueOf(t1.class, it.next()));
                    } catch (IllegalArgumentException unused) {
                    }
                }
                enumSetNoneOf = enumSetNoneOf2;
            }
            this.f51549e = enumSetNoneOf;
        }
        if ("dock_enable".equals(str) || zEquals) {
            this.f51550f = this.f51545a.getBoolean("dock_enable", this.f51550f);
        }
        if ("dock_pages_count".equals(str) || zEquals) {
            this.f51551g = this.f51545a.getInt("dock_pages_count", this.f51551g);
        }
        if ("scroll_speed".equals(str) || zEquals) {
            SharedPreferences sharedPreferences2 = this.f51545a;
            Enum enumValueOf = this.f51553i;
            try {
                enumValueOf = Enum.valueOf(enumValueOf.getDeclaringClass(), sharedPreferences2.getString("scroll_speed", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
            } catch (IllegalArgumentException unused2) {
            }
            this.f51553i = (f2) enumValueOf;
        }
        if ("animation_speed".equals(str) || zEquals) {
            SharedPreferences sharedPreferences3 = this.f51545a;
            Enum enumValueOf2 = this.f51554j;
            try {
                enumValueOf2 = Enum.valueOf(enumValueOf2.getDeclaringClass(), sharedPreferences3.getString("animation_speed", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
            } catch (IllegalArgumentException unused3) {
            }
            this.f51554j = (r1) enumValueOf2;
        }
        if ("unread_count_provider".equals(str) || zEquals) {
            SharedPreferences sharedPreferences4 = this.f51545a;
            Enum enumValueOf3 = this.f51557m;
            try {
                enumValueOf3 = Enum.valueOf(enumValueOf3.getDeclaringClass(), sharedPreferences4.getString("unread_count_provider", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
            } catch (IllegalArgumentException unused4) {
            }
            this.f51557m = (p4) enumValueOf3;
        }
        if ("unread_count".equals(str) || "1".equals(str) || "unread_count_provider".equals(str) || zEquals) {
            this.f51556l = this.f51545a.getBoolean("unread_count", this.f51556l);
            this.f51557m.getClass();
            this.f51555k = a3.f51435a.f51552h && this.f51556l;
        }
        if ("unread_count_badge_style".equals(str) || zEquals) {
            String string = this.f51545a.getString("unread_count_badge_style", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            try {
                mz.o.Companion.getClass();
                this.n = mz.n.a(string);
            } catch (NumberFormatException e3) {
                e3.printStackTrace();
                this.n = mz.o.f77358f;
            }
        }
        if ("analytics_enabled".equals(str) || zEquals) {
            this.o = this.f51545a.getBoolean("analytics_enabled", true);
        }
        if (("expand_notifications_root".equals(str) || zEquals) && v30.a.f92041e) {
            this.f51545a.getBoolean("expand_notifications_root", false);
        }
        if (zEquals) {
            return;
        }
        Iterator it2 = this.f51546b.keySet().iterator();
        while (it2.hasNext()) {
            ((SharedPreferences.OnSharedPreferenceChangeListener) it2.next()).onSharedPreferenceChanged(sharedPreferences, str.toString());
        }
    }
}
