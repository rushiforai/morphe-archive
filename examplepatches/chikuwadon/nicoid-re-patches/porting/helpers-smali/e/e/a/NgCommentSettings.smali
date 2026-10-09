.class public final Le/e/a/NgCommentSettings;
.super Ljava/lang/Object;
.source "NgCommentSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/NgCommentSettings$ListDialog;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final URL:Ljava/lang/String; = "https://nvapi.nicovideo.jp/v1/users/me/ng-comments/client"

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/NgCommentSettings;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/NgCommentSettings;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 5
    sget-object v0, Le/e/a/NgCommentSettings;->WORK:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$1()Landroid/os/Handler;
    .registers 1

    .line 5
    sget-object v0, Le/e/a/NgCommentSettings;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static install(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 6

    .line 7
    const-string v0, "nicoid_ng_comments"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "NG comment list"

    const-string v2, "NG \u7559\u8a00\u6e05\u55ae"

    const-string v3, "NG\u30b3\u30e1\u30f3\u30c8\u30ea\u30b9\u30c8"

    invoke-static {p0, v3, v0, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "Manage blocked words, users and commands"

    const-string v2, "\u7ba1\u7406\u5c01\u9396\u6587\u5b57\u3001\u4f7f\u7528\u8005\u8207\u6307\u4ee4"

    const-string v3, "NG\u30ef\u30fc\u30c9\u30fbNG\u30e6\u30fc\u30b6\u30fc\u30fbNG\u30b3\u30de\u30f3\u30c9\u3092\u7ba1\u7406"

    invoke-static {p0, v3, v0, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/NgCommentSettings$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/NgCommentSettings$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method static items(Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 1

    .line 8
    invoke-static {p0}, Le/e/a/NgCommentData;->items(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 7
    invoke-static {p0}, Le/e/a/NgCommentSettings;->show(Landroid/preference/PreferenceActivity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static show(Landroid/preference/PreferenceActivity;)V
    .registers 2

    .line 10
    new-instance v0, Le/e/a/NgCommentSettings$ListDialog;

    invoke-direct {v0, p0}, Le/e/a/NgCommentSettings$ListDialog;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0}, Le/e/a/NgCommentSettings$ListDialog;->show()V

    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 6
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static typeLabel(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 9
    const-string v0, "word"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string p1, "Blocked word"

    const-string v0, "\u5c01\u9396\u6587\u5b57"

    const-string v1, "NG\u30ef\u30fc\u30c9"

    :goto_e
    invoke-static {p0, v1, p1, v0}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_31

    :cond_13
    const-string v0, "id"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    const-string p1, "Blocked user"

    const-string v0, "\u5c01\u9396\u4f7f\u7528\u8005"

    const-string v1, "NG\u30e6\u30fc\u30b6\u30fc"

    goto :goto_e

    :cond_22
    const-string v0, "command"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    const-string p1, "Blocked command"

    const-string v0, "\u5c01\u9396\u6307\u4ee4"

    const-string v1, "NG\u30b3\u30de\u30f3\u30c9"

    goto :goto_e

    :cond_31
    :goto_31
    return-object p1
.end method
