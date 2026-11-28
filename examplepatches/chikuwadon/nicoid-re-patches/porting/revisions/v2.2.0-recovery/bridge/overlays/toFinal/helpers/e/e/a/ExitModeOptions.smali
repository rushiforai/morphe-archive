.class public final Le/e/a/ExitModeOptions;
.super Ljava/lang/Object;
.source "ExitModeOptions.java"


# static fields
.field public static final DIALOG:I = 0x1

.field public static final DOUBLE_BACK:I = 0x2

.field private static final LAST_BACK:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIVE_KEY:Ljava/lang/String; = "nicolive_exit_mode"

.field public static final NONE:I = 0x0

.field public static final NORMAL_KEY:Ljava/lang/String; = "nicoid_exit_mode"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 22
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ExitModeOptions;->LAST_BACK:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checked(I)I
    .registers 2

    const/4 v0, 0x2

    if-ltz p0, :cond_0

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    return v0
.end method

.method public static clear(Landroid/app/Activity;)V
    .registers 2

    .line 136
    sget-object v0, Le/e/a/ExitModeOptions;->LAST_BACK:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static doubleBack(Landroid/app/Activity;Ljava/lang/String;)Z
    .registers 7

    .line 124
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 125
    sget-object v2, Le/e/a/ExitModeOptions;->LAST_BACK:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-eqz v3, :cond_0

    .line 126
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v3, v4, v0, v1}, Le/e/a/ExitBackPolicy;->isSecondPress(JJ)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 127
    invoke-interface {v2, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0

    .line 130
    :cond_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 131
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return v0
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 7

    if-eqz p0, :cond_0

    .line 61
    const-string v0, "setting_whole"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 62
    instance-of v1, v0, Landroid/preference/PreferenceGroup;

    if-eqz v1, :cond_0

    .line 63
    check-cast v0, Landroid/preference/PreferenceGroup;

    .line 64
    const-string v1, "nicoid_exit_mode"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_1

    :cond_0
    return-void

    .line 65
    :cond_1
    const-string v2, "nicoid_confirm_exit"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-nez v2, :cond_2

    .line 66
    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Landroid/preference/Preference;->getOrder()I

    move-result v3

    .line 67
    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    move v2, v3

    .line 68
    :goto_0
    new-instance v3, Landroid/preference/Preference;

    invoke-direct {v3, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 69
    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 70
    invoke-virtual {v3, v2}, Landroid/preference/Preference;->setOrder(I)V

    .line 71
    const-string v2, "Confirm app exit"

    const-string/jumbo v4, "\u9000\u51fa\u61c9\u7528\u7a0b\u5f0f\u6642\u78ba\u8a8d"

    const-string v5, "\u30a2\u30d7\u30ea\u7d42\u4e86\u6642\u306e\u78ba\u8a8d"

    invoke-static {p0, v5, v2, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 72
    invoke-static {p0, v1}, Le/e/a/ExitModeOptions;->mode(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Le/e/a/ExitModeOptions;->summary(Landroid/content/Context;IZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 73
    new-instance v1, Le/e/a/ExitModeOptions$2;

    invoke-direct {v1, p0, v3}, Le/e/a/ExitModeOptions$2;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 84
    invoke-virtual {v0, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method public static labels(Landroid/content/Context;)[Ljava/lang/String;
    .registers 6

    .line 33
    const-string v0, "No confirmation"

    const-string v1, "\u4e0d\u78ba\u8a8d"

    const-string/jumbo v2, "\u78ba\u8a8d\u3057\u306a\u3044"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 34
    const-string v1, "Dialog"

    const-string v2, "\u5c0d\u8a71\u6846"

    const-string v3, "\u30c0\u30a4\u30a2\u30ed\u30b0"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 35
    const-string v2, "Press Back twice"

    const-string/jumbo v3, "\u8fd4\u56de\u5169\u6b21"

    const-string/jumbo v4, "\u623b\u308b\u30922\u56de"

    invoke-static {p0, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {v0, v1, p0}, [Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/preference/Preference;)Z
    .registers 6

    .line 74
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    .line 75
    invoke-static {p0}, Le/e/a/ExitModeOptions;->labels(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    const-string v1, "nicoid_exit_mode"

    invoke-static {p0, v1}, Le/e/a/ExitModeOptions;->mode(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    new-instance v2, Le/e/a/ExitModeOptions$1;

    invoke-direct {v2, p0, p1}, Le/e/a/ExitModeOptions$1;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    invoke-virtual {p2, v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    .line 81
    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 74
    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 76
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 77
    const-string v1, "nicoid_exit_mode"

    invoke-interface {v0, v1, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 v0, 0x0

    .line 78
    invoke-static {p0, p3, v0}, Le/e/a/ExitModeOptions;->summary(Landroid/content/Context;IZ)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 79
    invoke-static {p0}, Le/e/a/ExitModeOptions;->clear(Landroid/app/Activity;)V

    .line 80
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 109
    invoke-static {p0}, Le/e/a/Dev112;->exit(Landroid/app/Activity;)V

    return-void
.end method

.method public static mode(Landroid/content/Context;Ljava/lang/String;)I
    .registers 3

    .line 29
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 v0, 0x2

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Le/e/a/ExitModeOptions;->checked(I)I

    move-result p0

    return p0
.end method

.method public static normalBack(Landroid/app/Activity;)Z
    .registers 9

    const/4 v0, 0x0

    if-eqz p0, :cond_6

    .line 88
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_6

    .line 90
    :try_start_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "e.e.a.TabRoutes228"

    .line 91
    const-string v3, "supported"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Landroid/app/Activity;

    aput-object v6, v5, v0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v7

    .line 90
    invoke-static {v2, v3, v5, v7}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    return v0

    .line 93
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "e.e.a.MultiTabs227"

    .line 94
    const-string v3, "enabled"

    new-array v5, v0, [Ljava/lang/Class;

    new-array v7, v0, [Ljava/lang/Object;

    .line 93
    invoke-static {v2, v3, v5, v7}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 95
    invoke-virtual {p0}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v1

    if-nez v1, :cond_1

    return v0

    .line 96
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_local_playlists"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 97
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "e.e.a.LocalPlaylists"

    const-string v3, "back"

    .line 98
    new-array v5, v4, [Ljava/lang/Class;

    aput-object v6, v5, v0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v6

    .line 97
    invoke-static {v2, v3, v5, v6}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v4

    .line 99
    :cond_2
    const-string v1, "nicoid_exit_mode"

    invoke-static {p0, v1}, Le/e/a/ExitModeOptions;->mode(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_3

    .line 101
    invoke-static {p0}, Le/e/a/ExitModeOptions;->clear(Landroid/app/Activity;)V

    .line 102
    invoke-static {p0}, Le/e/a/Dev112;->exit(Landroid/app/Activity;)V

    goto :goto_0

    :cond_3
    if-ne v1, v4, :cond_4

    .line 104
    invoke-static {p0}, Le/e/a/ExitModeOptions;->clear(Landroid/app/Activity;)V

    .line 105
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 106
    const-string v2, "\u30a2\u30d7\u30ea\u3092\u7d42\u4e86\u3057\u307e\u3059\u304b\uff1f"

    const-string v3, "Exit the app?"

    const-string/jumbo v5, "\u78ba\u5b9a\u9000\u51fa\u61c9\u7528\u7a0b\u5f0f\uff1f"

    invoke-static {p0, v2, v3, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 107
    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v3, "Cancel"

    const-string v5, "\u53d6\u6d88"

    invoke-static {p0, v2, v3, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 108
    const-string/jumbo v2, "\u7d42\u4e86"

    const-string v3, "Exit"

    const-string/jumbo v5, "\u9000\u51fa"

    invoke-static {p0, v2, v3, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 109
    new-instance v3, Le/e/a/ExitModeOptions$0;

    invoke-direct {v3, p0}, Le/e/a/ExitModeOptions$0;-><init>(Landroid/app/Activity;)V

    .line 108
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 109
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 110
    invoke-static {p0}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    goto :goto_0

    .line 112
    :cond_4
    const-string v1, "\u3082\u3046\u4e00\u5ea6\u623b\u308b\u3068\u30a2\u30d7\u30ea\u3092\u7d42\u4e86\u3057\u307e\u3059"

    const-string v2, "Press Back again to exit the app"

    .line 113
    const-string v3, "\u518d\u6b21\u8fd4\u56de\u5373\u53ef\u9000\u51fa\u61c9\u7528\u7a0b\u5f0f"

    .line 111
    invoke-static {p0, v1, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Le/e/a/ExitModeOptions;->doubleBack(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 114
    invoke-static {p0}, Le/e/a/Dev112;->exit(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_5
    :goto_0
    return v4

    :catch_0
    move-exception p0

    .line 118
    const-string v1, "nicoid-exit"

    const-string v2, "Back routing fallback"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6
    return v0
.end method

.method public static summary(Landroid/content/Context;IZ)Ljava/lang/String;
    .registers 5

    .line 39
    invoke-static {p1}, Le/e/a/ExitModeOptions;->checked(I)I

    move-result p1

    const/4 v0, 0x1

    if-eqz p2, :cond_2

    if-nez p1, :cond_0

    .line 43
    const-string p2, "Return to the main screen immediately"

    const-string/jumbo v0, "\u76f4\u63a5\u8fd4\u56de\u4e3b\u756b\u9762"

    const-string v1, "\u305d\u306e\u307e\u307e\u901a\u5e38\u753b\u9762\u306b\u623b\u308a\u307e\u3059"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    if-ne p1, v0, :cond_1

    .line 45
    const-string p2, "Ask before closing Niconico Live"

    const-string/jumbo v0, "\u95dc\u9589\u76f4\u64ad\u524d\u5148\u78ba\u8a8d"

    const-string v1, "\u30cb\u30b3\u751f\u3092\u9589\u3058\u308b\u524d\u306b\u78ba\u8a8d\u3057\u307e\u3059"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 47
    :cond_1
    const-string p2, "Press Back again within 2 seconds to close Niconico Live"

    const-string v0, "\u57282\u79d2\u5167\u518d\u6b21\u8fd4\u56de\u5373\u53ef\u95dc\u9589\u76f4\u64ad"

    .line 46
    const-string v1, "2\u79d2\u4ee5\u5185\u306b\u3082\u3046\u4e00\u5ea6\u623b\u308b\u3068\u30cb\u30b3\u751f\u3092\u9589\u3058\u307e\u3059"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_2
    if-nez p1, :cond_3

    .line 50
    const-string p2, "Exit without a prompt"

    const-string/jumbo v0, "\u76f4\u63a5\u9000\u51fa\u61c9\u7528\u7a0b\u5f0f"

    const-string v1, "\u305d\u306e\u307e\u307e\u30a2\u30d7\u30ea\u3092\u7d42\u4e86\u3057\u307e\u3059"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_3
    if-ne p1, v0, :cond_4

    .line 52
    const-string p2, "Ask before exiting the app"

    const-string/jumbo v0, "\u9000\u51fa\u61c9\u7528\u7a0b\u5f0f\u524d\u5148\u78ba\u8a8d"

    const-string v1, "\u30a2\u30d7\u30ea\u3092\u7d42\u4e86\u3059\u308b\u524d\u306b\u78ba\u8a8d\u3057\u307e\u3059"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 54
    :cond_4
    const-string p2, "Press Back again within 2 seconds to exit the app"

    const-string v0, "\u57282\u79d2\u5167\u518d\u6b21\u8fd4\u56de\u5373\u53ef\u9000\u51fa\u61c9\u7528\u7a0b\u5f0f"

    .line 53
    const-string v1, "2\u79d2\u4ee5\u5185\u306b\u3082\u3046\u4e00\u5ea6\u623b\u308b\u3068\u30a2\u30d7\u30ea\u3092\u7d42\u4e86\u3057\u307e\u3059"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 56
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/ExitModeOptions;->labels(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p0

    aget-object p0, p0, p1

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo p0, "\uff1a"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
