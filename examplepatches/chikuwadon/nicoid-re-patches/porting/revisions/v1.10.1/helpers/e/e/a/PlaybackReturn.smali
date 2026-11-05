.class public final Le/e/a/PlaybackReturn;
.super Ljava/lang/Object;
.source "PlaybackReturn.java"


# static fields
.field private static final RETURN_AT:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final RETURN_VIDEO:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

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

    .line 15
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackReturn;->RETURN_VIDEO:Ljava/util/WeakHashMap;

    .line 16
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackReturn;->RETURN_AT:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static arm(Ljava/lang/String;)V
    .registers 1

    .line 19
    sput-object p0, Le/e/a/PlaybackReturn;->automaticVideo:Ljava/lang/String;

    return-void
.end method

.method public static bind(Ljava/lang/Object;)V
    .registers 2

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/PlaybackReturn;->active:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static foreground(Landroid/app/Activity;)V
    .registers 4

    .line 21
    sget-object v0, Le/e/a/PlaybackReturn;->automaticVideo:Ljava/lang/String;

    .line 22
    if-eqz v0, :cond_5c

    sget-boolean v1, Le/e/a/PlaybackReturn;->opening:Z

    if-eqz v1, :cond_9

    goto :goto_5c

    .line 23
    :cond_9
    const/4 v1, 0x0

    sput-object v1, Le/e/a/PlaybackReturn;->automaticVideo:Ljava/lang/String;

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v2, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1d

    return-void

    .line 25
    :cond_1d
    sget-object p0, Le/e/a/PlaybackReturn;->active:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    .line 27
    if-eqz p0, :cond_5b

    :try_start_25
    const-string v2, "f"

    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "o0"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "p0"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_52

    goto :goto_5b

    .line 30
    :cond_52
    invoke-static {p0}, Le/e/a/PlaybackReturn;->open(Ljava/lang/Object;)V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_55} :catch_56

    .line 31
    goto :goto_5a

    :catch_56
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackReturn;->log(Ljava/lang/Exception;)V

    .line 32
    :goto_5a
    return-void

    .line 29
    :cond_5b
    :goto_5b
    return-void

    .line 22
    :cond_5c
    :goto_5c
    return-void
.end method

