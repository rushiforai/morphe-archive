package mx;

import android.content.ComponentName;
import android.content.Intent;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.NovaShortcutHandler;
import com.teslacoilsw.launcher.preferences.SettingsActivity;
import java.util.ArrayList;

/* loaded from: classes.dex */
public enum c0 {
    NONE(2132018734, 2131820573),
    APP_DRAWER(2132018752, 2131230987),
    TOGGLE_STATUS_BAR(2132018767, 2131231658),
    EXPAND_STATUS_BAR(2132018754, 2131231637),
    EXPAND_STATUS_SETTINGS_BAR(2132018755, 2131231638),
    SHOW_PREVIEWS(2132018763, 2131231644),
    GOTO_DEFAULT_SCREEN(2132018753, 2131231636),
    GOTO_SCREEN(2132018759, 2131231641),
    VOICE_SEARCH(2132018768, 2131231659),
    ASSIST(2132018757, 2131231635),
    NOVA_SETTINGS(2132019012, 2131231030),
    TOGGLE_DOCK(2132018766, 2131231657),
    TEXT_SEARCH(2132018765, 2131231656),
    SHOW_RECENT_APPS(2132018764, 2131231645),
    /* JADX INFO: Fake field, exist only in values array */
    OPEN_FOLDER(2132017913, 2131231639),
    FIRST_ITEM_IN_FOLDER(2132018756, 2131231639),
    APP_SEARCH(2132019010, 2131231634),
    SCREEN_OFF(2132018761, 2131231655),
    GOOGLE_NOW(2132018758, 2131231640),
    SET_DEFAULT_LAUNCHER(2132017511, 2131231885),
    PLAY_STORE(2132019126, 2131231795),
    WEATHER(2132020354, 2131231835),
    GOOGLE_LENS(2132017961, 2131231769),
    DATE(2132017705, 2131231756),
    GOOGLE_SEARCH(2132017956, 2131231778),
    NOVA_NOW(2132019004, 2131231642);

    public static final ArrayList B;
    public static final c0[] C;

    /* renamed from: a, reason: collision with root package name */
    public final int f77040a;

    /* renamed from: b, reason: collision with root package name */
    public final int f77041b;

    static {
        c0 c0Var = APP_DRAWER;
        c0 c0Var2 = TOGGLE_STATUS_BAR;
        c0 c0Var3 = EXPAND_STATUS_BAR;
        c0 c0Var4 = SHOW_PREVIEWS;
        c0 c0Var5 = GOTO_DEFAULT_SCREEN;
        B = v70.o.i(NovaLauncher.f45646r1, NovaShortcutHandler.f45670c, new ComponentName("com.teslacoilsw.launcher", "com.android.launcher2.Launcher"), new ComponentName("com.teslacoilsw.launcher", "com.teslacoilsw.launcher.NovaShortcutHandler"), new ComponentName("com.teslacoilsw.launcher", "com.teslacoilsw.launcher.NovaLauncher"));
        C = new c0[]{c0Var, c0Var2, c0Var3, c0Var4, c0Var5};
    }

    c0(int i5, int i11) {
        this.f77040a = i5;
        this.f77041b = i11;
    }

    public static final c0 c(Intent intent) {
        if (intent == null || intent.hasCategory("com.android.launcher3.DEEP_SHORTCUT")) {
            return null;
        }
        if ((!"com.teslacoilsw.launcher.ACTION".equals(intent.getAction()) || intent.getComponent() != null) && !B.contains(intent.getComponent())) {
            return null;
        }
        String stringExtra = intent.getStringExtra("LAUNCHER_ACTION");
        if (stringExtra != null) {
            try {
                return valueOf(stringExtra);
            } catch (IllegalArgumentException unused) {
            }
        }
        ComponentName component = intent.getComponent();
        if (component == null || "com.teslacoilsw.launcher".equals(component.getPackageName())) {
            return APP_DRAWER;
        }
        return null;
    }

    public final int a() {
        if (this == APP_DRAWER) {
            py.c.f83128b.getClass();
            if (py.c.d()) {
                return 2131230989;
            }
        }
        return this.f77041b;
    }

    public final Intent b() {
        if (this == NOVA_SETTINGS) {
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setFlags(805339136);
            intent.setComponent(SettingsActivity.f45966y);
            return intent;
        }
        if (this == GOOGLE_NOW) {
            Intent intent2 = new Intent("android.intent.action.MAIN");
            intent2.setFlags(344457216);
            intent2.setComponent(ComponentName.unflattenFromString("com.google.android.googlequicksearchbox/.SearchActivity"));
            return intent2;
        }
        if (this == GOOGLE_LENS) {
            Intent intent3 = new Intent("android.intent.action.MAIN");
            intent3.setFlags(335544320);
            intent3.addCategory("android.intent.category.LAUNCHER");
            intent3.setComponent(b30.e.f17443c);
            return intent3;
        }
        if (this == DATE) {
            Intent intent4 = new Intent("android.intent.action.MAIN");
            intent4.setFlags(335544320);
            intent4.addCategory("android.intent.category.APP_CALENDAR");
            return intent4;
        }
        if (this == NONE) {
            return null;
        }
        if (this == GOOGLE_SEARCH) {
            Intent intent5 = new Intent("android.search.action.GLOBAL_SEARCH");
            intent5.setPackage("com.google.android.googlequicksearchbox");
            return intent5;
        }
        Intent intent6 = new Intent("com.teslacoilsw.launcher.ACTION");
        intent6.setFlags(268435456);
        intent6.setComponent(NovaShortcutHandler.f45670c);
        intent6.putExtra("LAUNCHER_ACTION", name());
        return intent6;
    }
}
