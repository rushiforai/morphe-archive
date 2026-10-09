.class public final Le/e/a/PlaybackReturn;
.super Ljava/lang/Object;
.source "PlaybackReturn.java"


# static fields
.field private static active:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static automaticVideo:Ljava/lang/String;

.field private static opening:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 12
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/PlaybackReturn;->active:Ljava/lang/ref/WeakReference;

    .line 14
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static arm(Ljava/lang/String;)V
    .registers 1

    .line 17
    sput-object p0, Le/e/a/PlaybackReturn;->automaticVideo:Ljava/lang/String;

    return-void
.end method

.method public static bind(Ljava/lang/Object;)V
    .registers 2

    .line 16
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/PlaybackReturn;->active:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static foreground(Landroid/app/Activity;)V
    .registers 4

    .line 19
    sget-object v0, Le/e/a/PlaybackReturn;->automaticVideo:Ljava/lang/String;

    .line 20
    if-eqz v0, :cond_5c

    sget-boolean v1, Le/e/a/PlaybackReturn;->opening:Z

    if-eqz v1, :cond_9

    goto :goto_5c

    .line 21
    :cond_9
    const/4 v1, 0x0

    sput-object v1, Le/e/a/PlaybackReturn;->automaticVideo:Ljava/lang/String;

    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v2, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1d

    return-void

    .line 23
    :cond_1d
    sget-object p0, Le/e/a/PlaybackReturn;->active:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    .line 25
    if-eqz p0, :cond_5b

    :try_start_25
    const-string v2, "f"

    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "o0"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "p0"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_52

    goto :goto_5b

    .line 28
    :cond_52
    invoke-static {p0}, Le/e/a/PlaybackReturn;->open(Ljava/lang/Object;)V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_55} :catch_56

    .line 29
    goto :goto_5a

    :catch_56
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackReturn;->log(Ljava/lang/Exception;)V

    .line 30
    :goto_5a
    return-void

    .line 27
    :cond_5b
    :goto_5b
    return-void

    .line 20
    :cond_5c
    :goto_5c
    return-void
.end method

