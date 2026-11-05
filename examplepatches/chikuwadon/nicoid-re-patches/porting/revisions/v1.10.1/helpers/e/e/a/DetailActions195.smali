.class public final Le/e/a/DetailActions195;
.super Ljava/lang/Object;
.source "DetailActions195.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/DetailActions195$Binding;
    }
.end annotation


# static fields
.field static final BINDINGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/DetailActions195$Binding;",
            ">;"
        }
    .end annotation
.end field

.field static final KEYS:[Ljava/lang/String;

.field static final LABELS:[Ljava/lang/String;

.field static final TAGS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 5
    const-string v0, "video_info_like_button"

    const-string v1, "video_info_nicoad_button"

    const-string v2, "video_info_follow_button"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/DetailActions195;->KEYS:[Ljava/lang/String;

    .line 6
    const-string v0, "nicoid_like"

    const-string v1, "nicoid_nicoad"

    const-string v2, "nicoid_follow"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/DetailActions195;->TAGS:[Ljava/lang/String;

    .line 7
    const-string v0, "\u3044\u3044\u306d"

    const-string v1, "\u30cb\u30b3\u30cb\u5e83\u544a"

    const-string v2, "\u30d5\u30a9\u30ed\u30fc"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/DetailActions195;->LABELS:[Ljava/lang/String;

    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/DetailActions195;->BINDINGS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/view/View;)V
    .registers 3

    .line 17
    if-eqz p0, :cond_27

    sget-object v0, Le/e/a/DetailActions195;->BINDINGS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_27

    :cond_b
    new-instance v0, Le/e/a/DetailActions195$Binding;

    invoke-direct {v0, p0}, Le/e/a/DetailActions195$Binding;-><init>(Landroid/view/View;)V

    sget-object v1, Le/e/a/DetailActions195;->BINDINGS:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object p0, v0, Le/e/a/DetailActions195$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    invoke-virtual {v0}, Le/e/a/DetailActions195$Binding;->update()V

    :cond_27
    :goto_27
    return-void
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 10
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Le/e/a/DetailActions195$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Le/e/a/DetailActions195$$ExternalSyntheticLambda3;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 14
    return-void
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;)V
    .registers 6

    .line 11
    sget-object v0, Le/e/a/DetailActions195;->KEYS:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    if-nez v0, :cond_10

    goto :goto_14

    :cond_10
    invoke-static {v2, v0}, Le/e/a/DetailActions195;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    :goto_14
    if-nez v2, :cond_17

    return-void

    .line 12
    :cond_17
    if-nez v0, :cond_1e

    invoke-virtual {v2}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v3

    goto :goto_22

    :cond_1e
    invoke-virtual {v0}, Landroid/preference/Preference;->getOrder()I

    move-result v3

    :goto_22
    if-eqz v0, :cond_27

    invoke-virtual {v2, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 13
    :cond_27
    new-instance v0, Landroid/preference/Preference;

    invoke-direct {v0, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    sget-object v4, Le/e/a/DetailActions195;->KEYS:[Ljava/lang/String;

    aget-object v1, v4, v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Landroid/preference/Preference;->setOrder(I)V

    const-string v1, "\u52d5\u753b\u60c5\u5831\u6b04\u306e\u30dc\u30bf\u30f3"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    invoke-static {v0, v1}, Le/e/a/Revision196;->summary(Landroid/preference/Preference;Z)V

    new-instance v1, Le/e/a/DetailActions195$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Le/e/a/DetailActions195$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v2, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 14
    return-void
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 13
    invoke-static {p0}, Le/e/a/DetailActions195;->show(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$2([ZLandroid/content/DialogInterface;IZ)V
    .registers 4

    .line 16
    aput-boolean p3, p0, p2

    return-void
.end method

.method static synthetic lambda$3(Landroid/content/SharedPreferences;[ZLandroid/content/DialogInterface;I)V
    .registers 5

    .line 16
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const/4 p2, 0x0

    :goto_5
    const/4 p3, 0x3

    if-lt p2, p3, :cond_c

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :cond_c
    sget-object p3, Le/e/a/DetailActions195;->KEYS:[Ljava/lang/String;

    aget-object p3, p3, p2

    aget-boolean v0, p1, p2

    invoke-interface {p0, p3, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 p2, p2, 0x1

    goto :goto_5
.end method

.method static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5

    .line 9
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_9

    const/4 p0, 0x0

    return-object p0

    :cond_9
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    if-ne v1, p1, :cond_10

    return-object p0

    :cond_10
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1d

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/DetailActions195;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_1d

    return-object v1

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method static show(Landroid/app/Activity;)V
    .registers 8

    .line 15
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x3

    new-array v2, v1, [Z

    new-array v3, v1, [Ljava/lang/CharSequence;

    const/4 v4, 0x0

    :goto_a
    if-lt v4, v1, :cond_41

    .line 16
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v1, "\u52d5\u753b\u60c5\u5831\u6b04\u306e\u30dc\u30bf\u30f3"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance v1, Le/e/a/DetailActions195$$ExternalSyntheticLambda1;

    invoke-direct {v1, v2}, Le/e/a/DetailActions195$$ExternalSyntheticLambda1;-><init>([Z)V

    invoke-virtual {p0, v3, v2, v1}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance v1, Le/e/a/DetailActions195$$ExternalSyntheticLambda2;

    invoke-direct {v1, v0, v2}, Le/e/a/DetailActions195$$ExternalSyntheticLambda2;-><init>(Landroid/content/SharedPreferences;[Z)V

    const-string v0, "OK"

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void

    .line 15
    :cond_41
    sget-object v5, Le/e/a/DetailActions195;->KEYS:[Ljava/lang/String;

    aget-object v5, v5, v4

    const/4 v6, 0x1

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    aput-boolean v5, v2, v4

    sget-object v5, Le/e/a/DetailActions195;->LABELS:[Ljava/lang/String;

    aget-object v5, v5, v4

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_a
.end method
