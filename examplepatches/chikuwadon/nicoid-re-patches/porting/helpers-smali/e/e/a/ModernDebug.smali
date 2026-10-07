.class public final Le/e/a/ModernDebug;
.super Ljava/lang/Object;


# static fields
.field private static final entries:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v0, Le/e/a/ModernDebug;->entries:Ljava/lang/StringBuilder;

    return-void
.end method

.method public static http(Ljava/net/HttpURLConnection;I)V
    .locals 4

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Media HTTP "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " @ "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v2, ".m3u8"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, " playlist"

    goto :goto_0

    :cond_0
    const-string v0, " segment"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void
.end method

.method public static declared-synchronized record(Ljava/lang/String;)V
    .locals 4

    const-class v0, Le/e/a/ModernDebug;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/ModernDebug;->entries:Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const/16 v3, 0x7000

    if-le v2, v3, :cond_0

    const/4 v2, 0x0

    const/16 v3, 0x2000

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    :cond_0
    monitor-exit v0

    return-void
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static restart(Landroid/content/Context;)V
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x10008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_0
    return-void
.end method

 .method public static share(Landroid/content/Context;)V
    .locals 3
    const-class v0, Le/e/a/ModernDebug;
    monitor-enter v0
    :try_start_save
    sget-object v1, Le/e/a/ModernDebug;->entries:Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    monitor-exit v0
    :try_end_save
    .catchall {:try_start_save .. :try_end_save} :save_error
    invoke-static {p0, v1}, Le/e/a/Followup173;->saveLog(Landroid/content/Context;Ljava/lang/String;)V
    return-void
    :save_error
    move-exception v2
    monitor-exit v0
    throw v2
.end method
