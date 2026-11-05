.class public final Le/e/a/MediaClose248;
.super Ljava/lang/Object;
.source "MediaClose248.java"


# static fields
.field static final ACTION:Ljava/lang/String; = "com.sauzask.nicoid.RE_STOP_248"

.field static final PREFS:Ljava/lang/String; = "nicoid_media_close_248"

.field static final TOKENS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 11
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/MediaClose248;->TOKENS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static action(Landroid/content/Context;Ljava/lang/Object;II)Landroid/app/PendingIntent;
    .registers 9

    .line 13
    sget-object v0, Le/e/a/MediaClose248;->TOKENS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 14
    const-string v1, "notification"

    const-string v2, "token"

    if-nez v0, :cond_31

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Le/e/a/MediaClose248;->TOKENS:Ljava/util/Map;

    invoke-interface {v3, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "nicoid_media_close_248"

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, v1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 15
    :cond_31
    new-instance p1, Landroid/content/Intent;

    const-string v3, "com.sauzask.nicoid.RE_STOP_248"

    invoke-direct {p1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "nicoid-media-close:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p1

    const-string v3, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {p1, p0, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    .line 16
    const/high16 p2, 0xc000000

    invoke-static {p0, p3, p1, p2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method public static consume(Landroid/app/Service;Landroid/content/Intent;)Z
    .registers 12

    .line 24
    const/4 v0, 0x0

    if-eqz p1, :cond_9f

    const-string v1, "com.sauzask.nicoid.RE_STOP_248"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    goto/16 :goto_9f

    .line 25
    :cond_11
    invoke-static {p0, p1}, Le/e/a/MediaClose248;->valid(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_89

    .line 26
    const-string v1, "nicoid_media_close_248"

    invoke-virtual {p0, v1, v0}, Landroid/app/Service;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "token"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "notification"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 27
    :try_start_31
    const-class v1, Le/e/a/MediaControls;

    const-string v4, "active"

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 28
    if-eqz v1, :cond_6f

    const-class v5, Le/e/a/MediaControls;

    const-string v6, "command"

    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    aput-object v9, v8, v0

    const-class v9, Ljava/lang/String;

    aput-object v9, v8, v2

    invoke-virtual {v5, v6, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v6, v7, [Ljava/lang/Object;

    aput-object v1, v6, v0

    const-string v0, "stop"

    aput-object v0, v6, v2

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_66} :catch_67

    .line 29
    goto :goto_6f

    :catch_67
    move-exception v0

    const-string v1, "nicoid-media"

    const-string v4, "Cannot stop the active playback session"

    invoke-static {v1, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    :cond_6f
    :goto_6f
    invoke-virtual {p0, v3}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/4 v1, -0x1

    invoke-virtual {p1, v3, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 31
    invoke-virtual {p0, v2}, Landroid/app/Service;->stopForeground(Z)V

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    .line 32
    const-string p0, "Notification close handled"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    .line 33
    goto :goto_9e

    .line 35
    :cond_89
    :try_start_89
    const-string p1, "e"

    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_9e

    const-string p1, "z"

    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_9e

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V
    :try_end_9c
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_9c} :catch_9d

    goto :goto_9e

    :catch_9d
    move-exception p0

    .line 37
    :cond_9e
    :goto_9e
    return v2

    .line 24
    :cond_9f
    :goto_9f
    return v0
.end method

.method static valid(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 7

    .line 19
    const/4 v0, 0x0

    if-eqz p1, :cond_42

    const-string v1, "com.sauzask.nicoid.RE_STOP_248"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_42

    .line 20
    :cond_10
    const-string v1, "nicoid_media_close_248"

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "token"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 21
    if-eqz v2, :cond_41

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x24

    if-ne v3, v4, :cond_41

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_41

    const/4 v1, -0x1

    const-string v2, "notification"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 v1, -0x2

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    if-ne p1, p0, :cond_41

    const/4 p0, 0x1

    return p0

    :cond_41
    return v0

    .line 19
    :cond_42
    :goto_42
    return v0
.end method
