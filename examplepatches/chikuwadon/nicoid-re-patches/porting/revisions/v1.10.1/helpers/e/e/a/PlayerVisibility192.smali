.class public final Le/e/a/PlayerVisibility192;
.super Ljava/lang/Object;
.source "PlayerVisibility192.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerVisibility192$Popup;
    }
.end annotation


# static fields
.field public static final KEY:Ljava/lang/String; = "player_controls_visibility_mode"

.field static final POPUPS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/ref/WeakReference<",
            "Le/e/a/PlayerVisibility192$Popup;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerVisibility192;->POPUPS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static enabled(Landroid/content/Context;Z)Z
    .registers 3

    .line 7
    invoke-static {p0}, Le/e/a/PlayerVisibility192;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "both"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    if-eqz p1, :cond_11

    const-string p1, "popup"

    goto :goto_13

    :cond_11
    const-string p1, "normal"

    :goto_13
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    const/4 p0, 0x0

    return p0

    :cond_1b
    const/4 p0, 0x1

    return p0
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/preference/Preference;[Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 8
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-static {p3}, Le/e/a/PlayerVisibility192;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p2

    aget-object p1, p1, p2

    invoke-virtual {p0, p1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$1([Ljava/lang/String;Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/CharSequence;Ljava/lang/Runnable;Landroid/preference/Preference;)Z
    .registers 7

    .line 8
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p5

    invoke-static {p1}, Le/e/a/PlayerVisibility192;->mode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p5, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p5

    invoke-static {p1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p2}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1, p0, p4}, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;[Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-virtual {p2, p3, p5, v0}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$2(Landroid/preference/PreferenceActivity;[Ljava/lang/String;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 8
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "player_controls_visibility_mode"

    aget-object p1, p1, p4

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static mode(Landroid/content/Context;)Ljava/lang/String;
    .registers 7

    .line 6
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "player_controls_visibility_mode"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "normal"

    const-string v3, "off"

    if-nez v1, :cond_27

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v4, "player_controls_outside_video"

    const/4 v5, 0x0

    invoke-interface {p0, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1f

    move-object v4, v2

    goto :goto_20

    :cond_1f
    move-object v4, v3

    :goto_20
    invoke-interface {v1, v0, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_27
    invoke-interface {p0, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "popup"

    const-string v1, "both"

    filled-new-array {v3, v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    move-object v3, p0

    :cond_3e
    return-object v3
.end method

.method static popup(Landroid/view/View;)V
    .registers 4

    .line 10
    sget-object v0, Le/e/a/PlayerVisibility192;->POPUPS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_11

    return-void

    :cond_11
    new-instance v0, Le/e/a/PlayerVisibility192$Popup;

    invoke-direct {v0, p0}, Le/e/a/PlayerVisibility192$Popup;-><init>(Landroid/view/View;)V

    sget-object v1, Le/e/a/PlayerVisibility192;->POPUPS:Ljava/util/Map;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object p0, v0, Le/e/a/PlayerVisibility192$Popup;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    invoke-virtual {v0}, Le/e/a/PlayerVisibility192$Popup;->update()V

    return-void
.end method

.method static settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 10

    .line 8
    const-string v0, "player_controls_outside_video"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-static {v1, v0}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_15

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_15
    const-string v0, "player_controls_visibility_mode"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_28

    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    :cond_28
    const-string p1, "\u64cd\u4f5c\u90e8\u306e\u5e38\u6642\u8868\u793a"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string p1, "popup"

    const-string v0, "both"

    const-string v2, "off"

    const-string v3, "normal"

    filled-new-array {v2, v3, p1, v0}, [Ljava/lang/String;

    move-result-object v3

    const/4 p1, 0x4

    new-array v6, p1, [Ljava/lang/CharSequence;

    const-string p1, "\u7121\u52b9"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    aput-object p1, v6, v0

    const-string p1, "\u901a\u5e38\u518d\u751f\u6642\u306e\u307f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    aput-object p1, v6, v0

    const-string p1, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u6642\u306e\u307f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x2

    aput-object p1, v6, v0

    const-string p1, "\u4e21\u65b9"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x3

    aput-object p1, v6, v0

    new-instance v7, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda1;

    invoke-direct {v7, v1, v6, v3, p0}, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda1;-><init>(Landroid/preference/Preference;[Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/preference/PreferenceActivity;)V

    invoke-interface {v7}, Ljava/lang/Runnable;->run()V

    new-instance p1, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;

    move-object v2, p1

    move-object v4, p0

    move-object v5, v1

    invoke-direct/range {v2 .. v7}, Le/e/a/PlayerVisibility192$$ExternalSyntheticLambda2;-><init>([Ljava/lang/String;Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    invoke-virtual {v1, p1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    return-void
.end method
