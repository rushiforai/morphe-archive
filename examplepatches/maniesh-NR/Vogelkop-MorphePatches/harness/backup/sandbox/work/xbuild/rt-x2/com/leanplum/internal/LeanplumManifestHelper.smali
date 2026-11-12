.class public Lcom/leanplum/internal/LeanplumManifestHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static disableComponent(Landroid/content/Context;Landroid/content/pm/PackageManager;Ljava/lang/String;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p0, :cond_12

    if-eqz p1, :cond_12

    if-eqz p2, :cond_12

    :try_start_7
    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, p0, p2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x2

    const/4 p2, 0x1

    invoke-virtual {p1, v1, p0, p2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_12

    return p2

    :catchall_12
    :cond_12
    return v0
.end method

.method public static enableComponent(Landroid/content/Context;Landroid/content/pm/PackageManager;Ljava/lang/Class;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p2, :cond_1e

    if-eqz p0, :cond_1e

    if-eqz p1, :cond_1e

    :try_start_7
    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, p0, p2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, 0x1

    invoke-virtual {p1, v1, p0, p0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_11

    return p0

    :catchall_11
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "Could not enable component: %s"

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1e
    return v0
.end method

.method public static enableServiceAndStart(Landroid/content/Context;Landroid/content/pm/PackageManager;Ljava/lang/Class;)Z
    .registers 4

    invoke-static {p0, p1, p2}, Lcom/leanplum/internal/LeanplumManifestHelper;->enableComponent(Landroid/content/Context;Landroid/content/pm/PackageManager;Ljava/lang/Class;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_8

    return v0

    :cond_8
    :try_start_8
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_12

    const/4 p0, 0x1

    return p0

    :catchall_12
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "Could not start service for class: %s"

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return v0
.end method

.method public static getClassForName(Ljava/lang/String;)Ljava/lang/Class;
    .registers 1

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_4
    .catchall {:try_start_0 .. :try_end_4} :catchall_5

    return-object p0

    :catchall_5
    const/4 p0, 0x0

    return-object p0
.end method

.method public static parseNotificationMetadata()Ljava/lang/String;
    .registers 3

    :try_start_0
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x80

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "LP_NOTIFICATION"

    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_1a
    .catchall {:try_start_0 .. :try_end_1a} :catchall_1b

    return-object v0

    :catchall_1b
    const/4 v0, 0x0

    return-object v0
.end method

.method public static wasComponentEnabled(Landroid/content/Context;Landroid/content/pm/PackageManager;Ljava/lang/Class;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p2, :cond_17

    if-eqz p0, :cond_17

    if-eqz p1, :cond_17

    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, p0, p2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result p0

    if-eqz p0, :cond_17

    const/4 p1, 0x2

    if-eq p1, p0, :cond_17

    const/4 p0, 0x1

    return p0

    :cond_17
    return v0
.end method
