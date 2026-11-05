.class public final Le/e/a/VerticalSwipe226;
.super Ljava/lang/Object;
.source "VerticalSwipe226.java"


# static fields
.field static final KEYS:[Ljava/lang/String;

.field static final LAST:Ljava/lang/String; = "gesture_swipe_down_last"

.field static final MINI:Ljava/lang/String; = "gesture_swipe_background"

.field static final POPUP:Ljava/lang/String; = "gesture_swipe_popup"


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 7
    const-string v0, "gesture_swipe_fullscreen"

    const-string v1, "gesture_swipe_exit_fullscreen"

    const-string v2, "gesture_swipe_background"

    const-string v3, "gesture_swipe_popup"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/VerticalSwipe226;->KEYS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static read(Landroid/content/SharedPreferences;)[Z
    .registers 7

    .line 10
    invoke-static {p0}, Le/e/a/PlaybackDefaults229;->initializePrefs(Landroid/content/SharedPreferences;)V

    sget-object v0, Le/e/a/VerticalSwipe226;->KEYS:[Ljava/lang/String;

    array-length v0, v0

    new-array v0, v0, [Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_a
    sget-object v3, Le/e/a/VerticalSwipe226;->KEYS:[Ljava/lang/String;

    array-length v4, v3

    if-lt v2, v4, :cond_37

    .line 11
    aget-boolean v2, v0, v1

    if-eqz v2, :cond_36

    const/4 v2, 0x1

    aget-boolean v4, v0, v2

    if-eqz v4, :cond_36

    const-string v4, "gesture_swipe_down_last"

    const-string v5, "gesture_swipe_background"

    invoke-interface {p0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "gesture_swipe_popup"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    sub-int/2addr v2, v4

    aput-boolean v1, v0, v2

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    aget-object v2, v3, v2

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_36
    return-object v0

    .line 10
    :cond_37
    aget-object v3, v3, v2

    invoke-interface {p0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    aput-boolean v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_a
.end method

.method public static show(Landroid/preference/PreferenceActivity;)Landroid/app/AlertDialog;
    .registers 9

    .line 15
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {v0}, Le/e/a/VerticalSwipe226;->read(Landroid/content/SharedPreferences;)[Z

    move-result-object v1

    .line 16
    const-string v2, "Swipe down for background playback"

    const-string v3, "\u5411\u4e0b\u6ed1\u52d5\u9032\u5165\u80cc\u666f\u64ad\u653e"

    const-string v4, "\u4e0b\u30b9\u30ef\u30a4\u30d7\u3067\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-static {p0, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Swipe down for popup playback"

    const-string v4, "\u5411\u4e0b\u6ed1\u52d5\u9032\u5165\u61f8\u6d6e\u64ad\u653e"

    const-string v5, "\u4e0b\u30b9\u30ef\u30a4\u30d7\u3067\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    invoke-static {p0, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Swipe up for landscape fullscreen"

    const-string v5, "\u5411\u4e0a\u6ed1\u52d5\u9032\u5165\u6a6b\u5411\u5168\u87a2\u5e55"

    const-string v6, "\u4e0a\u30b9\u30ef\u30a4\u30d7\u3067\u6a2a\u5411\u304d\u5168\u753b\u9762"

    invoke-static {p0, v6, v4, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Swipe down to exit fullscreen"

    const-string v6, "\u5411\u4e0b\u6ed1\u52d5\u96e2\u958b\u5168\u87a2\u5e55"

    const-string v7, "\u4e0b\u30b9\u30ef\u30a4\u30d7\u3067\u5168\u753b\u9762\u3092\u89e3\u9664"

    invoke-static {p0, v7, v5, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    .line 17
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string v4, "Vertical swipes"

    const-string v5, "\u4e0a\u4e0b\u6ed1\u52d5"

    const-string v6, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7"

    invoke-static {p0, v6, v4, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance v3, Le/e/a/VerticalSwipe226$1;

    invoke-direct {v3, v1, v0}, Le/e/a/VerticalSwipe226$1;-><init>([ZLandroid/content/SharedPreferences;)V

    invoke-virtual {p0, v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const v0, 0x104000a

    const/4 v1, 0x0

    .line 22
    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 17
    invoke-static {p0}, Le/e/a/UiDialogs;->showBuilder(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    move-result-object p0

    return-object p0
.end method