.method private static log(Ljava/lang/Exception;)V
    .registers 3

    .line 65
    const-string v0, "nicoid-session"

    const-string v1, "Foreground playback transfer failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static open(Ljava/lang/Object;)V
    .registers 14

    .line 32
    sget-boolean v0, Le/e/a/PlaybackReturn;->opening:Z

    if-nez v0, :cond_145

    instance-of v0, p0, Landroid/app/Service;

    if-nez v0, :cond_a

    goto/16 :goto_145

    .line 33
    :cond_a
    move-object v0, p0

    check-cast v0, Landroid/app/Service;

    .line 34
    const/4 v1, 0x0

    sput-object v1, Le/e/a/PlaybackReturn;->automaticVideo:Ljava/lang/String;

    .line 36
    const/4 v2, 0x0

    :try_start_11
    const-string v3, "f"

    invoke-static {p0, v3}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 37
    if-eqz v3, :cond_e8

    const-string v4, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_25

    goto/16 :goto_e8

    .line 38
    :cond_25
    const-string v4, "e"

    invoke-static {p0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 39
    const-string v5, "getCurrentPosition"

    new-array v6, v2, [Ljava/lang/Class;

    new-array v7, v2, [Ljava/lang/Object;

    invoke-static {v4, v5, v6, v7}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    .line 40
    new-instance v6, Landroid/content/Intent;

    const-string v7, "android.intent.action.VIEW"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "https://www.nicovideo.jp/watch/"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v6, v7, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 41
    const-string v3, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v6, v0, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    .line 42
    const/high16 v6, 0x10000000

    invoke-virtual {v3, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v3

    .line 43
    const-string v6, "intentselect"

    const/4 v7, 0x1

    invoke-virtual {v3, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v3

    .line 44
    const-string v6, "playposition"

    const-wide/32 v8, 0x7fffffff

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    const-wide/16 v8, 0x0

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    long-to-int v5, v4

    invoke-virtual {v3, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    .line 40
    nop

    .line 45
    const-string v4, "O"

    invoke-static {p0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 46
    if-eqz v4, :cond_c7

    const-string v5, "e.e.a.v0"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-string v6, "a"

    const/4 v8, 0x4

    new-array v9, v8, [Ljava/lang/Class;

    const-class v10, Landroid/content/Intent;

    aput-object v10, v9, v2

    const-class v10, Ljava/util/ArrayList;

    aput-object v10, v9, v7

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v11, 0x2

    aput-object v10, v9, v11

    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v12, 0x3

    aput-object v10, v9, v12

    invoke-virtual {v5, v6, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 47
    new-array v6, v8, [Ljava/lang/Object;

    aput-object v3, v6, v2

    aput-object v4, v6, v7

    const-string v4, "P"

    invoke-static {p0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v11

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v6, v12

    invoke-virtual {v5, v1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_c7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v4, "q0"

    invoke-virtual {p0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    .line 51
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 52
    sput-boolean v7, Le/e/a/PlaybackReturn;->opening:Z

    .line 53
    const-string v5, ""

    invoke-virtual {p0, v1, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_dc
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_dc} :catch_ed
    .catchall {:try_start_11 .. :try_end_dc} :catchall_eb

    .line 54
    :try_start_dc
    invoke-virtual {v0, v3}, Landroid/app/Service;->startActivity(Landroid/content/Intent;)V
    :try_end_df
    .catch Ljava/lang/RuntimeException; {:try_start_dc .. :try_end_df} :catch_e3
    .catch Ljava/lang/Exception; {:try_start_dc .. :try_end_df} :catch_ed
    .catchall {:try_start_dc .. :try_end_df} :catchall_eb

    .line 56
    :try_start_df
    invoke-virtual {v0}, Landroid/app/Service;->stopSelf()V

    .line 57
    goto :goto_13f

    .line 55
    :catch_e3
    move-exception v3

    invoke-virtual {p0, v1, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    throw v3
    :try_end_e8
    .catch Ljava/lang/Exception; {:try_start_df .. :try_end_e8} :catch_ed
    .catchall {:try_start_df .. :try_end_e8} :catchall_eb

    .line 63
    :cond_e8
    :goto_e8
    sput-boolean v2, Le/e/a/PlaybackReturn;->opening:Z

    .line 37
    return-void

    .line 63
    :catchall_eb
    move-exception p0

    goto :goto_142

    .line 57
    :catch_ed
    move-exception p0

    .line 58
    :try_start_ee
    invoke-static {p0}, Le/e/a/PlaybackReturn;->log(Ljava/lang/Exception;)V

    .line 59
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "app_lang"

    const-string v3, "0"

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 60
    const-string v1, "-1"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10d

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 61
    :cond_10d
    const-string v1, "1"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_135

    const-string v1, "en"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11e

    goto :goto_135

    .line 62
    :cond_11e
    const-string v1, "2"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_132

    const-string v1, "zh"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12f

    goto :goto_132

    :cond_12f
    const-string p0, "\u901a\u5e38\u518d\u751f\u306b\u623b\u308c\u307e\u305b\u3093\u3067\u3057\u305f"

    goto :goto_137

    :cond_132
    :goto_132
    const-string p0, "\u7121\u6cd5\u8fd4\u56de\u4e00\u822c\u64ad\u653e"

    goto :goto_137

    .line 61
    :cond_135
    :goto_135
    const-string p0, "Could not return to normal playback"

    .line 62
    :goto_137
    nop

    .line 61
    invoke-static {v0, p0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 62
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_13f
    .catchall {:try_start_ee .. :try_end_13f} :catchall_eb

    .line 63
    :goto_13f
    sput-boolean v2, Le/e/a/PlaybackReturn;->opening:Z

    .line 64
    return-void

    .line 63
    :goto_142
    sput-boolean v2, Le/e/a/PlaybackReturn;->opening:Z

    throw p0

    .line 32
    :cond_145
    :goto_145
    return-void
.end method
