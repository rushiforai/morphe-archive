.class public abstract Lyro;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String;

.field public static b:Ljava/lang/String;

.field public static volatile c:Ljava/lang/String;

.field public static final d:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0x30

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lyro;->d:Ljava/util/List;

    return-void
.end method

.method public static a(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    sget-object v0, Lyro;->a:Ljava/lang/String;

    if-nez v0, :cond_4c

    :try_start_4
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_16
    .catchall {:try_start_4 .. :try_end_16} :catchall_17

    goto :goto_20

    :catchall_17
    move-exception v0

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v1

    :goto_20
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_3f

    :try_start_26
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_36
    .catchall {:try_start_26 .. :try_end_36} :catchall_37

    goto :goto_3f

    :catchall_37
    move-exception p0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :cond_3f
    :goto_3f
    instance-of p0, v0, Lq0i;

    if-eqz p0, :cond_44

    const/4 v0, 0x0

    :cond_44
    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_4a

    const-string v0, ""

    :cond_4a
    sput-object v0, Lyro;->a:Ljava/lang/String;

    :cond_4c
    return-object v0
.end method

.method public static b(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    :try_start_0
    sget-object v0, Lt0i;->b:Lp0i;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_19

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/PackageManager;->getInstallSourceInfo(Ljava/lang/String;)Landroid/content/pm/InstallSourceInfo;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;

    move-result-object p0

    goto :goto_2f

    :cond_19
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_25
    .catchall {:try_start_0 .. :try_end_25} :catchall_26

    goto :goto_2f

    :catchall_26
    move-exception p0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v0

    :goto_2f
    instance-of v0, p0, Lq0i;

    if-eqz v0, :cond_34

    const/4 p0, 0x0

    :cond_34
    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public static c(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    sget-object v0, Lyro;->b:Ljava/lang/String;

    if-nez v0, :cond_2d

    :try_start_4
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_15
    .catchall {:try_start_4 .. :try_end_15} :catchall_16

    goto :goto_1f

    :catchall_16
    move-exception p0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v0

    :goto_1f
    instance-of v0, p0, Lq0i;

    if-eqz v0, :cond_24

    const/4 p0, 0x0

    :cond_24
    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_2a

    const-string p0, ""

    :cond_2a
    sput-object p0, Lyro;->b:Ljava/lang/String;

    return-object p0

    :cond_2d
    return-object v0
.end method
