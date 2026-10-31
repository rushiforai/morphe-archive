package h10;

import android.provider.Settings;

/* loaded from: classes4.dex */
public abstract class p0 {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean f58955a;

    static {
        f58955a = v30.e.q(Settings.System.class, "KEY_MENU_LONG_PRESS_ACTION", null) != null;
    }
}