.method private static log(Ljava/lang/Exception;)V
    .registers 3

    .line 71
    const-string v0, "nicoid-session"

    const-string v1, "Foreground playback transfer failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static open(Ljava/lang/Object;)V
    .registers 15

    .line 34
    sget-boolean v0, Le/e/a/PlaybackReturn;->opening:Z

    if-nez v0, :cond_17f

    instance-of v0, p0, Landroid/app/Service;

    if-nez v0, :cond_a

    goto/16 :goto_17f

    .line 35
    :cond_a
    move-object v0, p0

    check-cast v0, Landroid/app/Service;

    .line 36
    const/4 v1, 0x0

    sput-object v1, Le/e/a/PlaybackReturn;->automaticVideo:Ljava/lang/String;

    .line 38
    const/4 v2, 0x0

    :try_start_11
    const-string v3, "f"

    invoke-static {p0, v3}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 39
    if-eqz v3, :cond_122

    const-string v4, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_25

    goto/16 :goto_122

    .line 40
    :cond_25
    sget-object v4, Le/e/a/PlaybackReturn;->RETURN_AT:Ljava/util/WeakHashMap;

    invoke-virtual {v4, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    .line 41
    sget-object v5, Le/e/a/PlaybackReturn;->RETURN_VIDEO:Ljava/util/WeakHashMap;

    invoke-virtual {v5, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4d

    if-eqz v4, :cond_4d

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v7
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_43} :catch_127
    .catchall {:try_start_11 .. :try_end_43} :catchall_125

    sub-long/2addr v5, v7

    const-wide/16 v7, 0x3e8

    cmp-long v4, v5, v7

    if-gez v4, :cond_4d

    .line 69
    sput-boolean v2, Le/e/a/PlaybackReturn;->opening:Z

    .line 41
    return-void

    .line 42
    :cond_4d
    :try_start_4d
    const-string v4, "e"

    invoke-static {p0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 43
    const-string v5, "getCurrentPosition"

    new-array v6, v2, [Ljava/lang/Class;

    new-array v7, v2, [Ljava/lang/Object;

    invoke-static {v4, v5, v6, v7}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    .line 44
    new-instance v6, Landroid/content/Intent;

    const-string v7, "android.intent.action.VIEW"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "https://www.nicovideo.jp/watch/"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 45
    const-string v7, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v6, v0, v7}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v6

    .line 46
    const/high16 v7, 0x10000000

    invoke-virtual {v6, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v6

    .line 47
    const-string v7, "intentselect"

    const/4 v8, 0x1

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v6

    .line 48
    const-string v7, "playposition"

    const-wide/32 v9, 0x7fffffff

    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    const-wide/16 v9, 0x0

    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    long-to-int v5, v4

    invoke-virtual {v6, v7, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v4

    .line 44
    nop

    .line 49
    const-string v5, "O"

    invoke-static {p0, v5}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 50
    if-eqz v5, :cond_ef

    const-string v6, "e.e.a.v0"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-string v7, "a"

    const/4 v9, 0x4

    new-array v10, v9, [Ljava/lang/Class;

    const-class v11, Landroid/content/Intent;

    aput-object v11, v10, v2

    const-class v11, Ljava/util/ArrayList;

    aput-object v11, v10, v8

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v12, 0x2

    aput-object v11, v10, v12

    sget-object v11, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v13, 0x3

    aput-object v11, v10, v13

    invoke-virtual {v6, v7, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 51
    new-array v7, v9, [Ljava/lang/Object;

    aput-object v4, v7, v2

    aput-object v5, v7, v8

    const-string v5, "P"

    invoke-static {p0, v5}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v7, v12

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v7, v13

    invoke-virtual {v6, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    :cond_ef
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "q0"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 55
    invoke-virtual {v5, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 56
    sput-boolean v8, Le/e/a/PlaybackReturn;->opening:Z

    .line 57
    const-string v7, ""

    invoke-virtual {v5, v1, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_104
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_104} :catch_127
    .catchall {:try_start_4d .. :try_end_104} :catchall_125

    .line 58
    :try_start_104
    invoke-virtual {v0, v4}, Landroid/app/Service;->startActivity(Landroid/content/Intent;)V
    :try_end_107
    .catch Ljava/lang/RuntimeException; {:try_start_104 .. :try_end_107} :catch_11d
    .catch Ljava/lang/Exception; {:try_start_104 .. :try_end_107} :catch_127
    .catchall {:try_start_104 .. :try_end_107} :catchall_125

    .line 60
    :try_start_107
    sget-object v1, Le/e/a/PlaybackReturn;->RETURN_VIDEO:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v1, Le/e/a/PlaybackReturn;->RETURN_AT:Ljava/util/WeakHashMap;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    invoke-virtual {v0}, Landroid/app/Service;->stopSelf()V

    .line 63
    goto :goto_179

    .line 59
    :catch_11d
    move-exception p0

    invoke-virtual {v5, v1, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    throw p0
    :try_end_122
    .catch Ljava/lang/Exception; {:try_start_107 .. :try_end_122} :catch_127
    .catchall {:try_start_107 .. :try_end_122} :catchall_125

    .line 69
    :cond_122
    :goto_122
    sput-boolean v2, Le/e/a/PlaybackReturn;->opening:Z

    .line 39
    return-void

    .line 69
    :catchall_125
    move-exception p0

    goto :goto_17c

    .line 63
    :catch_127
    move-exception p0

    .line 64
    :try_start_128
    invoke-static {p0}, Le/e/a/PlaybackReturn;->log(Ljava/lang/Exception;)V

    .line 65
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "app_lang"

    const-string v3, "0"

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 66
    const-string v1, "-1"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_147

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 67
    :cond_147
    const-string v1, "1"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16f

    const-string v1, "en"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_158

    goto :goto_16f

    .line 68
    :cond_158
    const-string v1, "2"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16c

    const-string v1, "zh"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_169

    goto :goto_16c

    :cond_169
    const-string p0, "\u901a\u5e38\u518d\u751f\u306b\u623b\u308c\u307e\u305b\u3093\u3067\u3057\u305f"

    goto :goto_171

    :cond_16c
    :goto_16c
    const-string p0, "\u7121\u6cd5\u8fd4\u56de\u4e00\u822c\u64ad\u653e"

    goto :goto_171

    .line 67
    :cond_16f
    :goto_16f
    const-string p0, "Could not return to normal playback"

    .line 68
    :goto_171
    nop

    .line 67
    invoke-static {v0, p0, v2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 68
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_179
    .catchall {:try_start_128 .. :try_end_179} :catchall_125

    .line 69
    :goto_179
    sput-boolean v2, Le/e/a/PlaybackReturn;->opening:Z

    .line 70
    return-void

    .line 69
    :goto_17c
    sput-boolean v2, Le/e/a/PlaybackReturn;->opening:Z

    throw p0

    .line 34
    :cond_17f
    :goto_17f
    return-void
.end method
